# 001_EKObject.pdf

## Page 1

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


## Page 2

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


## Page 3

class EKSource
An abstract superclass that represents the account a calendar belongs to.


