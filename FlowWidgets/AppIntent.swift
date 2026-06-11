//
//  AppIntent.swift
//  FlowWidgets
//
//  Created by Antoine BLEUZE on 22/11/2025.
//

import WidgetKit
import AppIntents
import ActivityKit

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}

public struct RefreshDeparturesIntent: LiveActivityIntent {
    public static var title: LocalizedStringResource = "Rafraîchir les départs"
    
    public init() {}
    
    public func perform() async throws -> some IntentResult {
        print("⚡️ [AppIntent] RefreshDeparturesIntent running!")
        
        // Find the active activity
        guard let activity = Activity<StationActivityAttributes>.activities.first else {
            print("⚠️ No active Live Activity found")
            return .result()
        }
        
        let state = activity.content.state
        let defaults = UserDefaults(suiteName: "group.AntoineBleuze.Flow")
        let stopIds = defaults?.stringArray(forKey: "live_activity_stop_ids") ?? []
        let lineColor = defaults?.string(forKey: "live_activity_line_color") ?? state.lineColor
        let textColor = defaults?.string(forKey: "live_activity_text_color") ?? state.textColor
        
        guard !stopIds.isEmpty else {
            print("⚠️ No stop IDs found in UserDefaults")
            return .result()
        }
        
        var allDepartures: [String] = []
        
        for stopId in stopIds {
            do {
                let urlString = "https://prim.iledefrance-mobilites.fr/marketplace/v2/navitia/stop_points/\(stopId)/departures?count=10"
                guard let url = URL(string: urlString) else { continue }
                
                var request = URLRequest(url: url)
                let apiKey = defaults?.string(forKey: "idfm_api_key") ?? ""
                if !apiKey.isEmpty {
                    request.setValue(apiKey, forHTTPHeaderField: "apiKey")
                }
                
                let (data, response) = try await URLSession.shared.data(for: request)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { continue }
                
                struct StopPointResponse: Codable {
                    struct DepartureItem: Codable {
                        struct DisplayInfo: Codable {
                            let label: String?
                            let direction: String?
                        }
                        struct StopDateTime: Codable {
                            let departure_date_time: String
                        }
                        let display_informations: DisplayInfo
                        let stop_date_time: StopDateTime
                    }
                    let departures: [DepartureItem]?
                }
                
                let decoded = try JSONDecoder().decode(StopPointResponse.self, from: data)
                if let departures = decoded.departures {
                    let filtered = departures.filter { dep in
                        dep.display_informations.label == state.lineName &&
                        dep.display_informations.direction == state.direction
                    }
                    
                    for dep in filtered {
                        allDepartures.append(dep.stop_date_time.departure_date_time)
                    }
                }
            } catch {
                print("❌ Error fetching in AppIntent: \(error)")
            }
        }
        
        let sortedDateStrings = allDepartures.sorted()
        var newDepartures: [String] = []
        
        let navitiaFormatter = DateFormatter()
        navitiaFormatter.dateFormat = "yyyyMMdd'T'HHmmss"
        navitiaFormatter.timeZone = TimeZone(identifier: "Europe/Paris")
        
        let now = Date()
        for dateStr in sortedDateStrings {
            if let date = navitiaFormatter.date(from: dateStr) {
                let minutesAway = Int(date.timeIntervalSince(now) / 60)
                if minutesAway >= 0 && minutesAway < 120 {
                    newDepartures.append("\(minutesAway) min")
                }
            }
        }
        
        let timesToUse = Array(newDepartures.prefix(2))
        if !timesToUse.isEmpty {
            let updatedState = StationActivityAttributes.ContentState(
                nextDepartures: timesToUse,
                lineName: state.lineName,
                direction: state.direction,
                lineColor: lineColor,
                textColor: textColor
            )
            
            await activity.update(ActivityContent(state: updatedState, staleDate: Date().addingTimeInterval(60)))
            print("✅ [AppIntent] Live Activity refreshed successfully with times: \(timesToUse)")
        } else {
            print("⚠️ [AppIntent] No new departures found, keeping old ones")
        }
        
        return .result()
    }
}
