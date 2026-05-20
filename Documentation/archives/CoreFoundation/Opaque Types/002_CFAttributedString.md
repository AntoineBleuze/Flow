# 002_CFAttributedString.pdf

## Page 1

Instances of CFAttributedString manage character strings and associated sets of attributes (for
example, font and kerning information) that apply to individual characters or ranges of characters
the string. CFAttributedString as defined in Core Foundation provides the basic container
functionality, while higher levels provide definitions for standard attributes, their values, and
additional behaviors involving these. CFAttributedString represents an immutable string—use
CFMutableAttributedString to create and manage an attributed string that can be changed
after it has been created.
CFAttributedString is not a “subclass” of CFString; that is, it does not respond to CFString functio
calls. CFAttributedString conceptually contains a CFString to which it applies attributes. This
protects you from ambiguities caused by the semantic differences between simple and attributed
string.
Attributes are identified by key/value pairs stored in CFDictionary objects. Keys must be CFString
objects, while the corresponding values are CFType objects of an appropriate type. See the
attribute constants in NSAttributedString Application Kit Additions Reference or NSAttributedStrin
UIKit Additions Reference for standard attribute names.
Important
Attribute dictionaries set for an attributed string must always be created with kCFCopy
StringDictionaryKeyCallBacks for their dictionary key callbacks and kCFType
DictionaryValueCallBacks for their value callbacks; otherwise it’s an error.
Overview
Core Foundation / CFAttributedString
Class
CFAttributedString
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

CFAttributedString is “toll-free bridged” with its Foundation counterpart, NSAttributedString
This means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSAttributedString *
parameter, you can pass in a CFAttributedStringRef, and in a function where you see a
CFAttributedStringRef parameter, you can pass in an NSAttributedString instance. Th
also applies to concrete subclasses of NSAttributedString. See Toll-Free Bridged Types for
more information on toll-free bridging.
func CFAttributedStringCreate(CFAllocator!, CFString!, CFDictionary!) -
CFAttributedString!
Creates an attributed string with specified string and attributes.
func CFAttributedStringCreateCopy(CFAllocator!, CFAttributedString!) ->
CFAttributedString!
Creates an immutable copy of an attributed string.
func CFAttributedStringCreateWithSubstring(CFAllocator!, CFAttributed
String!, CFRange) -> CFAttributedString!
Creates a sub-attributed string from the specified range.
func CFAttributedStringGetLength(CFAttributedString!) -> CFIndex
Returns the length of the attributed string in characters.
func CFAttributedStringGetString(CFAttributedString!) -> CFString!
Returns the string for an attributed string.
func CFAttributedStringGetAttribute(CFAttributedString!, CFIndex,
CFString!, UnsafeMutablePointer<CFRange>!) -> CFTypeRef!
Returns the value of a given attribute of an attributed string at a specified location.
func CFAttributedStringGetAttributes(CFAttributedString!, CFIndex,
UnsafeMutablePointer<CFRange>!) -> CFDictionary!
Returns the attributes of an attributed string at a specified location.
Topics
Creating a CFAttributedString
Accessing Attributes


## Page 3

func CFAttributedStringGetAttributeAndLongestEffectiveRange(CFAttribute
String!, CFIndex, CFString!, CFRange, UnsafeMutablePointer<CFRange>!) -
CFTypeRef!
Returns the value of a given attribute of an attributed string at a specified location.
func CFAttributedStringGetAttributesAndLongestEffectiveRange(
CFAttributedString!, CFIndex, CFRange, UnsafeMutablePointer<CFRange>!) 
> CFDictionary!
Returns the attributes of an attributed string at a specified location.
func CFAttributedStringGetTypeID() -> CFTypeID
Returns the type identifier for the CFAttributedString opaque type.
CFMutableAttributedString
Equatable, Hashable
Property List Programming Topics for Core Foundation
String Programming Guide for Core Foundation
Data Formatting Guide for Core Foundation
Getting Attributed String Properties
Relationships
Inherited By
Conforms To
See Also
Related Documentation
Opaque Types


## Page 4

class CFAllocator
class CFArray
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
class CFFileDescriptor


