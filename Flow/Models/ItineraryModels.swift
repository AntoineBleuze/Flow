import Foundation
import CoreLocation

// MARK: - Itinerary Response
struct ItineraryResponse: Codable {
    let journeys: [Journey]
    let links: [ItineraryLink]?
    let feed_publishers: [FeedPublisher]?
}

struct ItineraryLink: Codable {
    let href: String?
    let type: String?
    let rel: String?
    let templated: Bool?
}

struct FeedPublisher: Codable {
    let id: String?
    let name: String?
    let url: String?
    let license: String?
}

// MARK: - Journey
struct Journey: Codable, Identifiable {
    var id: String {
        return UUID().uuidString
    }
    let duration: Int?
    let nb_transfers: Int?
    let departure_date_time: String?
    let arrival_date_time: String?
    let requested_date_time: String?
    let sections: [Section]?
    let fare: Fare?
    let co2_emission: Amount?
    let type: String?
    let status: String?
    let tags: [String]?
    let air_pollutants: AirPollutants?
    let durations: Durations?
    let distances: Distances?
    let calendars: [JourneyCalendar]?
    let links: [ItineraryLink]?
    
    enum CodingKeys: String, CodingKey {
        case duration, nb_transfers, departure_date_time, arrival_date_time, requested_date_time
        case sections, fare, co2_emission, type, status, tags, air_pollutants, durations, distances, calendars, links
    }
}

struct AirPollutants: Codable {
    let unit: String?
    let values: [String: Double]?
}

struct Durations: Codable {
    let total: Int?
    let walking: Int?
    let bike: Int?
    let car: Int?
    let ridesharing: Int?
    let taxi: Int?
}

struct Distances: Codable {
    let walking: Int?
    let bike: Int?
    let car: Int?
    let ridesharing: Int?
    let taxi: Int?
}

struct JourneyCalendar: Codable {
    let week_pattern: WeekPattern?
    let active_periods: [ActivePeriod]?
}

struct WeekPattern: Codable {
    let monday: Bool?
    let tuesday: Bool?
    let wednesday: Bool?
    let thursday: Bool?
    let friday: Bool?
    let saturday: Bool?
    let sunday: Bool?
}

struct ActivePeriod: Codable {
    let begin: String?
    let end: String?
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
    let name: String?
    let embedded_type: String?
    let stop_point: ItineraryStopPoint?
    let address: ItineraryAddress?
    let id: String?
    let coord: ItineraryCoord?
}

// MARK: - Coordinate
struct ItineraryCoord: Codable {
    let lat: String?
    let lon: String?
}

// MARK: - StopPoint
// Renamed to ItineraryStopPoint to avoid conflict with MapModels.StopPoint
struct ItineraryStopPoint: Codable {
    let id: String?
    let name: String?
    let label: String?
    let coord: ItineraryCoord?
}

// MARK: - Address
// Renamed to ItineraryAddress to avoid conflict
struct ItineraryAddress: Codable {
    let id: String?
    let name: String?
    let label: String?
    let coord: ItineraryCoord?
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
    let commercial_mode: String?
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
    
    enum CodingKeys: String, CodingKey {
        case value, unit
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        unit = try container.decodeIfPresent(String.self, forKey: .unit)
        
        // Handle value as either String or Double
        if let valueString = try? container.decode(String.self, forKey: .value) {
            value = Double(valueString)
        } else if let valueDouble = try? container.decode(Double.self, forKey: .value) {
            value = valueDouble
        } else {
            value = nil
        }
    }
}

// MARK: - GeoJson
struct GeoJson: Codable {
    let type: String
    let coordinates: [[Double]]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(String.self, forKey: .type)
        
        // Handle both LineString ([[Double]]) and MultiLineString ([[[Double]]])
        if let coords = try? container.decode([[Double]].self, forKey: .coordinates) {
            coordinates = coords
        } else if let multiCoords = try? container.decode([[[Double]]].self, forKey: .coordinates) {
            // Flatten MultiLineString to LineString (just take all segments)
            // Or just take the first segment for simplicity if we only support single line
            coordinates = multiCoords.flatMap { $0 }
        } else {
            coordinates = []
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case type, coordinates
    }
}
