import Foundation
import CoreData

extension TransportLineEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransportLineEntity> {
        return NSFetchRequest<TransportLineEntity>(entityName: "TransportLineEntity")
    }

    @NSManaged public var routeId: String?
    @NSManaged public var routeShortName: String?
    @NSManaged public var routeLongName: String?
    @NSManaged public var routeType: String?
    @NSManaged public var routeColor: String?
    @NSManaged public var coordinates: NSOrderedSet?

}

// MARK: Generated accessors for coordinates
extension TransportLineEntity {

    @objc(insertObject:inCoordinatesAtIndex:)
    @NSManaged public func insertIntoCoordinates(_ value: CoordinatePointEntity, at idx: Int)

    @objc(removeObjectFromCoordinatesAtIndex:)
    @NSManaged public func removeFromCoordinates(at idx: Int)

    @objc(insertCoordinates:atIndexes:)
    @NSManaged public func insertIntoCoordinates(_ values: [CoordinatePointEntity], at indexes: NSIndexSet)

    @objc(removeCoordinatesAtIndexes:)
    @NSManaged public func removeFromCoordinates(at indexes: NSIndexSet)

    @objc(replaceObjectInCoordinatesAtIndex:withObject:)
    @NSManaged public func replaceCoordinates(at idx: Int, with value: CoordinatePointEntity)

    @objc(replaceCoordinatesAtIndexes:withCoordinates:)
    @NSManaged public func replaceCoordinates(at indexes: NSIndexSet, with values: [CoordinatePointEntity])

    @objc(addCoordinatesObject:)
    @NSManaged public func addToCoordinates(_ value: CoordinatePointEntity)

    @objc(removeCoordinatesObject:)
    @NSManaged public func removeFromCoordinates(_ value: CoordinatePointEntity)

    @objc(addCoordinates:)
    @NSManaged public func addToCoordinates(_ values: NSOrderedSet)

    @objc(removeCoordinates:)
    @NSManaged public func removeFromCoordinates(_ values: NSOrderedSet)

}

extension TransportLineEntity : Identifiable {

}
