import ActivityKit
import Combine
import CoreLocation
import Foundation

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()

    @Published var isNavigating = false
    @Published var currentInstruction: String = ""
    @Published var nextDepartures: [String] = []  // For UI display
    @Published private(set) var currentJourney: Journey?
    @Published var shouldSwitchToMap = false  // Trigger to switch to map tab
    @Published private(set) var currentSectionIndex: Int = 0
    private var currentActivity: Activity<NavigationActivityAttributes>?

    private var cancellables = Set<AnyCancellable>()
    private var updateTimer: Timer?

    // State tracking
    private enum NavigationState {
        case idle
        case walkingToStation(targetStation: ItineraryPlace, nextSection: ItinerarySection)
        case waitingAtStation(station: ItineraryPlace, section: ItinerarySection)
        case onBoard(section: ItinerarySection)
        case walkingToDestination(destination: ItineraryPlace)
    }

    private var state: NavigationState = .idle

    // Location
    private var lastLocation: CLLocationCoordinate2D?

    private init() {}

    func startNavigation(journey: Journey) {
        print("🚀 Starting navigation")
        self.currentJourney = journey
        self.currentSectionIndex = 0
        self.isNavigating = true
        self.shouldSwitchToMap = true  // Trigger switch to map

        // Request location access if needed
        LocationManager.shared.requestLocation()

        // Subscribe to location updates
        LocationManager.shared.$userLocation
            .sink { [weak self] location in
                self?.lastLocation = location
                self?.checkState()
            }
            .store(in: &cancellables)

        // Determine initial state
        determineNextState()

        // Start Live Activity
        startActivity()

        // Enable background location updates
        LocationManager.shared.setBackgroundUpdates(enabled: true)

        // Start periodic updates (for API calls)
        startTimer()
    }

    func stopNavigation() {
        print("🛑 Stopping navigation")
        isNavigating = false
        state = .idle
        currentJourney = nil
        currentSectionIndex = 0
        nextDepartures = []

        updateTimer?.invalidate()
        updateTimer = nil
        cancellables.removeAll()

        // Disable background location updates
        LocationManager.shared.setBackgroundUpdates(enabled: false)

        endActivity()
    }

    private func determineNextState() {
        guard let journey = currentJourney, let sections = journey.sections,
            currentSectionIndex < sections.count
        else {
            print("🏁 Arrived or invalid journey")
            state = .idle
            stopNavigation()
            return
        }

        let section = sections[currentSectionIndex]

        if section.type == "street_network" || section.type == "transfer" {
            // Walking
            // Check what's next
            if currentSectionIndex + 1 < sections.count {
                let nextSection = sections[currentSectionIndex + 1]
                if nextSection.type == "public_transport" {
                    // Walking to a station
                    if let station = nextSection.from {
                        state = .walkingToStation(targetStation: station, nextSection: nextSection)
                        updateActivity(
                            instruction: "Marcher vers \(station.name ?? "Station")",
                            nextDepartures: [])
                    }
                } else {
                    // Just walking to another point? Skip to next for now
                    currentSectionIndex += 1
                    determineNextState()
                }
            } else {
                // Last section, walking to destination
                if let to = section.to {
                    state = .walkingToDestination(destination: to)
                    updateActivity(
                        instruction: "Marcher vers \(to.name ?? "Destination")", nextDepartures: [])
                }
            }
        } else if section.type == "public_transport" {
            // Should be handled by walkingToStation transition, but if we start directly here:
            if let station = section.from {
                state = .waitingAtStation(station: station, section: section)
            }
        } else {
            // Skip other types
            currentSectionIndex += 1
            determineNextState()
        }
    }

    private func checkState() {
        guard let location = lastLocation else { return }

        switch state {
        case .walkingToStation(let station, let nextSection):
            // Check distance to station
            if let stationCoord = station.coord, let lat = Double(stationCoord.lat ?? ""),
                let lon = Double(stationCoord.lon ?? "")
            {
                let stationLoc = CLLocation(latitude: lat, longitude: lon)
                let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
                let distance = userLoc.distance(from: stationLoc)

                print("📍 Distance to \(station.name ?? ""): \(distance)m")

                if distance < 100 {  // 100m threshold
                    print("✅ Arrived at station")
                    state = .waitingAtStation(station: station, section: nextSection)
                    // Trigger immediate update
                    fetchRealTimeData(for: nextSection)
                }
            }

        case .waitingAtStation(_, _):
            // Logic handled in timer (checking departure times)
            // But we also check if user leaves the station *on the train*
            // This is hard to distinguish from walking away.
            // We rely on the time-based trigger requested by user.
            break

        case .onBoard(let section):
            // Check distance to destination
            if let to = section.to, let coord = to.coord, let lat = Double(coord.lat ?? ""),
                let lon = Double(coord.lon ?? "")
            {
                let destLoc = CLLocation(latitude: lat, longitude: lon)
                let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
                let distance = userLoc.distance(from: destLoc)

                if distance < 500 {  // 500m threshold for "Arriving"
                    print("⚠️ Arriving at destination")
                    updateActivity(instruction: "Descendre à \(to.name ?? "")", nextDepartures: [])
                }

                if distance < 100 {
                    print("✅ Arrived at destination step")
                    currentSectionIndex += 1
                    determineNextState()
                }
            }

        case .walkingToDestination(let destination):
            if let coord = destination.coord, let lat = Double(coord.lat ?? ""),
                let lon = Double(coord.lon ?? "")
            {
                let destLoc = CLLocation(latitude: lat, longitude: lon)
                let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
                let distance = userLoc.distance(from: destLoc)

                if distance < 50 {
                    print("🏁 Arrived!")
                    stopNavigation()
                }
            }

        case .idle:
            break
        }
    }

    private func startTimer() {
        updateTimer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { [weak self] _ in
            self?.updateLoop()
        }
        // Initial call
        updateLoop()
    }

    private func updateLoop() {
        switch state {
        case .walkingToStation(_, let nextSection):
            // Fetch departures for the upcoming section so user knows when to hurry
            fetchRealTimeData(for: nextSection)

        case .waitingAtStation(_, let section):
            fetchRealTimeData(for: section)

        case .onBoard(let section):
            // Maybe show progress?
            updateActivity(
                instruction: "En direction de \(section.to?.name ?? "")", nextDepartures: [])

        default:
            break
        }
    }

    private func fetchRealTimeData(for section: ItinerarySection) {
        guard let stopId = section.from?.id else { return }

        // Use IDFMService to fetch
        // Note: We need to filter by line/direction

        IDFMService.shared.fetchDepartures(for: stopId)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] departures in
                    self?.processDepartures(departures, for: section)
                }
            )
            .store(in: &cancellables)
    }

    private func processDepartures(_ departures: [Departure], for section: ItinerarySection) {
        guard let lineName = section.display_informations?.label,
            let direction = section.display_informations?.direction
        else { return }

        // Filter
        let relevant = departures.filter { dep in
            // Basic matching. Might need refinement.
            return dep.displayInformations.label == lineName
        }

        let nextTimes = relevant.prefix(2).compactMap {
            timeRemaining($0.stopDateTime.departureDateTime)
        }

        DispatchQueue.main.async {
            self.nextDepartures = nextTimes
        }

        // Update Activity
        var instruction = ""
        if case .walkingToStation(let station, _) = state {
            instruction = "Aller à \(station.name ?? "")"
        } else if case .waitingAtStation = state {
            instruction = "Prendre \(lineName) vers \(direction)"

            // Check if we should transition to OnBoard
            // User rule: "quand l'utilisateur est a la station et que l'un des train est parti... ca lance la prochaine étape"
            checkIfTrainDeparted(relevant)
        }

        updateActivity(
            instruction: instruction,
            nextDepartures: nextTimes,
            lineName: lineName,
            direction: direction,
            lineColor: section.display_informations?.color,
            textColor: section.display_informations?.text_color)
    }

    private func checkIfTrainDeparted(_ departures: [Departure]) {
        // This is tricky with just a list of future departures.
        // We need to know if a departure *just happened*.
        // If the API returns only future departures, we might miss the moment.
        // However, if we see "0 min" or "1 min" and then it disappears in the next fetch, we can assume it left.
        // For now, let's use a simple heuristic: If we see a train leaving in < 1 min, we assume user takes it.

        if let first = departures.first {
            let remaining = timeRemaining(first.stopDateTime.departureDateTime)
            if remaining == "0 min" || remaining == "A quai" {
                // Assume user boards this one
                // Wait a bit? Or transition?
                // Let's transition after a delay or if we verify location change.
                // For this MVP, let's transition immediately but keep monitoring location to confirm?
                // User said: "train est parti dans les minutes pendant lesquelles il est arrivé"

                // Let's transition to OnBoard
                if case .waitingAtStation(_, let section) = state {
                    print("🚂 Train departing, assuming user is on board")
                    state = .onBoard(section: section)
                }
            }
        }
    }

    private func timeRemaining(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: dateString) {
            let diff = Int(date.timeIntervalSinceNow / 60)
            if diff <= 0 { return "0 min" }
            return "\(diff) min"
        }
        return ""
    }

    // MARK: - Activity

    private func startActivity() {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else { return }

        let attributes = NavigationActivityAttributes(
            destinationName: currentJourney?.sections?.last?.to?.name ?? "Destination")
        let contentState = NavigationActivityAttributes.ContentState(
            currentInstruction: "Démarrage...",
            nextDepartures: [],
            lineName: nil,
            direction: nil,
            lineColor: nil,
            textColor: nil
        )

        do {
            currentActivity = try Activity.request(
                attributes: attributes, content: .init(state: contentState, staleDate: nil))
        } catch {
            print("Error starting activity: \(error)")
        }
    }

    private func updateActivity(
        instruction: String, nextDepartures: [String], lineName: String? = nil,
        direction: String? = nil, lineColor: String? = nil, textColor: String? = nil
    ) {
        guard let activity = currentActivity else { return }

        let contentState = NavigationActivityAttributes.ContentState(
            currentInstruction: instruction,
            nextDepartures: nextDepartures,
            lineName: lineName,
            direction: direction,
            lineColor: lineColor,
            textColor: textColor
        )

        Task {
            await activity.update(.init(state: contentState, staleDate: nil))
        }
    }

    private func endActivity() {
        Task {
            await currentActivity?.end(nil, dismissalPolicy: .immediate)
            currentActivity = nil
        }
    }
}
