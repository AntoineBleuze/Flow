# Alarms.pdf

## Page 1

An easy way to alert users of their upcoming events is to give them the option of setting alarms fo
their calendar items. Regardless of the app that’s currently running, alarms come to the foregroun
as a notification and remind users of the scheduled event. If an alarm is set to a calendar event, th
notification comes from the Calendar app; if an alarm is set to a reminder, the notification comes
from the Reminders app.
Alarms can be time-based, firing at a specified time, or location-based, firing when crossing a
geofence (for more information about geofences, see “Configure Geofences”). Alarms can b
applied to both calendar events and reminders.
Note
An alarm is not intended to serve as a UILocalNotification. An alarm requires you to
create an event or reminder that is visible in the user’s Calendar or Reminders app. A UILocal
Notification is better suited for general purposes that don’t involve the Calendar
database.
Add an alarm to an event with the addAlarm(_:) method.
Alarms can be created with an absolute date or with an offset relative to the start date of the even
Alarms created with a relative offset must occur before or at the start date of the event.
In OS X, you can trigger an action alongside the alarm. For example, you can set properties such
as:
emailAddress to send an email.
Overview
Add and Remove Alarms
EventKit / Setting an alarm
Article
Setting an alarm
Alert users of events and reminders with an alarm.


## Page 2

soundName to play a sound.
url to open a URL.
Remove an alarm from an event with the removeAlarm(_:) method.
A geofence is a virtual border surrounding a geographic location that, when crossed, triggers an
alarm for an event. You specify the latitude and longitude of the center and the radius of the
geofence.
While geofence-enabled alarms can be applied to events, they are more practical for reminders.
Geofences are a useful way to remind users of tasks they need to do when entering or exiting a
certain region. For example, when a user leaves their workplace, an alarm can remind them to sto
by the grocery store.
Note
Geofences are supported on both macOS and iOS, but they are more effective on mobile
devices.
Configure a geofence for an event by creating an alarm and setting its structured location and
proximity. Call the init(title:) method to create a structured location. To set longitude and
latitude coordinates, pass a CLLocation to the geoLocation property of the structured locatio
returned. A value of 0 for the radius property will use the system’s default radius; to choose a
radius of your own, specify a value in meters.
class EKAlarm
A class that represents an alarm.
class EKStructuredLocation
A class that specifies a geofence to activate the alarm of a calendar item.
Configure Geofences
See Also
Alarms


## Page 3

An EKAlarm object represents an alarm in Event Kit. Use the init(absoluteDate:) and
init(relativeOffset:) class methods to create an alarm and use the properties to set
information about an alarm. In macOS Mountain Lion, you can specify an action to trigger when th
alarm fires via the emailAddress, soundName, or url property.
init(absoluteDate: Date)
Creates and returns an alarm with an absolute date.
init(relativeOffset: TimeInterval)
Creates and returns an alarm with a relative offset.
var absoluteDate: Date?
The absolute date for the alarm.
Overview
Topics
Creating an Alarm
Accessing Alarm Dates
EventKit / EKAlarm
Class
EKAlarm
A class that represents an alarm.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 4

var relativeOffset: TimeInterval
The offset from the start of an event, at which the alarm fires.
enum EKAlarmProximity
A value indicating whether an alarm is triggered by entering or exiting a region.
var proximity: EKAlarmProximity
A value indicating how a location-based alarm is triggered.
var structuredLocation: EKStructuredLocation?
The location to trigger an alarm.
These properties are only available in macOS 10.8 or later.
enum EKAlarmType
A value that specifies what type of action occurs when the alarm triggers.
var type: EKAlarmType
The type of action to trigger when the alarm fires.
var emailAddress: String?
The recipient of an email to send when the alarm triggers.
var soundName: String?
The name of the sound to play when the alarm triggers.
EKObject
CVarArg
Setting GeoFence-based Alarms
Triggering Alarm Actions
Relationships
Inherits From
Conforms To


## Page 5

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Setting an alarm
Alert users of events and reminders with an alarm.
class EKStructuredLocation
A class that specifies a geofence to activate the alarm of a calendar item.
See Also
Alarms


## Page 6

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


## Page 7

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


