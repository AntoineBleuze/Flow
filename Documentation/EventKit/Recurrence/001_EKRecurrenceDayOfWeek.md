# 001_EKRecurrenceDayOfWeek.pdf

## Page 1

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


## Page 2

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


## Page 3

Creating a recurring event
Set up an event or reminder that repeats.
class EKRecurrenceEnd
A class that defines the end of a recurrence rule.
class EKRecurrenceRule
A class that describes the pattern for a recurring event.
Recurrence


