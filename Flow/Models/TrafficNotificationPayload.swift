import Foundation

/// Payload léger et auto-suffisant transmis à l'extension de notification (`FlowNotificationContent`)
/// via `userInfo` (et sauvegardé dans l'App Group en secours).
struct TrafficNotificationPayload: Codable {
    struct StationNode: Codable, Identifiable {
        let id: String
        let name: String
        let isAffected: Bool
        let isTerminus: Bool
        let isUnderConstruction: Bool
        let col: Int?
        let row: Int?

        init(
            id: String,
            name: String,
            isAffected: Bool,
            isTerminus: Bool,
            isUnderConstruction: Bool,
            col: Int? = nil,
            row: Int? = nil
        ) {
            self.id = id
            self.name = name
            self.isAffected = isAffected
            self.isTerminus = isTerminus
            self.isUnderConstruction = isUnderConstruction
            self.col = col
            self.row = row
        }
    }

    struct SchematicEdge: Codable, Hashable {
        let fromId: String
        let toId: String
        let isAffected: Bool
        let isDashed: Bool
    }

    let lineId: String
    let transportTypeRaw: String
    let lineColorHex: String
    let textColorHex: String
    let logoPNGData: Data?
    let statusRaw: String
    let statusDescription: String
    let severityColorHex: String
    let severityIcon: String
    let title: String
    let message: String
    let impactedSection: String?
    let resumptionDate: Date?
    let resumptionText: String?
    let stations: [StationNode]
    let totalStationsCount: Int
    let edges: [SchematicEdge]?
    let rowCount: Int?

    init(
        lineId: String,
        transportTypeRaw: String,
        lineColorHex: String,
        textColorHex: String,
        logoPNGData: Data?,
        statusRaw: String,
        statusDescription: String,
        severityColorHex: String,
        severityIcon: String,
        title: String,
        message: String,
        impactedSection: String?,
        resumptionDate: Date?,
        resumptionText: String?,
        stations: [StationNode],
        totalStationsCount: Int,
        edges: [SchematicEdge]? = nil,
        rowCount: Int? = nil
    ) {
        self.lineId = lineId
        self.transportTypeRaw = transportTypeRaw
        self.lineColorHex = lineColorHex
        self.textColorHex = textColorHex
        self.logoPNGData = logoPNGData
        self.statusRaw = statusRaw
        self.statusDescription = statusDescription
        self.severityColorHex = severityColorHex
        self.severityIcon = severityIcon
        self.title = title
        self.message = message
        self.impactedSection = impactedSection
        self.resumptionDate = resumptionDate
        self.resumptionText = resumptionText
        self.stations = stations
        self.totalStationsCount = totalStationsCount
        self.edges = edges
        self.rowCount = rowCount
    }

    static let userInfoKey = "trafficPayloadJSON"
    static let appGroupSuite = "group.AntoineBleuze.Flow"

    static func appGroupKey(typeRaw: String, lineId: String) -> String {
        "latest_traffic_payload_\(typeRaw)_\(lineId)"
    }
}
