import Foundation
import ActivityKit
import Combine

class LiveActivityManager {
    static let shared = LiveActivityManager()
    
    private var currentActivity: Activity<StationActivityAttributes>?
    private var updateTimer: Timer?
    
    // Context for updates
    private var currentStopIds: [String] = []
    private var currentLineName: String = ""
    private var currentDirection: String = ""
    
    private init() {}
    
    func startLiveActivity(stationName: String, lineName: String, direction: String, nextDepartures: [String], stopIds: [String]) {
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
        
        let attributes = StationActivityAttributes(stationName: stationName)
        let contentState = StationActivityAttributes.ContentState(
            nextDepartures: nextDepartures,
            lineName: lineName,
            direction: direction
        )
        
        print("📊 Live Activity Data:")
        print("  Station: \(stationName)")
        print("  Line: \(lineName)")
        print("  Direction: \(direction)")
        print("  Departures: \(nextDepartures)")
        
        do {
            let activity = try Activity.request(
                attributes: attributes,
                content: .init(state: contentState, staleDate: nil),
                pushType: nil
            )
            currentActivity = activity
            print("✅ Live Activity started: \(activity.id)")
            
            // Start the update timer
            startUpdating()
        } catch {
            print("❌ Error starting Live Activity: \(error.localizedDescription)")
        }
    }
    
    func updateLiveActivity(nextDepartures: [String], lineName: String, direction: String) {
        guard let activity = currentActivity else { return }
        
        let contentState = StationActivityAttributes.ContentState(
            nextDepartures: nextDepartures,
            lineName: lineName,
            direction: direction
        )
        
        Task {
            await activity.update(
                ActivityContent(state: contentState, staleDate: nil)
            )
            print("🔄 Live Activity updated with times: \(nextDepartures)")
        }
    }
    
    func endLiveActivity() {
        stopUpdating()
        
        guard let activity = currentActivity else { return }
        
        Task {
            await activity.end(nil, dismissalPolicy: .immediate)
            print("🛑 Live Activity ended")
            self.currentActivity = nil
        }
    }
    
    // MARK: - Periodic Updates
    
    private func startUpdating() {
        stopUpdating() // Safety check
        
        print("⏱️ Starting Live Activity update timer (60s)")
        updateTimer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: true) { [weak self] _ in
            self?.fetchUpdates()
        }
    }
    
    private func stopUpdating() {
        if updateTimer != nil {
            print("🛑 Stopping Live Activity update timer")
            updateTimer?.invalidate()
            updateTimer = nil
        }
    }
    
    private func fetchUpdates() {
        guard !currentStopIds.isEmpty else { return }
        print("📡 Fetching updates for Live Activity...")
        
        // Use IDFMService to fetch fresh data
        // We need to combine results like in StationDetailSheet
        let publishers = currentStopIds.map { id in
            IDFMService.shared.fetchDepartures(for: id)
                .catch { _ in Just([]) }
        }
        
        _ = Publishers.MergeMany(publishers)
            .collect()
            .map { results in
                results.flatMap { $0 }.sorted {
                    $0.stopDateTime.departureDateTime < $1.stopDateTime.departureDateTime
                }
            }
            .sink(receiveValue: { [weak self] allDepartures in
                guard let self = self else { return }
                self.processUpdates(allDepartures)
            })
    }
    
    private func processUpdates(_ departures: [Departure]) {
        // Filter for the current line and direction
        // Logic similar to StationDetailSheet.groupDepartures but simplified for specific target
        
        let relevantDepartures = departures.filter { dep in
            guard let label = dep.displayInformations.label else { return false }
            let dir = dep.displayInformations.direction ?? ""
            
            // Simple matching
            return label == self.currentLineName && dir == self.currentDirection
        }
        
        // Extract times
        let nextTimes = relevantDepartures.prefix(2).compactMap { dep -> String? in
            let timeStr = self.timeRemaining(dep.stopDateTime.departureDateTime)
            return timeStr.isEmpty ? nil : timeStr
        }
        
        if !nextTimes.isEmpty {
            updateLiveActivity(
                nextDepartures: Array(nextTimes),
                lineName: self.currentLineName,
                direction: self.currentDirection
            )
        } else {
            print("⚠️ No relevant updates found for Live Activity")
        }
    }
    
    // Helper to calculate time remaining (duplicated from StationDetailSheet for now, could be shared)
    private func timeRemaining(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        if let date = formatter.date(from: dateString) {
            let diff = Int(date.timeIntervalSinceNow / 60)
            if diff <= 0 { return "Maintenant" }
            return "\(diff) min"
        }
        return ""
    }
}
