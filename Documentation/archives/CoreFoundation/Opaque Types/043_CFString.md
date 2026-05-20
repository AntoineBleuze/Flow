# 043_CFString.pdf

## Page 1

CFString provides a suite of efficient string-manipulation and string-conversion functions. It offer
seamless Unicode support and facilitates the sharing of data between Cocoa and C-based
programs. CFString objects are immutable—use CFMutableString to create and manage a
string that can be changed after it has been created.
CFString has two primitive functions, CFStringGetLength(_:) and CFStringGetCharacte
AtIndex(_:_:), that provide the basis for all other functions in its interface. The CFStringGe
Length function returns the total number (in terms of UTF-16 code pairs) of characters in the
string. The CFStringGetCharacterAtIndex function gives access to each character in the
string by index, with index values starting at 0.
CFString provides functions for finding and comparing strings. It also provides functions for readi
numeric values from strings, for combining strings in various ways, and for converting a string to
different forms (such as encoding and case changes). A number of functions, for example
CFStringFindWithOptions, allow you to specify a range over which to operate within a string
The specified range must not exceed the length of the string. Debugging options may help you to
catch any errors that arise if a range does exceed a string’s length.
Like other Core Foundation types, you can hash CFStrings using the CFHash(_:) function. You
should never, though, store a hash value outside of your application and expect it to be useful if y
read it back in later (hash values may change between different releases of the operating system)
CFString is “toll-free bridged” with its Cocoa Foundation counterpart, NSString. This means tha
the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSString * parameter, you can
pass in a CFStringRef, and in a function where you see a CFStringRef parameter, you can
Overview
Core Foundation / CFString
Class
CFString
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

