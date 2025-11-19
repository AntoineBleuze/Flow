import Foundation
import CoreLocation

// MARK: - Itinerary Response
struct ItineraryResponse: Codable {
    let journeys: [Journey]
}

// MARK: - Journey
struct Journey: Codable, Identifiable {
    var id: String {
        // Generate a unique ID if not present, or use a combination of properties
        return UUID().uuidString
    }
    let duration: Int
    let nb_transfers: Int
    let departure_date_time: String
    let arrival_date_time: String
    let sections: [Section]
    let fare: Fare?
    let co2_emission: Amount?
    
    enum CodingKeys: String, CodingKey {
        case duration, nb_transfers, departure_date_time, arrival_date_time, sections, fare, co2_emission
    }
}

// MARK: - Section
struct Section: Codable, Identifiable {
    var id: String {
        return _id ?? UUID().uuidString
    }
    private let _id: String?
    
    let type: String?
    let mode: String?
    let from: ItineraryPlace?
    let to: ItineraryPlace?
    let departure_date_time: String?
    let arrival_date_time: String?
    let duration: Int?
    let display_informations: DisplayInformation?
    let geojson: GeoJson?
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case type, mode, from, to, departure_date_time, arrival_date_time, duration, display_informations, geojson
    }
}

// MARK: - Place
// Renamed to ItineraryPlace to avoid conflict with potential other Place structs
struct ItineraryPlace: Codable {
    let name: String
    let embedded_type: String?
    let stop_point: ItineraryStopPoint?
    let address: ItineraryAddress?
}

// MARK: - StopPoint
// Renamed to ItineraryStopPoint to avoid conflict with MapModels.StopPoint
struct ItineraryStopPoint: Codable {
    let id: String
    let name: String
    let label: String?
}

// MARK: - Address
// Renamed to ItineraryAddress to avoid conflict
struct ItineraryAddress: Codable {
    let id: String
    let name: String
    let label: String?
}

// MARK: - Display Information
struct DisplayInformation: Codable {
    let direction: String?
    let code: String?
    let network: String?
    let color: String?
    let text_color: String?
    let label: String?
    let physical_mode: String?
    let headsign: String?
}

// MARK: - Fare
struct Fare: Codable {
    let total: Amount?
}

// MARK: - Amount
struct Amount: Codable {
    let value: Double?
    let unit: String?
}

// MARK: - GeoJson
struct GeoJson: Codable {
    let type: String
    let coordinates: [[Double]] // Simplified for LineString
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        
        // Handle MultiLineString vs LineString if needed, but usually sections are LineString or MultiLineString
        // For simplicity, let's assume we might get [[Double]] (Point) or [[[Double]]] (LineString) or [[[[Double]]]] (MultiLineString)
        // Actually, swagger says SectionGeoJsonSchema coordinates is items of items of float (LineString?)
        // Let's try to decode as [[Double]] first
        if let coords = try? container.decode([[Double]].self, forKey: .coordinates) {
            coordinates = coords
        } else {
            coordinates = []
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case type, coordinates
    }
}
