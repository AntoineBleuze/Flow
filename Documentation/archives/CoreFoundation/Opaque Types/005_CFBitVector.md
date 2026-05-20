# 005_CFBitVector.pdf

## Page 1

CFBitVector and its derived mutable type, CFMutableBitVector, manage ordered collections o
bit values, which are either 0 or 1. CFBitVector creates static bit vectors and CFMutableBitVector
creates dynamic bit vectors.
func CFBitVectorCreate(CFAllocator!, UnsafePointer<UInt8>!, CFIndex) ->
CFBitVector!
Creates an immutable bit vector from a block of memory.
func CFBitVectorCreateCopy(CFAllocator!, CFBitVector!) -> CFBitVector!
Creates an immutable bit vector that is a copy of another bit vector.
func CFBitVectorContainsBit(CFBitVector!, CFRange, CFBit) -> Bool
Returns whether a bit vector contains a particular bit value.
func CFBitVectorGetBitAtIndex(CFBitVector!, CFIndex) -> CFBit
Overview
Topics
Creating a Bit Vector
Getting Information About a Bit Vector
Core Foundation / CFBitVector
Class
CFBitVector
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Returns the bit value at a given index in a bit vector.
func CFBitVectorGetBits(CFBitVector!, CFRange, UnsafeMutablePointer<
UInt8>!)
Returns the bit values in a range of indices in a bit vector.
func CFBitVectorGetCount(CFBitVector!) -> CFIndex
Returns the number of bit values in a bit vector.
func CFBitVectorGetCountOfBit(CFBitVector!, CFRange, CFBit) -> CFIndex
Counts the number of times a certain bit value occurs within a range of bits in a bit vector.
func CFBitVectorGetFirstIndexOfBit(CFBitVector!, CFRange, CFBit) ->
CFIndex
Locates the first occurrence of a certain bit value within a range of bits in a bit vector.
func CFBitVectorGetLastIndexOfBit(CFBitVector!, CFRange, CFBit) ->
CFIndex
Locates the last occurrence of a certain bit value within a range of bits in a bit vector.
func CFBitVectorGetTypeID() -> CFTypeID
Returns the type identifier for the CFBitVector opaque type.
typealias CFBit
A binary value of either 0 or 1.
CFMutableBitVector
Getting the CFBitVector Type ID
Data Types
Relationships
Inherited By
Conforms To


## Page 3

Equatable, Hashable
Collections Programming Topics for Core Foundation
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
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
See Also
Related Documentation
Opaque Types


