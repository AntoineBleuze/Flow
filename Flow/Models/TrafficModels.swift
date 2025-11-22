import Foundation

// MARK: - API Response
struct LineReportResponse: Decodable {
    let disruptions: [Disruption]?
    let lineReports: [LineReport]?
    let pagination: Pagination?
    let links: [Link]?
    
    enum CodingKeys: String, CodingKey {
        case disruptions
        case lineReports = "line_reports"
        case pagination
        case links
    }
}

struct LineReport: Decodable {
    let line: Line?
    let ptObjects: [PtObject]?
    
    enum CodingKeys: String, CodingKey {
        case line
        case ptObjects = "pt_objects"
    }
}

struct Pagination: Decodable {
    let startPage: Int
    let itemsPerPage: Int
    let itemsOnPage: Int
    let totalResult: Int
    
    enum CodingKeys: String, CodingKey {
        case startPage = "start_page"
        case itemsPerPage = "items_per_page"
        case itemsOnPage = "items_on_page"
        case totalResult = "total_result"
    }
}

struct Link: Decodable {
    let href: String
    let type: String?
    let rel: String?
    let templated: Bool?
}

struct Disruption: Decodable, Identifiable {
    let id: String
    let status: String // "active", "past", "future"
    let cause: String?
    let category: String?
    let severity: Severity?
    let messages: [Message]?
    let impactedObjects: [Impacted]?
    let applicationPeriods: [ApplicationPeriod]?
    let contributor: String?
    let updatedAt: String?
    let uri: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case cause
        case category
        case severity
        case messages
        case impactedObjects = "impacted_objects"
        case applicationPeriods = "application_periods"
        case contributor
        case updatedAt = "updated_at"
        case uri
    }
}

struct ApplicationPeriod: Decodable {
    let begin: String // Format: "20251120T080000"
    let end: String   // Format: "20251120T170000"
    
    enum CodingKeys: String, CodingKey {
        case begin
        case end
    }
}

struct Severity: Decodable {
    let name: String?
    let priority: Int?
    let color: String?
    let effect: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case priority
        case color
        case effect
    }
}

struct Message: Decodable {
    let text: String?
    let channel: Channel?
    
    enum CodingKeys: String, CodingKey {
        case text
        case channel
    }
}

struct Channel: Decodable {
    let name: String?
    let contentTypes: [String]?
    let id: String?
    let types: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case contentTypes = "content_type"
        case id
        case types
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try container.decodeIfPresent(String.self, forKey: .name)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        types = try container.decodeIfPresent([String].self, forKey: .types)
        
        // Handle content_type as either String or [String]
        if let contentTypeArray = try? container.decode([String].self, forKey: .contentTypes) {
            contentTypes = contentTypeArray
        } else if let contentTypeString = try? container.decode(String.self, forKey: .contentTypes) {
            contentTypes = [contentTypeString]
        } else {
            contentTypes = nil
        }
    }
}

struct Impacted: Decodable {
    let ptObject: PtObject?
    let impactedStops: [ImpactedStop]?
    let impactedSection: ImpactedSection?
    
    enum CodingKeys: String, CodingKey {
        case ptObject = "pt_object"
        case impactedStops = "impacted_stops"
        case impactedSection = "impacted_section"
    }
}

struct ImpactedStop: Decodable {
    let stopPoint: TrafficStopPoint?
    let stopTimeEffect: String?
    let isDetour: Bool?
    let amendedArrivalTime: String?
    let amendedDepartureTime: String?
    let baseArrivalTime: String?
    let baseDepartureTime: String?
    let cause: String?
    let arrivalStatus: String?
    let departureStatus: String?
    
    enum CodingKeys: String, CodingKey {
        case stopPoint = "stop_point"
        case stopTimeEffect = "stop_time_effect"
        case isDetour = "is_detour"
        case amendedArrivalTime = "amended_arrival_time"
        case amendedDepartureTime = "amended_departure_time"
        case baseArrivalTime = "base_arrival_time"
        case baseDepartureTime = "base_departure_time"
        case cause
        case arrivalStatus = "arrival_status"
        case departureStatus = "departure_status"
    }
}

struct ImpactedSection: Decodable {
    let from: PtObject?
    let to: PtObject?
    
    enum CodingKeys: String, CodingKey {
        case from
        case to
    }
}

struct PtObject: Decodable {
    let id: String
    let name: String
    let line: Line?
    let stopPoint: TrafficStopPoint?
    let stopArea: TrafficStopArea?
    let network: Network?
    let commercialMode: CommercialMode?
    let embeddedType: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case line
        case stopPoint = "stop_point"
        case stopArea = "stop_area"
        case network
        case commercialMode = "commercial_mode"
        case embeddedType = "embedded_type"
    }
}

struct TrafficStopPoint: Decodable {
    let id: String
    let name: String
    let label: String?
    let coord: Coord?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case label
        case coord
    }
}

struct TrafficStopArea: Decodable {
    let id: String
    let name: String
    let label: String?
    let coord: Coord?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case label
        case coord
    }
}

struct Coord: Decodable {
    let lat: String
    let lon: String
}

struct Line: Decodable {
    let id: String
    let name: String?
    let code: String?
    let color: String?
    let textColor: String?
    let network: Network?
    let commercialMode: CommercialMode?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case code
        case color
        case textColor = "text_color"
        case network
        case commercialMode = "commercial_mode"
    }
}

struct CommercialMode: Decodable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct Network: Decodable {
    let id: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
