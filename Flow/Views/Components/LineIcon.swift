import SwiftUI

struct LineIcon: View {
    let line: TransportLine
    
    var body: some View {
        // Si l'asset existe, on l'affiche, sinon cercle de couleur
        if UIImage(named: line.assetName) != nil {
            Image(line.assetName)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        } else {
            Circle()
                .fill(line.type.accentColor.opacity(0.2))
                .frame(width: 30, height: 30)
                .overlay(
                    Text(line.lineId)
                        .font(.caption2).bold()
                        .foregroundColor(line.type.accentColor)
                )
        }
    }
}
