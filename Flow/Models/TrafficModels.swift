import Foundation

// MARK: - API Response
struct LineReportResponse: Decodable {
    let disruptions: [Disruption]
    let pagination: Pagination?
    let links: [Link]?
    
    enum CodingKeys: String, CodingKey {
        case disruptions
        case pagination
        case links
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
    let impactedObjects: [ImpactedObject]?
    let applicationPeriods: [ApplicationPeriod]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case cause
        case category
        case severity
        case messages
        case impactedObjects = "impacted_objects"
        case applicationPeriods = "application_periods"
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
    
    enum CodingKeys: String, CodingKey {
        case name
        case contentTypes = "content_types"
    }
}

struct ImpactedObject: Decodable {
    let ptObject: PtObject?
    
    enum CodingKeys: String, CodingKey {
        case ptObject = "pt_object"
    }
}

struct PtObject: Decodable {
    let id: String
    let name: String
    let line: Line?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case line
    }
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
