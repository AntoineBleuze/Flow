import SwiftData
import Foundation

@Model
final class CoordinatePointModel {
    var latitude: Double
    var longitude: Double
    var segmentIndex: Int32
    var transportLine: TransportLineModel?
    
    init(latitude: Double, longitude: Double, segmentIndex: Int32, transportLine: TransportLineModel? = nil) {
        self.latitude = latitude
        self.longitude = longitude
        self.segmentIndex = segmentIndex
        self.transportLine = transportLine
    }
}
