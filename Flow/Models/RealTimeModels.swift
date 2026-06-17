import Foundation

// MARK: - API Response
struct DepartureResponse: Decodable {
    let departures: [Departure]
}

struct Departure: Decodable, Identifiable {
    // On utilise une combinaison pour l'id car l'API ne donne pas toujours un ID unique simple pour un départ
    var id: String {
        return
            "\(displayInformations.label ?? "?")-\(stopDateTime.departureDateTime)-\(displayInformations.direction ?? "?")"
    }

    let displayInformations: DisplayInformations
    let stopDateTime: StopDateTime

    enum CodingKeys: String, CodingKey {
        case displayInformations = "display_informations"
        case stopDateTime = "stop_date_time"
    }
}

struct DisplayInformations: Decodable {
    let direction: String?
    let label: String?  // Ex: "12", "A"
    let code: String?  // Ex: "12"
    let color: String?  // Ex: "0055C8"
    let commercial_mode: String?  // Ex: "Metro", "RER"
    let network: String?
    let textColor: String?  // Ex: "FFFFFF"
    let name: String?

    enum CodingKeys: String, CodingKey {
        case direction
        case label
        case code
        case color
        case commercial_mode
        case network
        case textColor = "text_color"
        case name
    }
}

struct StopDateTime: Decodable {
    // Format attendu: "YYYYMMDDTHHMMSS" souvent avec Navitia
    let departureDateTime: String
    let stopPoint: StopPointRef?

    enum CodingKeys: String, CodingKey {
        case departureDateTime = "departure_date_time"
        case stopPoint = "stop_point"
    }

    init(departureDateTime: String, stopPoint: StopPointRef? = nil) {
        self.departureDateTime = departureDateTime
        self.stopPoint = stopPoint
    }
}

struct StopPointRef: Decodable {
    let id: String
    let name: String?
}
