# 002_EKSource.pdf

## Page 1

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


## Page 2

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


## Page 3

class EKCalendarItem
An abstract superclass for calendar events and reminders.
class EKObject
An abstract superclass for all EventKit classes that have persistent instances.
Common objects


