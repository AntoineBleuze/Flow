import Foundation
import SwiftUI

/// Payload léger partagé avec l'app principale Flow.
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

extension Color {
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch cleaned.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 122, 255)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
