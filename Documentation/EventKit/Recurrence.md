# Recurrence.pdf

## Page 1

Recurring events repeat over a specified interval of time. To make an event recurring, assign it a
recurrence rule that describes when the event occurs. Recurrence rules are represented by
instances of the EKRecurrenceRule class.
Recurrence is applicable to both calendar events and reminders. Unlike with recurring events, onl
the first incomplete reminder of a recurring set is obtainable. This is true with EventKit as well as
the Reminders app. When the reminder is completed, the next reminder in the recurrence set
becomes available.
You can create a recurrence rule with a simple daily, weekly, monthly, or yearly pattern using
the init(recurrenceWith:interval:end:) method. You provide three values to this
method:
The recurrence frequency. This is a value of type EKRecurrenceFrequency that indicates
whether the recurrence rule is daily, weekly, monthly, or yearly.
The recurrence interval. This is an integer greater than 0 that specifies how often a pattern
repeats. For example, if the recurrence rule is a weekly recurrence rule and its interval is 1, the
the pattern repeats every week. If the recurrence rule is a monthly recurrence rule and its
interval is 3, then the pattern repeats every three months.
The recurrence end. This optional parameter is an instance of the EKRecurrenceEnd class,
which indicates when the recurrence rule ends. The recurrence end can be based on a specific
end date or on an amount of occurrences. If you don’t want to specify an end for the recurrenc
rule, pass nil.
Overview
Create a Basic Rule
EventKit / Creating a recurring event
Article
Creating a recurring event
Set up an event or reminder that repeats.


## Page 2

You can create a recurrence rule with a complex pattern using the init(recurrenceWith:
interval:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:
daysOfTheYear:setPositions:end:) method. As for a basic recurrence rule, you provide a
frequency, interval, and optional end for the recurring event. In addition, you can provide a
combination of optional values describing a custom rule, as listed in the table below.
Parameter
name
Accepted values
Can be com‐
bined with
Example
days
An array of
EKRecurrenceDayOf
Week objects.
All
recurrence
rules except
for daily
recurrence
rules.
An array containing EKTuesday
and EKFriday objects will create a
recurrence that occurs every
Tuesday and Friday.
monthDays
An array of nonzero
NSNumber objects
ranging from –31 to 31.
Negative values indicate
counting backward from
the end of the month.
Monthly
recurrence
rules only.
An array containing the values 1
and –1 will create a recurrence tha
occurs on the first and last day of
every month.
months
An array of NSNumber
objects with values
ranging from 1 to 12,
corresponding to
Gregorian calendar
months.
Yearly
recurrence
rules only.
If your originating event occurs on
January 10, you can provide an
array containing the values 1 and 2
to create a recurrence that occurs
every January 10 and February 10.
weeksOf
TheYear
An array of nonzero
NSNumber objects
ranging from –53 to 53.
Negative values indicate
counting backward from
the end of the year.
Yearly
recurrence
rules only.
If your originating event occurs on 
Wednesday, you can provide an
array containing the values 1 and –
1 to create a recurrence that
occurs on the Wednesday of the
first and last weeks of every year. If
a specified week does not contain 
Wednesday in the current year, as
can be the case for the first or last
week of a year, the event does not
occur.
Create a Complex Rule


## Page 3

Parameter
name
Accepted values
Can be com‐
bined with
Example
daysOfThe
Year
An array of nonzero
NSNumber objects
ranging from –366 to
366. Negative values
indicate counting
backward from the end of
the year.
Yearly
recurrence
rules only.
You can provide an array containing
the values 1 and –1 to create a
recurrence that occurs on the first
and last day of every year.
set
Positions
An array of nonzero
NSNumber objects
ranging from –366 to
366. Negative values
indicate counting
backward from the end of
the list of occurrences.
All
recurrence
rules except
for daily
recurrence
rules.
If you provide an array containing
the values 1 and –1 to a yearly
recurrence rule that has specified
Monday through Friday as its value
for days of the week, the
recurrence occurs only on the first
and last weekday of every year.
You can provide values for any number of the parameters in the table. Parameters that don’t apply
to a particular recurrence rule are ignored. If you provide a value for more than one of the
parameters, the recurrence occurs only on days that apply to all provided values.
Once you have created a recurrence rule, you can apply it to a calendar event or reminder with
the addRecurrenceRule(_:) method of EKCalendarItem.
class EKRecurrenceDayOfWeek
A class that represents the day of the week.
class EKRecurrenceEnd
A class that defines the end of a recurrence rule.
class EKRecurrenceRule
A class that describes the pattern for a recurring event.
See Also
Recurrence


## Page 4

Creating a recurring event
The EKRecurrenceDayOfWeek class represents a day of the week for use with an
EKRecurrenceRule object.
A day of the week can optionally have a week number, indicating a specific day in the recurrence
rule’s frequency. For example, a day of the week with a day value of Tuesday and a week number 
2 would represent the second Tuesday of every month in a monthly recurrence rule, and the
second Tuesday of every year in a yearly recurrence rule. A day of the week with a week number o
0 ignores its week number.
enum EKWeekday
The day of the week.
Mentioned in
Overview
Topics
Creating a Day of the Week
EventKit / EKRecurrenceDayOfWeek
Class
EKRecurrenceDayOfWeek
A class that represents the day of the week.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 5

convenience init(EKWeekday)
Creates and returns a day of the week with a given day.
convenience init(EKWeekday, weekNumber: Int)
Creates and returns an autoreleased day of the week with a given day and week number.
init(dayOfTheWeek: EKWeekday, weekNumber: Int)
Initializes and returns a day of the week with a given day and week number.
var dayOfTheWeek: EKWeekday
The day of the week.
var weekNumber: Int
The week number of the day of the week.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Accessing Properties of a Day of the Week
Relationships
Inherits From
Conforms To
See Also


## Page 6

Creating a recurring event
Set up an event or reminder that repeats.
class EKRecurrenceEnd
A class that defines the end of a recurrence rule.
class EKRecurrenceRule
A class that describes the pattern for a recurring event.
Recurrence


## Page 7

Creating a recurring event
The EKRecurrenceEnd class defines the end of a recurrence rule defined by an EKRecurrenc
Rule object. The recurrence end can be specified by a date (date-based) or by a maximum coun
of occurrences (count-based). An event that is intended to continue indefinitely should have its
EKRecurrenceEnd set to nil.
convenience init(end: Date)
Initializes and returns a date-based recurrence end with a given end date.
convenience init(occurrenceCount: Int)
Initializes and returns a count-based recurrence end with a given maximum occurrence coun
Mentioned in
Overview
Topics
Creating a Recurrence End
EventKit / EKRecurrenceEnd
Class
EKRecurrenceEnd
A class that defines the end of a recurrence rule.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.8+
visionOS 1.0+
watchOS 2.0+


## Page 8

var endDate: Date?
The end date of the recurrence end, or nil if the recurrence end is count-based.
var occurrenceCount: Int
The occurrence count of the recurrence end, or 0 if the recurrence end is date-based.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Creating a recurring event
Set up an event or reminder that repeats.
class EKRecurrenceDayOfWeek
A class that represents the day of the week.
Accessing Recurrence End Properties
Relationships
Inherits From
Conforms To
See Also
Recurrence


## Page 9

class EKRecurrenceRule
A class that describes the pattern for a recurring event.


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

Creating a recurring event
Set up an event or reminder that repeats.
class EKRecurrenceDayOfWeek
A class that represents the day of the week.
class EKRecurrenceEnd
A class that defines the end of a recurrence rule.
Recurrence