pass in an NSString instance. This also applies to concrete subclasses of NSString. See Toll-Free
Bridged Types for more information on toll-free bridging.
func CFStringCreateArrayBySeparatingStrings(CFAllocator!, CFString!,
CFString!) -> CFArray!
Creates an array of CFString objects from a single CFString object.
func CFStringCreateByCombiningStrings(CFAllocator!, CFArray!, CFString!
-> CFString!
Creates a single string from the individual CFString objects that comprise the elements of an
array.
func CFStringCreateCopy(CFAllocator!, CFString!) -> CFString!
Creates an immutable copy of a string.
func CFStringCreateFromExternalRepresentation(CFAllocator!, CFData!,
CFStringEncoding) -> CFString!
Creates a string from its “external representation.”
func CFStringCreateWithBytes(CFAllocator!, UnsafePointer<UInt8>!,
CFIndex, CFStringEncoding, Bool) -> CFString!
Creates a string from a buffer containing characters in a specified encoding.
func CFStringCreateWithBytesNoCopy(CFAllocator!, UnsafePointer<UInt8>!,
CFIndex, CFStringEncoding, Bool, CFAllocator!) -> CFString!
Creates a string from a buffer, containing characters in a specified encoding, that might serv
as the backing store for the new string.
func CFStringCreateWithCharacters(CFAllocator!, UnsafePointer<UniChar>!
CFIndex) -> CFString!
Creates a string from a buffer of Unicode characters.
func CFStringCreateWithCharactersNoCopy(CFAllocator!, UnsafePointer<Uni
Char>!, CFIndex, CFAllocator!) -> CFString!
Creates a string from a buffer of Unicode characters that might serve as the backing store fo
the object.
Topics
Creating a CFString


## Page 3

func CFStringCreateWithCString(CFAllocator!, UnsafePointer<CChar>!,
CFStringEncoding) -> CFString!
Creates an immutable string from a C string.
func CFStringCreateWithCStringNoCopy(CFAllocator!, UnsafePointer<CChar
>!, CFStringEncoding, CFAllocator!) -> CFString!
Creates a CFString object from an external C string buffer that might serve as the backing
store for the object.
func CFStringCreateWithFormatAndArguments(CFAllocator!, CFDictionary!,
CFString!, CVaListPointer) -> CFString!
Creates an immutable string from a formatted string and a variable number of arguments
(specified in a parameter of type va_list).
func CFStringCreateWithPascalString(CFAllocator!, ConstStr255Param!,
CFStringEncoding) -> CFString!
Creates an immutable CFString object from a Pascal string.
func CFStringCreateWithPascalStringNoCopy(CFAllocator!, ConstStr255Para
!, CFStringEncoding, CFAllocator!) -> CFString!
Creates a CFString object from an external Pascal string buffer that might serve as the
backing store for the object.
func CFStringCreateWithSubstring(CFAllocator!, CFString!, CFRange) ->
CFString!
Creates an immutable string from a segment (substring) of an existing string.
func CFStringCreateArrayWithFindResults(CFAllocator!, CFString!,
CFString!, CFRange, CFStringCompareFlags) -> CFArray!
Searches a string for multiple occurrences of a substring and creates an array of ranges
identifying the locations of these substrings within the target string.
func CFStringFind(CFString!, CFString!, CFStringCompareFlags) -> CFRang
Searches for a substring within a string and, if it is found, yields the range of the substring
within the object’s characters.
func CFStringFindCharacterFromSet(CFString!, CFCharacterSet!, CFRange,
CFStringCompareFlags, UnsafeMutablePointer<CFRange>!) -> Bool
Query the range of the first character contained in the specified character set.
Searching Strings


## Page 4

func CFStringFindWithOptions(CFString!, CFString!, CFRange, CFString
CompareFlags, UnsafeMutablePointer<CFRange>!) -> Bool
Searches for a substring within a range of the characters represented by a string and, if the
substring is found, returns its range within the object’s characters.
func CFStringFindWithOptionsAndLocale(CFString!, CFString!, CFRange,
CFStringCompareFlags, CFLocale!, UnsafeMutablePointer<CFRange>!) -> Boo
Returns a Boolean value that indicates whether a given string was found in a given source
string.
func CFStringGetLineBounds(CFString!, CFRange, UnsafeMutablePointer<
CFIndex>!, UnsafeMutablePointer<CFIndex>!, UnsafeMutablePointer<CFIndex
>!)
Given a range of characters in a string, obtains the line bounds—that is, the indexes of the fir
character and the final characters of the lines containing the range.
func CFStringCompare(CFString!, CFString!, CFStringCompareFlags) ->
CFComparisonResult
Compares one string with another string.
func CFStringCompareWithOptions(CFString!, CFString!, CFRange, CFString
CompareFlags) -> CFComparisonResult
Compares a range of the characters in one string with that of another string.
func CFStringCompareWithOptionsAndLocale(CFString!, CFString!, CFRange,
CFStringCompareFlags, CFLocale!) -> CFComparisonResult
Compares a range of the characters in one string with another string using a given locale.
func CFStringHasPrefix(CFString!, CFString!) -> Bool
Determines if the character data of a string begin with a specified sequence of characters.
func CFStringHasSuffix(CFString!, CFString!) -> Bool
Determines if a string ends with a specified sequence of characters.
func CFStringCreateExternalRepresentation(CFAllocator!, CFString!,
CFStringEncoding, UInt8) -> CFData!
Creates an “external representation” of a CFString object, that is, a CFData object.
Comparing Strings
Accessing Characters


## Page 5

func CFStringGetBytes(CFString!, CFRange, CFStringEncoding, UInt8, Bool
UnsafeMutablePointer<UInt8>!, CFIndex, UnsafeMutablePointer<CFIndex>!) 
> CFIndex
Fetches a range of the characters from a string into a byte buffer after converting the
characters to a specified encoding.
func CFStringGetCharacterAtIndex(CFString!, CFIndex) -> UniChar
Returns the Unicode character at a specified location in a string.
func CFStringGetCharacters(CFString!, CFRange, UnsafeMutablePointer<Uni
Char>!)
Copies a range of the Unicode characters from a string to a user-provided buffer.
func CFStringGetCharactersPtr(CFString!) -> UnsafePointer<UniChar>!
Quickly obtains a pointer to the contents of a string as a buffer of Unicode characters.
func CFStringGetCharacterFromInlineBuffer(UnsafeMutablePointer<CFString
InlineBuffer>!, CFIndex) -> UniChar
Returns the Unicode character at a specific location in an in-line buffer.
func CFStringGetCString(CFString!, UnsafeMutablePointer<CChar>!, CFInde
, CFStringEncoding) -> Bool
Copies the character contents of a string to a local C string buffer after converting the
characters to a given encoding.
func CFStringGetCStringPtr(CFString!, CFStringEncoding) -> UnsafePointe
<CChar>!
Quickly obtains a pointer to a C-string buffer containing the characters of a string in a given
encoding.
func CFStringGetLength(CFString!) -> CFIndex
Returns the number (in terms of UTF-16 code pairs) of Unicode characters in a string.
func CFStringGetPascalString(CFString!, StringPtr!, CFIndex, CFString
Encoding) -> Bool
Copies the character contents of a CFString object to a local Pascal string buffer after
converting the characters to a requested encoding.
func CFStringGetPascalStringPtr(CFString!, CFStringEncoding) -> Const
StringPtr!
Quickly obtains a pointer to a Pascal buffer containing the characters of a string in a given
encoding.


## Page 6

func CFStringGetRangeOfComposedCharactersAtIndex(CFString!, CFIndex) ->
CFRange
Returns the range of the composed character sequence at a specified index.
func CFStringInitInlineBuffer(CFString!, UnsafeMutablePointer<CFString
InlineBuffer>!, CFRange)
Initializes an in-line buffer to use for efficient access of a CFString object’s characters.
func CFStringGetHyphenationLocationBeforeIndex(CFString!, CFIndex,
CFRange, CFOptionFlags, CFLocale!, UnsafeMutablePointer<UTF32Char>!) ->
CFIndex
Retrieve the first potential hyphenation location found before the specified location.
func CFStringIsHyphenationAvailableForLocale(CFLocale!) -> Bool
Returns a Boolean value that indicates whether hyphenation data is available.
func CFStringConvertEncodingToIANACharSetName(CFStringEncoding) ->
CFString!
Returns the name of the IANA registry “charset” that is the closest mapping to a specified
string encoding.
func CFStringConvertEncodingToNSStringEncoding(CFStringEncoding) -> UIn
Returns the Cocoa encoding constant that maps most closely to a given Core Foundation
encoding constant.
func CFStringConvertEncodingToWindowsCodepage(CFStringEncoding) ->
UInt32
Returns the Windows codepage identifier that maps most closely to a given Core Foundation
encoding constant.
func CFStringConvertIANACharSetNameToEncoding(CFString!) -> CFString
Encoding
Returns the Core Foundation encoding constant that is the closest mapping to a given IANA
registry “charset” name.
func CFStringConvertNSStringEncodingToEncoding(UInt) -> CFStringEncodin
Returns the Core Foundation encoding constant that is the closest mapping to a given Coco
encoding.
Working With Hyphenation
Working With Encodings


## Page 7

func CFStringConvertWindowsCodepageToEncoding(UInt32) -> CFString
Encoding
Returns the Core Foundation encoding constant that is the closest mapping to a given
Windows codepage identifier.
func CFStringGetFastestEncoding(CFString!) -> CFStringEncoding
Returns for a CFString object the character encoding that requires the least conversion time
func CFStringGetListOfAvailableEncodings() -> UnsafePointer<CFString
Encoding>!
Returns a pointer to a list of string encodings supported by the current system.
func CFStringGetMaximumSizeForEncoding(CFIndex, CFStringEncoding) ->
CFIndex
Returns the maximum number of bytes a string of a specified length (in Unicode characters)
will take up if encoded in a specified encoding.
func CFStringGetMostCompatibleMacStringEncoding(CFStringEncoding) ->
CFStringEncoding
Returns the most compatible Mac OS script value for the given input encoding.
func CFStringGetNameOfEncoding(CFStringEncoding) -> CFString!
Returns the canonical name of a specified string encoding.
func CFStringGetSmallestEncoding(CFString!) -> CFStringEncoding
Returns the smallest encoding on the current system for the character contents of a string.
func CFStringGetSystemEncoding() -> CFStringEncoding
Returns the default encoding used by the operating system when it creates strings.
func CFStringIsEncodingAvailable(CFStringEncoding) -> Bool
Determines whether a given Core Foundation string encoding is available on the current
system.
func CFStringGetDoubleValue(CFString!) -> Double
Returns the primary double value represented by a string.
func CFStringGetIntValue(CFString!) -> Int32
Returns the integer value represented by a string.
Getting Numeric Values


## Page 8

func CFShowStr(CFString!)
Prints the attributes of a string during debugging.
func CFStringGetTypeID() -> CFTypeID
Returns the type identifier for the CFString opaque type.
func CFStringCreateWithFileSystemRepresentation(CFAllocator!, Unsafe
Pointer<CChar>!) -> CFString!
Creates a CFString from a zero-terminated POSIX file system representation.
func CFStringGetFileSystemRepresentation(CFString!, UnsafeMutablePointe
<CChar>!, CFIndex) -> Bool
Extracts the contents of a string as a NULL-terminated 8-bit string appropriate for passing to
POSIX APIs.
func CFStringGetMaximumSizeOfFileSystemRepresentation(CFString!) ->
CFIndex
Determines the upper bound on the number of bytes required to hold the file system
representation of the string.
func CFStringGetParagraphBounds(CFString!, CFRange, UnsafeMutablePointe
<CFIndex>!, UnsafeMutablePointer<CFIndex>!, UnsafeMutablePointer<CFInde
>!)
Given a range of characters in a string, obtains the paragraph bounds—that is, the indexes o
the first character and the final characters of the paragraph(s) containing the range.
func CFStringGetLongCharacterForSurrogatePair(UniChar, UniChar) ->
UTF32Char
Returns a UTF-32 character that corresponds to a given pair of UTF-16 surrogate character
func CFStringGetSurrogatePairForLongCharacter(UTF32Char, UnsafeMutable
Pointer<UniChar>!) -> Bool
Getting String Properties
String File System Representations
Getting Paragraph Bounds
Managing Surrogates


## Page 9

Maps a given UTF-32 character to a pair of UTF-16 surrogate characters.
func CFStringIsSurrogateHighCharacter(UniChar) -> Bool
Returns a Boolean value that indicates whether a given character is a high character in a
surrogate pair.
func CFStringIsSurrogateLowCharacter(UniChar) -> Bool
Returns a Boolean value that indicates whether a given character is a low character in a
surrogate pair.
typealias CFStringEncoding
An integer type for constants used to specify supported string encodings in various CFString
functions.
enum CFStringEncodings
Index type for constants used to specify external string encodings.
struct CFStringCompareFlags
A CFOptionFlags type for specifying options for string comparison .
struct CFStringInlineBuffer
Defines the buffer and related fields used for in-line buffer access of characters in CFString
objects.
String Comparison Flags
Flags that specify how string comparisons are performed.
enum CFStringBuiltInEncodings
Encodings that are built-in on all platforms on which macOS runs.
Invalid String Encoding Flag
Special value returned from functions to indicate a string encoding that is not supported or
recognized by CFString.
External String Encodings
CFStringEncoding constants for encodings that may be supported by CFString.
Data Types
Constants


## Page 10

CFMutableString
Equatable, Hashable
Property List Programming Topics for Core Foundation
Data Formatting Guide for Core Foundation
String Programming Guide for Core Foundation
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
Inherited By
Conforms To
See Also
Related Documentation
Opaque Types


## Page 11

class CFDate
class CFDateFormatter
class CFDictionary
class CFError


