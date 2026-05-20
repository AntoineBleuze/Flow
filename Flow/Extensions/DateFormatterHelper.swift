import Foundation

/// DateFormatters partagés pour éviter de recréer ces objets coûteux à chaque appel.
/// Apple recommande de réutiliser les DateFormatter car leur initialisation est très lente.
enum DateFormat {
    /// Format Navitia standard : "yyyyMMdd'T'HHmmss" (ex: "20260215T183000")
    static let navitia: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        return formatter
    }()

    /// Format Navitia avec timezone Europe/Paris
    static let navitiaParisTimezone: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        formatter.timeZone = TimeZone(identifier: "Europe/Paris")
        return formatter
    }()

    /// Format heure courte : "HH:mm"
    static let shortTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    // MARK: - Helpers communs

    /// Calcule le temps restant à partir d'une date Navitia (ex: "3 min", "0 min")
    static func timeRemaining(from dateString: String) -> String {
        guard let date = navitia.date(from: dateString) else { return "" }
        let diff = Int(date.timeIntervalSinceNow / 60)
        if diff <= 0 { return "0 min" }
        return "\(diff) min"
    }

    /// Formate une date Navitia en heure courte (ex: "18:30")
    static func formatTime(from dateString: String) -> String {
        guard let date = navitia.date(from: dateString) else { return dateString }
        return shortTime.string(from: date)
    }
}
