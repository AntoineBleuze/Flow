# 003_EKRecurrenceRule.pdf

## Page 1

Creating a recurring event
After you create a recurrence rule, assign it to an event with the method of EKEvent.
Recurrence rules can have an end, represented by an EKRecurrenceEnd object. The end can b
based on a specific date or a maximum number of occurrences.
Note
It is currently not possible to directly modify an EKRecurrenceRule or any of its properties.
This functionality is achieved by creating a new EKRecurrenceRule and setting an event or
reminder to use the newly created rule.
Mentioned in
Overview
Topics
Creating a Basic Recurrence Rule
EventKit / EKRecurrenceRule
Class
EKRecurrenceRule
A class that describes the pattern for a recurring event.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 2

enum EKSpan
An object that indicates whether modifications should apply to a single event or all future
events of a recurring event.
init(recurrenceWith: EKRecurrenceFrequency, interval: Int, end:
EKRecurrenceEnd?)
Initializes and returns a simple recurrence rule with a given frequency, interval, and end.
init(recurrenceWith: EKRecurrenceFrequency, interval: Int, daysOfTheWee
: [EKRecurrenceDayOfWeek]?, daysOfTheMonth: [NSNumber]?, monthsOfTheYea
: [NSNumber]?, weeksOfTheYear: [NSNumber]?, daysOfTheYear: [NSNumber]?,
setPositions: [NSNumber]?, end: EKRecurrenceEnd?)
Initializes and returns a recurrence rule with a given frequency and additional scheduling
information.
enum EKRecurrenceFrequency
The frequency for recurrence rules.
var calendarIdentifier: String
The identifier for the recurrence rule’s calendar.
var recurrenceEnd: EKRecurrenceEnd?
Indicates when the recurrence rule ends.
var frequency: EKRecurrenceFrequency
The frequency of the recurrence rule.
var interval: Int
Specifies how often the recurrence rule repeats over the unit of time indicated by its
frequency.
var firstDayOfTheWeek: Int
Indicates which day of the week the recurrence rule treats as the first day of the week.
var daysOfTheWeek: [EKRecurrenceDayOfWeek]?
The days of the week associated with the recurrence rule, as an array of EKRecurrenceDa
OfWeek objects.
Creating a Complex Recurrence Rule
Accessing Recurrence Rule Properties


## Page 3

var daysOfTheMonth: [NSNumber]?
The days of the month associated with the recurrence rule, as an array of NSNumber objects
var daysOfTheYear: [NSNumber]?
The days of the year associated with the recurrence rule, as an array of NSNumber objects.
var weeksOfTheYear: [NSNumber]?
The weeks of the year associated with the recurrence rule, as an array of NSNumber objects
var monthsOfTheYear: [NSNumber]?
The months of the year associated with the recurrence rule, as an array of NSNumber object
var setPositions: [NSNumber]?
An array of ordinal numbers that filters which recurrences to include in the recurrence rule’s
frequency.
func EK_LOSE_FRACTIONAL_SECONDS_DO_NOT_USE()
A deprecated function.
Deprecated
EKObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Relationships
Inherits From
Conforms To
See Also


## Page 4

Creating a recurring event
Set up an event or reminder that repeats.
class EKRecurrenceDayOfWeek
A class that represents the day of the week.
class EKRecurrenceEnd
A class that defines the end of a recurrence rule.
Recurrence


