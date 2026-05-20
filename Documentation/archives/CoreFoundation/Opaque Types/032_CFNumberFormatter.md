# 032_CFNumberFormatter.pdf

## Page 1

CFNumberFormatter objects format the textual representations of CFNumber objects, and conve
textual representations of numbers into CFNumber objects. The representation encompasses
integers, floats, and doubles; floats and doubles can be formatted to a specified decimal position
You specify how strings are formatted and parsed by setting a format string and other properties 
a CFNumberFormatter object.
The format of the format string is defined by Unicode Technical Standard #35; the version of the
standard used varies with release of the operating system, and is described in Introduction to Dat
Formatting Programming Guide For Cocoa.
Important
CFNumberFormatter is not thread-safe. Do not use a single instance from multiple threads.
Unlike some other Core Foundation opaque types with names similar to a corresponding Cocoa
Foundation class (such as CFString and NSString), CFNumberFormatter objects cannot be cast
(“toll-free bridged”) to NSNumberFormatter objects.
Overview
Topics
Creating a Number Formatter
Core Foundation / CFNumberFormatter
Class
CFNumberFormatter
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFNumberFormatterCreate(CFAllocator!, CFLocale!, CFNumberFormatter
Style) -> CFNumberFormatter!
Creates a new CFNumberFormatter object, localized to the given locale, which will format
numbers to the given style.
func CFNumberFormatterSetFormat(CFNumberFormatter!, CFString!)
Sets the format string of a number formatter.
func CFNumberFormatterSetProperty(CFNumberFormatter!, CFNumberFormatter
Key!, CFTypeRef!)
Sets a number formatter property using a key-value pair.
func CFNumberFormatterCreateNumberFromString(CFAllocator!, CFNumber
Formatter!, CFString!, UnsafeMutablePointer<CFRange>!, CFOptionFlags) -
CFNumber!
Returns a number object representing a given string.
func CFNumberFormatterCreateStringWithNumber(CFAllocator!, CFNumber
Formatter!, CFNumber!) -> CFString!
Returns a string representation of the given number using the specified number formatter.
func CFNumberFormatterCreateStringWithValue(CFAllocator!, CFNumber
Formatter!, CFNumberType, UnsafeRawPointer!) -> CFString!
Returns a string representation of the given number or value using the specified number
formatter.
func CFNumberFormatterGetDecimalInfoForCurrencyCode(CFString!, Unsafe
MutablePointer<Int32>!, UnsafeMutablePointer<Double>!) -> Bool
Returns the number of fraction digits that should be displayed, and the rounding increment,
for a given currency.
func CFNumberFormatterGetValueFromString(CFNumberFormatter!, CFString!,
UnsafeMutablePointer<CFRange>!, CFNumberType, UnsafeMutableRawPointer!)
-> Bool
Returns a number or value representing a given string.
Configuring a Number Formatter
Formatting Values
Examining a Number Formatter


## Page 3

func CFNumberFormatterCopyProperty(CFNumberFormatter!, CFNumberFormatte
Key!) -> CFTypeRef!
Returns a copy of a number formatter’s value for a given key.
func CFNumberFormatterGetFormat(CFNumberFormatter!) -> CFString!
Returns a format string for the given number formatter object.
func CFNumberFormatterGetLocale(CFNumberFormatter!) -> CFLocale!
Returns the locale object used to create the given number formatter object.
func CFNumberFormatterGetStyle(CFNumberFormatter!) -> CFNumberFormatter
Style
Returns the number style used to create the given number formatter object.
func CFNumberFormatterGetTypeID() -> CFTypeID
Returns the type identifier for the CFNumberFormatter opaque type.
enum CFNumberFormatterStyle
Type for constants specifying a formatter style.
struct CFNumberFormatterOptionFlags
Type for constants specifying how numbers should be parsed.
enum CFNumberFormatterPadPosition
Type for constants specifying how numbers should be padded.
Number Formatter Styles
Predefined number format styles.
Number Formatter Property Keys
The keys used in key-value pairs to specify the value of number formatter properties.
Number Format Options
These constants are used to specify how numbers should be parsed.
Getting the CFNumberFormatter Type ID
Data Types
Constants


## Page 4

enum CFNumberFormatterRoundingMode
These constants are used to specify how numbers should be rounded.
Padding Positions
These constants are used to specify how numbers should be padded.
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
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 5

class CFDate
class CFDateFormatter
class CFDictionary
class CFError


