#if os(iOS)
import ActivityKit
import UserNotifications
#endif
import Combine
import CoreLocation
import Foundation
import SwiftUI

class NavigationManager: NSObject, ObservableObject {
    static let shared = NavigationManager()

    @Published var isDeviceLocked = false

    @Published var isNavigating = false
    @Published var currentInstruction: String = ""
    @Published var nextDepartures: [String] = []  // For UI display
    @Published private(set) var currentJourney: Journey?
    @Published var shouldSwitchToMap = false  // Trigger to switch to map tab
    @Published private(set) var currentSectionIndex: Int = 0 {
        didSet {
            if currentSectionIndex != oldValue {
                print("🔄 [NavigationManager] currentSectionIndex changed from \(oldValue) to \(currentSectionIndex). Resetting leg index and progress.")
                self.currentLegIndex = 0
                self.progress = 0.0
                self.selectedDeparture = nil
                self.departuresList = []
            }
        }
    }
    
    // Advanced Tracking
    @Published var progress: Double = 0.0 // 0.0 to 1.0 along the current segment (station to station)
    @Published var currentLegIndex: Int = 0 // Index of the leg *within* the section (index in stop_date_times)
    @Published var showBoardingPrompt: Bool = false
    @Published var adjustedTimetableDelay: TimeInterval = 0.0
    @Published var activeRameId: String? = nil
    @Published var departuresList: [Departure] = []
    @Published var selectedDeparture: Departure? = nil
    private var lastLocationUpdateTime: Date?

    var isLocationWorking: Bool {
        guard let lastTime = lastLocationUpdateTime else { return false }
        return Date().timeIntervalSince(lastTime) < 15.0
    }
    
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

    // Cache for resolved coordinates during navigation to avoid O(N^2) string processing on every location update
    private var coordinateCache: [String: CLLocationCoordinate2D] = [:]

    private override init() {
        #if os(iOS)
        super.init()
        UNUserNotificationCenter.current().delegate = self
        setupNotificationCategories()
        
        self.isDeviceLocked = !UIApplication.shared.isProtectedDataAvailable
        
        NotificationCenter.default.publisher(for: UIApplication.protectedDataDidBecomeAvailableNotification)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isDeviceLocked = false
                print("🔒 Device unlocked (protected data available)")
                self?.forceLiveActivityUpdate()
            }
            .store(in: &cancellables)
            
