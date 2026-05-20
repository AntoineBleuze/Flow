# 025_CFMutableData.pdf

## Page 1

CFMutableData manages dynamic binary data. The basic interface for managing binary data is
provided by CFData. CFMutableData adds functions to modify the contents of a binary data
object.
You create a mutable data object using either the CFDataCreateMutable(_:_:) or CFData
CreateMutableCopy(_:_:_:) function.
Bytes are added to a data object with the CFDataAppendBytes(_:_:_:) function. Bytes are
removed from a data object with the CFDataDeleteBytes(_:_:) function.
Important
Many of the CFMutableData functions take a CFIndex length or capacity argument. You
must not pass a negative number for such values—this may introduce a security risk.
CFMutableData is “toll-free bridged” with its Cocoa Foundation counterpart, NSMutableData.
What this means is that the Core Foundation type is interchangeable in function or method calls
with the bridged Foundation object. In other words, in a method where you see an NSMutable
Data * parameter, you can pass in a CFMutableDataRef, and in a function where you see a
CFMutableDataRef parameter, you can pass in an NSMutableData instance. This also applies
to concrete subclasses of NSMutableData. See Toll-Free Bridged Types for more information on
toll-free bridging.
Overview
Core Foundation / CFMutableData
Class
CFMutableData
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFDataCreateMutable(CFAllocator!, CFIndex) -> CFMutableData!
Creates an empty CFMutableData object.
func CFDataCreateMutableCopy(CFAllocator!, CFIndex, CFData!) ->
CFMutableData!
Creates a CFMutableData object by copying another CFData object.
func CFDataGetMutableBytePtr(CFMutableData!) -> UnsafeMutablePointer<
UInt8>!
Returns a pointer to a mutable byte buffer of a CFMutableData object.
func CFDataAppendBytes(CFMutableData!, UnsafePointer<UInt8>!, CFIndex)
Appends the bytes from a byte buffer to the contents of a CFData object.
func CFDataDeleteBytes(CFMutableData!, CFRange)
Deletes the bytes in a CFMutableData object within a specified range.
func CFDataReplaceBytes(CFMutableData!, CFRange, UnsafePointer<UInt8>!,
CFIndex)
Replaces those bytes in a CFMutableData object that fall within a specified range with other
bytes.
func CFDataIncreaseLength(CFMutableData!, CFIndex)
Increases the length of a CFMutableData object’s internal byte buffer, zero-filling the
extension to the buffer.
func CFDataSetLength(CFMutableData!, CFIndex)
Resets the length of a CFMutableData object’s internal byte buffer.
Topics
Creating a Mutable Data Object
Accessing Data
Modifying a Mutable Data Object


## Page 3

CFData
Equatable, Hashable
Property List Programming Topics for Core Foundation
Binary Data Programming Guide for Core Foundation
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
Relationships
Inherits From
Conforms To
See Also
Related Documentation
Opaque Types


## Page 4

class CFDateFormatter
class CFDictionary
class CFError


