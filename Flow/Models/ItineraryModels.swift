import CoreLocation
import Foundation

// MARK: - Crowd Level & Estimated Affluence
enum CrowdLevel: String, Codable, CaseIterable, Sendable {
    case low = "low"
    case moderate = "moderate"
    case high = "high"
    case veryHigh = "very_high"

    var title: String {
        switch self {
        case .low: return "Faible"
        case .moderate: return "Modérée"
        case .high: return "Forte"
        case .veryHigh: return "Très forte"
        }
    }

    var shortDescription: String {
        switch self {
        case .low: return "Nombreuses places assises"
        case .moderate: return "Places assises probables"
        case .high: return "Debout probable"
        case .veryHigh: return "Rame très dense • Affluence maximale"
        }
    }

    var icon: String {
        switch self {
        case .low: return "person.fill"
        case .moderate: return "person.2.fill"
        case .high: return "person.3.fill"
        case .veryHigh: return "person.3.sequence.fill"
        }
    }

    var segmentsCount: Int {
        switch self {
        case .low: return 1
        case .moderate: return 2
        case .high: return 3
        case .veryHigh: return 4
        }
    }
}

struct EstimatedAffluence: Codable, Hashable, Sendable {
    let level: CrowdLevel
    let score: Double          // 0.0 ... 1.0
    let detail: String         // e.g. "Heure de pointe vers La Défense"
    let lineVolumeTier: String // e.g. "Ligne très fréquentée"

    init(
        level: CrowdLevel,
        score: Double,
        detail: String,
        lineVolumeTier: String
    ) {
        self.level = level
        self.score = score
        self.detail = detail
        self.lineVolumeTier = lineVolumeTier
    }
}

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
    var sections: [ItinerarySection]?

    var overallAffluence: CrowdLevel? {
        guard let sections = sections else { return nil }
        let levels = sections.compactMap { $0.estimated_affluence?.level }
        if levels.contains(.veryHigh) { return .veryHigh }
        if levels.contains(.high) { return .high }
        if levels.contains(.moderate) { return .moderate }
        if levels.contains(.low) { return .low }
        return nil
    }

    enum CodingKeys: String, CodingKey {
        case departure_date_time
        case arrival_date_time
        case duration
        case nb_transfers
        case sections
    }

    init(
        departure_date_time: String? = nil,
        arrival_date_time: String? = nil,
        duration: Int? = nil,
        nb_transfers: Int? = nil,
        sections: [ItinerarySection]? = nil
    ) {
        self.departure_date_time = departure_date_time
        self.arrival_date_time = arrival_date_time
        self.duration = duration
        self.nb_transfers = nb_transfers
        self.sections = sections
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
    var geojson: GeoJSON?
    let stop_date_times: [ItineraryStopDateTime]?
    var has_closed_stop: Bool?
    var closed_stop_alert: String?
    var has_skipped_stops: Bool?
    var estimated_affluence: EstimatedAffluence?

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
        case has_closed_stop
        case closed_stop_alert
        case has_skipped_stops
        case estimated_affluence
    }

    init(
        id: String,
        type: String,
        mode: String? = nil,
        duration: Int? = nil,
        from: ItineraryPlace? = nil,
        to: ItineraryPlace? = nil,
        departure_date_time: String? = nil,
        arrival_date_time: String? = nil,
        display_informations: DisplayInformation? = nil,
        geojson: GeoJSON? = nil,
        stop_date_times: [ItineraryStopDateTime]? = nil,
        has_closed_stop: Bool? = nil,
        closed_stop_alert: String? = nil,
        has_skipped_stops: Bool? = nil,
        estimated_affluence: EstimatedAffluence? = nil
    ) {
        self.id = id
        self.type = type
        self.mode = mode
        self.duration = duration
        self.from = from
        self.to = to
        self.departure_date_time = departure_date_time
        self.arrival_date_time = arrival_date_time
        self.display_informations = display_informations
        self.geojson = geojson
        self.stop_date_times = stop_date_times
        self.has_closed_stop = has_closed_stop
        self.closed_stop_alert = closed_stop_alert
        self.has_skipped_stops = has_skipped_stops
        self.estimated_affluence = estimated_affluence
    }
}

// MARK: - StopDateTime
struct ItineraryStopDateTime: Codable, Identifiable {
    let stop_point: ItineraryPlace.StopPoint
    let arrival_date_time: String
    let departure_date_time: String
    var is_skipped: Bool?
    var is_closed: Bool?
    var disruption_reason: String?
    var estimated_affluence: EstimatedAffluence?

