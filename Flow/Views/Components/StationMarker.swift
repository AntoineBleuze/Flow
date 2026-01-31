import CoreLocation
import SwiftUI
import UIKit

struct StationMarker: View {
    let station: MapStation
    let zoomLevel: Double  // Pour ajuster la taille si besoin (optionnel)

    var body: some View {
        let lines = station.lines.prefix(4)
        let hasMore = station.lines.count > 4

        // Dimensions du marqueur
        let pointerHeight: CGFloat = 8
        let bubbleSize: CGFloat = 40  // Taille du cercle blanc

        ZStack {
            // Forme de bulle (Ballon + Pointe)
            MarkerBubbleShape(pointerHeight: pointerHeight)
                .fill(Color.white)
                .frame(width: bubbleSize, height: bubbleSize + pointerHeight)
                .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 2)

            // Contenu (Lignes)
            // On le décale légèrement vers le haut pour qu'il soit centré dans la partie "cercle"
            VStack(spacing: 0) {
                if lines.isEmpty {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 12, height: 12)
                } else if lines.count == 1 {
                    let line = lines[0]
                    icon(for: line, size: 28)  // Un peu plus grand pour une seule ligne
                } else {
                    // Grille 2x2
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 2) {
                        ForEach(Array(lines.enumerated()), id: \.element) { index, line in
                            icon(for: line, size: 12)
                        }
                        if hasMore {
                            Circle()
                                .fill(Color.gray.opacity(0.2))  // Plus subtil que le blanc sur blanc
                                .frame(width: 8, height: 8)
                                .overlay(
                                    Text("+").font(.system(size: 6)).bold().foregroundColor(.black))
                        }
                    }
                    .frame(width: 28, height: 28)  // Conteneur borné pour la grille
                }
            }
            .padding(.bottom, pointerHeight)  // Remonter le contenu pour ne pas être dans la pointe
        }
        // Le nom de la station est masqué par défaut comme sur Apple Maps,
        // ou on peut le rajouter en dessous/au-dessus si demandé, mais pour l'instant on se focus sur le marqueur.
        // Si on veut le garder:
        .overlay(
            Text(station.name)
                .font(.system(size: 10, weight: .bold))  // Plus lisible
                .foregroundColor(.black)
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(Color.white.opacity(0.95))
                .cornerRadius(4)
                .shadow(radius: 1)
                .fixedSize()
                .offset(y: 35)  // En dessous du marqueur
            , alignment: .bottom
        )
    }

    @ViewBuilder
    private func icon(for line: StationLine, size: CGFloat) -> some View {
        let assetName = TransportType.getAssetName(mode: line.type.rawValue, label: line.name)

        if UIImage(named: assetName) != nil {
            Image(assetName)
                .resizable()
                .scaledToFit()
                .frame(width: size, height: size)
        } else {
            // Fallback shape
            let color = MapDataService.shared.lineColorCache[line.name] ?? .gray

            ZStack {
                if line.type == .rer || line.type == .transilien {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(color)
                        .frame(width: size, height: size)
                } else {
                    Circle()
                        .fill(color)
                        .frame(width: size, height: size)
                }

                // Si on n'a pas d'image, on affiche le nom de la ligne
                Text(line.name)
                    .font(.system(size: size * 0.6, weight: .bold))
                    .foregroundColor(.white)
            }
        }
    }
}

// Forme personnalisée style Apple Maps
struct MarkerBubbleShape: Shape {
    var pointerHeight: CGFloat = 8
    var cornerRadius: CGFloat = 20  // Demi-largeur implicite pour un cercle

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height - pointerHeight
        let bottomCenter = CGPoint(x: width / 2, y: rect.height)

        // Cercle principal
        path.addArc(
            center: CGPoint(x: width / 2, y: height / 2),
            radius: width / 2,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 360),
            clockwise: false)

        // Pointe
        // On dessine un petit triangle ou une courbe de Bézier attachée au bas du cercle
        // Pour faire simple et joli : une courbe quadratique

        let pointerWidth: CGFloat = 12
        path.move(to: CGPoint(x: width / 2 - pointerWidth / 2, y: height * 0.95))  // Départ un peu avant le bas du cercle

        path.addQuadCurve(
            to: bottomCenter,
            control: CGPoint(x: width / 2 - pointerWidth / 4, y: height + pointerHeight / 2))

        path.addQuadCurve(
            to: CGPoint(x: width / 2 + pointerWidth / 2, y: height * 0.95),
            control: CGPoint(x: width / 2 + pointerWidth / 4, y: height + pointerHeight / 2))

        return path
    }
}

struct StationMarker_Previews: PreviewProvider {
    static var previews: some View {
        // Mock data
        let station1 = MapStation(
            id: "1", name: "Châtelet",
            coordinate: CLLocationCoordinate2D(latitude: 48.8584, longitude: 2.3470), platforms: [],
            isHub: true,
            mainType: .metro,
            lines: [
                StationLine(name: "1", type: .metro),
                StationLine(name: "4", type: .metro),
            ])

        let station2 = MapStation(
            id: "2", name: "Monceau",
            coordinate: CLLocationCoordinate2D(latitude: 48.8809, longitude: 2.3094), platforms: [],
            isHub: false,
            mainType: .metro,
            lines: [
                StationLine(name: "2", type: .metro)
            ])

        HStack(spacing: 20) {
            StationMarker(station: station1, zoomLevel: 1)
            StationMarker(station: station2, zoomLevel: 1)
        }
        .padding()
        .background(Color.green.opacity(0.3))  // Simule la carte
        .previewLayout(.sizeThatFits)
    }
}
