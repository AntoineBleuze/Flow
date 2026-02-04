import CoreLocation
import Foundation

// MARK: - Main Response
struct ItineraryResponse: Codable {
    let journeys: [Journey]
}

// MARK: - Journey
struct Journey: Codable, Identifiable {
    let id = UUID()
    let departure_date_time: String?
    let arrival_date_time: String?
    let duration: Int?
    let nb_transfers: Int?
    let sections: [ItinerarySection]?

    enum CodingKeys: String, CodingKey {
        case departure_date_time
        case arrival_date_time
        case duration
        case nb_transfers
        case sections
    }
}

// MARK: - Section
struct ItinerarySection: Codable, Identifiable {
    let id: String
    let type: String  // "public_transport", "street_network", "transfer", "waiting"
    let mode: String?
    let duration: Int?
    let from: ItineraryPlace?
    let to: ItineraryPlace?
    let departure_date_time: String?
    let arrival_date_time: String?
    let display_informations: DisplayInformation?
    let geojson: GeoJSON?
    let stop_date_times: [ItineraryStopDateTime]?

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case mode
        case duration
        case from
        case to
        case departure_date_time
        case arrival_date_time
        case display_informations
        case geojson
        case stop_date_times
    }
}

// MARK: - StopDateTime
struct ItineraryStopDateTime: Codable, Identifiable {
    let stop_point: ItineraryPlace.StopPoint
    let arrival_date_time: String
    let departure_date_time: String

    var id: String { stop_point.id ?? UUID().uuidString }
}

// MARK: - Place
struct ItineraryPlace: Codable {
    let name: String?
    let id: String?
    let coord: ItineraryCoord?
    let stop_point: StopPoint?

    struct StopPoint: Codable {
        let name: String?
        let id: String?
        let coord: ItineraryCoord?
    }
}

// MARK: - Coordinates
struct ItineraryCoord: Codable {
    let lat: String?
    let lon: String?
}

// MARK: - Display Information
struct DisplayInformation: Codable {
    let network: String?
    let code: String?
    let label: String?
    let color: String?
    let text_color: String?
    let commercial_mode: String?
    let direction: String?
    let physical_mode: String?
}

// MARK: - GeoJSON
struct GeoJSON: Codable {
    let type: String?
    let coordinates: [[Double]]?
}