    var id: String { stop_point.id ?? UUID().uuidString }

    var isSkipped: Bool {
        return is_skipped == true || is_closed == true
    }

    var disruptionReason: String? {
        return disruption_reason
    }

    enum CodingKeys: String, CodingKey {
        case stop_point
        case arrival_date_time
        case departure_date_time
        case is_skipped
        case is_closed
        case disruption_reason
        case estimated_affluence
    }

    init(
        stop_point: ItineraryPlace.StopPoint,
        arrival_date_time: String,
        departure_date_time: String,
        is_skipped: Bool? = nil,
        is_closed: Bool? = nil,
        disruption_reason: String? = nil,
        estimated_affluence: EstimatedAffluence? = nil
    ) {
        self.stop_point = stop_point
        self.arrival_date_time = arrival_date_time
        self.departure_date_time = departure_date_time
        self.is_skipped = is_skipped
        self.is_closed = is_closed
        self.disruption_reason = disruption_reason
        self.estimated_affluence = estimated_affluence
    }
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
struct DisplayInformation: Codable, Sendable {
    let network: String?
    let code: String?
    let label: String?
    let color: String?
    let text_color: String?
    let commercial_mode: String?
    let direction: String?
    let physical_mode: String?
    let line: ItineraryLine?

    nonisolated init(
        network: String? = nil,
        code: String? = nil,
        label: String? = nil,
        color: String? = nil,
        text_color: String? = nil,
        commercial_mode: String? = nil,
        direction: String? = nil,
        physical_mode: String? = nil,
        line: ItineraryLine? = nil
    ) {
        self.network = network
        self.code = code
        self.label = label
        self.color = color
        self.text_color = text_color
        self.commercial_mode = commercial_mode
        self.direction = direction
        self.physical_mode = physical_mode
        self.line = line
    }
}

struct ItineraryLine: Codable, Sendable {
    let id: String?
    let name: String?
    let code: String?
}

// MARK: - GeoJSON
struct GeoJSON: Codable {
    let type: String?
    let coordinates: [[Double]]?
}

extension Journey {
    var destinationCoordinate: CLLocationCoordinate2D? {
        sections?.last?.to?.coordinate
    }
}

extension DisplayInformation {
    var transportType: TransportType {
        let mode = (commercial_mode ?? physical_mode ?? "").lowercased()
        if mode.contains("metro") || mode.contains("subway") {
            return .metro
        } else if mode.contains("rer") {
            return .rer
        } else if mode.contains("tram") {
            return .tram
        } else if mode.contains("transilien") || mode.contains("train") {
            return .transilien
        } else if mode.contains("bus") || mode.contains("noctilien") {
            return .bus
        } else if mode.contains("cable") {
            return .cable
        }
        return .bus // Fallback
    }
}

extension ItineraryPlace.StopPoint {
    var coordinate: CLLocationCoordinate2D? {
        guard let coord = self.coord,
              let latStr = coord.lat,
              let lonStr = coord.lon,
              let lat = Double(latStr),
              let lon = Double(lonStr) else { return nil }
        guard lat != 0.0 && lon != 0.0 else { return nil }
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

extension ItineraryPlace {
    var coordinate: CLLocationCoordinate2D? {
        if let coord = self.coord,
           let latStr = coord.lat,
           let lonStr = coord.lon,
           let lat = Double(latStr),
           let lon = Double(lonStr),
           lat != 0.0 && lon != 0.0 {
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        return stop_point?.coordinate
    }
}

// MARK: - Route Incident & Dynamic Rerouting
struct RouteIncident: Identifiable, Equatable, Sendable {
    let id: String
    let lineCode: String
    let lineType: TransportType
    let severity: LineStatus
    let title: String
    let message: String
    let impactedSection: String?
    let impactedStopNames: [String]
    let detectedAt: Date
    let impactedSectionId: String?

    init(
        id: String,
        lineCode: String,
        lineType: TransportType,
        severity: LineStatus,
        title: String,
        message: String,
        impactedSection: String? = nil,
        impactedStopNames: [String] = [],
        detectedAt: Date = Date(),
        impactedSectionId: String? = nil
    ) {
        self.id = id
        self.lineCode = lineCode
        self.lineType = lineType
        self.severity = severity
        self.title = title
        self.message = message
        self.impactedSection = impactedSection
        self.impactedStopNames = impactedStopNames
        self.detectedAt = detectedAt
        self.impactedSectionId = impactedSectionId
    }
}
