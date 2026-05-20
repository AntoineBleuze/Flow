# 012_CFDateFormatter.pdf

## Page 1

CFDateFormatter objects format the textual representations of CFDate and CFAbsoluteTime
objects, and convert textual representations of dates and times into CFDate and CFAbsoluteTime
objects. You can express the representation of dates and times very flexibly, for example “Thu 22
Dec 1994” is just as acceptable as “12/22/94.” You specify how strings are formatted and parsed 
setting a format string and other properties of a CFDateFomatter object.
The format of the format string itself is defined by Unicode Technical Standard #35; the version o
the standard used varies with release of the operating system, and is described in Introduction to
Data Formatting Programming Guide For Cocoa.
Note
CFDateFormatter is not thread safe, so you must not mutate a given date formatter
simultaneously from multiple threads.
func CFDateFormatterCreate(CFAllocator!, CFLocale!, CFDateFormatterStyl
, CFDateFormatterStyle) -> CFDateFormatter!
Overview
Topics
Creating a Date Formatter
Core Foundation / CFDateFormatter
Class
CFDateFormatter
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Creates a new CFDateFormatter object, localized to the given locale, which will format dates
to the given date and time styles.
func CFDateFormatterSetFormat(CFDateFormatter!, CFString!)
Sets the format string of the given date formatter to the specified value.
func CFDateFormatterSetProperty(CFDateFormatter!, CFString!, CFTypeRef!
Sets a date formatter property using a key-value pair.
func CFDateFormatterCreateDateFromString(CFAllocator!, CFDateFormatter!
CFString!, UnsafeMutablePointer<CFRange>!) -> CFDate!
Returns a date object representing a given string.
func CFDateFormatterGetAbsoluteTimeFromString(CFDateFormatter!, CFStrin
!, UnsafeMutablePointer<CFRange>!, UnsafeMutablePointer<CFAbsoluteTime
>!) -> Bool
Returns an absolute time object representing a given string.
func CFDateFormatterCreateStringWithAbsoluteTime(CFAllocator!, CFDate
Formatter!, CFAbsoluteTime) -> CFString!
Returns a string representation of the given absolute time using the specified date formatter
func CFDateFormatterCreateStringWithDate(CFAllocator!, CFDateFormatter!
CFDate!) -> CFString!
Returns a string representation of the given date using the specified date formatter.
func CFDateFormatterCreateDateFormatFromTemplate(CFAllocator!, CFString
!, CFOptionFlags, CFLocale!) -> CFString!
Returns a localized date format string representing the given date format components
arranged appropriately for the specified locale.
func CFDateFormatterCopyProperty(CFDateFormatter!, CFDateFormatterKey!)
-> CFTypeRef!
Configuring a Date Formatter
Parsing Strings
Creating Strings From Data
Getting Information About a Date Formatter


## Page 3

Returns a copy of a date formatter’s value for a given key.
func CFDateFormatterGetDateStyle(CFDateFormatter!) -> CFDateFormatter
Style
Returns the date style used to create the given date formatter object.
func CFDateFormatterGetFormat(CFDateFormatter!) -> CFString!
Returns a format string for the given date formatter object.
func CFDateFormatterGetLocale(CFDateFormatter!) -> CFLocale!
Returns the locale object used to create the given date formatter object.
func CFDateFormatterGetTimeStyle(CFDateFormatter!) -> CFDateFormatter
Style
Returns the time style used to create the given date formatter object.
func CFDateFormatterGetTypeID() -> CFTypeID
Returns the type identifier for CFDateFormatter.
enum CFDateFormatterStyle
Data type for predefined date and time format styles.
Date Formatter Styles
Predefined date and time format styles.
Date Formatter Property Keys
Keys used in key-value pairs to discover and specify the value of date formatter properties—
used in conjunction with CFDateFormatterCopyProperty(_:_:) and CFDate
FormatterSetProperty(_:_:_:).
Calendar Names
Calendar names used by CFDateFormatter.
Getting the CFDateFormatter Type ID
Data Types
Constants


## Page 4

Equatable, Hashable
Data Formatting Guide for Core Foundation
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDictionary
class CFError
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 5

class CFFileDescriptor


