# Action Sets.pdf

## Page 1

Action sets can be executed as a result of evaluating a trigger (instances of HMTrigger) or
manually with executeActionSet(_:completionHandler:). Actions in an action set are
performed in an unspecified order. You create new action sets using the addActionSet(with
Name:completionHandler:) method of HMHome.
var uniqueIdentifier: UUID
The action set’s unique identifier.
var name: String
The name of the action set.
func updateName(String, completionHandler: ((any Error)?) -> Void)
Updates the name of the action set.
Overview
Topics
Identifiying an action set
Specifying a type
HomeKit / HMActionSet
Class
HMActionSet
A collection of actions that you trigger as a group.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

var actionSetType: String
The type of the action set, such as built-in or user-defined.
Action Set Types
The types of action sets that you can define.
var actions: Set<HMAction>
Set of actions in the action set.
func addAction(HMAction, completionHandler: ((any Error)?) -> Void)
Adds an action to the action set.
func removeAction(HMAction, completionHandler: ((any Error)?) -> Void)
Removes an action from the action set.
class HMCharacteristicWriteAction
An action in an action set that writes a value to a characteristic.
class HMAction
An abstract base class for actions in HomeKit.
var isExecuting: Bool
The execution status of the action set.
var lastExecutionDate: Date?
The last execution date of the action set.
NSObject
Defining the associated actions
Keeping track of execution
Relationships
Inherits From
Conforms To


## Page 3

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class HMTimerTrigger
A trigger to activate an action set based on a periodic timer.
class HMEventTrigger
A trigger to activate an action set based on a set of events and optional conditions.
See Also
Action Sets


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

Use an HMEventTrigger object to trigger the execution of a scene when a combination of
characteristic or location events and conditions occur. To create an event trigger, first create one 
more event objects that fire an event when the specified trigger values are met. For example, you
might create an HMCharacteristicEvent that fires when the front door is open. Then, you ca
use HMEventTrigger convenience methods to create optional predicates that specify condition
that must be met before a scene is executed. For example, you might create a condition that
ensures the scene is executed only after sunset.
init(name: String, events: [HMEvent], predicate: NSPredicate?)
Creates a new event trigger with the specified name, events, and predicate.
init(name: String, events: [HMEvent], end: [HMEvent]?, recurrences: [
DateComponents]?, predicate: NSPredicate?)
Creates a new event trigger with the specified name, events, end events, recurrences, and
predicate.
Overview
Topics
Creating an event trigger
HomeKit / HMEventTrigger
Class
HMEventTrigger
A trigger to activate an action set based on a set of events and optional condition
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 9.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 8

var triggerActivationState: HMEventTriggerActivationState
The current activation state of the trigger.
enum HMEventTriggerActivationState
The activation state of an event trigger.
var events: [HMEvent]
The events that activate the trigger.
func updateEvents([HMEvent], completionHandler: ((any Error)?) -> Void)
Updates the set of trigger events.
Location events
Events that represent the user’s movement among regions.
Time events
Events based on time, significant occurrences, and time durations.
Characteristic events
Events based on the capabilities or characteristics of accessories.
Presence events
Events based on the user’s presence in a home.
class HMEvent
The abstract base class for a HomeKit event.
var endEvents: [HMEvent]
The events associated with the end of scene represented by this trigger.
func updateEndEvents([HMEvent], completionHandler: ((any Error)?) ->
Void)
Updates the set of end events associated with the event trigger.
Querying trigger activation state
Setting trigger events
Restoring the previous scene after an event


## Page 9

var recurrences: [DateComponents]?
Specifies the days on which the trigger can execute.
func updateRecurrences([DateComponents]?, completionHandler: ((any Erro
)?) -> Void)
Updates the days of the week the trigger can repeat.
var executeOnce: Bool
A Boolean that can execute the trigger many times.
func updateExecuteOnce(Bool, completionHandler: ((any Error)?) -> Void)
Updates the repetition status of the event trigger.
var predicate: NSPredicate?
The predicate to evaluate before executing the scene associated with the event trigger.
func updatePredicate(NSPredicate?, completionHandler: ((any Error)?) ->
Void)
Replaces the predicate used to evaluate execution of the scene associated with the event
trigger.
class func predicateForEvaluatingTriggerOccurring(beforeSignificantEven
: HMSignificantTimeEvent) -> NSPredicate
Creates a predicate that evaluates whether the event occurred before a significant event.
class func predicateForEvaluatingTriggerOccurring(afterSignificantEvent
HMSignificantTimeEvent) -> NSPredicate
Creates a predicate that evaluates whether the event occurred after a significant event.
class func predicate(forEvaluatingTriggerOccurringBetweenSignificant
Event: HMSignificantTimeEvent, secondSignificantEvent: HMSignificantTim
Event) -> NSPredicate
Creates a predicate that evaluates whether the event occurred between two significant
events.
Controlling recurrence
Adding a trigger condition
Creating predicates


## Page 10

class func predicateForEvaluatingTrigger(occurringBefore: DateComponent
) -> NSPredicate
Creates a predicate that evaluates whether the event occurred before the specified time.
class func predicateForEvaluatingTrigger(occurringOn: DateComponents) -
NSPredicate
Creates a predicate that evaluates whether the event occurred at the specified time.
class func predicateForEvaluatingTrigger(occurringAfter: DateComponents
-> NSPredicate
Creates a predicate that evaluates whether the event occurred at or after the specified time.
class func predicateForEvaluatingTriggerOccurringBetweenDate(with: Date
Components, secondDateWith: DateComponents) -> NSPredicate
Creates a predicate that evaluates whether the event occurred between the specified times.
class func predicateForEvaluatingTrigger(HMCharacteristic, relatedBy:
NSComparisonPredicate.Operator, toValue: Any) -> NSPredicate
Creates a predicate that evaluates whether a characteristic value relates to the specified
value.
class func predicateForEvaluatingTrigger(withPresence: HMPresenceEvent)
-> NSPredicate
Creates a predicate that evaluates the current user presence against that specified in the
presence event.
let HMCharacteristicKeyPath: String
Specifies the key path for a characteristic in a predicate.
let HMCharacteristicValueKeyPath: String
Specifies the key path for a characteristic value in a predicate.
let HMPresenceKeyPath: String
Specifies the key path for a presence event in a predicate.
func addEvent(HMEvent, completionHandler: ((any Error)?) -> Void)
Adds a new event to the event trigger.
Deprecated
func removeEvent(HMEvent, completionHandler: ((any Error)?) -> Void)
Removes the specified event from the event trigger.
Deprecated symbols


## Page 11

Deprecated
class func predicateForEvaluatingTrigger(occurringBefore: String,
applyingOffset: DateComponents?) -> NSPredicate
Creates a predicate that evaluates whether the event occurred before a significant event.
Deprecated
class func predicateForEvaluatingTrigger(occurringAfter: String,
applyingOffset: DateComponents?) -> NSPredicate
Creates a predicate that evaluates whether the event occurred before a significant event.
Deprecated
HMTrigger
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class HMActionSet
A collection of actions that you trigger as a group.
class HMTimerTrigger
Relationships
Inherits From
Conforms To
See Also
Action Sets


## Page 12

A trigger to activate an action set based on a periodic timer.


