import SwiftData
import Foundation

@Model
final class StopPointModel {
    @Attribute(.unique) var id: String
    var stopAreaId: String
    var city: String
    var name: String
    var latitude: Double
    var longitude: Double
    var type: String
    var lineName: String
    
    init(id: String, stopAreaId: String, city: String, name: String, latitude: Double, longitude: Double, type: String, lineName: String) {
        self.id = id
        self.stopAreaId = stopAreaId
        self.city = city
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.type = type
        self.lineName = lineName
    }
}
