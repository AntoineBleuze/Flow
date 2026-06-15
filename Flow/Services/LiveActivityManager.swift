#if os(iOS)
import ActivityKit
import Combine
import Foundation
import UIKit

class LiveActivityManager: ObservableObject {
    static let shared = LiveActivityManager()

    @Published var activeActivityID: String?

    private var currentActivity: Activity<StationActivityAttributes>?
    private var updateTimer: Timer?
    private var cancellables = Set<AnyCancellable>()

    // Context for updates
    private var currentStopIds: [String] = []
    private var currentLineName: String = ""
    private var currentDirection: String = ""
    private var currentLineColor: String = "000000"
    private var currentTextColor: String = "FFFFFF"

    private init() {}

    func startLiveActivity(
        stationName: String, lineName: String, direction: String, nextDepartures: [String],
        stopIds: [String], lineColor: String, textColor: String
    ) {
        guard ActivityAuthorizationInfo().areActivitiesEnabled else {
            print("🚫 Live Activities are not enabled")
            return
        }

        // End any existing activity first
        endLiveActivity()

        // Store context for updates
        self.currentStopIds = stopIds
        self.currentLineName = lineName
        self.currentDirection = direction
        self.currentLineColor = lineColor
        self.currentTextColor = textColor

        saveActivityContext(stopIds: stopIds, lineColor: lineColor, textColor: textColor)

        let attributes = StationActivityAttributes(stationName: stationName)
        let contentState = StationActivityAttributes.ContentState(
            nextDepartures: nextDepartures,
            lineName: lineName,
            direction: direction,
            lineColor: lineColor,
            textColor: textColor
        )

        print("📊 Live Activity Data:")
        print("  Station: \(stationName)")
        print("  Line: \(lineName)")
        print("  Direction: \(direction)")
        print("  Departures: \(nextDepartures)")
        print("  Colors: #\(lineColor) / #\(textColor)")

        do {
            // Set initial staleDate
            let staleDate = Date().addingTimeInterval(60)

            let activity = try Activity.request(
                attributes: attributes,
                content: .init(state: contentState, staleDate: staleDate),
                pushType: nil
            )
            currentActivity = activity
            activeActivityID = activity.id
            print("✅ Live Activity started: \(activity.id)")

            // Monitor activity state
            Task {
                for await state in activity.activityStateUpdates {
                    if state == .dismissed || state == .ended {
                        print("🛑 Live Activity was dismissed or ended")
                        await MainActor.run {
                            self.stopUpdating()
                            self.currentActivity = nil
                            self.activeActivityID = nil
                            LocationManager.shared.setBackgroundUpdates(enabled: false)
                        }
                    }
                }
            }

            // Start the update timer
            startUpdating()

            // Keep app alive with location
            LocationManager.shared.setBackgroundUpdates(enabled: true)
            LocationManager.shared.startTracking()
        } catch {
            print("❌ Error starting Live Activity: \(error.localizedDescription)")
        }
    }

    func updateLiveActivity(nextDepartures: [String], lineName: String, direction: String) {
        guard let activity = currentActivity else { return }

        let contentState = StationActivityAttributes.ContentState(
            nextDepartures: nextDepartures,
            lineName: lineName,
            direction: direction,
            lineColor: currentLineColor,
            textColor: currentTextColor
        )

        Task {
            // Set staleDate to 60 seconds in the future
            // This hints the system to wake up the app to refresh the content
            let staleDate = Date().addingTimeInterval(60)

            await activity.update(
                ActivityContent(state: contentState, staleDate: staleDate)
            )
            print("🔄 Live Activity updated with times: \(nextDepartures) (stale in 60s)")
        }
    }

    func endLiveActivity() {
        stopUpdating()

        guard let activity = currentActivity else { return }

        Task {
            await activity.end(nil, dismissalPolicy: .immediate)
            print("🛑 Live Activity ended")
            await MainActor.run {
                self.currentActivity = nil
                self.activeActivityID = nil
                LocationManager.shared.setBackgroundUpdates(enabled: false)
            }
        }
    }

    func isActivityActive(line: String, direction: String) -> Bool {
        guard currentActivity != nil else { return false }
        return currentLineName == line && currentDirection == direction
    }

    // MARK: - Periodic Updates

