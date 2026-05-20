# Common objects.pdf

## Page 1

Creating a recurring event
Creating events and reminders
The EKCalendarItem is a an abstract superclass for calendar events and reminders. This class
provides common properties and methods for accessing properties of calendar items such as the
ability to set the calendar, title, and location, as well as support for attaching notes, displaying
attendees, setting multiple alarms, and specifying recurrence rules.
var calendarItemIdentifier: String
The calendar item’s unique identifier.
var calendarItemExternalIdentifier: String!
The calendar item’s external identifier as provided by the calendar server.
Mentioned in
Overview
Topics
Accessing Calendar Items
EventKit / EKCalendarItem
Class
EKCalendarItem
An abstract superclass for calendar events and reminders.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 2

var uuid: String
The calendar item’s unique identifier.
Deprecated
var calendar: EKCalendar!
The calendar for the calendar item.
var title: String!
The title for the calendar item.
var location: String?
The location associated with the calendar item.
var creationDate: Date?
The date that this calendar item was created.
var lastModifiedDate: Date?
The date that the calendar item was last modified.
var timeZone: TimeZone?
The time zone for the calendar item.
var url: URL?
The URL for the calendar item.
var hasNotes: Bool
A Boolean value that indicates whether the calendar item has notes.
var notes: String?
The notes associated with the calendar item.
var hasAttendees: Bool
A Boolean value that indicates whether the calendar item has attendees.
var attendees: [EKParticipant]?
Accessing Calendar Item Properties
Attaching Notes
Displaying Attendees


## Page 3

The attendees associated with the calendar item, as an array of EKParticipant objects.
var hasAlarms: Bool
A Boolean value that indicates whether the calendar item has alarms.
func addAlarm(EKAlarm)
Adds an alarm to the receiver.
func removeAlarm(EKAlarm)
Removes an alarm from the calendar item.
var alarms: [EKAlarm]?
The alarms associated with the calendar item, as an array of EKAlarm objects.
var hasRecurrenceRules: Bool
A Boolean value that indicates whether the calendar item has recurrence rules.
func addRecurrenceRule(EKRecurrenceRule)
Adds a recurrence rule to the recurrence rule array.
func removeRecurrenceRule(EKRecurrenceRule)
Removes a recurrence rule from the recurrence rule array.
var recurrenceRules: [EKRecurrenceRule]?
The recurrence rules for the calendar item.
EKObject
EKEvent, EKReminder
Adding and Removing Alarms
Setting Recurrence Rules
Relationships
Inherits From
Inherited By


## Page 4

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class EKObject
An abstract superclass for all EventKit classes that have persistent instances.
class EKSource
An abstract superclass that represents the account a calendar belongs to.
Conforms To
See Also
Common objects


## Page 5

EKObject provides fine control when saving and restoring property settings. For example, you c
find out if a persistent object was modified locally and whether it needs to be saved. If the object
has changed in the event store since it was fetched, you can refresh the local copy by keeping loc
changes or by removing local changes. You can also roll back the object to the state when it was
first fetched.
var hasChanges: Bool
Returns whether this object or any of the objects it contains has uncommitted changes.
var isNew: Bool
A Boolean value that indicates whether this object has ever been saved.
func refresh() -> Bool
Merges changes to this object with the latest saved values.
func reset()
Overview
Topics
Saving and Restoring State
EventKit / EKObject
Class
EKObject
An abstract superclass for all EventKit classes that have persistent instances.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 6.0+


## Page 6

Returns this object to its saved state.
func rollback()
Rolls back the property values of this object to its original state when it was first fetched.
NSObject
EKAlarm
EKCalendar
EKCalendarItem
EKParticipant
EKRecurrenceRule
EKSource
EKStructuredLocation
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class EKCalendarItem
An abstract superclass for calendar events and reminders.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Common objects


## Page 7

class EKSource
An abstract superclass that represents the account a calendar belongs to.


## Page 8

You do not create instances of this class; instead, you retrieve EKSource objects from an
EKEventStore object. Use the sources property to get all the EKSource objects for an event
store, and use the methods in this class to access properties of the source object.
enum EKSourceType
The type of source object.
var sourceIdentifier: String
A unique identifier for the source object.
var sourceType: EKSourceType
The type of this source object.
var title: String
The name of this source object.
Overview
Topics
Accessing Source Properties
EventKit / EKSource
Class
EKSource
An abstract superclass that represents the account a calendar belongs to.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 9

func calendars(for: EKEntityType) -> Set<EKCalendar>
Returns the calendars that belong to this source object that support a particular entity type.
var calendars: Set<EKCalendar>
The calendars that belong to this source object.
Deprecated
enum EKEntityType
The type of entities allowed for a source.
var isDelegate: Bool
EKObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Accessing Calendars
Entity Type
Instance Properties
Relationships
Inherits From
Conforms To
See Also


## Page 10

class EKCalendarItem
An abstract superclass for calendar events and reminders.
class EKObject
An abstract superclass for all EventKit classes that have persistent instances.
Common objects


