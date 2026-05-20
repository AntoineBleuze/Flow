# 007_CLLocationSourceInformation.pdf

## Page 1

CLLocationSourceInformation contains information about the source that provides a
CLLocation instance, such as instances that locationManager(_:didUpdateLocations
delivers. For example, an app may choose to check the source information and reject locations if
the isSimulatedBySoftware property is true when the developer isn’t debugging or testing
the app.
init(softwareSimulationState: Bool, andExternalAccessoryState: Bool)
Creates an instance of location source information.
var isProducedByAccessory: Bool
A Boolean value that indicates whether the system receives the location from an external
accessory.
Overview
Topics
Creating a location source information object
Identifying the source of location data
Core Location / CLLocationSourceInformation
Class
CLLocationSourceInformation
Information about the source that provides a location.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
tvOS 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 2

var isSimulatedBySoftware: Bool
A Boolean value that indicates whether the system generates the location using on-device
software simulation.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting the current location of a device
Start location services and provide information the system needs to optimize power usage fo
those services.
Handling location updates in the background
Configure your app to receive location updates when it isn’t running in the foreground.
Creating a location push service extension
Add and configure an extension to enable your location-sharing app to access a user’s
location in response to a request from another user.
Relationships
Inherits From
Conforms To
See Also
Location updates


## Page 3

class CLLocation
The latitude, longitude, and course information reported by the system.
struct CLLocationCoordinate2D
The latitude and longitude associated with a location, specified using the WGS 84 reference
frame.
class CLFloor
The floor of a building on which the user’s device is located.
class CLVisit
Information about the user’s location during a specific period of time.
Monitoring location changes with Core Location
Define boundaries and act on user location updates.
class CLServiceSession


