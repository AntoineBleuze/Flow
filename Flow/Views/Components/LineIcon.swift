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
            if type == .bus {
                Text(lineId)
                    .font(.system(size: size * 0.5, weight: .bold))
                    .padding(.horizontal, size * 0.2)
                    .padding(.vertical, size * 0.1)
                    .background(customColor ?? type.accentColor)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: size * 0.15, style: .continuous))
                    .frame(minHeight: size)
            } else {
                Text(lineId)
                    .font(.system(size: size * 0.5, weight: .bold))
                    .padding(.horizontal, size * 0.25)
                    .padding(.vertical, size * 0.1)
                    .background(customColor ?? type.accentColor)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .frame(minHeight: size)
            }
        }
    }

    // Logique extraite de TransportModels pour être autonome
    private var assetName: String {
        switch type {
        case .metro:
            var fixedId = lineId
            if lineId == "3B" { fixedId = "3bis" } else if lineId == "7B" { fixedId = "7bis" }
            return "metro\(fixedId)"
        case .tram:
            var fixedId = lineId
            if fixedId.uppercased() == "T3A" {
                fixedId = "T3a"
            } else if fixedId.uppercased() == "T3B" {
                fixedId = "T3b"
            }

            if fixedId.lowercased().starts(with: "t") { return fixedId }
            return "T\(fixedId)"
        case .rer:
            return "rer\(lineId)"
        case .transilien, .train:
            return "transilien\(lineId)"
        case .bus:
            return "bus\(lineId)"
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

