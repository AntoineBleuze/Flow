# 031_CFNumber.pdf

## Page 1

CFNumber encapsulates C scalar (numeric) types. It provides functions for setting and accessing
the value as any basic C type. It also provides a compare function to determine the ordering of tw
CFNumber objects. CFNumber objects are used to wrap numerical values for use in Core
Foundation property lists and collections.
CFNumber objects are not intended as a replacement for C scalar values and should not be used 
APIs or implementations where scalar values are more appropriate and efficient.
Note
In order to improve performance, some commonly-used numbers (such as 0 and 1) are
uniqued. You should not expect that allocating multiple CFNumber instances will necessarily
result in distinct objects.
CFNumber is “toll-free bridged” with its Cocoa Foundation counterpart, NSNumber. This means
that the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSNumber * parameter, you can
pass in a CFNumberRef, and in a function where you see a CFNumberRef parameter, you can
pass in an NSNumber instance. This fact also applies to concrete subclasses of NSNumber. See
Toll-Free Bridged Types for more information on toll-free bridging.
Overview
Topics
Core Foundation / CFNumber
Class
CFNumber
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFNumberCreate(CFAllocator!, CFNumberType, UnsafeRawPointer!) ->
CFNumber!
Creates a CFNumber object using a specified value.
func CFNumberGetByteSize(CFNumber!) -> CFIndex
Returns the number of bytes used by a CFNumber object to store its value.
func CFNumberGetType(CFNumber!) -> CFNumberType
Returns the type used by a CFNumber object to store its value.
func CFNumberGetValue(CFNumber!, CFNumberType, UnsafeMutableRawPointer!
-> Bool
Obtains the value of a CFNumber object cast to a specified type.
func CFNumberIsFloatType(CFNumber!) -> Bool
Determines whether a CFNumber object contains a value stored as one of the defined floatin
point types.
func CFNumberCompare(CFNumber!, CFNumber!, UnsafeMutableRawPointer!) ->
CFComparisonResult
Compares two CFNumber objects and returns a comparison result.
func CFNumberGetTypeID() -> CFTypeID
Returns the type identifier for the CFNumber opaque type.
enum CFNumberType
Flags used by CFNumber to indicate the data type of a value.
Predefined Values
Creating a Number
Getting Information About Numbers
Comparing Numbers
Getting the CFNumber Type ID
Constants


## Page 3

CFNumber provides some predefined number values.
Equatable, Hashable
Property List Programming Topics for Core Foundation
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
class CFDateFormatter
class CFDictionary
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 4

class CFError


