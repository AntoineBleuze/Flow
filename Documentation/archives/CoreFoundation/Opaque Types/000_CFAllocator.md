# 000_CFAllocator.pdf

## Page 1

CFAllocator is an opaque type that allocates and deallocates memory for you. You never have to
allocate, reallocate, or deallocate memory directly for Core Foundation objects—and rarely should
you. You pass CFAllocator objects into functions that create objects; these functions have “Create
embedded in their names, for example, CFStringCreateWithPascalString. The creation
functions use the allocators to allocate memory for the objects they create.
func CFAllocatorCreate(CFAllocator!, UnsafeMutablePointer<CFAllocator
Context>!) -> Unmanaged<CFAllocator>!
Creates an allocator object.
func CFAllocatorAllocate(CFAllocator!, CFIndex, CFOptionFlags) -> Unsaf
MutableRawPointer!
Allocates memory using the specified allocator.
func CFAllocatorDeallocate(CFAllocator!, UnsafeMutableRawPointer!)
Overview
Topics
Creating an Allocator
Managing Memory with an Allocator
Core Foundation / CFAllocator
Class
CFAllocator
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Deallocates a block of memory with a given allocator.
func CFAllocatorGetPreferredSizeForSize(CFAllocator!, CFIndex, CFOption
Flags) -> CFIndex
Obtains the number of bytes likely to be allocated upon a specific request.
func CFAllocatorReallocate(CFAllocator!, UnsafeMutableRawPointer!,
CFIndex, CFOptionFlags) -> UnsafeMutableRawPointer!
Reallocates memory using the specified allocator.
func CFAllocatorGetDefault() -> Unmanaged<CFAllocator>!
Gets the default allocator object for the current thread.
func CFAllocatorSetDefault(CFAllocator!)
Sets the given allocator as the default for the current thread.
func CFAllocatorGetContext(CFAllocator!, UnsafeMutablePointer<
CFAllocatorContext>!)
Obtains the context of the specified allocator or of the default allocator.
func CFAllocatorGetTypeID() -> CFTypeID
Returns the type identifier for the CFAllocator opaque type.
typealias CFAllocatorAllocateCallBack
A prototype for a function callback that allocates memory of a requested size.
typealias CFAllocatorCopyDescriptionCallBack
A prototype for a function callback that provides a description of the specified data.
typealias CFAllocatorDeallocateCallBack
A prototype for a function callback that deallocates a block of memory.
typealias CFAllocatorPreferredSizeCallBack
Getting and Setting the Default Allocator
Getting an Allocator’s Context
Getting the CFAllocator Type ID
Callbacks


## Page 3

A prototype for a function callback that gives the size of memory likely to be allocated, given
certain request.
typealias CFAllocatorReallocateCallBack
A prototype for a function callback that reallocates memory of a requested size for an existin
block of memory.
typealias CFAllocatorReleaseCallBack
A prototype for a function callback that releases the given data.
typealias CFAllocatorRetainCallBack
A prototype for a function callback that retains the given data.
struct CFAllocatorContext
A structure that defines the context or operating environment for an allocator (CFAllocator)
object. Every Core Foundation allocator object must have a context defined for it.
Predefined Allocators
CFAllocator provides the following predefined allocators. In general, you should use k
CFAllocatorDefault unless one of the special circumstances exist below.
Equatable, Hashable
Memory Management Programming Guide for Core Foundation
Data Types
Constants
Relationships
Conforms To
See Also
Related Documentation


## Page 4

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
class CFError
class CFFileDescriptor
Opaque Types


