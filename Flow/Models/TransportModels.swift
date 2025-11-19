import Foundation
import SwiftUI

enum TransportType: String, CaseIterable, Identifiable {
    case metro = "Métro"
    case tram = "Tramway"
    case rer = "RER"
    case transilien = "Transilien"
    case bus = "Bus"
    case train = "Train" // Added to support the new accentColor and getAssetName logic
    
    var id: String { self.rawValue }
    
    var accentColor: Color {
        switch self {
        case .metro: return Color.yellow
        case .rer: return Color.red
        case .train, .transilien: return Color.blue
        case .tram: return Color.green
        case .bus: return Color.orange
        }
    }
    
    static func getAssetName(mode: String?, label: String) -> String {
        guard let mode = mode else { return "" }
        let normalizedMode = mode.lowercased().folding(options: .diacriticInsensitive, locale: .current)
        
        if normalizedMode.contains("metro") || normalizedMode.contains("subway") {
            return "metro\(label)"
        } else if normalizedMode.contains("rer") {
            let cleanLabel = label.uppercased().replacingOccurrences(of: "RER", with: "").trimmingCharacters(in: .whitespaces)
            return "rer\(cleanLabel)"
        } else if normalizedMode.contains("tram") {
            // Gestion des cas T3a vs 3a
            if label.lowercased().starts(with: "t") {
                return label
            }
            return "T\(label)"
        } else if normalizedMode.contains("train") || normalizedMode.contains("transilien") {
            return "transilien\(label)"
        }
        return ""
    }
}

enum LineStatus {
    case normal
    case critical // Trafic interrompu
    case warning // Travaux ou ralentissements
    
    var icon: String {
        switch self {
        case .normal: return "checkmark.circle.fill"
        case .critical: return "xmark.octagon.fill"
        case .warning: return "exclamationmark.triangle.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .normal: return .green
        case .critical: return .red
        case .warning: return .orange
        }
    }
    
    var description: String {
        switch self {
        case .normal: return "Trafic normal"
        case .critical: return "Trafic interrompu"
        case .warning: return "Perturbations"
        }
    }
}

struct TransportLine: Identifiable {
    let id = UUID()
    let type: TransportType
    let lineId: String // ex: "1", "A", "T3a"
    var status: LineStatus
    var trafficInfos: [TrafficInfo] = []
    
    // Computed properties for backward compatibility
    var message: String? { trafficInfos.first?.message }
    var details: String? { trafficInfos.map { $0.message }.joined(separator: "\n\n") }
    
    // Logique pour récupérer vos assets SVG nommés spécifiquement
    var assetName: String {
        switch type {
        case .metro:
            return "metro\(lineId)" // ex: metro1
        case .tram:
            if lineId.lowercased().starts(with: "t") {
                return lineId
            }
            return "T\(lineId)" // ex: T1, T3a
        case .rer:
            return "rer\(lineId)" // ex: rerA
        case .transilien:
            return "transilien\(lineId)" // ex: transilienL
        case .bus:
            return "bus\(lineId)" // Fallback ou nommage à définir
        case .train:
            return "transilien\(lineId)" // On utilise les assets Transilien pour les trains
        }
    }
}

struct TrafficInfo: Identifiable {
    let id: String
    let title: String
    let message: String
    let period: TrafficPeriod // "active" or "future"
    let severity: LineStatus
    let startTime: Date?
    let endTime: Date?
}

enum TrafficPeriod {
    case active
    case future
    case past
}

