# 008_CFCalendar.pdf

## Page 1

The CFCalendar opaque type represents a calendar system. The associated API provides
information about a calendar and supports calendrical computations such as determining the ran
of a given calendrical unit and adding units to a given absolute time.
CFAbsoluteTime is the operational lingua franca of CFCalendar—to do calendar arithmetic, you
start and end with an absolute time; to convert between a decomposed date in one calendar and
another calendar, you first convert to an absolute time. CFAbsoluteTime provides the absolute
scale and epoch for dates and times, which can then be rendered into a particular calendar, for
calendrical computations or user display.
In a calendar, day, week, weekday, month, and year numbers are generally 1-based, but there may
be calendar-specific exceptions. Ordinal numbers, where they occur, are 1-based. Some calendar
represented by this API may have to map their basic unit concepts into year/month/week/day/…
nomenclature. For example, a calendar composed of 4 quarters in a year instead of 12 months us
the “month” unit to represent quarters. The particular values of the unit are defined by each
calendar, and are not necessarily “consistent with” or have a “correspondence with,” values for th
unit in another calendar. Several CFCalendar functions (CFCalendarComposeAbsoluteTime,
CFCalendarDecomposeAbsoluteTime, CFCalendarAddComponents, and CFCalendarGe
ComponentDifference) take a description string that describes the calendrical components
provided in a varargs parameter area. You can provide as many components as you need (or
choose to), in whatever order you choose. When there is incomplete information to compute an
absolute time, default values similar to 0 and 1 are usually chosen by a calendar, but this is a
calendar-specific choice. If you provide inconsistent information, calendar-specific disambiguatio
is performed (which may involve ignoring one or more of the parameters). The characters of the
description string specify the units and order of the parameters which follow. The characters are
Overview
Core Foundation / CFCalendar
Class
CFCalendar
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

adopted from the corresponding format characters used by CFDateFormatter when possible, as
shown in below.
Symbol
Meaning
Value Type
y
year
int
M
month
int
d
day
int
H
hour
int
m
minute
int
s
second
int
Information related to formatting dates and times and name-related calendar information is
managed by CFDateFormatter.
CFCalendar is subject to some limitations. There is no leap second handling—the existence of lea
seconds is ignored as in the other CoreFoundation API. In general, historical accuracy of calendar
is not guaranteed. There is currently no API for defining your own calendars.
CFCalendar is “toll-free bridged” with its Cocoa Foundation counterpart, NSCalendar. This means
that the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSCalendar * parameter, you can
pass in a CFCalendarRef, and in a function where you see a CFCalendarRef parameter, you
can pass in an NSCalendar instance. See Toll-Free Bridged Types for more information on toll-fre
bridging.
func CFCalendarCopyCurrent() -> CFCalendar!
Returns a copy of the logical calendar for the current user.
func CFCalendarCreateWithIdentifier(CFAllocator!, CFCalendarIdentifier!
-> CFCalendar!
Returns a calendar object for the calendar identified by a calendar identifier.
Topics
Creating a Calendar


## Page 3

func CFCalendarGetRangeOfUnit(CFCalendar!, CFCalendarUnit, CFCalendar
Unit, CFAbsoluteTime) -> CFRange
Returns the range of values that one unit can take on within a larger unit during which a
specific absolute time occurs.
func CFCalendarGetOrdinalityOfUnit(CFCalendar!, CFCalendarUnit,
CFCalendarUnit, CFAbsoluteTime) -> CFIndex
Returns the ordinal number of a calendrical unit within a larger unit at a specified absolute
time.
func CFCalendarGetTimeRangeOfUnit(CFCalendar!, CFCalendarUnit,
CFAbsoluteTime, UnsafeMutablePointer<CFAbsoluteTime>!, UnsafeMutable
Pointer<CFTimeInterval>!) -> Bool
Returns by reference the start time and duration of a given calendar unit that contains a give
absolute time.
func CFCalendarGetMaximumRangeOfUnit(CFCalendar!, CFCalendarUnit) ->
CFRange
Returns the maximum range limits of the values that a specified unit can take on in a given
calendar.
func CFCalendarGetMinimumRangeOfUnit(CFCalendar!, CFCalendarUnit) ->
CFRange
Returns the minimum range limits of the values that a specified unit can take on in a given
calendar.
func CFCalendarCopyTimeZone(CFCalendar!) -> CFTimeZone!
Returns a time zone object for a specified calendar.
func CFCalendarSetTimeZone(CFCalendar!, CFTimeZone!)
Sets the time zone for a calendar.
func CFCalendarGetIdentifier(CFCalendar!) -> CFCalendarIdentifier!
Returns the given calendar’s identifier.
Getting Ranges of Units
Getting and Setting the Time Zone
Getting the Identifier


## Page 4

func CFCalendarCopyLocale(CFCalendar!) -> CFLocale!
Returns a locale object for a specified calendar.
func CFCalendarSetLocale(CFCalendar!, CFLocale!)
Sets the locale for a calendar.
func CFCalendarGetFirstWeekday(CFCalendar!) -> CFIndex
Returns the index of first weekday for a specified calendar.
func CFCalendarSetFirstWeekday(CFCalendar!, CFIndex)
Sets the first weekday for a calendar.
func CFCalendarGetMinimumDaysInFirstWeek(CFCalendar!) -> CFIndex
Returns the minimum number of days in the first week of a specified calendar.
func CFCalendarSetMinimumDaysInFirstWeek(CFCalendar!, CFIndex)
Sets the minimum number of days in the first week of a specified calendar.
func CFCalendarGetTypeID() -> CFTypeID
Returns the type identifier for the CFCalendar opaque type.
struct CFCalendarUnit
CFCalendarUnit constants are used to specify calendrical units, such as day or month, in
various calendar calculations.
Component Wrapping Options
The wrapping option specifies overflow behavior for calendar components in calendrical
calculations
Getting and Setting the Locale
Getting and Setting Day Information
Getting the Type ID
Constants


## Page 5

Equatable, Hashable
Date and Time Programming Guide for Core Foundation
Internationalization and Localization Guide
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 6

class CFFileDescriptor


