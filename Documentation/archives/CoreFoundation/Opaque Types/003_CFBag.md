# 003_CFBag.pdf

## Page 1

CFBag and its derived mutable type, CFMutableBag, manage non-sequential collections of valu
called bags in which there can be duplicate values. CFBag creates static bags and CFMutableBag
creates dynamic bags.
Use bags or sets as an alternative to arrays when the order of elements isn’t important and
performance in testing whether a value is contained in the collection is a consideration—while
arrays are ordered, testing for membership is slower than with bags or sets. Use bags over sets if
you want to allow duplicate values in your collections.
You create a static bag object using either the CFBagCreate(_:_:_:_:) or CFBagCreate
Copy(_:_:) function. These functions return a bag containing the values you pass in as
arguments. (Note that bags can’t contain NULL pointers; in most cases, though, you can use the
kCFNull constant instead.) Values are not copied but retained using the retain callback provided
when the bag was created. Similarly, when a value is removed from a bag, it is released using the
release callback.
CFBag provides functions for querying the values of a bag. The CFBagGetCount(_:) returns th
number of values in a bag, the CFBagContainsValue(_:_:) function checks if a value is in a
bag, and CFBagGetValues(_:_:) returns a C array containing all the values in a bag.
The CFBagApplyFunction(_:_:_:) function lets you apply a function to all values in a bag.
Overview
Topics
Core Foundation / CFBag
Class
CFBag
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFBagCreate(CFAllocator!, UnsafeMutablePointer<UnsafeRawPointer?>!
CFIndex, UnsafePointer<CFBagCallBacks>!) -> CFBag!
Creates an immutable bag containing specified values.
func CFBagCreateCopy(CFAllocator!, CFBag!) -> CFBag!
Creates an immutable bag with the values of another bag.
func CFBagContainsValue(CFBag!, UnsafeRawPointer!) -> Bool
Reports whether or not a value is in a bag.
func CFBagGetCount(CFBag!) -> CFIndex
Returns the number of values currently in a bag.
func CFBagGetCountOfValue(CFBag!, UnsafeRawPointer!) -> CFIndex
Returns the number of times a value occurs in a bag.
func CFBagGetValue(CFBag!, UnsafeRawPointer!) -> UnsafeRawPointer!
Returns a requested value from a bag.
func CFBagGetValueIfPresent(CFBag!, UnsafeRawPointer!, UnsafeMutable
Pointer<UnsafeRawPointer?>!) -> Bool
Reports whether or not a value is in a bag, and returns that value indirectly if it exists.
func CFBagGetValues(CFBag!, UnsafeMutablePointer<UnsafeRawPointer?>!)
Fills a buffer with values from a bag.
func CFBagApplyFunction(CFBag!, ((UnsafeRawPointer?, UnsafeMutableRaw
Pointer?) -> Void)!, UnsafeMutableRawPointer!)
Calls a function once for each value in a bag.
func CFBagGetTypeID() -> CFTypeID
Returns the type identifier for the CFBag opaque type.
Creating a Bag
Examining a Bag
Applying a Function to the Contents of a Bag
Getting the CFBag Type ID


## Page 3

typealias CFBagApplierFunction
Prototype of a callback function that may be applied to every value in a bag.
typealias CFBagCopyDescriptionCallBack
Prototype of a callback function used to get a description of a value in a bag.
typealias CFBagEqualCallBack
Prototype of a callback function used to determine if two values in a bag are equal.
typealias CFBagHashCallBack
Prototype of a callback function invoked to compute a hash code for a value. Hash codes are
used when values are accessed, added, or removed from a collection.
typealias CFBagReleaseCallBack
Prototype of a callback function used to release a value before it’s removed from a bag.
typealias CFBagRetainCallBack
Prototype of a callback function used to retain a value being added to a bag.
struct CFBagCallBacks
This structure contains the callbacks used to retain, release, describe, and compare the
values of a CFBag object.
Predefined Callback Structures
CFBag provides some predefined callbacks for your convenience.
CFMutableBag
Callbacks
Data Types
Constants
Relationships
Inherited By


## Page 4

Equatable, Hashable
Collections Programming Topics for Core Foundation
class CFAllocator
class CFArray
class CFAttributedString
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
Conforms To
See Also
Related Documentation
Opaque Types


