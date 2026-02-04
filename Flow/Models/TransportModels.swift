import Foundation
import SwiftUI

public enum TransportType: String, CaseIterable, Identifiable {
    case metro = "Métro"
    case tram = "Tramway"
    case rer = "RER"
    case transilien = "Transilien"
    case bus = "Bus"
    case train = "Train"
    case cable = "Câble"

    public var id: String { self.rawValue }

    public var accentColor: Color {
        switch self {
        case .metro: return Color.yellow
        case .rer: return Color.red
        case .train, .transilien: return Color.blue
        case .tram: return Color.green
        case .bus: return Color.orange
        case .cable: return Color.gray  // Ou une couleur spécifique si demandée, par défaut gris ou violet clair? Le logo semble gris/blanc.
        }
    }

    public static func getAssetName(mode: String?, label: String) -> String {
        guard let mode = mode else { return "" }
        let normalizedMode = mode.lowercased().folding(
            options: .diacriticInsensitive, locale: .current)

        if normalizedMode.contains("metro") || normalizedMode.contains("subway") {
            var fixedLabel = label
            if label == "3B" { fixedLabel = "3bis" } else if label == "7B" { fixedLabel = "7bis" }
            return "metro\(fixedLabel)"
        } else if normalizedMode.contains("rer") {
            let cleanLabel = label.uppercased().replacingOccurrences(of: "RER", with: "")
                .trimmingCharacters(in: .whitespaces)
            return "rer\(cleanLabel)"
        } else if normalizedMode.contains("tram") {
            // Gestion des cas T3a vs 3a et formatage spécifique
            var fixedLabel = label
            if label.uppercased() == "T3A" {
                fixedLabel = "T3a"
            } else if label.uppercased() == "T3B" {
                fixedLabel = "T3b"
            }

            if fixedLabel.lowercased().starts(with: "t") {
                return fixedLabel
            }
            return "T\(fixedLabel)"
        } else if normalizedMode.contains("train") || normalizedMode.contains("transilien")
            || normalizedMode.contains("ter")
        {
            return "transilien\(label)"
        } else if normalizedMode.contains("cable") || normalizedMode.contains("funiculaire")
            || normalizedMode.contains("suspendu")
        {
            // Pour le funiculaire, l'utilisateur a dit "utilise le logo cable"
            // Pour le Cable 1, on utilisera probablement "Cable1" si dispo, ou "Cable"
            // Ici c'est pour l'affichage statique d'un logo mode
            return "Cable"
        }
        return ""
    }
}

public enum LineStatus: Int, Comparable {
    case interrupted = 0  // Rouge: Interruptions exceptionnelles
    case disrupted = 1  // Orange: Perturbations (légers retards)
    case works = 2  // Jaune: Travaux
    case information = 3  // Bleu: Informations diverses
    case normal = 4  // Blanc: Trafic normal

    public static func < (lhs: LineStatus, rhs: LineStatus) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }

    public var icon: String {
        switch self {
        case .interrupted: return "xmark.octagon.fill"
        case .disrupted: return "exclamationmark.triangle.fill"
        case .works: return "hammer.fill"
        case .information: return "info.circle.fill"
        case .normal: return "checkmark.circle.fill"
        }
    }

    public var color: Color {
        switch self {
        case .interrupted: return .red
        case .disrupted: return .orange
        case .works: return .yellow
        case .information: return .blue
        case .normal: return .primary  // "Blanc" en dark mode, Noir en light mode. Si l'utilisateur veut vraiment blanc forcé, on mettra .white mais attention au contraste.
        }
    }

    var description: String {
        switch self {
        case .interrupted: return "Trafic interrompu"
        case .disrupted: return "Trafic perturbé"
        case .works: return "Travaux"
        case .information: return "Information"
        case .normal: return "Trafic normal"
        }
    }
}

public struct TransportLine: Identifiable {
    public let id = UUID()
    public let type: TransportType
    public let lineId: String  // ex: "1", "A", "T3a"
    public var status: LineStatus
    public var trafficInfos: [TrafficInfo] = []

    // Computed properties for backward compatibility
    public var message: String? { trafficInfos.first?.message }
    public var details: String? { trafficInfos.map { $0.message }.joined(separator: "\n\n") }

