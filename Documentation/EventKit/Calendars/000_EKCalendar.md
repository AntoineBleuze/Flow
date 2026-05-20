# 000_EKCalendar.pdf

## Page 1

Retrieving events and reminders
Use the properties in this class to get attributes about a calendar, such as its title and type. Use th
init(for:eventStore:) method to create a calendar object.
init(for: EKEntityType, eventStore: EKEventStore)
Creates a new calendar that can contain the given entity type.
init(eventStore: EKEventStore)
Creates and returns a calendar belonging to a specified event store.
Deprecated
Mentioned in
Overview
Topics
Creating Calendars
EventKit / EKCalendar
Class
EKCalendar
A class that represents a calendar in EventKit.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 2

enum EKCalendarType
Possible calendar types.
struct EKCalendarEventAvailabilityMask
A bitmask indicating the event availability settings that the calendar can support.
var allowsContentModifications: Bool
A Boolean value that indicates whether you can add, edit, and delete items in the calendar.
var cgColor: CGColor!
The calendar’s color.
var color: NSColor!
The calendar’s color.
var isImmutable: Bool
A Boolean value indicating whether the calendar’s properties can be edited or deleted.
var title: String
The calendar’s title.
var type: EKCalendarType
The calendar’s type.
var allowedEntityTypes: EKEntityMask
The entity types this calendar can contain.
var source: EKSource!
The source object representing the account to which this calendar belongs.
var isSubscribed: Bool
A Boolean value indicating whether the calendar is a subscribed calendar.
var supportedEventAvailabilities: EKCalendarEventAvailabilityMask
The event availability settings supported by this calendar, as indicated by a bitmask.
var calendarIdentifier: String
A unique identifier for the calendar.
func DATETIME_COMPONENTS_DO_NOT_USE()
Accessing Calendar Properties


## Page 3

A deprecated function.
Deprecated
func DATE_COMPONENTS_DO_NOT_USE()
A deprecated function.
Deprecated
EKObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class EKParticipant
A class that represents person, group, or room invited to a calendar event.
Relationships
Inherits From
Conforms To
See Also
Calendars


