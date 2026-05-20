# Errors.pdf

## Page 1

static var eventNotMutable: EKError.Code
The event isn’t mutable and you can’t save or delete it.
static var noCalendar: EKError.Code
The event isn’t associated with a calendar.
static var noEndDate: EKError.Code
The event has no start date set.
static var noStartDate: EKError.Code
The event has no end date set.
static var datesInverted: EKError.Code
The event’s end date occurs before its start date.
static var internalFailure: EKError.Code
An internal error occurred.
static var calendarReadOnly: EKError.Code
The calendar is read-only and you can’t add events to it.
Topics
Error Codes
EventKit / EKError
Structure
EKError
An EventKit error.
iOS
iPadOS
Mac Catalyst
macOS
visionOS
watchOS


## Page 2

static var durationGreaterThanRecurrence: EKError.Code
The duration of an event is greater than its recurrence interval.
static var alarmGreaterThanRecurrence: EKError.Code
The alarm interval is greater than the recurrence interval.
static var startDateTooFarInFuture: EKError.Code
The start date is further into the future than the calendar can display.
static var startDateCollidesWithOtherOccurrence: EKError.Code
The event’s start date collides with another occurrence of the event.
static var objectBelongsToDifferentStore: EKError.Code
The object belongs to a different calendar store.
static var invitesCannotBeMoved: EKError.Code
You can’t move the event because it’s an invitation.
static var invalidSpan: EKError.Code
The system encountered an invalid span during a save or deletion.
static var calendarHasNoSource: EKError.Code
You can’t save the calendar without setting a source first.
static var calendarSourceCannotBeModified: EKError.Code
You can’t move the calendar to another source.
static var calendarIsImmutable: EKError.Code
The calendar is immutable and you can’t modify or delete it.
static var sourceDoesNotAllowCalendarAddDelete: EKError.Code
The source doesn’t allow you to add or delete calendars.
static var recurringReminderRequiresDueDate: EKError.Code
The recurring reminder requires a due date.
static var structuredLocationsNotSupported: EKError.Code
The source to which this calendar belongs doesn’t support structured locations.
static var reminderLocationsNotSupported: EKError.Code
The source doesn’t support locations on reminders.
static var alarmProximityNotSupported: EKError.Code


## Page 3

The source doesn’t allow geofences on alarms.
static var calendarDoesNotAllowEvents: EKError.Code
The calendar doesn’t allow you to add events.
static var calendarDoesNotAllowReminders: EKError.Code
The calendar doesn’t allow you to add reminders.
static var sourceDoesNotAllowReminders: EKError.Code
The source doesn’t allow calendars supporting reminder entity types.
static var sourceDoesNotAllowEvents: EKError.Code
The source doesn’t allow calendars supporting event entity types.
static var priorityIsInvalid: EKError.Code
The priority number for the reminder is invalid.
static var invalidEntityType: EKError.Code
The entity type is invalid.
static var procedureAlarmsNotMutable: EKError.Code
You can’t create or modify procedure alarms.
static var eventStoreNotAuthorized: EKError.Code
The user hasn’t authorized your app to access events or reminders.
static var osNotSupported: EKError.Code
The action isn’t supported on the current operating system.
static var invalidInviteReplyCalendar: EKError.Code
The calendar is invalid or nil.
static var notificationsCollectionFlagNotSet: EKError.Code
The notification collection doesn’t have the notifications collection flag.
static var sourceMismatch: EKError.Code
The object’s source doesn’t match its container’s source.
static var notificationCollectionMismatch: EKError.Code
The notification collection that contains this notification doesn’t match the collection the
system is trying to save.
static var notificationSavedWithoutCollection: EKError.Code


## Page 4

The notification can’t save because you haven’t added it to a notification collection and save
the collection first.
static var last: EKError.Code
This error is for internal use.
let EKErrorDomain: String
A string that identifies the EventKit error domain.
static var errorDomain: String
static var reminderAlarmContainsEmailOrUrl: EKError.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
enum Code
Error codes for EventKit errors.
let EKErrorDomain: String
Error Domain
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 5

A string that identifies the EventKit error domain.


## Page 6

case eventNotMutable
The event isn’t mutable and you can’t save or delete it.
case noCalendar
The event isn’t associated with a calendar.
case noStartDate
The event has no start date set.
case noEndDate
The event has no end date set.
case datesInverted
The event’s end date occurs before its start date.
case internalFailure
An internal error occurred.
case calendarReadOnly
The calendar is read-only and you can’t add events to it.
Topics
Constants
EventKit / EKError / EKError.Code
Enumeration
EKError.Code
Error codes for EventKit errors.
iOS
iPadOS
Mac Catalyst
macOS
visionOS
watchOS


## Page 7

case durationGreaterThanRecurrence
The duration of an event is greater than its recurrence interval.
case alarmGreaterThanRecurrence
The alarm interval is greater than the recurrence interval.
case startDateTooFarInFuture
The start date is further into the future than the calendar can display.
case startDateCollidesWithOtherOccurrence
The event’s start date collides with another occurrence of the event.
case objectBelongsToDifferentStore
The object belongs to a different calendar store.
case invitesCannotBeMoved
You can’t move the event because it’s an invitation.
case invalidSpan
The system encountered an invalid span during a save or deletion.
case calendarHasNoSource
You can’t save the calendar without setting a source first.
case calendarSourceCannotBeModified
You can’t move the calendar to another source.
case calendarIsImmutable
The calendar is immutable and you can’t modify or delete it.
case sourceDoesNotAllowCalendarAddDelete
The source doesn’t allow you to add or delete calendars.
case recurringReminderRequiresDueDate
The recurring reminder requires a due date.
case structuredLocationsNotSupported
The source to which this calendar belongs doesn’t support structured locations.
case reminderLocationsNotSupported
The source doesn’t support locations on reminders.
case alarmProximityNotSupported


## Page 8

The source doesn’t allow geofences on alarms.
case calendarDoesNotAllowEvents
The calendar doesn’t allow you to add events.
case calendarDoesNotAllowReminders
The calendar doesn’t allow you to add reminders.
case sourceDoesNotAllowReminders
The source doesn’t allow calendars supporting reminder entity types.
case sourceDoesNotAllowEvents
The source doesn’t allow calendars supporting event entity types.
case priorityIsInvalid
The priority number for the reminder is invalid.
case invalidEntityType
The entity type is invalid.
case procedureAlarmsNotMutable
You can’t create or modify procedure alarms.
case eventStoreNotAuthorized
The user hasn’t authorized your app to access events or reminders.
case osNotSupported
The action isn’t supported on the current operating system.
case invalidInviteReplyCalendar
The calendar is invalid or nil.
case notificationsCollectionFlagNotSet
The notification collection doesn’t have the notifications collection flag.
case sourceMismatch
The object’s source doesn’t match its container’s source.
case notificationCollectionMismatch
The notification collection that contains this notification doesn’t match the collection the
system is trying to save.
case notificationSavedWithoutCollection


## Page 9

The notification can’t save because you haven’t added it to a notification collection and save
the collection first.
case last
This error is for internal use.
case reminderAlarmContainsEmailOrUrl
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct EKError
An EventKit error.
let EKErrorDomain: String
A string that identifies the EventKit error domain.
Enumeration Cases
Initializers
Relationships
Conforms To
See Also
Errors


## Page 10

struct EKError
An EventKit error.
enum Code
Error codes for EventKit errors.
See Also
Errors
EventKit / EKErrorDomain
Global Variable
EKErrorDomain
A string that identifies the EventKit error domain.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


