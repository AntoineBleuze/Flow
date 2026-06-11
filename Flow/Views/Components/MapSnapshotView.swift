import MapKit
import SwiftUI

#if os(iOS)
    import UIKit
#endif

/// A view that displays a static snapshot of the map as background
/// Centered on user location with transit line polylines drawn
struct MapSnapshotView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var locationManager = LocationManager.shared
    @ObservedObject var mapDataService = MapDataService.shared

    #if os(iOS)
        @State private var snapshot: UIImage?
    #else
        @State private var snapshot: NSImage?
    #endif

    /// Clé calculée pour détecter les changements de position utilisateur
    private var userLocationKey: String {
        if let loc = locationManager.userLocation {
            return "\(loc.latitude.rounded(toPlaces: 3))-\(loc.longitude.rounded(toPlaces: 3))"
        }
        return "no-location"
    }

    var body: some View {
        Group {
            if let snapshot = snapshot {
                #if os(iOS)
                    Image(uiImage: snapshot)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                #else
                    Image(nsImage: snapshot)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                #endif
            } else {
                // Fallback gradient while loading
                LinearGradient(
                    colors: [Color.blue.opacity(0.1), Color.green.opacity(0.1)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            }
        }
        .ignoresSafeArea()
        .onAppear {
            generateSnapshot()
        }
        .onChange(of: colorScheme) { _, _ in
            // Régénérer le snapshot quand le mode change
            MapSnapshotCache.shared.invalidateAll()
            generateSnapshot()
        }
        .onChange(of: userLocationKey) { _, _ in
            // Régénérer si la position utilisateur change significativement
            generateSnapshot()
        }
        .onChange(of: mapDataService.lines.count) { _, _ in
            // Régénérer quand les lignes sont chargées
            if !mapDataService.lines.isEmpty {
                MapSnapshotCache.shared.invalidateAll()
                generateSnapshot()
            }
        }
    }

    private func generateSnapshot() {
        let isDarkMode = colorScheme == .dark

        // Déterminer le centre de la carte (position utilisateur ou Paris par défaut)
        let center: CLLocationCoordinate2D
        if let userLocation = locationManager.userLocation {
            center = userLocation
        } else {
            center = CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)  // Paris
        }

        // Vérifier le cache
        let cacheKey =
            "\(isDarkMode)-\(center.latitude.rounded(toPlaces: 3))-\(center.longitude.rounded(toPlaces: 3))"
        if let cached = MapSnapshotCache.shared.getSnapshot(for: cacheKey) {
            self.snapshot = cached
            return
        }

        // Generate new snapshot with polylines
        let options = MKMapSnapshotter.Options()
        options.region = MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        )

        #if os(iOS)
            options.size = UIScreen.main.bounds.size
            options.traitCollection = UITraitCollection(
                userInterfaceStyle: isDarkMode ? .dark : .light)
        #else
            options.size = CGSize(width: 400, height: 800)
        #endif

        options.mapType = .standard
        options.pointOfInterestFilter = MKPointOfInterestFilter(excluding: [.publicTransport])

        let snapshotter = MKMapSnapshotter(options: options)
        let lines = mapDataService.lines

        snapshotter.start { result, error in
            guard let result = result else { return }

            #if os(iOS)
                // Dessiner les polylines sur le snapshot
                let finalImage = self.drawPolylines(on: result, lines: lines, size: options.size)

                DispatchQueue.main.async {
                    self.snapshot = finalImage
                    MapSnapshotCache.shared.setSnapshot(finalImage, for: cacheKey)
                }
            #else
                DispatchQueue.main.async {
                    self.snapshot = result.image
                }
            #endif
        }
    }

    #if os(iOS)
        /// Dessine les polylines des lignes de transport sur l'image snapshot
        private func drawPolylines(
            on snapshot: MKMapSnapshotter.Snapshot, lines: [LineTrace], size: CGSize
        ) -> UIImage {
            UIGraphicsBeginImageContextWithOptions(size, true, 0)

            // Dessiner l'image de base
            snapshot.image.draw(at: .zero)

            guard let context = UIGraphicsGetCurrentContext() else {
                return snapshot.image
            }

            // Dessiner chaque ligne
            for line in lines {
                // Convertir Color en UIColor
                let uiColor = UIColor(line.color)
                context.setStrokeColor(uiColor.cgColor)
                context.setLineWidth(2.5)
                context.setLineCap(.round)
                context.setLineJoin(.round)

                for polyline in line.polylines {
                    guard polyline.pointCount > 1 else { continue }

                    // Créer le path pour cette polyline
                    let path = CGMutablePath()
                    var firstPoint = true

                    for i in 0..<polyline.pointCount {
                        let coordinate = polyline.points()[i].coordinate
                        let point = snapshot.point(for: coordinate)

                        // Vérifier que le point est dans les limites
                        if point.x.isFinite && point.y.isFinite {
                            if firstPoint {
                                path.move(to: point)
                                firstPoint = false
                            } else {
                                path.addLine(to: point)
                            }
                        }
                    }

                    context.addPath(path)
                    context.strokePath()
                }
            }

            let finalImage = UIGraphicsGetImageFromCurrentImageContext() ?? snapshot.image
            UIGraphicsEndImageContext()

            return finalImage
        }
    #endif
}

/// Extension pour arrondir les coordonnées (pour le cache)
extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

/// Singleton cache for the map snapshot - supports multiple cached snapshots
class MapSnapshotCache {
    static let shared = MapSnapshotCache()

    #if os(iOS)
        private var snapshots: [String: UIImage] = [:]

        func getSnapshot(for key: String) -> UIImage? {
            return snapshots[key]
        }

        func setSnapshot(_ image: UIImage, for key: String) {
            // Limiter le nombre de snapshots en cache
            if snapshots.count > 5 {
                snapshots.removeAll()
            }
            snapshots[key] = image
        }

        func invalidateAll() {
            snapshots.removeAll()
        }
    #else
        private var snapshots: [String: NSImage] = [:]

        func getSnapshot(for key: String) -> NSImage? {
            return snapshots[key]
        }

        func setSnapshot(_ image: NSImage, for key: String) {
            if snapshots.count > 5 {
                snapshots.removeAll()
            }
            snapshots[key] = image
        }

        func invalidateAll() {
            snapshots.removeAll()
        }
    #endif

    private init() {}
}

#Preview {
    MapSnapshotView()
}

