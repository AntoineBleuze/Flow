# Altitude data.pdf

## Page 1

Altitude events report changes in both the relative and absolute altitude. For example, a hiking ap
could use this object to track the user’s elevation change over the course of a hike, or to report
their current absolute altitude during the hike.
Because altitude events may not be available on all devices, always call the isRelative
AltitudeAvailable() method before starting relative altitude updates, and call isAbsolute
AltitudeAvailable() before starting absolute altitude updates.
After checking the availability of altitude data, call the startRelativeAltitudeUpdates(to
withHandler:) method to start receiving relative altitude data, or call the startAbsolute
AltitudeUpdates(to:withHandler:) method for absolute altitude data.
Core Motion generates events at regular intervals (regardless of whether the data has changed)
and delivers them to the block you specified. When you no longer need the event data, call the
stopRelativeAltitudeUpdates() or stopAbsoluteAltitudeUpdates() methods
respectively.
Important
To use this API, you must include the NSMotionUsageDescription key in your app’s Info
.plist file and provide a usage description string for this key. The usage description appears
in the prompt that the user must accept the first time the system asks the user to access
motion data for your app. If you don’t include a usage description string, your app crashes
when you call this API.
Overview
Core Motion / CMAltimeter
Class
CMAltimeter
An object that initiates the delivery of altitude-related changes.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
watchOS 2.0+


## Page 2

class func isAbsoluteAltitudeAvailable() -> Bool
Returns a Boolean value indicating whether the current device reports changes in the absolu
altitude.
class func isRelativeAltitudeAvailable() -> Bool
Returns a Boolean value indicating whether the current device supports generating data for
relative altitude changes.
class func authorizationStatus() -> CMAuthorizationStatus
Returns a value indicating whether the app is authorized to retrieve altimeter data.
enum CMAuthorizationStatus
The authorization status for motion-related features.
func startAbsoluteAltitudeUpdates(to: OperationQueue, withHandler:
CMAbsoluteAltitudeHandler)
Starts the delivery of absolute altitude data to the specified handler.
func stopAbsoluteAltitudeUpdates()
Stops the delivery of absolute altitude data for this altimeter object.
typealias CMAbsoluteAltitudeHandler
A block for receiving absolute altitude data.
func startRelativeAltitudeUpdates(to: OperationQueue, withHandler:
CMAltitudeHandler)
Starts the delivery of relative altitude data to the specified handler.
func stopRelativeAltitudeUpdates()
Stops the delivery of relative altitude data for the altimeter object.
typealias CMAltitudeHandler
A block for receiving relative altitude data.
Topics
Determining Altitude Availability
Starting and Stopping Altitude Updates


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CMAbsoluteAltitudeData
Data that records a change in absolute altitude.
class CMAltitudeData
Data for a recorded change in altitude.
Relationships
Inherits From
Conforms To
See Also
Altitude data


## Page 4

Absolute altitude is only available on iPhone 12 and later and Apple Watch 6 or SE and later.
var altitude: Double
The absolute altitude of the device relative to sea level, measured in meters.
var accuracy: Double
The estimated uncertainty of the altimeter in meters, based on one standard deviation.
var precision: Double
The recommended resolution for the altitude, in meters.
Overview
Topics
Accessing Altitude Data
Relationships
Core Motion / CMAbsoluteAltitudeData
Class
CMAbsoluteAltitudeData
Data that records a change in absolute altitude.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
visionOS 1.0+
watchOS 8.0+


## Page 5

CMLogItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CMAltimeter
An object that initiates the delivery of altitude-related changes.
class CMAltitudeData
Data for a recorded change in altitude.
Inherits From
Conforms To
See Also
Altitude data


## Page 6

You do not create instances of this class directly. When you want to receive altimeter changes,
create an instance of the CMAltimeter class and use that object to query for events or to start
the delivery of events. The altimeter object creates new instances of this class at appropriate time
and delivers them to the handler you specify.
var relativeAltitude: NSNumber
The change in altitude (in meters) since the first reported event.
var pressure: NSNumber
The recorded pressure, in kilopascals.
Overview
Topics
Getting the Altitude Data
Relationships
Core Motion / CMAltitudeData
Class
CMAltitudeData
Data for a recorded change in altitude.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
watchOS 2.0+


## Page 7

CMLogItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CMAltimeter
An object that initiates the delivery of altitude-related changes.
class CMAbsoluteAltitudeData
Data that records a change in absolute altitude.
Inherits From
Conforms To
See Also
Altitude data


