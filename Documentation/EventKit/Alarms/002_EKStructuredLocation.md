# 002_EKStructuredLocation.pdf

## Page 1

Use init(title:) to create a new structured location, then set it to the structuredLocati
property of an EKAlarm object.
convenience init(title: String)
Creates a new structured location with the specified title.
convenience init(mapItem: MKMapItem)
Creates a new structured location with the specified map item.
var title: String?
The title of the location.
var geoLocation: CLLocation?
Overview
Topics
Creating Structured Locations
Accessing Structured Location Properties
EventKit / EKStructuredLocation
Class
EKStructuredLocation
A class that specifies a geofence to activate the alarm of a calendar item.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 2

The core location.
var radius: Double
A minimum distance from the core location that would trigger the alarm or reminder.
EKObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Setting an alarm
Alert users of events and reminders with an alarm.
class EKAlarm
A class that represents an alarm.
Relationships
Inherits From
Conforms To
See Also
Alarms


