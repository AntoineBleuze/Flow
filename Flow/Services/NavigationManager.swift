#if os(iOS)
import ActivityKit
#endif
import Combine
import CoreLocation
import Foundation
import SwiftUI

class NavigationManager: ObservableObject {
    static let shared = NavigationManager()

    @Published var isNavigating = false
    @Published var currentInstruction: String = ""
    @Published var nextDepartures: [String] = []  // For UI display
    @Published private(set) var currentJourney: Journey?
    @Published var shouldSwitchToMap = false  // Trigger to switch to map tab
    @Published private(set) var currentSectionIndex: Int = 0
    
    // Advanced Tracking
    @Published var progress: Double = 0.0 // 0.0 to 1.0 along the current segment (station to station)
    @Published var currentLegIndex: Int = 0 // Index of the leg *within* the section (index in stop_date_times)
    @Published var showBoardingPrompt: Bool = false
    
#if os(iOS)
    private var currentActivity: Activity<NavigationActivityAttributes>?
#endif

    private var cancellables = Set<AnyCancellable>()
    private var updateTimer: Timer?

    // State tracking
    public enum NavigationState {
        case idle
        case walkingToStation(targetStation: ItineraryPlace, nextSection: ItinerarySection)
        case waitingAtStation(station: ItineraryPlace, section: ItinerarySection)
        case onBoard(section: ItinerarySection)
        case walkingToDestination(destination: ItineraryPlace)
    }

    @Published public var state: NavigationState = .idle

    // Location
    private var lastLocation: CLLocationCoordinate2D?

    private init() {}

    func startNavigation(journey: Journey) {
        print("🚀 NavigationManager.startNavigation called")
        print("   Journey ID: \(journey.id)")
        print("   Sections count: \(journey.sections?.count ?? 0)")
        
        self.currentJourney = journey
        self.currentSectionIndex = 0
        self.isNavigating = true
        self.shouldSwitchToMap = true  // Trigger switch to map
        
        print("   ✅ isNavigating set to: \(self.isNavigating)")
        print("   ✅ currentJourney set: \(self.currentJourney != nil)")

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
        print("   Calling determineNextState...")
        determineNextState()
        print("   State after determineNextState: \(state)")

        // Start Live Activity
        startActivity()

        // Enable background location updates
        LocationManager.shared.setBackgroundUpdates(enabled: true)

        // Start periodic updates (for API calls)
        startTimer()
        print("🚀 startNavigation completed")
    }