    private func startUpdating() {
        stopUpdating()  // Safety check

        print("📡 Starting Live Activity monitoring (WS Push + 120s Fallback)")
        print(
            "📍 Monitoring \(currentStopIds.count) stop IDs for \(currentLineName) → \(currentDirection)"
        )

        // 1. S'abonner via WebSocket
        FlowServerService.shared.sendSubscribeDepartures(
            stopIds: currentStopIds,
            line: currentLineName,
            direction: currentDirection
        )

        // 2. Écouter les notifications de push (WS)
        NotificationCenter.default.publisher(for: .flowServerDepartureUpdate)
            .compactMap { $0.userInfo?["departures"] as? [Departure] }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] departures in
                print("⚡️ [LiveActivity] Push reçu: \(departures.count) départs")
                self?.processUpdates(departures)
            }
            .store(in: &cancellables)

        // 3. Fallback timer (60s) au cas où le WS est déconnecté
        updateTimer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) {
            [weak self] _ in
            print("\n⏰ [LiveActivity] Fallback timer fired - Fetching updates...")
            self?.fetchUpdates()
        }
    }

    private func stopUpdating() {
        if updateTimer != nil {
            print("🛑 Stopping Live Activity monitoring")
        }
        
        // Se désabonner du WS
        FlowServerService.shared.sendUnsubscribeDepartures()
        
        #if os(iOS)
        // Si l'application est en arrière-plan et qu'on arrête de monitorer, on coupe le WebSocket global
        if UIApplication.shared.applicationState == .background {
            print("🔋 [LiveActivity] Arrêt du monitoring en arrière-plan. Déconnexion immédiate du WebSocket.")
            FlowServerService.shared.disconnectWebSocket()
        }
        #endif
        
        updateTimer?.invalidate()
        updateTimer = nil
        cancellables.removeAll()

        // Stop location tracking
        LocationManager.shared.stopTracking()
    }

    private func fetchUpdates() {
        guard !currentStopIds.isEmpty else {
            print("⚠️ No stop IDs configured for updates")
            return
        }

        print("📡 Fetching departures for \(currentStopIds.count) stops...")

        let publishers = currentStopIds.map { id in
            IDFMService.shared.fetchDepartures(for: id)
                .catch { error -> Just<[Departure]> in
                    print("⚠️ Error fetching stop \(id): \(error)")
                    return Just([])
                }
        }

        Publishers.MergeMany(publishers)
            .collect()
            .map { results in results.flatMap { $0 } }
            .receive(on: DispatchQueue.main)
            .sink { allDepartures in
                if allDepartures.isEmpty {
                    print("⚠️ No departures returned from API")
                } else {
                    print("✅ Received \(allDepartures.count) total departures")
                }
                self.processUpdates(allDepartures)
            }
            .store(in: &cancellables)
    }

    private func processUpdates(_ departures: [Departure]) {
        print("🔍 Processing updates for \(currentLineName) → \(currentDirection)")

        // Filter for the current line and direction
        let relevantDepartures = departures.filter { dep in
            guard let label = dep.displayInformations.label else { return false }
            let dir = dep.displayInformations.direction ?? ""

            return label == self.currentLineName && dir == self.currentDirection
        }

        print("  → Found \(relevantDepartures.count) matching departures")

        // Extract times
        let nextTimes = relevantDepartures.prefix(2).compactMap { dep in
            let timeStr = self.timeRemaining(dep.stopDateTime.departureDateTime)
            return timeStr.isEmpty ? nil : timeStr
        }

        if !nextTimes.isEmpty {
            print("  → Updating Live Activity with times: \(nextTimes)")
            updateLiveActivity(
                nextDepartures: Array(nextTimes),
                lineName: self.currentLineName,
                direction: self.currentDirection
            )
        } else {
            print("  ⚠️ No valid times found to update")
        }
    }

    private func saveActivityContext(stopIds: [String], lineColor: String, textColor: String) {
        if let defaults = UserDefaults(suiteName: "group.AntoineBleuze.Flow") {
            defaults.set(stopIds, forKey: "live_activity_stop_ids")
            defaults.set(lineColor, forKey: "live_activity_line_color")
            defaults.set(textColor, forKey: "live_activity_text_color")
            defaults.set(IDFMService.shared.apiKey, forKey: "idfm_api_key")
            defaults.synchronize()
        }
    }

    private func timeRemaining(_ dateString: String) -> String {
        return DateFormat.timeRemaining(from: dateString)
    }
}
#else
import Foundation
import Combine

class LiveActivityManager: ObservableObject {
    static let shared = LiveActivityManager()

    @Published var activeActivityID: String? = nil

    private init() {}

    func startLiveActivity(
        stationName: String, lineName: String, direction: String, nextDepartures: [String],
        stopIds: [String], lineColor: String, textColor: String
    ) {}

    func updateLiveActivity(nextDepartures: [String], lineName: String, direction: String) {}

    func endLiveActivity() {}

    func isActivityActive(line: String, direction: String) -> Bool {
        return false
    }
}
#endif
