#if os(iOS)
import ActivityKit
import Foundation

struct StationActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var nextDepartures: [String] // Ex: ["12:05", "12:10"]
        var lineName: String
        var direction: String
        var lineColor: String // Ex: "FFCD00" (jaune métro 1)
        var textColor: String // Ex: "000000" (noir)
    }

    // Fixed non-changing properties about your activity go here!
    var stationName: String
}
#endif
