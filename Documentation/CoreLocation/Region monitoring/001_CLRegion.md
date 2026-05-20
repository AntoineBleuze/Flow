# 001_CLRegion.pdf

## Page 1

This is an abstract base class. Instantiate one of the provided subclasses that define specific type
of regions. After you create a region, register it with a CLLocationManager object with the
startMonitoring(for:) method. The location manager generates appropriate events
whenever the user crosses the boundaries of the region.
var identifier: String
The identifier for the region object.
var notifyOnEntry: Bool
A Boolean indicating that notifications are generated upon entry into the region.
var notifyOnExit: Bool
A Boolean indicating that notifications are generated upon exit from the region.
Overview
Topics
Getting the region identifier
Specifying the notification conditions
Core Location / CLRegion
Class
CLRegion
A base class representing an area that can be monitored.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
watchOS 2.0+


## Page 2

init(circularRegionWithCenter: CLLocationCoordinate2D, radius:
CLLocationDistance, identifier: String)
Initializes and returns a region object defining a circular area.
Deprecated
func contains(CLLocationCoordinate2D) -> Bool
Returns a Boolean value indicating whether the region contains the specified coordinate.
Deprecated
var center: CLLocationCoordinate2D
The center point of the region.
Deprecated
var radius: CLLocationDistance
The radius (measured in meters) that defines the region’s outer boundary.
Deprecated
NSObject
CLBeaconRegion, CLCircularRegion
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
Deprecated
Relationships
Inherits From
Inherited By
Conforms To


## Page 3

NSObjectProtocol
NSSecureCoding
Monitoring the user’s proximity to geographic regions
Use condition monitoring to determine when the user enters or leaves a geographic region.
See Also
Region monitoring


