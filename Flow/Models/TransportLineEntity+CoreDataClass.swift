import CoreData
import Foundation
import MapKit

#if canImport(UIKit)
    import UIKit
#elseif canImport(AppKit)
    import AppKit
#endif

@objc(TransportLineEntity)
public class TransportLineEntity: NSManagedObject {

    /// Convertit l'entité CoreData en ColoredPolyline pour affichage sur la carte
    func toCustomPolylines() -> [ColoredPolyline] {
        var polylines: [ColoredPolyline] = []

        // Récupère la couleur à partir de la chaîne hexadécimale
        let color = MapPlatformColor(hex: self.routeColor ?? "000000") ?? .blue  // Bleu par défaut

        // Groupe les coordonnées par segment
        let sortedCoordinates = coordinates?.array as? [CoordinatePointEntity] ?? []

        // Dictionnaire pour regrouper par segmentIndex
        var segmentDict: [Int32: [CLLocationCoordinate2D]] = [:]

        for coordEntity in sortedCoordinates {
            let coordinate = CLLocationCoordinate2D(
                latitude: coordEntity.latitude,
                longitude: coordEntity.longitude
            )

            if segmentDict[coordEntity.segmentIndex] == nil {
                segmentDict[coordEntity.segmentIndex] = []
            }
            segmentDict[coordEntity.segmentIndex]?.append(coordinate)
        }

        // Crée une polyline pour chaque segment
        for (_, coords) in segmentDict.sorted(by: { $0.key < $1.key }) {
            if coords.count >= 2 {
                let polyline = ColoredPolyline(coordinates: coords, count: coords.count)
                polyline.color = color
                polyline.lineName = self.routeShortName ?? ""
                polylines.append(polyline)
            }
        }

        return polylines
    }
}
