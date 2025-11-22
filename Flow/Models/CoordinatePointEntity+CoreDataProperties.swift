import Foundation
import CoreData

extension CoordinatePointEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoordinatePointEntity> {
        return NSFetchRequest<CoordinatePointEntity>(entityName: "CoordinatePointEntity")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var segmentIndex: Int32
    @NSManaged public var transportLine: TransportLineEntity?

}

extension CoordinatePointEntity : Identifiable {

}
