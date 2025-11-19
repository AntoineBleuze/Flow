import Foundation
import CoreData

@objc(StopPointEntity)
public class StopPointEntity: NSManagedObject {

}

extension StopPointEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StopPointEntity> {
        return NSFetchRequest<StopPointEntity>(entityName: "StopPointEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var stopAreaId: String?
    @NSManaged public var city: String?
    @NSManaged public var name: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var type: String?
    @NSManaged public var lineName: String?

}

extension StopPointEntity : Identifiable {

}
