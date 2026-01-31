import SwiftUI

#if canImport(UIKit)
    import UIKit
#endif

struct LineIcon: View {
    let type: TransportType
    let lineId: String
    let size: CGFloat

    // Init depuis un objet TransportLine complet
    init(line: TransportLine, size: CGFloat = 30) {
        self.type = line.type
        self.lineId = line.lineId
        self.size = size
    }

    // Init manuel
    init(type: TransportType, lineId: String, size: CGFloat = 30) {
        self.type = type
        self.lineId = lineId
        self.size = size
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
            Text(lineId)
                .font(.system(size: size * 0.5, weight: .bold))
                .padding(.horizontal, size * 0.25)
                .padding(.vertical, size * 0.1)
                .background(type.accentColor)
                .foregroundColor(.white)
                .clipShape(Capsule())
                // On s'assure qu'il a au moins la hauteur demandée si possible,
                // mais pour une capsule texte c'est le contenu qui dicte souvent.
                .frame(minHeight: size)
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
