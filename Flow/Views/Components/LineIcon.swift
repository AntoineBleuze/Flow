import SwiftUI

#if canImport(UIKit)
    import UIKit
#endif

struct LineIcon: View {
    let type: TransportType
    let lineId: String
    let size: CGFloat
    let customColor: Color?

    // Init depuis un objet TransportLine complet
    init(line: TransportLine, size: CGFloat = 30) {
        self.type = line.type
        self.lineId = line.lineId
        self.size = size
        if let hex = line.colorHex {
            self.customColor = Color(hex: hex)
        } else if let cached = MapDataService.shared.lineColorCache[line.lineId] {
            self.customColor = cached
        } else {
            self.customColor = resolveLineColor(line.lineId, type: line.type)
        }
    }

    // Init manuel
    init(type: TransportType, lineId: String, size: CGFloat = 30, customColor: Color? = nil) {
        self.type = type
        self.lineId = lineId
        self.size = size
        self.customColor = customColor ?? MapDataService.shared.lineColorCache[lineId] ?? resolveLineColor(lineId, type: type)
    }

    var body: some View {
        // Calcul du nom d'asset basé sur le type et l'ID
        let asset = self.assetName

        // Si l'asset existe, on l'affiche
        if UIImage(named: asset) != nil {
            Image(asset)
                .resizable()
                .scaledToFit()
                .frame(height: size)
        } else {
            // Fallback Text
            // Pour le texte, on ajuste la taille de police et le padding en fonction de "size"
            // approximativement
            if type == .metro || type == .rer {
                Text(lineId)
                    .font(.system(size: size * 0.45, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: size, height: size)
                    .background(customColor ?? type.accentColor)
                    .clipShape(Circle())
            } else {
                Text(lineId)
                    .font(.system(size: size * 0.45, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.horizontal, size * 0.2)
                    .frame(minWidth: size, minHeight: size)
                    .background(customColor ?? type.accentColor)
                    .clipShape(RoundedRectangle(cornerRadius: size * 0.15, style: .continuous))
            }
        }
    }

    // Logique extraite de TransportModels pour être autonome
    private var assetName: String {
        let cleanId = lineId.uppercased()
            .replacingOccurrences(of: "RER ", with: "")
            .replacingOccurrences(of: "METRO ", with: "")
            .replacingOccurrences(of: "TRAMWAY ", with: "")
            .replacingOccurrences(of: "TRAM ", with: "")
            .replacingOccurrences(of: "TRANSILIEN ", with: "")
            .replacingOccurrences(of: "TRAIN ", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)

        switch type {
        case .metro:
            var fixedId = cleanId
            if cleanId == "3B" { fixedId = "3bis" } else if cleanId == "7B" { fixedId = "7bis" }
            return "metro\(fixedId.lowercased())"
        case .tram:
            var fixedId = cleanId
            if fixedId == "T3A" || fixedId == "3A" {
                fixedId = "3a"
            } else if fixedId == "T3B" || fixedId == "3B" {
                fixedId = "3b"
            }
            let cleanNumber = fixedId.replacingOccurrences(of: "T", with: "", options: .caseInsensitive)
            return "T\(cleanNumber)"
        case .rer:
            return "rer\(cleanId)"
        case .transilien, .train:
            return "transilien\(cleanId)"
        case .bus:
            return "bus\(cleanId)"
        case .cable:
            if lineId.contains("1") { return "Cable1" }
            return "Cable"
        }
    }
}

#Preview {
    VStack(spacing: 10) {
        LineIcon(type: .metro, lineId: "1")
        LineIcon(type: .rer, lineId: "A")
        LineIcon(type: .tram, lineId: "3a")
        LineIcon(type: .bus, lineId: "38")
    }
}

