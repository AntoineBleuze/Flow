import Foundation

// MARK: - API Response
public struct DepartureResponse: Decodable {
    public let departures: [Departure]
}

public struct Departure: Decodable, Identifiable {
    // On utilise une combinaison pour l'id car l'API ne donne pas toujours un ID unique simple pour un départ
    public var id: String {
        return
            "\(displayInformations.label ?? "?")-\(stopDateTime.departureDateTime)-\(displayInformations.direction ?? "?")"
    }

    public let displayInformations: DisplayInformations
    public let stopDateTime: StopDateTime

    enum CodingKeys: String, CodingKey {
        case displayInformations = "display_informations"
        case stopDateTime = "stop_date_time"
    }
}

public struct DisplayInformations: Decodable {
    public let direction: String?
    public let label: String?  // Ex: "12", "A"
    public let code: String?  // Ex: "12"
    public let color: String?  // Ex: "0055C8"
    public let commercial_mode: String?  // Ex: "Metro", "RER"
    public let network: String?
    public let textColor: String?  // Ex: "FFFFFF"
    public let name: String?

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

public struct StopDateTime: Decodable {
    // Format attendu: "YYYYMMDDTHHMMSS" souvent avec Navitia
    public let departureDateTime: String

    enum CodingKeys: String, CodingKey {
        case departureDateTime = "departure_date_time"
    }
}
