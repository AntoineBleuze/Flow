# 004_CFBinaryHeap.pdf

## Page 1

CFBinaryHeap implements a container that stores values sorted using a binary search algorithm
All binary heaps are mutable; there is not a separate immutable variety. Binary heaps can be usefu
as priority queues.
func CFBinaryHeapAddValue(CFBinaryHeap!, UnsafeRawPointer!)
Adds a value to a binary heap.
func CFBinaryHeapApplyFunction(CFBinaryHeap!, ((UnsafeRawPointer?,
UnsafeMutableRawPointer?) -> Void)!, UnsafeMutableRawPointer!)
Iteratively applies a function to all the values in a binary heap.
func CFBinaryHeapContainsValue(CFBinaryHeap!, UnsafeRawPointer!) -> Boo
Returns whether a given value is in a binary heap.
func CFBinaryHeapCreate(CFAllocator!, CFIndex, UnsafePointer<CFBinary
HeapCallBacks>!, UnsafePointer<CFBinaryHeapCompareContext>!) -> CFBinar
Heap!
Overview
Topics
CFBinaryHeap Miscellaneous Functions
Core Foundation / CFBinaryHeap
Class
CFBinaryHeap
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Creates a new mutable or fixed-mutable binary heap.
func CFBinaryHeapCreateCopy(CFAllocator!, CFIndex, CFBinaryHeap!) ->
CFBinaryHeap!
Creates a new mutable or fixed-mutable binary heap with the values from a pre-existing
binary heap.
func CFBinaryHeapGetCount(CFBinaryHeap!) -> CFIndex
Returns the number of values currently in a binary heap.
func CFBinaryHeapGetCountOfValue(CFBinaryHeap!, UnsafeRawPointer!) ->
CFIndex
Counts the number of times a given value occurs in a binary heap.
func CFBinaryHeapGetMinimum(CFBinaryHeap!) -> UnsafeRawPointer!
Returns the minimum value in a binary heap.
func CFBinaryHeapGetMinimumIfPresent(CFBinaryHeap!, UnsafeMutablePointe
<UnsafeRawPointer?>!) -> Bool
Returns the minimum value in a binary heap, if present.
func CFBinaryHeapGetTypeID() -> CFTypeID
Returns the type identifier of the CFBinaryHeap opaque type.
func CFBinaryHeapGetValues(CFBinaryHeap!, UnsafeMutablePointer<UnsafeRa
Pointer?>!)
Copies all the values from a binary heap into a sorted C array.
func CFBinaryHeapRemoveAllValues(CFBinaryHeap!)
Removes all values from a binary heap, making it empty.
func CFBinaryHeapRemoveMinimumValue(CFBinaryHeap!)
Removes the minimum value from a binary heap.
typealias CFBinaryHeapApplierFunction
Callback function used to apply a function to all members of a binary heap.
var compare: ((UnsafeRawPointer?, UnsafeRawPointer?, UnsafeMutableRaw
Pointer?) -> CFComparisonResult)!
The callback used to compare values in the binary heap in some operations. This field canno
be NULL.
Callbacks


## Page 3

var copyDescription: ((UnsafeRawPointer?) -> Unmanaged<CFString>?)!
Callback function used to get a description of a value in a binary heap.
var release: ((CFAllocator?, UnsafeRawPointer?) -> Void)!
Callback function used to release a value before it is removed from a binary heap.
var retain: ((CFAllocator?, UnsafeRawPointer?) -> UnsafeRawPointer?)!
Callback function used to retain a value being added to a binary heap.
var version: CFIndex
The version number of the structure type being passed in as a parameter to the CFBinary
Heap creation functions. This structure is version 0.
struct CFBinaryHeapCallBacks
Structure containing the callbacks for values for a CFBinaryHeap object.
struct CFBinaryHeapCompareContext
Not used.
Predefined Callback Structures
CFBinaryHeap provides some predefined callbacks for your convenience.
Equatable, Hashable
Data Types
Constants
Relationships
Conforms To
See Also
Related Documentation


## Page 4

Collections Programming Topics
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
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
Opaque Types


