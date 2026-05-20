# 005_EKReminder.pdf

## Page 1

Creating events and reminders
Use the init(eventStore:) method to create a new reminder. Use the properties in the class
to get and modify certain information about a reminder.
init(eventStore: EKEventStore)
Creates and returns a new reminder in the given event store.
enum EKReminderPriority
The priority of the reminder.
Mentioned in
Overview
Topics
Creating a Reminder
Accessing Reminder Properties
EventKit / EKReminder
Class
EKReminder
A class that represents a reminder in a calendar.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 2

var priority: Int
The reminder’s priority.
var startDateComponents: DateComponents?
The start date of the task.
var dueDateComponents: DateComponents?
The date by which the reminder should be completed.
var isCompleted: Bool
A Boolean value determining whether or not the reminder is marked completed.
var completionDate: Date?
The date on which the reminder was completed.
EKCalendarItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating events and reminders
Create and modify events and reminders in a person’s database.
Relationships
Inherits From
Conforms To
See Also
Events and reminders


## Page 3

Retrieving events and reminders
Fetch events and reminders from the Calendar database.
Updating with notifications
Register for notifications about changes and keep your app up to date.
Managing location-based reminders
Access reminders set up with geofence-enabled alarms on a person’s calendars.
class EKEvent
A class that represents an event in a calendar.


