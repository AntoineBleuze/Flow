import CoreLocation
import SwiftUI
import UIKit

struct StationMarker: View {
    let station: MapStation
    let zoomLevel: Double
    var isSelected: Bool = false

    var body: some View {
        let lines = station.lines.prefix(4)
        let hasMore = station.lines.count > 4

        // Dimensions du marqueur
        let pointerHeight: CGFloat = 8
        let bubbleSize: CGFloat = isSelected ? 48 : 40  // Taille dynamique

        ZStack {
            // Forme de bulle (Ballon + Pointe)
            MarkerBubbleShape(pointerHeight: pointerHeight)
                .fill(Color.white)
                .glassEffect()
                .frame(width: bubbleSize, height: bubbleSize + pointerHeight)
                .shadow(color: Color.black.opacity(isSelected ? 0.3 : 0.15), radius: isSelected ? 6 : 3, x: 0, y: 2)
                .scaleEffect(isSelected ? 1.1 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isSelected)

            // Contenu (Lignes)
            VStack(spacing: 0) {
                if lines.isEmpty {
                    Circle()
                        .fill(Color.gray)
                        .frame(width: 12, height: 12)
                } else if lines.count == 1 {
                    let line = lines[0]
                    LineIcon(type: line.type, lineId: line.name, size: isSelected ? 34 : 28)
                } else {
                    // Grille 2x2
                    let iconSize: CGFloat = isSelected ? 14 : 12
                    LazyVGrid(columns: [GridItem(.fixed(iconSize)), GridItem(.fixed(iconSize))], spacing: 2) {
                        ForEach(Array(lines.enumerated()), id: \.element) { index, line in
                            LineIcon(type: line.type, lineId: line.name, size: iconSize)
                        }
                        if hasMore {
                            Circle()
                                .fill(Color.gray.opacity(0.1))
                                .frame(width: iconSize, height: iconSize)
                                .overlay(
                                    Text("+")
                                        .font(.system(size: iconSize * 0.5, weight: .bold))
                                        .foregroundColor(.secondary)
                                )
                        }
                    }
                    .frame(width: bubbleSize * 0.7, height: bubbleSize * 0.7)
                }
            }
            .padding(.bottom, pointerHeight)
            .scaleEffect(isSelected ? 1.1 : 1.0)
            .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0), value: isSelected)
        }
        .overlay(
            Text(station.name)
                .font(.system(size: isSelected ? 12 : 10, weight: .bold))
                .foregroundColor(.primary)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 6))
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 1)
                .fixedSize()
                .offset(y: isSelected ? 45 : 35)
                .opacity(isSelected || zoomLevel > 0.8 ? 1 : 0) // Show name when selected or zoomed in
            , alignment: .bottom
        )
    }
}

// Forme personnalisée style Apple Maps améliorée
struct MarkerBubbleShape: Shape {
    var pointerHeight: CGFloat = 8

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height - pointerHeight
        let radius = width / 2
        let center = CGPoint(x: width / 2, y: radius)
        
        // Cercle principal
        path.addArc(
            center: center,
            radius: radius,
            startAngle: Angle(degrees: 150),
            endAngle: Angle(degrees: 30),
            clockwise: false)

        // Pointe plus douce
        let bottomCenter = CGPoint(x: width / 2, y: rect.height)
        
        path.addQuadCurve(
            to: bottomCenter,
            control: CGPoint(x: width / 2, y: rect.height - pointerHeight * 0.2))
        
        path.addQuadCurve(
            to: CGPoint(x: width * 0.25, y: height * 0.9), // Point de retour sur le cercle
            control: CGPoint(x: width / 2, y: rect.height - pointerHeight * 0.2))
            
        path.closeSubpath()

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
