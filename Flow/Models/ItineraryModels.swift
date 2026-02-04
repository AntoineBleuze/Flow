import CoreLocation
import Foundation

// MARK: - Main Response
public struct ItineraryResponse: Codable {
    public let journeys: [Journey]
}

// MARK: - Journey
public struct Journey: Codable, Identifiable {
    public let id = UUID()
    public let departure_date_time: String?
    public let arrival_date_time: String?
    public let duration: Int?
    public let nb_transfers: Int?
    public let sections: [ItinerarySection]?

    enum CodingKeys: String, CodingKey {
        case departure_date_time
        case arrival_date_time
        case duration
        case nb_transfers
        case sections
    }
}

// MARK: - Section
public struct ItinerarySection: Codable, Identifiable {
    public let id: String
    public let type: String  // "public_transport", "street_network", "transfer", "waiting"
    public let mode: String?
    public let duration: Int?
    public let from: ItineraryPlace?
    public let to: ItineraryPlace?
    public let departure_date_time: String?
    public let arrival_date_time: String?
    public let display_informations: DisplayInformation?
    public let geojson: GeoJSON?
    public let stop_date_times: [ItineraryStopDateTime]?

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
public struct ItineraryStopDateTime: Codable, Identifiable {
    public let stop_point: ItineraryPlace.StopPoint
    public let arrival_date_time: String
    public let departure_date_time: String

    public var id: String { stop_point.id ?? UUID().uuidString }
}

// MARK: - Place
public struct ItineraryPlace: Codable {
    public let name: String?
    public let id: String?
    public let coord: ItineraryCoord?
    public let stop_point: StopPoint?

    public struct StopPoint: Codable {
        public let name: String?
        public let id: String?
        public let coord: ItineraryCoord?
    }
}

// MARK: - Coordinates
public struct ItineraryCoord: Codable {
    public let lat: String?
    public let lon: String?
}

// MARK: - Display Information
public struct DisplayInformation: Codable {
    public let network: String?
    public let code: String?
    public let label: String?
    public let color: String?
    public let text_color: String?
    public let commercial_mode: String?
    public let direction: String?
    public let physical_mode: String?
}

// MARK: - GeoJSON
public struct GeoJSON: Codable {
    public let type: String?
    public let coordinates: [[Double]]?
}
