import Foundation

// MARK: - API Response
struct DepartureResponse: Decodable {
    let departures: [Departure]
}

struct Departure: Decodable, Identifiable {
    // On utilise une combinaison pour l'id car l'API ne donne pas toujours un ID unique simple pour un départ
    var id: String {
        return "\(displayInformations.label)-\(stopDateTime.departureDateTime)-\(displayInformations.direction)"
    }
    
    let displayInformations: DisplayInformations
    let stopDateTime: StopDateTime
    
    enum CodingKeys: String, CodingKey {
        case displayInformations = "display_informations"
        case stopDateTime = "stop_date_time"
    }
}

struct DisplayInformations: Decodable {
    let direction: String
    let label: String // Ex: "12", "A"
    let color: String? // Ex: "0055C8"
    let commercialMode: String? // Ex: "Metro", "RER"
    let network: String?
    let textColor: String? // Ex: "FFFFFF"
    
    enum CodingKeys: String, CodingKey {
        case direction
        case label
        case color
        case commercialMode = "commercial_mode"
        case network
        case textColor = "text_color"
    }
}

struct StopDateTime: Decodable {
    // Format attendu: "YYYYMMDDTHHMMSS" souvent avec Navitia
    let departureDateTime: String
    
    enum CodingKeys: String, CodingKey {
        case departureDateTime = "departure_date_time"
    }
}
