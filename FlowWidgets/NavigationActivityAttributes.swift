import ActivityKit
import Foundation

struct NavigationActivityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic state
        var currentInstruction: String // "Walk to Mairie d'Issy"
        var nextDepartures: [String] // ["12:05", "12:10"]
        var lineName: String? // "12"
        var direction: String? // "Mairie d'Aubervilliers"
        var lineColor: String? // "008833"
        var textColor: String? // "FFFFFF"
        var remainingTime: String? // "5 min" (walking or travel time)
        var progress: Double? // 0.0 to 1.0
    }

    // Fixed properties
    var destinationName: String
}