    func stopNavigation() {
        print("🛑 Stopping navigation")
        stopSimulation()
        isNavigating = false
        state = .idle
        currentJourney = nil
        currentSectionIndex = 0
        nextDepartures = []

        updateTimer?.invalidate()
        updateTimer = nil
        animationTimer?.invalidate()
        animationTimer = nil
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
            // stopNavigation() // DEBUG: prevent immediate stop to see if UI appears
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
                    
                    // Show Prompt
                    DispatchQueue.main.async {
                        self.showBoardingPrompt = true
                    }
                }
            }

        case .waitingAtStation(_, _):
            // Fallback for visual state update if needed
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

    // User Action: Confirm they are on board
    func confirmBoarding() {
        if case .waitingAtStation(_, let section) = state {
            print("👤 User confirmed boarding")
            state = .onBoard(section: section)
            // Immediately update UI with ETA to next stop
            updateLoop()
        }
    }

    // Calculates ETA to the end of the current section
    func calculateETA(for section: ItinerarySection) -> String? {
        guard let arrivalTime = section.arrival_date_time else { return nil }
        
        if let arrivalDate = DateFormat.navitia.date(from: arrivalTime) {
            let diff = Int(arrivalDate.timeIntervalSinceNow / 60)
            if diff <= 0 { return "Maintenant" }
            return "\(diff) min"
        }
        return nil
    }

    private var animationTimer: Timer?

    private func startTimer() {
        // Network / Heavy update every 30s
        updateTimer = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { [weak self] _ in
            self?.updateLoop()
        }
        
        // UI / Progress update every 1s
        animationTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateProgressLoop()
        }
        
        // Initial call
        updateLoop()
    }
    
    private func updateProgressLoop() {
        guard let journey = currentJourney, 
              let sections = journey.sections,
              currentSectionIndex < sections.count else { return }
              
        let section = sections[currentSectionIndex]
        if section.type == "public_transport" {
            calculateProgressForCurrentLeg(section: section)
        }
    }

    private func updateLoop() {
        switch state {
        case .walkingToStation(_, let nextSection):
            // Fetch departures for the upcoming section so user knows when to hurry
            fetchRealTimeData(for: nextSection)

        case .waitingAtStation(_, let section):
            fetchRealTimeData(for: section)

        case .onBoard(let section):
            let eta = calculateETA(for: section) ?? "--"
            let destination = section.to?.name ?? "Arrêt suivant"
            
            updateActivity(
                instruction: "En direction de \(destination)",
                nextDepartures: ["ETA: \(eta)"]
            )
            
            DispatchQueue.main.async {
                self.currentInstruction = "Prochain arrêt: \(destination)"
                self.nextDepartures = ["Arrivée dans \(eta)"]
            }
            // Update continuous progress
            calculateProgressForCurrentLeg(section: section)

        default:
            break
        }
    }
    
    // MARK: - Advanced Progress Logic
    private func calculateProgressForCurrentLeg(section: ItinerarySection) {
        guard let stops = section.stop_date_times, !stops.isEmpty else { return }
        
        // Find current leg based on time or location
        // For simplicity, let's assume currentLegIndex is managed or inferred
        // In a real app, we'd match user location to the nearest segment between stops.
        
        // Fallback: Time Based
        let now = Date()
        
        // Find the "active" leg where DepTime(Stop N) < Now < ArrTime(Stop N+1)
        // Or if strictly waiting, progress is 0.
        
        // Let's stick to a simple time interpolation for the current leg if GPS is weak
        if currentLegIndex >= 0 && currentLegIndex < stops.count - 1 {
            let startStop = stops[currentLegIndex]
            let endStop = stops[currentLegIndex+1]
            
            let formatter = DateFormat.navitia
            
            if let start = formatter.date(from: startStop.departure_date_time),
               let end = formatter.date(from: endStop.arrival_date_time) {
                
                let totalDuration = end.timeIntervalSince(start)
                let elapsed = now.timeIntervalSince(start)
                
                var newProgress = elapsed / totalDuration
                
                // Hybrid: If we have GPS, project it?
                if let location = lastLocation {
                    // TODO: Project on Polyline logic (Complex geometry calculation)
                    // For now, trust time if underground, trust GPS if close?
                    // Let's rely on Time primarily for Metro as GPS is unreliable.
                }
                
                // Clamp
                if newProgress < 0 { newProgress = 0 }
                if newProgress > 1 {
                    newProgress = 1
                    // Maybe auto-advance leg if time passed?
                    if currentLegIndex < stops.count - 2 {
                         DispatchQueue.main.async {
                             self.currentLegIndex += 1
                         }
                    }
                }
                
                DispatchQueue.main.async {
                    withAnimation {
                        self.progress = newProgress
                    }
                }
            }
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
        return DateFormat.timeRemaining(from: dateString)
    }

    // MARK: - Activity

#if os(iOS)
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
#else
    private func startActivity() {}
    private func updateActivity(
        instruction: String, nextDepartures: [String], lineName: String? = nil,
        direction: String? = nil, lineColor: String? = nil, textColor: String? = nil
    ) {}
    private func endActivity() {}
#endif

    // MARK: - Simulation Mode
    
    @Published var isSimulating = false
    private var simulationPoints: [CLLocationCoordinate2D] = []
    private var simulationIndex = 0
    private var simulationTimer: Timer?
    
    func startSimulation() {
        guard let journey = currentJourney else { return }
        print("🎮 Starting in-app journey simulation")
        
        // Stop any active real tracking in LocationManager
        LocationManager.shared.isSimulating = true
        self.isSimulating = true
        
        // Extract all coordinates from sections
        var points: [CLLocationCoordinate2D] = []
        
        if let sections = journey.sections {
            for section in sections {
                // If section has geojson coordinates, use them
                if let geojson = section.geojson, let coords = geojson.coordinates {
                    for coord in coords {
                        if coord.count >= 2 {
                            points.append(CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0]))
                        }
                    }
                } else {
                    // Otherwise, just use from and to coordinates
                    if let from = section.from, let fromCoord = from.coord,
                       let latStr = fromCoord.lat, let lonStr = fromCoord.lon,
                       let lat = Double(latStr), let lon = Double(lonStr) {
                        points.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
                    }
                    if let to = section.to, let toCoord = to.coord,
                       let latStr = toCoord.lat, let lonStr = toCoord.lon,
                       let lat = Double(latStr), let lon = Double(lonStr) {
                        points.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
                    }
                }
            }
        }
        
        guard !points.isEmpty else {
            print("⚠️ No coordinates found to simulate")
            return
        }
        
        // Filter out duplicate consecutive coordinates
        var uniquePoints: [CLLocationCoordinate2D] = []
        for p in points {
            if let last = uniquePoints.last {
                let dist = CLLocation(latitude: p.latitude, longitude: p.longitude)
                    .distance(from: CLLocation(latitude: last.latitude, longitude: last.longitude))
                if dist > 5 { // Only add if it's > 5 meters away
                    uniquePoints.append(p)
                }
            } else {
                uniquePoints.append(p)
            }
        }
        
        self.simulationPoints = uniquePoints
        self.simulationIndex = 0
        
        // Start the timer
        simulationTimer?.invalidate()
        simulationTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { [weak self] _ in
            self?.tickSimulation()
        }
    }
    
    private func tickSimulation() {
        guard isSimulating, simulationIndex < simulationPoints.count else {
            stopSimulation()
            return
        }
        
        let coord = simulationPoints[simulationIndex]
        print("🎮 Simulation Tick: \(simulationIndex)/\(simulationPoints.count) - Coord: \(coord.latitude), \(coord.longitude)")
        
        // Update user location in LocationManager
        LocationManager.shared.simulateLocation(latitude: coord.latitude, longitude: coord.longitude)
        
        simulationIndex += 1
        
        // Auto-board if we are waiting at a station during simulation
        if case .waitingAtStation = state {
            print("🎮 Auto-boarding during simulation")
            confirmBoarding()
        }
    }
    
    func stopSimulation() {
        print("🎮 Stopping simulation")
        simulationTimer?.invalidate()
        simulationTimer = nil
        isSimulating = false
        LocationManager.shared.isSimulating = false
    }
}
