import SwiftData
import Foundation
import MapKit

@Model
final class TransportLineModel {
    @Attribute(.unique) var routeId: String
    var routeShortName: String
    var routeLongName: String
    var routeType: String
    var routeColor: String
    
    @Relationship(deleteRule: .cascade, inverse: \CoordinatePointModel.transportLine)
    var coordinates: [CoordinatePointModel] = []
    
    init(routeId: String, routeShortName: String, routeLongName: String, routeType: String, routeColor: String) {
        self.routeId = routeId
        self.routeShortName = routeShortName
        self.routeLongName = routeLongName
        self.routeType = routeType
        self.routeColor = routeColor
    }
    
    func toColoredPolylines() -> [ColoredPolyline] {
        var polylines: [ColoredPolyline] = []
        let color = UIColor(hex: self.routeColor) ?? .blue
        var segmentDict: [Int32: [CLLocationCoordinate2D]] = [:]
        
        for coordModel in coordinates {
            let coordinate = CLLocationCoordinate2D(latitude: coordModel.latitude, longitude: coordModel.longitude)
            segmentDict[coordModel.segmentIndex, default: []].append(coordinate)
        }
        
        for (_, coords) in segmentDict.sorted(by: { $0.key < $1.key }) {
            if coords.count >= 2 {
                let polyline = ColoredPolyline(coordinates: coords, count: coords.count)
                polyline.color = color
                polyline.lineName = self.routeShortName
                polylines.append(polyline)
            }
        }
        return polylines
    }
}
