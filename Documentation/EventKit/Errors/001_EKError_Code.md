# 001_EKError_Code.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