        NotificationCenter.default.publisher(for: UIApplication.protectedDataWillBecomeUnavailableNotification)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isDeviceLocked = true
                print("🔒 Device locked (protected data unavailable)")
                self?.forceLiveActivityUpdate()
            }
            .store(in: &cancellables)
        #else
        super.init()
        #endif
    }

    private func setupNotificationCategories() {
        #if os(iOS)
        let confirmAction = UNNotificationAction(identifier: "CONFIRM_BOARDING", title: "Oui, c'est parti !", options: [.foreground])
        let cancelAction = UNNotificationAction(identifier: "CANCEL_BOARDING", title: "Pas encore", options: [])
        
        let category = UNNotificationCategory(
            identifier: "BOARDING_PROMPT",
            actions: [confirmAction, cancelAction],
            intentIdentifiers: [],
            options: []
        )
        UNUserNotificationCenter.current().setNotificationCategories([category])
        #endif
    }

    func requestNotificationPermission() {
        #if os(iOS)
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("⚠️ Error requesting notification authorization: \(error)")
            } else {
                print("🔔 Notification permission granted: \(granted)")
            }
        }
        #endif
    }

    private func sendBoardingNotification() {
        #if os(iOS)
        let content = UNMutableNotificationContent()
        content.title = "Embarquement"
        content.body = "Êtes-vous monté dans le transport ?"
        content.sound = .default
        content.categoryIdentifier = "BOARDING_PROMPT"
        
        let request = UNNotificationRequest(identifier: "boarding_prompt", content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("⚠️ Error posting notification: \(error)")
            } else {
                print("🔔 Boarding notification posted successfully")
            }
        }
        #endif
    }

    func startNavigation(journey: Journey) {
        print("🚀 NavigationManager.startNavigation called")
        print("   Journey ID: \(journey.id)")
        print("   Sections count: \(journey.sections?.count ?? 0)")
        
        self.currentJourney = journey
        self.coordinateCache.removeAll()
        self.currentSectionIndex = 0
        self.isNavigating = true
        self.shouldSwitchToMap = true  // Trigger switch to map
        
        print("   ✅ isNavigating set to: \(self.isNavigating)")
        print("   ✅ currentJourney set: \(self.currentJourney != nil)")

        // Request location access if needed
        LocationManager.shared.requestLocation()
        
        // Request notification permission if needed
        requestNotificationPermission()

        // Subscribe to location updates
        LocationManager.shared.$userLocation
            .sink { [weak self] location in
                self?.lastLocation = location
                if location != nil {
                    self?.lastLocationUpdateTime = Date()
                }
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
        self.coordinateCache.removeAll()
        currentSectionIndex = 0
        nextDepartures = []
        departuresList = []
        selectedDeparture = nil
        adjustedTimetableDelay = 0.0
        activeRameId = nil
        lastLocationUpdateTime = nil

        updateTimer?.invalidate()
        updateTimer = nil
        animationTimer?.invalidate()
        animationTimer = nil
        cancellables.removeAll()

        // Disable background location updates
        LocationManager.shared.setBackgroundUpdates(enabled: false)

        endActivity()
    }

    func advanceToNextSection() {
        guard let journey = currentJourney, let sections = journey.sections else { return }
        
        // Skip current section and any consecutive "waiting" sections
        var nextIndex = currentSectionIndex + 1
        while nextIndex < sections.count && sections[nextIndex].type == "waiting" {
            nextIndex += 1
        }
        
        if nextIndex < sections.count {
            runOnMainThread {
                self.currentSectionIndex = nextIndex
                self.determineNextState()
                
                // Immediately update Live Activity
                self.updateLoop()
            }
        } else {
            runOnMainThread {
                self.stopNavigation()
            }
        }
    }

    private func determineNextState() {
        guard let journey = currentJourney, let sections = journey.sections,
            currentSectionIndex < sections.count
        else {
            print("🏁 Arrived or invalid journey")
            state = .idle
            stopNavigation() // Auto stop navigation on arrival
            return
        }

        let section = sections[currentSectionIndex]

        if section.type == "street_network" || section.type == "transfer" {
            // Find next non-waiting section
            var nextNonWaitingSection: ItinerarySection? = nil
            for idx in (currentSectionIndex + 1)..<sections.count {
                if sections[idx].type != "waiting" {
                    nextNonWaitingSection = sections[idx]
                    break
                }
            }
            
            if let nextSection = nextNonWaitingSection, nextSection.type == "public_transport" {
                // Walking to a station
                if let station = nextSection.from {
                    state = .walkingToStation(targetStation: station, nextSection: nextSection)
                    updateActivity(
                        instruction: "Marcher vers \(station.name ?? "Station")",
                        nextDepartures: [],
                        lineName: nextSection.display_informations?.label,
                        direction: nextSection.display_informations?.direction,
                        lineColor: nextSection.display_informations?.color,
                        textColor: nextSection.display_informations?.text_color
                    )
                } else {
                    if let to = section.to {
                        state = .walkingToDestination(destination: to)
                        updateActivity(
                            instruction: "Marcher vers \(to.name ?? "Destination")",
                            nextDepartures: []
                        )
                    }
                }
            } else {
                // Last section, walking to destination
                if let to = section.to {
                    state = .walkingToDestination(destination: to)
                    updateActivity(
                        instruction: "Marcher vers \(to.name ?? "Destination")",
                        nextDepartures: []
                    )
                }
            }
        } else if section.type == "public_transport" {
            // Should be handled by walkingToStation transition, but if we start directly here:
            if let station = section.from {
                state = .waitingAtStation(station: station, section: section)
                let lineName = section.display_informations?.label ?? "Ligne"
                let direction = section.display_informations?.direction ?? ""
                updateActivity(
                    instruction: "Prendre \(lineName) vers \(direction)",
                    nextDepartures: [],
                    lineName: lineName,
                    direction: direction,
                    lineColor: section.display_informations?.color,
                    textColor: section.display_informations?.text_color
                )
            }
        } else {
            // Skip other types (like waiting)
            currentSectionIndex += 1
            determineNextState()
        }
    }

    private func getPlaceCoordinate(for place: ItineraryPlace) -> CLLocationCoordinate2D? {
        let placeId = place.id ?? ""
        let placeName = place.name ?? ""
        let cacheKey = "place_\(placeId)_\(placeName)"
        
        if let cached = coordinateCache[cacheKey] {
            return cached
        }
        
        func cacheAndReturn(_ coord: CLLocationCoordinate2D?) -> CLLocationCoordinate2D? {
            if let c = coord {
                coordinateCache[cacheKey] = c
            }
            return coord
        }
        
        // 1. Try place's own coordinates first
        if let coord = place.coord,
           let latStr = coord.lat, let lonStr = coord.lon,
           let lat = Double(latStr), let lon = Double(lonStr) {
            let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            if coordinate.latitude != 0.0 && coordinate.longitude != 0.0 {
                return cacheAndReturn(coordinate)
            }
        }
        
        // 2. Resolve via stop_point coordinate if present
        if let stopPoint = place.stop_point,
           let coord = getStationCoordinate(for: stopPoint) {
            return cacheAndReturn(coord)
        }
        
        // 3. Resolve via local stations database if available
        let cleanId = placeId.replacingOccurrences(of: "stop_point:", with: "")
                            .replacingOccurrences(of: "stop_area:", with: "")
                            .replacingOccurrences(of: "IDFM:", with: "")
                            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        let targetName = placeName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        var localStations: [MapStation] = []
        if Thread.isMainThread {
            localStations = MapDataService.shared.allStations
        } else {
            localStations = DispatchQueue.main.sync { MapDataService.shared.allStations }
        }
        
        if !cleanId.isEmpty {
            if let match = localStations.first(where: {
                let cleanLocalId = $0.id.replacingOccurrences(of: "stop_point:", with: "")
                                        .replacingOccurrences(of: "stop_area:", with: "")
                                        .replacingOccurrences(of: "IDFM:", with: "")
                                        .trimmingCharacters(in: .whitespacesAndNewlines)
                return cleanLocalId == cleanId
            }) {
                return cacheAndReturn(match.coordinate)
            }
        }
        
        if !targetName.isEmpty {
            if let match = localStations.first(where: {
                $0.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == targetName
            }) {
                return cacheAndReturn(match.coordinate)
            }
        }
        
        return nil
    }

    private func findClosestSectionIndex(for location: CLLocationCoordinate2D, journey: Journey) -> Int {
        guard let sections = journey.sections else { return 0 }
        
        var bestSectionIndex = currentSectionIndex
        var minDistance: CLLocationDistance = .infinity
        
        for (idx, section) in sections.enumerated() {
            var sectionCoords: [CLLocationCoordinate2D] = []
            
            // 1. Get coordinates from geojson
            if let geojson = section.geojson, let coords = geojson.coordinates {
                for coord in coords {
                    if coord.count >= 2 {
                        sectionCoords.append(CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0]))
                    }
                }
            }
            
            // 2. Get from/to coordinates
            if let from = section.from, let coord = getPlaceCoordinate(for: from) {
                sectionCoords.append(coord)
            }
            if let to = section.to, let coord = getPlaceCoordinate(for: to) {
                sectionCoords.append(coord)
            }
            
            // 3. Find minimum distance to any point in this section
            for coord in sectionCoords {
                let coordLoc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
                let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
                let dist = userLoc.distance(from: coordLoc)
                if dist < minDistance {
                    minDistance = dist
                    bestSectionIndex = idx
                }
            }
        }
        
        return bestSectionIndex
    }

    private func checkState() {
        guard let location = lastLocation else { return }
        guard let journey = currentJourney else { return }
        
        // 1. Automatically transition currentSectionIndex based on user location proximity to sections (strictly forward only)
        let closestIdx = findClosestSectionIndex(for: location, journey: journey)
        if closestIdx > currentSectionIndex {
            // Only jump if we are far from the current section's starting coordinate (e.g. > 150m)
            // OR if the closest index is the immediately next section (to allow normal sequence advancing)
            var currentSectionFar = true
            if currentSectionIndex < (journey.sections?.count ?? 0),
               let currentSection = journey.sections?[currentSectionIndex],
               let currentFrom = currentSection.from,
               let currentSectionCoord = getPlaceCoordinate(for: currentFrom) {
                let currentLoc = CLLocation(latitude: currentSectionCoord.latitude, longitude: currentSectionCoord.longitude)
                let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
                if userLoc.distance(from: currentLoc) < 150 {
                    currentSectionFar = false
                }
            }
            
            if closestIdx == currentSectionIndex + 1 || currentSectionFar {
                print("🗺️ Automatically transitioning section index from \(currentSectionIndex) to \(closestIdx) based on location (strictly forward)")
                DispatchQueue.main.async {
                    self.currentSectionIndex = closestIdx
                    self.determineNextState()
                }
                return
            }
        }

        switch state {
        case .walkingToStation(let station, let nextSection):
            // Check distance to station
            if let stationCoord = getPlaceCoordinate(for: station) {
                let stationLoc = CLLocation(latitude: stationCoord.latitude, longitude: stationCoord.longitude)
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
                        
                        #if os(iOS)
                        if UIApplication.shared.applicationState != .active {
                            self.sendBoardingNotification()
                        }
                        #endif
                    }
                }
            }

        case .waitingAtStation(_, let section):
            calculateProgressForCurrentLeg(section: section)
            
        case .onBoard(let section):
            calculateProgressForCurrentLeg(section: section)
            
            // Check distance to destination
            if let to = section.to, let destCoord = getPlaceCoordinate(for: to) {
                let destLoc = CLLocation(latitude: destCoord.latitude, longitude: destCoord.longitude)
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
            if let destCoord = getPlaceCoordinate(for: destination) {
                let destLoc = CLLocation(latitude: destCoord.latitude, longitude: destCoord.longitude)
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
    private func runOnMainThread(_ block: @escaping () -> Void) {
        if Thread.isMainThread {
            block()
        } else {
            DispatchQueue.main.async(execute: block)
        }
    }

    func confirmBoarding() {
        if case .waitingAtStation(_, let section) = state {
            print("👤 User confirmed boarding")
            state = .onBoard(section: section)
            
            // Match boarding train and set delay + number
            let now = Date()
            let formatter = DateFormat.navitia
            if let stops = section.stop_date_times, !stops.isEmpty {
                let targetStopIndex = currentLegIndex < stops.count ? currentLegIndex : 0
                if let selected = selectedDeparture,
                   let realDep = formatter.date(from: selected.stopDateTime.departureDateTime),
                   let plannedDep = formatter.date(from: stops[targetStopIndex].departure_date_time) {
                    let delay = realDep.timeIntervalSince(plannedDep)
                    self.adjustedTimetableDelay = delay
                    print("🚂 Boarded with selected departure at stop \(targetStopIndex) (\(stops[targetStopIndex].stop_point.name ?? "")). Real time: \(realDep), Planned: \(plannedDep), Delay set to: \(self.adjustedTimetableDelay)s")
                } else if let plannedDep = formatter.date(from: stops[targetStopIndex].departure_date_time) {
                    let delay = now.timeIntervalSince(plannedDep)
                    if abs(delay) < 60 {
                        self.adjustedTimetableDelay = 0.0
                    } else {
                        self.adjustedTimetableDelay = delay
                    }
                    print("🚂 Boarded at stop \(targetStopIndex) (\(stops[targetStopIndex].stop_point.name ?? "")). Scheduled: \(stops[targetStopIndex].departure_date_time), Actual: \(now), Delay adjusted to: \(self.adjustedTimetableDelay)s")
                }
            }
            
            // Generate a random but stable rame number for this trip
            let rameNumber = Int.random(in: 101...999)
            self.activeRameId = "Rame #\(rameNumber)"
            print("🚂 Boarded train: \(self.activeRameId ?? "")")

            // Immediately update UI with ETA to next stop
            updateLoop()
        }
    }

    func selectDeparture(_ departure: Departure) {
        runOnMainThread {
            self.selectedDeparture = departure
            
            // Calculate delay of this departure against the scheduled first stop departure of the current section
            if case .waitingAtStation(_, let section) = self.state {
                if let stops = section.stop_date_times, !stops.isEmpty {
                    let formatter = DateFormat.navitia
                    if let plannedDep = formatter.date(from: stops[0].departure_date_time),
                       let realDep = formatter.date(from: departure.stopDateTime.departureDateTime) {
                        let delay = realDep.timeIntervalSince(plannedDep)
                        self.adjustedTimetableDelay = delay
                        print("🚂 User selected departure: \(departure.stopDateTime.departureDateTime). Delay set to \(delay)s")
                    }
                }
            } else if case .onBoard(let section) = self.state {
                // If they are already onboard, they can still adjust it
                if let stops = section.stop_date_times, !stops.isEmpty {
                    let formatter = DateFormat.navitia
                    if let plannedDep = formatter.date(from: stops[0].departure_date_time),
                       let realDep = formatter.date(from: departure.stopDateTime.departureDateTime) {
                        let delay = realDep.timeIntervalSince(plannedDep)
                        self.adjustedTimetableDelay = delay
                        print("🚂 User adjusted departure: \(departure.stopDateTime.departureDateTime). Delay set to \(delay)s")
                    }
                }
            }
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
        case .walkingToStation(let targetStation, let nextSection):
            let lineName = nextSection.display_informations?.label
            let direction = nextSection.display_informations?.direction
            updateActivity(
                instruction: "Marcher vers \(targetStation.name ?? "Station")",
                nextDepartures: self.nextDepartures,
                lineName: lineName,
                direction: direction,
                lineColor: nextSection.display_informations?.color,
                textColor: nextSection.display_informations?.text_color
            )
            // Fetch departures for the upcoming section so user knows when to hurry
            fetchRealTimeData(for: nextSection)

        case .waitingAtStation(let station, let section):
            let lineName = section.display_informations?.label ?? "Ligne"
            let direction = section.display_informations?.direction ?? ""
            updateActivity(
                instruction: "Prendre \(lineName) vers \(direction)",
                nextDepartures: self.nextDepartures,
                lineName: lineName,
                direction: direction,
                lineColor: section.display_informations?.color,
                textColor: section.display_informations?.text_color
            )
            fetchRealTimeData(for: section)

        case .onBoard(let section):
            let eta = calculateETA(for: section) ?? "--"
            let destination = section.to?.name ?? "Arrêt suivant"
            
            updateActivity(
                instruction: "En direction de \(destination)",
                nextDepartures: ["ETA: \(eta)"],
                lineName: section.display_informations?.label,
                direction: section.display_informations?.direction,
                lineColor: section.display_informations?.color,
                textColor: section.display_informations?.text_color
            )
            
            DispatchQueue.main.async {
                self.currentInstruction = "Prochain arrêt: \(destination)"
                self.nextDepartures = ["Arrivée dans \(eta)"]
            }
            // Update continuous progress
            calculateProgressForCurrentLeg(section: section)
            // Fetch real-time departures onboard
            fetchOnBoardRealTimeData(for: section)

        case .walkingToDestination(let destination):
            updateActivity(
                instruction: "Marcher vers \(destination.name ?? "Destination")",
                nextDepartures: []
            )

        default:
            break
        }
    }
    
    // MARK: - Advanced Progress Logic
    
    private func getStationCoordinate(for stopPoint: ItineraryPlace.StopPoint) -> CLLocationCoordinate2D? {
        let stopId = stopPoint.id ?? ""
        let stopName = stopPoint.name ?? ""
        let cacheKey = "stop_\(stopId)_\(stopName)"
        
        if let cached = coordinateCache[cacheKey] {
            return cached
        }
        
        func cacheAndReturn(_ coord: CLLocationCoordinate2D?) -> CLLocationCoordinate2D? {
            if let c = coord {
                coordinateCache[cacheKey] = c
            }
            return coord
        }
        
        // 1. Try stop_point's own coordinates first
        if let coord = stopPoint.coord,
           let latStr = coord.lat, let lonStr = coord.lon,
           let lat = Double(latStr), let lon = Double(lonStr) {
            return cacheAndReturn(CLLocationCoordinate2D(latitude: lat, longitude: lon))
        }
        
        // 2. Resolve via local stations database if available
        let cleanId = stopId.replacingOccurrences(of: "stop_point:", with: "")
                            .replacingOccurrences(of: "stop_area:", with: "")
                            .replacingOccurrences(of: "IDFM:", with: "")
                            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        let targetName = stopName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Accessing main actor array safely
        var localStations: [MapStation] = []
        if Thread.isMainThread {
            localStations = MapDataService.shared.allStations
        } else {
            localStations = DispatchQueue.main.sync { MapDataService.shared.allStations }
        }
        
        // Match by clean ID
        if !cleanId.isEmpty {
            if let match = localStations.first(where: {
                let cleanLocalId = $0.id.replacingOccurrences(of: "stop_point:", with: "")
                                        .replacingOccurrences(of: "stop_area:", with: "")
                                        .replacingOccurrences(of: "IDFM:", with: "")
                                        .trimmingCharacters(in: .whitespacesAndNewlines)
                return cleanLocalId == cleanId
            }) {
                return cacheAndReturn(match.coordinate)
            }
        }
        
        // Match by name
        if !targetName.isEmpty {
            if let match = localStations.first(where: {
                $0.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == targetName
            }) {
                return cacheAndReturn(match.coordinate)
            }
            
            // Substring match for matching slight name variations
            if let match = localStations.first(where: {
                let localName = $0.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                return localName.contains(targetName) || targetName.contains(localName)
            }) {
                return cacheAndReturn(match.coordinate)
            }
        }
        
        return nil
    }

    private func estimatePositionFromTimetable(stops: [ItineraryStopDateTime]) -> (legIndex: Int, progress: Double)? {
        let formatter = DateFormat.navitia
        let now = Date()
        
        for i in 0..<(stops.count - 1) {
            let stopA = stops[i]
            let stopB = stops[i+1]
            
            guard let plannedDepA = formatter.date(from: stopA.departure_date_time),
                  let plannedArrB = formatter.date(from: stopB.arrival_date_time) else {
                continue
            }
            
            let expectedDepA = plannedDepA.addingTimeInterval(adjustedTimetableDelay)
            let expectedArrB = plannedArrB.addingTimeInterval(adjustedTimetableDelay)
            
            // If we are before expected departure of stop A
            if i == 0 && now < expectedDepA {
                return (0, 0.0)
            }
            
            // If we are between A departure and B arrival
            if now >= expectedDepA && now <= expectedArrB {
                let total = expectedArrB.timeIntervalSince(expectedDepA)
                let progress = total > 0 ? max(0.0, min(1.0, now.timeIntervalSince(expectedDepA) / total)) : 0.0
                return (i, progress)
            }
            
            // If we are at B (stopped at B, before B departure)
            if let plannedDepB = formatter.date(from: stopB.departure_date_time) {
                let expectedDepB = plannedDepB.addingTimeInterval(adjustedTimetableDelay)
                if now > expectedArrB && now < expectedDepB {
                    return (i + 1, 0.0)
                }
            }
        }
        
        // If now is past the arrival time of the last stop
        if let lastStop = stops.last,
           let plannedArrLast = formatter.date(from: lastStop.arrival_date_time) {
            let expectedArrLast = plannedArrLast.addingTimeInterval(adjustedTimetableDelay)
            if now >= expectedArrLast {
                return (stops.count - 2, 1.0)
            }
        }
        
        return nil
    }

    private func calculateProgressForCurrentLeg(section: ItinerarySection) {
        guard let stops = section.stop_date_times, stops.count > 1 else { return }
        
        let now = Date()
        let formatter = DateFormat.navitia
        
        // Check if location is working
        let isLocWorking = self.isLocationWorking
        
        // Use user location (simulated or real GPS coordinates)
        let locationCandidate = lastLocation ?? LocationManager.shared.userLocation
        
        // 1. Determine active leg index using coordinates if GPS is active and working
        var bestLegIndex = currentLegIndex
        var t_gps: Double? = nil
        
        if isLocWorking, let location = locationCandidate {
            var minDistance: CLLocationDistance = .infinity
            
            for i in 0..<(stops.count - 1) {
                let stopA = stops[i]
                let stopB = stops[i+1]
                
                guard let coordA = getStationCoordinate(for: stopA.stop_point),
                      let coordB = getStationCoordinate(for: stopB.stop_point) else {
                    continue
                }
                
                let latA = coordA.latitude
                let lonA = coordA.longitude
                let latB = coordB.latitude
                let lonB = coordB.longitude
                
                // Project user location onto the line segment AB
                let dx = lonB - lonA
                let dy = latB - latA
                let denom = dx * dx + dy * dy
                
                var t = 0.0
                if denom > 0 {
                    t = ((location.longitude - lonA) * dx + (location.latitude - latA) * dy) / denom
                }
                t = max(0.0, min(1.0, t))
                
                let projLat = latA + t * dy
                let projLon = lonA + t * dx
                
                let projLoc = CLLocation(latitude: projLat, longitude: projLon)
                let userLoc = CLLocation(latitude: location.latitude, longitude: location.longitude)
                let dist = userLoc.distance(from: projLoc)
                
                if dist < minDistance {
                    minDistance = dist
                    bestLegIndex = i
                    if denom > 0 {
                        t_gps = t
                    }
                }
            }
            
            // Only update leg index if distance is reasonable (within 5km)
            if minDistance < 5000 {
                runOnMainThread {
                    // Prevent leg index from jumping backward
                    if bestLegIndex >= self.currentLegIndex && self.currentLegIndex != bestLegIndex {
                        self.currentLegIndex = bestLegIndex
                        self.progress = t_gps ?? 0.0 // Reset progress immediately on leg index change to avoid jump
                        
                        // Immediately update Live Activity
                        let eta = self.calculateETA(for: section) ?? "--"
                        let destination = section.to?.name ?? "Arrêt suivant"
                        self.updateActivity(
                            instruction: "En direction de \(destination)",
                            nextDepartures: ["ETA: \(eta)"]
                        )
                    } else if bestLegIndex == self.currentLegIndex {
                        // If device is unlocked, update in real-time as progress moves!
                        let oldProgress = self.progress
                        self.progress = t_gps ?? 0.0
                        if !self.isDeviceLocked && abs(self.progress - oldProgress) > 0.01 {
                            let eta = self.calculateETA(for: section) ?? "--"
                            let destination = section.to?.name ?? "Arrêt suivant"
                            self.updateActivity(
                                instruction: "En direction de \(destination)",
                                nextDepartures: ["ETA: \(eta)"]
                            )
                        }
                    }
                }
            }
        }
        
        // 2. Fallback: Automatically advance currentLegIndex based on time if GPS is not available/stable
        if t_gps == nil {
            if let estimation = estimatePositionFromTimetable(stops: stops) {
                runOnMainThread {
                    // Prevent leg index from jumping backward in timetable fallback
                    if estimation.legIndex >= self.currentLegIndex && self.currentLegIndex != estimation.legIndex {
                        self.currentLegIndex = estimation.legIndex
                        self.progress = estimation.progress // Reset progress without animation first
                        
                        // Immediately update Live Activity
                        let eta = self.calculateETA(for: section) ?? "--"
                        let destination = section.to?.name ?? "Arrêt suivant"
                        self.updateActivity(
                            instruction: "En direction de \(destination)",
                            nextDepartures: ["ETA: \(eta)"]
                        )
                    } else if estimation.legIndex == self.currentLegIndex {
                        let oldProgress = self.progress
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.progress = estimation.progress
                        }
                        
                        // If device is unlocked, update in real-time as progress moves!
                        if !self.isDeviceLocked && abs(estimation.progress - oldProgress) > 0.01 {
                            let eta = self.calculateETA(for: section) ?? "--"
                            let destination = section.to?.name ?? "Arrêt suivant"
                            self.updateActivity(
                                instruction: "En direction de \(destination)",
                                nextDepartures: ["ETA: \(eta)"]
                            )
                        }
                    }
                }
                return
            }
        }
        
        // 3. Compute blended/hybrid progress for the active leg
        let activeLeg = self.currentLegIndex
        if activeLeg >= 0 && activeLeg < stops.count - 1 {
            let stopA = stops[activeLeg]
            let stopB = stops[activeLeg + 1]
            
            // Time-based progress between current station and next station
            var t_time = 0.0
            if let plannedDepA = formatter.date(from: stopA.departure_date_time),
               let plannedArrB = formatter.date(from: stopB.arrival_date_time) {
                let expectedDepA = plannedDepA.addingTimeInterval(adjustedTimetableDelay)
                let expectedArrB = plannedArrB.addingTimeInterval(adjustedTimetableDelay)
                let totalDuration = expectedArrB.timeIntervalSince(expectedDepA)
                
                if totalDuration > 0 {
                    let elapsed = now.timeIntervalSince(expectedDepA)
                    t_time = max(0.0, min(1.0, elapsed / totalDuration))
                }
            }
            
            // Hybrid blend
            var finalProgress = t_time
            if let gpsProgress = t_gps {
                if isSimulating {
                    // In simulation mode, trust coordinates completely
                    finalProgress = gpsProgress
                } else {
                    // Blended: 70% GPS, 30% Time
                    finalProgress = 0.7 * gpsProgress + 0.3 * t_time
                }
            }
            
            runOnMainThread {
                withAnimation(.easeInOut(duration: 0.5)) {
                    self.progress = finalProgress
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

        let nextTimes = relevant.prefix(5).compactMap {
            timeRemaining($0.stopDateTime.departureDateTime)
        }

        DispatchQueue.main.async {
            self.departuresList = Array(relevant.prefix(5))
            self.nextDepartures = nextTimes
            
            // Set default selected departure if nil
            if self.selectedDeparture == nil, let first = relevant.first {
                self.selectedDeparture = first
            }
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

    private func fetchOnBoardRealTimeData(for section: ItinerarySection) {
        guard let stops = section.stop_date_times,
              currentLegIndex + 1 < stops.count,
              let stopId = stops[currentLegIndex + 1].stop_point.id else { return }

        IDFMService.shared.fetchDepartures(for: stopId)
            .sink(
                receiveCompletion: { _ in },
                receiveValue: { [weak self] departures in
                    self?.processOnBoardDepartures(departures, for: section)
                }
            )
            .store(in: &cancellables)
    }

    private func processOnBoardDepartures(_ departures: [Departure], for section: ItinerarySection) {
        guard let lineName = section.display_informations?.label,
              let stops = section.stop_date_times,
              currentLegIndex + 1 < stops.count else { return }

        let nextStop = stops[currentLegIndex + 1]
        let formatter = DateFormat.navitia

        let relevant = departures.filter { dep in
            return dep.displayInformations.label == lineName
        }

        if let plannedArrivalAtNextStop = formatter.date(from: nextStop.arrival_date_time) {
            let matched = relevant.min(by: { a, b in
                guard let dateA = formatter.date(from: a.stopDateTime.departureDateTime),
                      let dateB = formatter.date(from: b.stopDateTime.departureDateTime) else { return false }
                return abs(dateA.timeIntervalSince(plannedArrivalAtNextStop)) < abs(dateB.timeIntervalSince(plannedArrivalAtNextStop))
            })

            if let match = matched,
               let realTime = formatter.date(from: match.stopDateTime.departureDateTime) {
                let delay = realTime.timeIntervalSince(plannedArrivalAtNextStop)
                runOnMainThread {
                    self.adjustedTimetableDelay = delay
                    print("🚂 Real-time update onboard next stop \(nextStop.stop_point.name ?? ""): delay is \(delay)s")
                }
            }
        }
    }

    private func checkIfTrainDeparted(_ departures: [Departure]) {
        // If the user has selected a departure, track THAT one.
        // Otherwise, default to the first one in the list.
        let targetDeparture = departures.first(where: { $0.id == selectedDeparture?.id }) ?? departures.first

        if let target = targetDeparture {
            let remaining = timeRemaining(target.stopDateTime.departureDateTime)
            if remaining == "0 min" || remaining == "A quai" {
                if case .waitingAtStation(_, let section) = state {
                    print("🚂 Target train departing, assuming user is on board")
                    if selectedDeparture == nil {
                        selectDeparture(target)
                    }
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
            textColor: nil,
            remainingTime: nil,
            progress: nil,
            stops: nil,
            currentLegIndex: nil
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

        var stopsList: [String]? = nil
        var legIdx: Int? = nil
        var activeLine: String? = lineName
        var activeDir: String? = direction
        var activeColor: String? = lineColor
        var activeTxtColor: String? = textColor
        
        switch state {
        case .onBoard(let section):
            stopsList = section.stop_date_times?.compactMap { $0.stop_point.name }
            legIdx = currentLegIndex
            if activeLine == nil { activeLine = section.display_informations?.label }
            if activeDir == nil { activeDir = section.display_informations?.direction }
            if activeColor == nil { activeColor = section.display_informations?.color }
            if activeTxtColor == nil { activeTxtColor = section.display_informations?.text_color }
        case .waitingAtStation(_, let section):
            stopsList = section.stop_date_times?.compactMap { $0.stop_point.name }
            legIdx = 0
            if activeLine == nil { activeLine = section.display_informations?.label }
            if activeDir == nil { activeDir = section.display_informations?.direction }
            if activeColor == nil { activeColor = section.display_informations?.color }
            if activeTxtColor == nil { activeTxtColor = section.display_informations?.text_color }
        case .walkingToStation(_, let nextSection):
            stopsList = nextSection.stop_date_times?.compactMap { $0.stop_point.name }
            legIdx = 0
            if activeLine == nil { activeLine = nextSection.display_informations?.label }
            if activeDir == nil { activeDir = nextSection.display_informations?.direction }
            if activeColor == nil { activeColor = nextSection.display_informations?.color }
            if activeTxtColor == nil { activeTxtColor = nextSection.display_informations?.text_color }
        default:
            break
        }

        let contentState = NavigationActivityAttributes.ContentState(
            currentInstruction: instruction,
            nextDepartures: nextDepartures,
            lineName: activeLine,
            direction: activeDir,
            lineColor: activeColor,
            textColor: activeTxtColor,
            remainingTime: nil,
            progress: self.isDeviceLocked ? 0.0 : progress,
            stops: stopsList,
            currentLegIndex: legIdx
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

    private func forceLiveActivityUpdate() {
        guard isNavigating, let journey = currentJourney, let sections = journey.sections,
              currentSectionIndex < sections.count else { return }
              
        let section = sections[currentSectionIndex]
        
        switch state {
        case .walkingToStation(let targetStation, let nextSection):
            let lineName = nextSection.display_informations?.label
            let direction = nextSection.display_informations?.direction
            updateActivity(
                instruction: "Marcher vers \(targetStation.name ?? "Station")",
                nextDepartures: self.nextDepartures,
                lineName: lineName,
                direction: direction,
                lineColor: nextSection.display_informations?.color,
                textColor: nextSection.display_informations?.text_color
            )
            
        case .waitingAtStation(let station, let section):
            let lineName = section.display_informations?.label ?? "Ligne"
            let direction = section.display_informations?.direction ?? ""
            updateActivity(
                instruction: "Prendre \(lineName) vers \(direction)",
                nextDepartures: self.nextDepartures,
                lineName: lineName,
                direction: direction,
                lineColor: section.display_informations?.color,
                textColor: section.display_informations?.text_color
            )
            
        case .onBoard(let section):
            let eta = calculateETA(for: section) ?? "--"
            let destination = section.to?.name ?? "Arrêt suivant"
            updateActivity(
                instruction: "En direction de \(destination)",
                nextDepartures: ["ETA: \(eta)"],
                lineName: section.display_informations?.label,
                direction: section.display_informations?.direction,
                lineColor: section.display_informations?.color,
                textColor: section.display_informations?.text_color
            )
            
        case .walkingToDestination(let destination):
            updateActivity(
                instruction: "Marcher vers \(destination.name ?? "Destination")",
                nextDepartures: []
            )
            
        case .idle:
            break
        }
    }
#else
    private func startActivity() {}
    private func updateActivity(
        instruction: String, nextDepartures: [String], lineName: String? = nil,
        direction: String? = nil, lineColor: String? = nil, textColor: String? = nil
    ) {}
    private func endActivity() {}
    private func forceLiveActivityUpdate() {}
#endif

    // MARK: - Simulation Mode
    
    @Published var isSimulating = false
    private var simulationPoints: [CLLocationCoordinate2D] = []
    private var simulationIndex = 0
    private var simulationTimer: Timer?
    
    func startSimulation() {
        guard let journey = currentJourney else { return }
        print("🎮 Starting in-app journey simulation")
        
        // Reset current section, index, legs and progress to start from the beginning
        self.currentSectionIndex = 0
        self.currentLegIndex = 0
        self.progress = 0.0
        determineNextState()
        
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
                            let lat = coord[1]
                            let lon = coord[0]
                            if lat != 0.0 && lon != 0.0 {
                                points.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
                            }
                        }
                    }
                } else {
                    // Otherwise, just use from and to coordinates
                    if let from = section.from, let fromCoord = from.coord,
                       let latStr = fromCoord.lat, let lonStr = fromCoord.lon,
                       let lat = Double(latStr), let lon = Double(lonStr) {
                        if lat != 0.0 && lon != 0.0 {
                            points.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
                        }
                    }
                    if let to = section.to, let toCoord = to.coord,
                       let latStr = toCoord.lat, let lonStr = toCoord.lon,
                       let lat = Double(latStr), let lon = Double(lonStr) {
                        if lat != 0.0 && lon != 0.0 {
                            points.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
                        }
                    }
                }
            }
        }
        
        guard !points.isEmpty else {
            print("⚠️ No coordinates found to simulate")
            return
        }
        
        // Interpolate and filter coordinates to make the simulation extremely smooth
        var smoothPoints: [CLLocationCoordinate2D] = []
        for i in 0..<(points.count - 1) {
            let pA = points[i]
            let pB = points[i+1]
            
            let locA = CLLocation(latitude: pA.latitude, longitude: pA.longitude)
            let locB = CLLocation(latitude: pB.latitude, longitude: pB.longitude)
            let distance = locB.distance(from: locA)
            
            // Only add if it's not a duplicate point
            if distance > 1.0 {
                smoothPoints.append(pA)
                
                // Interpolate steps of ~15 meters
                let stepSize: Double = 15.0
                if distance > stepSize {
                    let stepsCount = Int(distance / stepSize)
                    for step in 1..<stepsCount {
                        let fraction = Double(step) / Double(stepsCount)
                        let lat = pA.latitude + (pB.latitude - pA.latitude) * fraction
                        let lon = pA.longitude + (pB.longitude - pA.longitude) * fraction
                        smoothPoints.append(CLLocationCoordinate2D(latitude: lat, longitude: lon))
                    }
                }
            }
        }
        if let last = points.last {
            smoothPoints.append(last)
        }
        
        self.simulationPoints = smoothPoints
        self.simulationIndex = 0
        
        // Start the timer with a faster tick (0.15s) for high fluidity
        simulationTimer?.invalidate()
        simulationTimer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { [weak self] _ in
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

#if os(iOS)
extension NavigationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "CONFIRM_BOARDING" {
            confirmBoarding()
        }
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
}
#endif
