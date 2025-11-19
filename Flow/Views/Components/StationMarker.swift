import SwiftUI

struct StationMarker: View {
    let station: Station
    let zoomLevel: Double // Pour ajuster la taille si besoin (optionnel)
    
    var body: some View {
        // On affiche un cluster si c'est un Hub ou s'il y a plusieurs lignes
        // Sinon on affiche un simple point
        
        let lines = station.lines.prefix(4) // On limite à 4 pour l'affichage compact
        let hasMore = station.lines.count > 4
        
        VStack(spacing: 4) {
            ZStack {
                // Fond transparent (zone de touche gérée par MapView)
                
                if lines.isEmpty {
                    // Fallback si pas de ligne identifiée
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 12, height: 12)
                        .shadow(radius: 1)
                } else if lines.count == 1 {
                    // Une seule ligne
                    let line = lines[0]
                    icon(for: line, size: 24)
                } else {
                    // Grille 2x2
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 2) {
                        ForEach(Array(lines.enumerated()), id: \.element) { index, line in
                            icon(for: line, size: 16)
                        }
                        if hasMore {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 10, height: 10)
                                .overlay(Text("+").font(.system(size: 8)).bold())
                        }
                    }
                    .padding(2)
                    .background(Color.white.opacity(0.8)) // Petit fond léger pour le groupe
                    .cornerRadius(8)
                    .shadow(radius: 2)
                    .frame(width: 44, height: 44)
                }
            }
            
            // Nom de la station
            Text(station.name)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.black)
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(Color.white.opacity(0.9))
                .cornerRadius(4)
                .shadow(radius: 1)
                .fixedSize() // Empêche le texte de se tronquer trop vite
        }
    }
    
    @ViewBuilder
    private func icon(for line: StationLine, size: CGFloat) -> some View {
        let assetName = TransportType.getAssetName(mode: line.type.rawValue, label: line.name)
        
        if UIImage(named: assetName) != nil {
            Image(assetName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
                .shadow(radius: 1)
        } else {
            // Fallback shape
            let color = MapDataService.shared.lineColorCache[line.name] ?? .gray
            if line.type == .rer || line.type == .transilien {
                RoundedRectangle(cornerRadius: 4)
                    .fill(color)
                    .frame(width: size, height: size)
            } else {
                Circle()
                    .fill(color)
                    .frame(width: size, height: size)
            }
        }
    }
}
