# 010_CFData.pdf

## Page 1

CFData and its derived mutable type, CFMutableData, provide support for data objects, object-
oriented wrappers for byte buffers. Data objects let simple allocated buffers (that is, data with no
embedded pointers) take on the behavior of Core Foundation objects. CFData creates static data
objects, and CFMutableData creates dynamic data objects. Data objects are typically used for raw
data storage.
You use the CFDataCreate(_:_:_:) and CFDataCreateCopy(_:_:) functions to create
static data objects. These functions make a new copy of the supplied data. To create a data objec
that uses the supplied buffer instead of making a separate copy, use the CFDataCreateWith
BytesNoCopy(_:_:_:_:) function. You use the CFDataGetBytes(_:_:_:) function to
retrieve the bytes and the CFDataGetLength(_:) function to get the length of the bytes.
CFData is “toll-free bridged” with its Cocoa Foundation counterpart, NSData. What this means is
that the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. In other words, in a method where you see an NSData * parameter, you can
pass in a CFDataRef, and in a function where you see a CFDataRef parameter, you can pass in
an NSData instance. This also applies to concrete subclasses of NSData. See Toll-Free Bridged
Types for more information on toll-free bridging.
Overview
Topics
Creating a CFData Object
Core Foundation / CFData
Class
CFData
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFDataCreate(CFAllocator!, UnsafePointer<UInt8>!, CFIndex) ->
CFData!
Creates an immutable CFData object using data copied from a specified byte buffer.
func CFDataCreateCopy(CFAllocator!, CFData!) -> CFData!
Creates an immutable copy of a CFData object.
func CFDataCreateWithBytesNoCopy(CFAllocator!, UnsafePointer<UInt8>!,
CFIndex, CFAllocator!) -> CFData!
Creates an immutable CFData object from an external (client-owned) byte buffer.
func CFDataGetBytePtr(CFData!) -> UnsafePointer<UInt8>!
Returns a read-only pointer to the bytes of a CFData object.
func CFDataGetBytes(CFData!, CFRange, UnsafeMutablePointer<UInt8>!)
Copies the byte contents of a CFData object to an external buffer.
func CFDataGetLength(CFData!) -> CFIndex
Returns the number of bytes contained by a CFData object.
func CFDataFind(CFData!, CFData!, CFRange, CFDataSearchFlags) -> CFRang
Finds and returns the range within a data object of the first occurrence of the given data,
within a given range, subject to any given options.
func CFDataGetTypeID() -> CFTypeID
Returns the type identifier for the CFData opaque type.
struct CFDataSearchFlags
A CFOptionFlags type for specifying options for searching.
Examining a CFData Object
Getting the CFData Type ID
Data Types
Relationships


## Page 3

CFMutableData
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
class CFDate
class CFDateFormatter
class CFDictionary
Inherited By
Conforms To
See Also
Related Documentation
Opaque Types


## Page 4

class CFError
class CFFileDescriptor


