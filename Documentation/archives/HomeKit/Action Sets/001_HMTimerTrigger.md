# 001_HMTimerTrigger.pdf

## Page 1

When a timer trigger is enabled using enable(_:completionHandler:), the system checks 
verify that the timer trigger’s fire date, time zone, and recurrence rules yield a next fire date that i
in the future.
init(name: String, fireDate: Date, recurrence: DateComponents?)
var fireDate: Date
The time at which the trigger will next fire.
func updateFireDate(Date, completionHandler: ((any Error)?) -> Void)
Updates the next fire date for the trigger.
Overview
Topics
Creating a timer trigger
Choosing the fire date
Using recurrence
HomeKit / HMTimerTrigger
Class
HMTimerTrigger
A trigger to activate an action set based on a periodic timer.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

var recurrence: DateComponents?
The interval on which to repeat firing the trigger.
func updateRecurrence(DateComponents?, completionHandler: ((any Error)?
-> Void)
Updates the recurrence interval.
init(name: String, fireDate: Date, timeZone: TimeZone?, recurrence: Dat
Components?, recurrenceCalendar: Calendar?)
Initializes a timer trigger with specified timing information.
Deprecated
var timeZone: TimeZone?
The timezone in which to evaluate the fire time.
Deprecated
func updateTimeZone(TimeZone?, completionHandler: ((any Error)?) -> Voi
)
Updates the trigger’s time zone.
Deprecated
var recurrenceCalendar: Calendar?
The calendar in which the recurrence value is evaluated.
Deprecated
HMTrigger
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Deprecated symbols
Relationships
Inherits From
Conforms To


## Page 3

Hashable
NSObjectProtocol
Sendable
SendableMetatype
class HMActionSet
A collection of actions that you trigger as a group.
class HMEventTrigger
A trigger to activate an action set based on a set of events and optional conditions.
See Also
Action Sets


