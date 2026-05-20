# 000_EKCalendarItem.pdf

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