    // Logique pour récupérer vos assets SVG nommés spécifiquement
    public var assetName: String {
        switch type {
        case .metro:
            var fixedId = lineId
            if lineId == "3B" { fixedId = "3bis" } else if lineId == "7B" { fixedId = "7bis" }
            return "metro\(fixedId)"  // ex: metro1, metro3bis
        case .tram:
            var fixedId = lineId
            if fixedId.uppercased() == "T3A" {
                fixedId = "T3a"
            } else if fixedId.uppercased() == "T3B" {
                fixedId = "T3b"
            }

            if fixedId.lowercased().starts(with: "t") {
                return fixedId
            }
            return "T\(fixedId)"  // ex: T1, T3a
        case .rer:
            return "rer\(lineId)"  // ex: rerA
        case .transilien:
            return "transilien\(lineId)"  // ex: transilienL
        case .bus:
            return "bus\(lineId)"  // Fallback ou nommage à définir
        case .train:
            return "transilien\(lineId)"  // On utilise les assets Transilien pour les trains
        case .cable:
            // L'utilisateur a demandé "Cable" pour le funiculaire et "Cable 1" pour le C1
            if lineId.contains("1") {
                return "Cable1"
            }
            return "Cable"
        }
    }
}

public struct TrafficInfo: Identifiable {
    public let id: String
    public let title: String
    public let message: String
    public let period: TrafficPeriod  // "active" or "future"
    public let severity: LineStatus
    public let startTime: Date?
    public let endTime: Date?
    public let impactedStops: [String]?
    public let impactedSection: String?
}

public enum TrafficPeriod {
    case active
    case future
    case past
}

// MARK: - Navitia API Models (Restored)

struct LineReportResponse: Codable {
    let disruptions: [Disruption]?
    let pagination: Pagination?
    let links: [Link]?

    struct Pagination: Codable {
        let start_page: Int?
        let items_on_page: Int?
        let items_per_page: Int?
        let total_result: Int?
    }

    struct Link: Codable {
        let href: String
        let rel: String?
        let type: String?
        let templated: Bool?
    }
}

struct Disruption: Codable, Identifiable {
    let id: String
    let status: String?
    let cause: String?
    let category: String?
    let severity: Severity?
    let messages: [DisruptionMessage]?
    let applicationPeriods: [ApplicationPeriod]?
    let impactedObjects: [ImpactedObject]?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case status
        case cause
        case category
        case severity
        case messages
        case applicationPeriods = "application_periods"
        case impactedObjects = "impacted_objects"
        case updatedAt = "updated_at"
    }

    struct Severity: Codable {
        let color: String?
        let priority: Int?
        let name: String?
        let effect: String?
    }
}

struct DisruptionMessage: Codable {
    let text: String?
    let channel: Channel?

    struct Channel: Codable {
        let name: String?
        let content_type: String?
    }
}

struct ApplicationPeriod: Codable {
    let begin: String
    let end: String
}

struct ImpactedObject: Codable {
    let ptObject: PtObject?
    let impactedStops: [ImpactedStop]?
    let impactedSection: ImpactedSection?

    enum CodingKeys: String, CodingKey {
        case ptObject = "pt_object"
        case impactedStops = "impacted_stops"
        case impactedSection = "impacted_section"
    }
}

struct PtObject: Codable {
    let id: String?
    let name: String?
    let line: NavitiaLine?  // Renamed to avoid conflict with TransportLine

    // Helper struct for nested Line object in Navitia response
    struct NavitiaLine: Codable {
        let id: String?
        let code: String?
        let name: String?
        let commercialMode: CommercialMode?

        enum CodingKeys: String, CodingKey {
            case id
            case code
            case name
            case commercialMode = "commercial_mode"
        }
    }

    struct CommercialMode: Codable {
        let id: String?
        let name: String?  // "Metro", "RER", etc.
    }
}

struct ImpactedStop: Codable {
    let stopPoint: StopPointInfo?
    let cause: String?

    enum CodingKeys: String, CodingKey {
        case stopPoint = "stop_point"
        case cause
    }

    struct StopPointInfo: Codable {
        let id: String?
        let name: String?
    }
}

struct ImpactedSection: Codable {
    let from: SectionPoint?
    let to: SectionPoint?

    struct SectionPoint: Codable {
        let name: String?
        let id: String?
    }
}
