# Opaque Types.pdf

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


## Page 5

CFArray and its derived mutable type, CFMutableArray, manage ordered collections of values
called arrays. CFArray creates static arrays and CFMutableArray creates dynamic arrays.
You create a static array object using either the CFArrayCreate(_:_:_:_:) or CFArray
CreateCopy(_:_:) function. These functions return an array containing the values you pass in
as arguments. (Note that arrays can’t contain NULL pointers; in most cases, though, you can use
the kCFNull constant instead.) Values are not copied but retained using the retain callback
provided when an array was created. Similarly, when a value is removed from an array, it is release
using the release callback.
CFArray’s two primitive functions CFArrayGetCount(_:) and CFArrayGetValueAtIndex(_
_:) provide the basis for all other functions in its interface. The CFArrayGetCount(_:) functio
returns the number of elements in an array; CFArrayGetValueAtIndex(_:_:) gives you
access to an array’s elements by index, with index values starting at 0.
A number of CFArray functions allow you to operate over a range of values in an array, for exampl
CFArrayApplyFunction(_:_:_:_:) lets you apply a function to values in an array, and
CFArrayBSearchValues(_:_:_:_:_:) searches an array for the value that matches its
parameter. Recall that a range is defined as {start, length}, therefore to operate over the
entire array the range you supply should be {0, N} (where N is the count of the array).
CFArray is “toll-free bridged” with its Cocoa Foundation counterpart, NSArray. This means that
the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSArray * parameter, you can pas
in a CFArrayRef, and in a function where you see a CFArrayRef parameter, you can pass in an
NSArray instance. This also applies to concrete subclasses of NSArray. See Toll-Free Bridged
Types for more information on toll-free bridging.
Overview
Core Foundation / CFArray
Class
CFArray
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 6

func CFArrayCreate(CFAllocator!, UnsafeMutablePointer<UnsafeRawPointer?
>!, CFIndex, UnsafePointer<CFArrayCallBacks>!) -> CFArray!
Creates a new immutable array with the given values.
func CFArrayCreateCopy(CFAllocator!, CFArray!) -> CFArray!
Creates a new immutable array with the values from another array.
func CFArrayBSearchValues(CFArray!, CFRange, UnsafeRawPointer!,
CFComparatorFunction!, UnsafeMutableRawPointer!) -> CFIndex
Searches an array for a value using a binary search algorithm.
func CFArrayContainsValue(CFArray!, CFRange, UnsafeRawPointer!) -> Bool
Reports whether or not a value is in an array.
func CFArrayGetCount(CFArray!) -> CFIndex
Returns the number of values currently in an array.
func CFArrayGetCountOfValue(CFArray!, CFRange, UnsafeRawPointer!) ->
CFIndex
Counts the number of times a given value occurs in an array.
func CFArrayGetFirstIndexOfValue(CFArray!, CFRange, UnsafeRawPointer!) 
> CFIndex
Searches an array forward for a value.
func CFArrayGetLastIndexOfValue(CFArray!, CFRange, UnsafeRawPointer!) -
CFIndex
Searches an array backward for a value.
func CFArrayGetValues(CFArray!, CFRange, UnsafeMutablePointer<UnsafeRaw
Pointer?>!)
Fills a buffer with values from an array.
func CFArrayGetValueAtIndex(CFArray!, CFIndex) -> UnsafeRawPointer!
Topics
Creating an Array
Examining an Array


## Page 7

Retrieves a value at a given index.
func CFArrayApplyFunction(CFArray!, CFRange, ((UnsafeRawPointer?, Unsaf
MutableRawPointer?) -> Void)!, UnsafeMutableRawPointer!)
Calls a function once for each element in range in an array.
func CFArrayGetTypeID() -> CFTypeID
Returns the type identifier for the CFArray opaque type.
typealias CFArrayApplierFunction
Prototype of a callback function that may be applied to every value in an array.
typealias CFArrayCopyDescriptionCallBack
Prototype of a callback function used to get a description of a value in an array.
typealias CFArrayEqualCallBack
Prototype of a callback function used to determine if two values in an array are equal.
typealias CFArrayReleaseCallBack
Prototype of a callback function used to release a value before it’s removed from an array.
typealias CFArrayRetainCallBack
Prototype of a callback function used to retain a value being added to an array.
struct CFArrayCallBacks
Structure containing the callbacks of a CFArray.
Predefined Callback Structures
Applying a Function to Elements
Getting the CFArray Type ID
Callbacks
Data Types
Constants


## Page 8

CFArray provides a predefined callback structure appropriate for use when the values in a
CFArray are all CFType-derived objects.
CFMutableArray
Equatable, Hashable
Property List Programming Topics for Core Foundation
Collections Programming Topics for Core Foundation
class CFAllocator
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
Relationships
Inherited By
Conforms To
See Also
Related Documentation
Opaque Types


## Page 9

class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
class CFFileDescriptor


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

CFBoolean objects are used to wrap boolean values for use in Core Foundation property lists and
collection types.
func CFBooleanGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier for the CFBoolean opaque type.
func CFBooleanGetValue(CFBoolean!) -> Bool
Returns the value of a CFBoolean object as a standard C type Boolean.
Boolean Values
CFBoolean evaluates to either true or false values where kCFBooleanTrue is the true, and 
CFBooleanFalse is the false value.
Overview
Topics
CFBoolean Miscellaneous Functions
Constants
Core Foundation / CFBoolean
Class
CFBoolean
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 26

Equatable, Hashable
Property List Programming Topics for Core Foundation
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 27

class CFFileDescriptor


## Page 28

CFBundle allows you to use a folder hierarchy called a bundle to organize and locate many types o
application resources including images, sounds, localized strings, and executable code. In macOS
bundles can also be used by CFM applications to load and execute functions from Mach-O
frameworks. You can use bundles to support multiple languages or execute your application on
multiple operating environments.
You create a bundle object using one of the CFBundleCreate... functions. CFBundle provides
several functions for finding resources within a bundle. The CFBundleCopyResourceURL(_:_
_:_:) function returns the location of a resource of the specified name and type, and in the
specified subdirectory. Use CFBundleCopyResourceURLForLocalization(_:_:_:_:_:) 
restrict the search to a specific localization name. Use CFBundleCopyResourceURLsOf
Type(_:_:_:) to get the locations of all resources of a specified type.
CFBundle provides functions for getting bundle information, such as its identifier and information
dictionary. Use the CFBundleGetIdentifier(_:) function to get the identifier of a bundle, an
the CFBundleGetInfoDictionary(_:) function to get its information dictionary. The principa
intended purpose for locating bundles by identifier is so that code (in frameworks, plugins, etc.)
can find its own bundle.
You can also obtain locations of subdirectories in a bundle represented as CFURL objects. The
CFBundleCopyExecutableURL(_:) function returns the location of the application’s
executable. The functions CFBundleCopyResourceURL(_:_:_:_:), CFBundleCopyShared
FrameworksURL(_:), CFBundleCopyPrivateFrameworksURL(_:), CFBundleCopy
SharedSupportURL(_:), and CFBundleCopyBuiltInPlugInsURL(_:) return the location
of a bundle’s subdirectory containing resources, shared frameworks, private frameworks, shared
support files, and plug-ins respectively.
Overview
Core Foundation / CFBundle
Class
CFBundle
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 29

Other functions are used to manage localizations. The CFBundleCopyLocalizedString(_:_
_:_:) and CFBundleCopyLocalizationsForURL(_:) functions return a localized string fro
a bundle’s strings file. The CFBundleCopyLocalizationsForPreferences(_:_:) function
returns the localizations that CFBundle would prefer, given the specified bundle and user
preference localizations.
Unlike some other Core Foundation opaque types with similar Cocoa Foundation names (such as
CFString and NSString), Bundle objects cannot be cast (“toll-free bridged”) to CFBundle
objects.
Unlike NSBundle, which does not support unloading (because the Objective C runtime does not
support the unloading of Objective C code), you can unload CFBundle objects.
CFBundleGetFunctionPointerForName(_:_:) and related calls automatically load a bund
if it is not already loaded. When the last reference to the CFBundle object is released and it is fina
deallocated, then the code will be unloaded if it is still loaded and if the executable is of a type tha
supports unloading. If you keep this in mind, and if you make sure that everything that uses the
bundle keeps a retain on the CFBundle object, then you can just use the bundle naturally and nev
have to worry about when it is loaded and unloaded.
On the other hand, if you want to manually manage when the bundle is loaded and unloaded, then
you can use CFBundleLoadExecutable(_:) and CFBundleUnloadExecutable(_:)—
although this technique is not recommended. These functions force immediate loading and
unloading of the executable (if it has not already been loaded/unloaded, and in the case of
unloading if the executable is of a type that supports unloading). If you do this, then the code
calling CFBundleUnloadExecutable is responsible for making sure that there are no remainin
references to anything in the bundle’s code before it is unloaded. In the previous approach, by
contrast, this responsibility can be distributed to the individual code sections that use the bundle
by making sure that each one keeps its own retain on the CFBundle object.
One further point about CFBundle reference counting: if you are taking the first approach, but do
not actually wish the bundle’s code to be unloaded (as is often the case), or if you are taking the
second approach of manually managing the unloading yourself, then in many cases you do not
actually have to worry about releasing a CFBundle object. CFBundle instances are uniqued, so
there is only one CFBundle object for a given bundle, and rarely are there so many bundles being
considered at once that the memory usage for CFBundle objects would be significant. There are
cases in which a process could create CFBundle objects for potentially an unlimited number of
bundles, and such processes would wish to balance retains and releases carefully, but such cases
are likely to be rare.
Note that it is best to compile any unloadable bundles with the flag -fno-constant-cfstring
—see Bundle Programming Guide for more details.
Topics


## Page 30

func CFBundleCreate(CFAllocator!, CFURL!) -> CFBundle!
Creates a CFBundle object.
func CFBundleCreateBundlesFromDirectory(CFAllocator!, CFURL!, CFString!
-> CFArray!
Searches a directory and constructs an array of CFBundle objects from all valid bundles in th
specified directory.
func CFBundleGetAllBundles() -> CFArray!
Returns an array containing all of the bundles currently open in the application.
func CFBundleGetBundleWithIdentifier(CFString!) -> CFBundle!
Locate a bundle given its program-defined identifier.
func CFBundleGetMainBundle() -> CFBundle!
Returns an application’s main bundle.
func CFBundleIsExecutableLoaded(CFBundle!) -> Bool
Obtains information about the load status for a bundle’s main executable.
func CFBundlePreflightExecutable(CFBundle!, UnsafeMutablePointer<
Unmanaged<CFError>?>!) -> Bool
Returns a Boolean value that indicates whether a given bundle is loaded or appears to be
loadable.
func CFBundleLoadExecutable(CFBundle!) -> Bool
Loads a bundle’s main executable code into memory and dynamically links it into the running
application.
func CFBundleLoadExecutableAndReturnError(CFBundle!, UnsafeMutable
Pointer<Unmanaged<CFError>?>!) -> Bool
Returns a Boolean value that indicates whether a given bundle is loaded, attempting to load 
if necessary.
func CFBundleUnloadExecutable(CFBundle!)
Unloads the main executable for the specified bundle.
Creating and Accessing Bundles
Loading and Unloading a Bundle


## Page 31

func CFBundleCopyAuxiliaryExecutableURL(CFBundle!, CFString!) -> CFURL!
Returns the location of a bundle’s auxiliary executable code.
func CFBundleCopyBuiltInPlugInsURL(CFBundle!) -> CFURL!
Returns the location of a bundle’s built in plug-in.
func CFBundleCopyExecutableURL(CFBundle!) -> CFURL!
Returns the location of a bundle’s main executable code.
func CFBundleCopyPrivateFrameworksURL(CFBundle!) -> CFURL!
Returns the location of a bundle’s private Frameworks directory.
func CFBundleCopyResourcesDirectoryURL(CFBundle!) -> CFURL!
Returns the location of a bundle’s Resources directory.
func CFBundleCopySharedFrameworksURL(CFBundle!) -> CFURL!
Returns the location of a bundle’s shared frameworks directory.
func CFBundleCopySharedSupportURL(CFBundle!) -> CFURL!
Returns the location of a bundle’s shared support files directory.
func CFBundleCopySupportFilesDirectoryURL(CFBundle!) -> CFURL!
Returns the location of the bundle’s support files directory.
func CFBundleCloseBundleResourceMap(CFBundle!, CFBundleRefNum)
Closes an open resource map for a bundle.
Deprecated
func CFBundleCopyResourceURL(CFBundle!, CFString!, CFString!, CFString!
-> CFURL!
Returns the location of a resource contained in the specified bundle.
func CFBundleCopyResourceURLInDirectory(CFURL!, CFString!, CFString!,
CFString!) -> CFURL!
Returns the location of a resource contained in the specified bundle directory without
requiring the creation of a CFBundle object.
Finding Locations in a Bundle
Locating Bundle Resources


## Page 32

func CFBundleCopyResourceURLsOfType(CFBundle!, CFString!, CFString!) ->
CFArray!
Assembles an array of URLs specifying all of the resources of the specified type found in a
bundle.
func CFBundleCopyResourceURLsOfTypeInDirectory(CFURL!, CFString!,
CFString!) -> CFArray!
Returns an array of CFURL objects describing the locations of all resources in a bundle of th
specified type without needing to create a CFBundle object.
func CFBundleCopyResourceURLForLocalization(CFBundle!, CFString!,
CFString!, CFString!, CFString!) -> CFURL!
Returns the location of a localized resource in a bundle.
func CFBundleCopyResourceURLsOfTypeForLocalization(CFBundle!, CFString!
CFString!, CFString!) -> CFArray!
Returns an array containing copies of the URL locations for a specified bundle, resource, and
localization name.
func CFBundleOpenBundleResourceFiles(CFBundle!, UnsafeMutablePointer<
CFBundleRefNum>!, UnsafeMutablePointer<CFBundleRefNum>!) -> Int32
Opens the non-localized and localized resource files (if any) for a bundle in separate resourc
maps.
Deprecated
func CFBundleOpenBundleResourceMap(CFBundle!) -> CFBundleRefNum
Opens the non-localized and localized resource files (if any) for a bundle in a single resource
map.
Deprecated
func CFBundleCopyBundleLocalizations(CFBundle!) -> CFArray!
Returns an array containing a bundle’s localizations.
func CFBundleCopyLocalizedString(CFBundle!, CFString!, CFString!,
CFString!) -> CFString!
Returns a localized string from a bundle’s strings file.
func CFBundleCopyLocalizationsForPreferences(CFArray!, CFArray!) ->
CFArray!
Managing Localizations


## Page 33

Given an array of possible localizations and preferred locations, returns the one or more of
them that CFBundle would use, without reference to the current application context.
func CFBundleCopyLocalizationsForURL(CFURL!) -> CFArray!
Returns an array containing the localizations for a bundle or executable at a particular
location.
func CFBundleCopyPreferredLocalizationsFromArray(CFArray!) -> CFArray!
Given an array of possible localizations, returns the one or more of them that CFBundle wou
use in the current application context.
func CFBundleGetDataPointerForName(CFBundle!, CFString!) -> Unsafe
MutableRawPointer!
Returns a data pointer to a symbol of the given name.
func CFBundleGetDataPointersForNames(CFBundle!, CFArray!, UnsafeMutable
Pointer<UnsafeMutableRawPointer?>!)
Returns a C array of data pointer to symbols of the given names.
func CFBundleGetFunctionPointerForName(CFBundle!, CFString!) -> Unsafe
MutableRawPointer!
Returns a pointer to a function in a bundle’s executable code using the function name as the
search key.
func CFBundleGetFunctionPointersForNames(CFBundle!, CFArray!, Unsafe
MutablePointer<UnsafeMutableRawPointer?>!)
Constructs a function table containing pointers to all of the functions found in a bundle’s ma
executable code.
func CFBundleGetPlugIn(CFBundle!) -> CFPlugIn!
Returns a bundle’s plug-in.
func CFBundleCopyBundleURL(CFBundle!) -> CFURL!
Returns the location of a bundle.
func CFBundleGetDevelopmentRegion(CFBundle!) -> CFString!
Returns the bundle’s development region from the bundle’s information property list.
Managing Executable Code
Getting Bundle Properties


## Page 34

func CFBundleGetIdentifier(CFBundle!) -> CFString!
Returns the bundle identifier from a bundle’s information property list.
func CFBundleGetInfoDictionary(CFBundle!) -> CFDictionary!
Returns a bundle’s information dictionary.
func CFBundleGetLocalInfoDictionary(CFBundle!) -> CFDictionary!
Returns a bundle’s localized information dictionary.
func CFBundleGetValueForInfoDictionaryKey(CFBundle!, CFString!) ->
CFTypeRef!
Returns a value (localized if possible) from a bundle’s information dictionary.
func CFBundleCopyInfoDictionaryInDirectory(CFURL!) -> CFDictionary!
Returns a bundle’s information dictionary.
func CFBundleCopyInfoDictionaryForURL(CFURL!) -> CFDictionary!
Returns the information dictionary for a given URL location.
func CFBundleGetPackageInfo(CFBundle!, UnsafeMutablePointer<UInt32>!,
UnsafeMutablePointer<UInt32>!)
Returns a bundle’s package type and creator.
func CFBundleGetPackageInfoInDirectory(CFURL!, UnsafeMutablePointer<
UInt32>!, UnsafeMutablePointer<UInt32>!) -> Bool
Returns a bundle’s package type and creator without having to create a CFBundle object.
func CFBundleCopyExecutableArchitectures(CFBundle!) -> CFArray!
Returns an array of CFNumbers representing the architectures a given bundle provides.
func CFBundleCopyExecutableArchitecturesForURL(CFURL!) -> CFArray!
Returns an array of CFNumbers representing the architectures a given URL provides.
func CFBundleGetVersionNumber(CFBundle!) -> UInt32
Returns a bundle’s version number.
func CFBundleGetTypeID() -> CFTypeID
Returns the type identifier for the CFBundle opaque type.
Getting the CFBundle Type ID
Data Types


## Page 35

typealias CFBundleRefNum
Type that identifies a distinct reference number for a resource map.
Information Property List Keys
Standard keys found in a bundle’s information property list file.
Architecture Types
Constants that identify executable architecture types.
Equatable, Hashable
Bundle Programming Guide
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
Constants
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 36

class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
class CFFileDescriptor


## Page 37

The CFCalendar opaque type represents a calendar system. The associated API provides
information about a calendar and supports calendrical computations such as determining the ran
of a given calendrical unit and adding units to a given absolute time.
CFAbsoluteTime is the operational lingua franca of CFCalendar—to do calendar arithmetic, you
start and end with an absolute time; to convert between a decomposed date in one calendar and
another calendar, you first convert to an absolute time. CFAbsoluteTime provides the absolute
scale and epoch for dates and times, which can then be rendered into a particular calendar, for
calendrical computations or user display.
In a calendar, day, week, weekday, month, and year numbers are generally 1-based, but there may
be calendar-specific exceptions. Ordinal numbers, where they occur, are 1-based. Some calendar
represented by this API may have to map their basic unit concepts into year/month/week/day/…
nomenclature. For example, a calendar composed of 4 quarters in a year instead of 12 months us
the “month” unit to represent quarters. The particular values of the unit are defined by each
calendar, and are not necessarily “consistent with” or have a “correspondence with,” values for th
unit in another calendar. Several CFCalendar functions (CFCalendarComposeAbsoluteTime,
CFCalendarDecomposeAbsoluteTime, CFCalendarAddComponents, and CFCalendarGe
ComponentDifference) take a description string that describes the calendrical components
provided in a varargs parameter area. You can provide as many components as you need (or
choose to), in whatever order you choose. When there is incomplete information to compute an
absolute time, default values similar to 0 and 1 are usually chosen by a calendar, but this is a
calendar-specific choice. If you provide inconsistent information, calendar-specific disambiguatio
is performed (which may involve ignoring one or more of the parameters). The characters of the
description string specify the units and order of the parameters which follow. The characters are
Overview
Core Foundation / CFCalendar
Class
CFCalendar
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 38

adopted from the corresponding format characters used by CFDateFormatter when possible, as
shown in below.
Symbol
Meaning
Value Type
y
year
int
M
month
int
d
day
int
H
hour
int
m
minute
int
s
second
int
Information related to formatting dates and times and name-related calendar information is
managed by CFDateFormatter.
CFCalendar is subject to some limitations. There is no leap second handling—the existence of lea
seconds is ignored as in the other CoreFoundation API. In general, historical accuracy of calendar
is not guaranteed. There is currently no API for defining your own calendars.
CFCalendar is “toll-free bridged” with its Cocoa Foundation counterpart, NSCalendar. This means
that the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSCalendar * parameter, you can
pass in a CFCalendarRef, and in a function where you see a CFCalendarRef parameter, you
can pass in an NSCalendar instance. See Toll-Free Bridged Types for more information on toll-fre
bridging.
func CFCalendarCopyCurrent() -> CFCalendar!
Returns a copy of the logical calendar for the current user.
func CFCalendarCreateWithIdentifier(CFAllocator!, CFCalendarIdentifier!
-> CFCalendar!
Returns a calendar object for the calendar identified by a calendar identifier.
Topics
Creating a Calendar


## Page 39

func CFCalendarGetRangeOfUnit(CFCalendar!, CFCalendarUnit, CFCalendar
Unit, CFAbsoluteTime) -> CFRange
Returns the range of values that one unit can take on within a larger unit during which a
specific absolute time occurs.
func CFCalendarGetOrdinalityOfUnit(CFCalendar!, CFCalendarUnit,
CFCalendarUnit, CFAbsoluteTime) -> CFIndex
Returns the ordinal number of a calendrical unit within a larger unit at a specified absolute
time.
func CFCalendarGetTimeRangeOfUnit(CFCalendar!, CFCalendarUnit,
CFAbsoluteTime, UnsafeMutablePointer<CFAbsoluteTime>!, UnsafeMutable
Pointer<CFTimeInterval>!) -> Bool
Returns by reference the start time and duration of a given calendar unit that contains a give
absolute time.
func CFCalendarGetMaximumRangeOfUnit(CFCalendar!, CFCalendarUnit) ->
CFRange
Returns the maximum range limits of the values that a specified unit can take on in a given
calendar.
func CFCalendarGetMinimumRangeOfUnit(CFCalendar!, CFCalendarUnit) ->
CFRange
Returns the minimum range limits of the values that a specified unit can take on in a given
calendar.
func CFCalendarCopyTimeZone(CFCalendar!) -> CFTimeZone!
Returns a time zone object for a specified calendar.
func CFCalendarSetTimeZone(CFCalendar!, CFTimeZone!)
Sets the time zone for a calendar.
func CFCalendarGetIdentifier(CFCalendar!) -> CFCalendarIdentifier!
Returns the given calendar’s identifier.
Getting Ranges of Units
Getting and Setting the Time Zone
Getting the Identifier


## Page 40

func CFCalendarCopyLocale(CFCalendar!) -> CFLocale!
Returns a locale object for a specified calendar.
func CFCalendarSetLocale(CFCalendar!, CFLocale!)
Sets the locale for a calendar.
func CFCalendarGetFirstWeekday(CFCalendar!) -> CFIndex
Returns the index of first weekday for a specified calendar.
func CFCalendarSetFirstWeekday(CFCalendar!, CFIndex)
Sets the first weekday for a calendar.
func CFCalendarGetMinimumDaysInFirstWeek(CFCalendar!) -> CFIndex
Returns the minimum number of days in the first week of a specified calendar.
func CFCalendarSetMinimumDaysInFirstWeek(CFCalendar!, CFIndex)
Sets the minimum number of days in the first week of a specified calendar.
func CFCalendarGetTypeID() -> CFTypeID
Returns the type identifier for the CFCalendar opaque type.
struct CFCalendarUnit
CFCalendarUnit constants are used to specify calendrical units, such as day or month, in
various calendar calculations.
Component Wrapping Options
The wrapping option specifies overflow behavior for calendar components in calendrical
calculations
Getting and Setting the Locale
Getting and Setting Day Information
Getting the Type ID
Constants


## Page 41

Equatable, Hashable
Date and Time Programming Guide for Core Foundation
Internationalization and Localization Guide
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 42

class CFFileDescriptor


## Page 43

A CFCharacterSet object represents a set of Unicode compliant characters. CFString uses
CFCharacterSet objects to group characters together for searching operations, so that they can
find any of a particular set of characters during a search. The two opaque types, CFCharacterSet
and CFMutableCharacterSet, define the interface for static and dynamic character sets,
respectively. The objects you create using these opaque types are referred to as character set
objects (and when no confusion will result, merely as character sets).
CFCharacterSet’s principal function, CFCharacterSetIsCharacterMember(_:_:), provides
the basis for all other functions in its interface. You create a character set using one of the
CFCharacterSetCreate... functions. You may also use any one of the predefined character
sets using the CFCharacterSetGetPredefined(_:) function.
CFCharacterSet is “toll-free bridged” with its Cocoa Foundation counterpart, NSCharacterSet.
This means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSCharacterSet *
parameter, you can pass in a CFCharacterSetRef, and in a function where you see a
CFCharacterSetRef parameter, you can pass in an NSCharacterSet instance. This capability
also applies to concrete subclasses of NSCharacterSet. See Toll-Free Bridged Types for more
information on toll-free bridging.
Overview
Topics
Core Foundation / CFCharacterSet
Class
CFCharacterSet
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 44

func CFCharacterSetCreateCopy(CFAllocator!, CFCharacterSet!) ->
CFCharacterSet!
Creates a new character set with the values from a given character set.
func CFCharacterSetCreateInvertedSet(CFAllocator!, CFCharacterSet!) ->
CFCharacterSet!
Creates a new immutable character set that is the invert of the specified character set.
func CFCharacterSetCreateWithCharactersInRange(CFAllocator!, CFRange) -
CFCharacterSet!
Creates a new character set with the values from the given range of Unicode characters.
func CFCharacterSetCreateWithCharactersInString(CFAllocator!, CFString!
-> CFCharacterSet!
Creates a new character set with the values in the given string.
func CFCharacterSetCreateWithBitmapRepresentation(CFAllocator!, CFData!
-> CFCharacterSet!
Creates a new immutable character set with the bitmap representation specified by given
data.
func CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet) ->
CFCharacterSet!
Returns a predefined character set.
func CFCharacterSetCreateBitmapRepresentation(CFAllocator!, CFCharacter
Set!) -> CFData!
Creates a new immutable data with the bitmap representation from the given character set.
func CFCharacterSetHasMemberInPlane(CFCharacterSet!, CFIndex) -> Bool
Reports whether or not a character set contains at least one member character in the
specified plane.
func CFCharacterSetIsCharacterMember(CFCharacterSet!, UniChar) -> Bool
Reports whether or not a given Unicode character is in a character set.
Creating Character Sets
Getting Predefined Character Sets
Querying Character Sets


## Page 45

func CFCharacterSetIsLongCharacterMember(CFCharacterSet!, UTF32Char) ->
Bool
Reports whether or not a given UTF-32 character is in a character set.
func CFCharacterSetIsSupersetOfSet(CFCharacterSet!, CFCharacterSet!) ->
Bool
Reports whether or not a character set is a superset of another set.
func CFCharacterSetGetTypeID() -> CFTypeID
Returns the type identifier of the CFCharacterSet opaque type.
enum CFCharacterSetPredefinedSet
Defines a predefined character set.
Predefined CFCharacterSet Selector Values
Identifiers for the available predefined CFCharacterSet objects.
CFMutableCharacterSet
Equatable, Hashable
Getting the Character Set Type Identifier
Data Types
Constants
Relationships
Inherited By
Conforms To
See Also


## Page 46

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
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
class CFFileDescriptor
Related Documentation
Opaque Types


## Page 47

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


## Page 48

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


## Page 49

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


## Page 50

class CFError
class CFFileDescriptor


## Page 51

CFDate objects store dates and times that can be compared to other dates and times. CFDate
objects are immutable—there is no mutable counterpart for this opaque type.
CFDate provides functions for creating dates, comparing dates, and computing intervals. You us
the CFDateCreate(_:_:) function to create CFDate objects. You use the CFDateCompare(_
_:_:) function to compare two dates, and the CFDateGetTimeIntervalSinceDate(_:_:)
function to compute a time interval. Additional functions for managing dates and times are
described in Time Utilities
CFDate is “toll-free bridged” with its Cocoa Foundation counterpart, NSDate. What this means is
that the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. In other words, in a method where you see an NSDate * parameter, you can
pass in a CFDateRef, and in a function where you see a CFDateRef parameter, you can pass in
an NSDate instance. This also applies to concrete subclasses of NSDate. See Interchangeable
Data Types for more information on toll-free bridging.
func CFDateCompare(CFDate!, CFDate!, UnsafeMutableRawPointer!) ->
CFComparisonResult
Overview
Topics
CFDate Miscellaneous Functions
Core Foundation / CFDate
Class
CFDate
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 52

Compares two CFDate objects and returns a comparison result.
func CFDateCreate(CFAllocator!, CFAbsoluteTime) -> CFDate!
Creates a CFDate object given an absolute time.
func CFDateGetAbsoluteTime(CFDate!) -> CFAbsoluteTime
Returns a CFDate object’s absolute time.
func CFDateGetTimeIntervalSinceDate(CFDate!, CFDate!) -> CFTimeInterval
Returns the number of elapsed seconds between the given CFDate objects.
func CFDateGetTypeID() -> CFTypeID
Returns the type identifier for the CFDate opaque type.
Equatable, Hashable
Property List Programming Topics for Core Foundation
Date and Time Programming Guide for Core Foundation
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 53

class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDateFormatter
class CFDictionary
class CFError
class CFFileDescriptor


## Page 54

CFDateFormatter objects format the textual representations of CFDate and CFAbsoluteTime
objects, and convert textual representations of dates and times into CFDate and CFAbsoluteTime
objects. You can express the representation of dates and times very flexibly, for example “Thu 22
Dec 1994” is just as acceptable as “12/22/94.” You specify how strings are formatted and parsed 
setting a format string and other properties of a CFDateFomatter object.
The format of the format string itself is defined by Unicode Technical Standard #35; the version o
the standard used varies with release of the operating system, and is described in Introduction to
Data Formatting Programming Guide For Cocoa.
Note
CFDateFormatter is not thread safe, so you must not mutate a given date formatter
simultaneously from multiple threads.
func CFDateFormatterCreate(CFAllocator!, CFLocale!, CFDateFormatterStyl
, CFDateFormatterStyle) -> CFDateFormatter!
Overview
Topics
Creating a Date Formatter
Core Foundation / CFDateFormatter
Class
CFDateFormatter
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 55

Creates a new CFDateFormatter object, localized to the given locale, which will format dates
to the given date and time styles.
func CFDateFormatterSetFormat(CFDateFormatter!, CFString!)
Sets the format string of the given date formatter to the specified value.
func CFDateFormatterSetProperty(CFDateFormatter!, CFString!, CFTypeRef!
Sets a date formatter property using a key-value pair.
func CFDateFormatterCreateDateFromString(CFAllocator!, CFDateFormatter!
CFString!, UnsafeMutablePointer<CFRange>!) -> CFDate!
Returns a date object representing a given string.
func CFDateFormatterGetAbsoluteTimeFromString(CFDateFormatter!, CFStrin
!, UnsafeMutablePointer<CFRange>!, UnsafeMutablePointer<CFAbsoluteTime
>!) -> Bool
Returns an absolute time object representing a given string.
func CFDateFormatterCreateStringWithAbsoluteTime(CFAllocator!, CFDate
Formatter!, CFAbsoluteTime) -> CFString!
Returns a string representation of the given absolute time using the specified date formatter
func CFDateFormatterCreateStringWithDate(CFAllocator!, CFDateFormatter!
CFDate!) -> CFString!
Returns a string representation of the given date using the specified date formatter.
func CFDateFormatterCreateDateFormatFromTemplate(CFAllocator!, CFString
!, CFOptionFlags, CFLocale!) -> CFString!
Returns a localized date format string representing the given date format components
arranged appropriately for the specified locale.
func CFDateFormatterCopyProperty(CFDateFormatter!, CFDateFormatterKey!)
-> CFTypeRef!
Configuring a Date Formatter
Parsing Strings
Creating Strings From Data
Getting Information About a Date Formatter


## Page 56

Returns a copy of a date formatter’s value for a given key.
func CFDateFormatterGetDateStyle(CFDateFormatter!) -> CFDateFormatter
Style
Returns the date style used to create the given date formatter object.
func CFDateFormatterGetFormat(CFDateFormatter!) -> CFString!
Returns a format string for the given date formatter object.
func CFDateFormatterGetLocale(CFDateFormatter!) -> CFLocale!
Returns the locale object used to create the given date formatter object.
func CFDateFormatterGetTimeStyle(CFDateFormatter!) -> CFDateFormatter
Style
Returns the time style used to create the given date formatter object.
func CFDateFormatterGetTypeID() -> CFTypeID
Returns the type identifier for CFDateFormatter.
enum CFDateFormatterStyle
Data type for predefined date and time format styles.
Date Formatter Styles
Predefined date and time format styles.
Date Formatter Property Keys
Keys used in key-value pairs to discover and specify the value of date formatter properties—
used in conjunction with CFDateFormatterCopyProperty(_:_:) and CFDate
FormatterSetProperty(_:_:_:).
Calendar Names
Calendar names used by CFDateFormatter.
Getting the CFDateFormatter Type ID
Data Types
Constants


## Page 57

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
class CFDate
class CFDictionary
class CFError
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 58

class CFFileDescriptor


## Page 59

CFDictionary and its derived mutable type, CFMutableDictionary, manage associations of ke
value pairs. CFDictionary creates static dictionaries where you set the key-value pairs when first
creating a dictionary and cannot modify them afterward; CFMutableDictionary creates dynamic
dictionaries where you can add or delete key-value pairs at any time, and the dictionary
automatically allocates memory as needed.
A key-value pair within a dictionary is called an entry. Each entry consists of one object that
represents the key and a second object that is that key’s value. Within a dictionary, the keys are
unique. That is, no two keys in a single dictionary are equal (as determined by the equal callback)
Internally, a dictionary uses a hash table to organize its storage and to provide rapid access to a
value given the corresponding key.
Keys for a CFDictionary may be of any C type, however note that if you want to convert a
CFPropertyList to XML, any dictionary’s keys must be CFString objects.
You create static dictionaries using either the CFDictionaryCreate(_:_:_:_:_:_:) or
CFDictionaryCreateCopy(_:_:) function. Key-value pairs are passed as parameters to
CFDictionaryCreate(_:_:_:_:_:_:). When adding key-value pairs to a dictionary, the key
and values are not copied—they are retained so they are not invalidated before the dictionary is
deallocated.
CFDictionary provides functions for querying the values of a dictionary. The function
CFDictionaryGetCount(_:) returns the number of key-value pairs in a dictionary; the
CFDictionaryContainsValue(_:_:) function checks if a value is in a dictionary; and
CFDictionaryGetKeysAndValues(_:_:_:) returns a C array containing all the values and a
C array containing all the keys in a dictionary.
Overview
Core Foundation / CFDictionary
Class
CFDictionary
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 60

The CFDictionaryApplyFunction(_:_:_:) function lets you apply a function to all key-val
pairs in a dictionary.
CFDictionary is “toll-free bridged” with its Cocoa Foundation counterpart, NSDictionary. This
means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSDictionary *
parameter, you can pass in a CFDictionaryRef, and in a function where you see a
CFDictionaryRef parameter, you can pass in an NSDictionary instance. This also applies to
concrete subclasses of NSDictionary. See Toll-Free Bridged Types for more information on toll-fre
bridging.
func CFDictionaryCreate(CFAllocator!, UnsafeMutablePointer<UnsafeRaw
Pointer?>!, UnsafeMutablePointer<UnsafeRawPointer?>!, CFIndex, Unsafe
Pointer<CFDictionaryKeyCallBacks>!, UnsafePointer<CFDictionaryValueCall
Backs>!) -> CFDictionary!
Creates an immutable dictionary containing the specified key-value pairs.
func CFDictionaryCreateCopy(CFAllocator!, CFDictionary!) -> CFDictionar
!
Creates and returns a new immutable dictionary with the key-value pairs of another dictiona
func CFDictionaryContainsKey(CFDictionary!, UnsafeRawPointer!) -> Bool
Returns a Boolean value that indicates whether a given key is in a dictionary.
func CFDictionaryContainsValue(CFDictionary!, UnsafeRawPointer!) -> Boo
Returns a Boolean value that indicates whether a given value is in a dictionary.
func CFDictionaryGetCount(CFDictionary!) -> CFIndex
Returns the number of key-value pairs in a dictionary.
func CFDictionaryGetCountOfKey(CFDictionary!, UnsafeRawPointer!) ->
CFIndex
Returns the number of times a key occurs in a dictionary.
func CFDictionaryGetCountOfValue(CFDictionary!, UnsafeRawPointer!) ->
CFIndex
Topics
Creating a dictionary
Examining a dictionary


## Page 61

Counts the number of times a given value occurs in the dictionary.
func CFDictionaryGetKeysAndValues(CFDictionary!, UnsafeMutablePointer<
UnsafeRawPointer?>!, UnsafeMutablePointer<UnsafeRawPointer?>!)
Fills two buffers with the keys and values from a dictionary.
func CFDictionaryGetValue(CFDictionary!, UnsafeRawPointer!) -> UnsafeRa
Pointer!
Returns the value associated with a given key.
func CFDictionaryGetValueIfPresent(CFDictionary!, UnsafeRawPointer!,
UnsafeMutablePointer<UnsafeRawPointer?>!) -> Bool
Returns a Boolean value that indicates whether a given value for a given key is in a dictionary
and returns that value indirectly if it exists.
func CFDictionaryApplyFunction(CFDictionary!, ((UnsafeRawPointer?,
UnsafeRawPointer?, UnsafeMutableRawPointer?) -> Void)!, UnsafeMutableRa
Pointer!)
Calls a function once for each key-value pair in a dictionary.
func CFDictionaryGetTypeID() -> CFTypeID
Returns the type identifier for the CFDictionary opaque type.
typealias CFDictionaryApplierFunction
Prototype of a callback function that may be applied to every key-value pair in a dictionary.
typealias CFDictionaryCopyDescriptionCallBack
Prototype of a callback function used to get a description of a value or key in a dictionary.
typealias CFDictionaryEqualCallBack
Prototype of a callback function used to determine if two values or keys in a dictionary are
equal.
typealias CFDictionaryHashCallBack
Prototype of a callback function invoked to compute a hash code for a key. Hash codes are
used when key-value pairs are accessed, added, or removed from a collection.
Applying a function to a dictionary
Getting the CFDictionary type ID
Callbacks


## Page 62

typealias CFDictionaryReleaseCallBack
Prototype of a callback function used to release a key-value pair before it’s removed from a
dictionary.
typealias CFDictionaryRetainCallBack
Prototype of a callback function used to retain a value or key being added to a dictionary.
struct CFDictionaryKeyCallBacks
This structure contains the callbacks used to retain, release, describe, and compare the keys
in a dictionary.
struct CFDictionaryValueCallBacks
This structure contains the callbacks used to retain, release, describe, and compare the
values in a dictionary.
Predefined Callback Structures
CFDictionary provides some predefined callbacks for your convenience.
CFMutableDictionary
Equatable, Hashable
Data Types
Constants
Relationships
Inherited By
Conforms To
See Also
Related Documentation


## Page 63

Property List Programming Topics for Core Foundation
Collections Programming Topics for Core Foundation
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
class CFError
class CFFileDescriptor
Opaque Types


## Page 64

A CFError object encapsulates more rich and extensible error information than is possible using
only an error code or error string. The core attributes of a CFError object are an error domain
(represented by a string), a domain-specific error code, and a “user info” dictionary containing
application-specific information. Errors are required to have a domain and an error code within tha
domain. Several well-known domains are defined corresponding to Mach, POSIX, and OSStatus
errors.
The optional “user info” dictionary may provide additional information that might be useful for the
interpretation and reporting of the error, including a human-readable description for the error. The
“user info” dictionary sometimes includes another CFError object that represents an error in a
subsystem underlying the error represented by the containing CFError object. This underlying err
object may provide more specific information about the cause of the error.
In general, a method should signal an error condition by returning, for example, false or NULL
rather than by the simple presence of an error object. The method can then optionally return an
CFError object by reference, in order to further describe the error.
CFError is toll-free bridged to NSError in the Foundation framework—for more details on toll-fre
bridging, see Toll-Free Bridged Types. NSError has some additional guidelines that make it easy
to report errors automatically to users and attempt to recover from them. See Error Handling
Programming Guide for more information on NSError programming guidelines.
Overview
Topics
Core Foundation / CFError
Class
CFError
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 65

func CFErrorCreate(CFAllocator!, CFErrorDomain!, CFIndex, CFDictionary!
-> CFError!
Creates a new CFError object.
func CFErrorCreateWithUserInfoKeysAndValues(CFAllocator!, CFErrorDomain
!, CFIndex, UnsafePointer<UnsafeRawPointer?>!, UnsafePointer<UnsafeRaw
Pointer?>!, CFIndex) -> CFError!
Creates a new CFError object using given keys and values to create the user info dictionary.
func CFErrorGetDomain(CFError!) -> CFErrorDomain!
Returns the error domain for a given CFError.
func CFErrorGetCode(CFError!) -> CFIndex
Returns the error code for a given CFError.
func CFErrorCopyUserInfo(CFError!) -> CFDictionary!
Returns the user info dictionary for a given CFError.
func CFErrorCopyDescription(CFError!) -> CFString!
Returns a human-presentable description for a given error.
func CFErrorCopyFailureReason(CFError!) -> CFString!
Returns a human-presentable failure reason for a given error.
func CFErrorCopyRecoverySuggestion(CFError!) -> CFString!
Returns a human presentable recovery suggestion for a given error.
func CFErrorGetTypeID() -> CFTypeID
Returns the type identifier for the CFError opaque type.
Error domains
These constants define domains for CFError objects.
Creating a CFError
Getting Information About an Error
Getting the CFError Type ID
Constants


## Page 66

Keys for the user info dictionary
Keys in the userInfo dictionary.
Copyable
Equatable
Error
Hashable
Sendable
SendableMetatype
Error Handling Programming Guide
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
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 67

class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFFileDescriptor


## Page 68

The CFFileDescriptor provides an opaque type to monitor file descriptors for read and write activi
via CFRunLoop.
You use CFFileDescriptor to monitor file descriptors for read and write activity via CFRunLoop usi
callbacks. Each call back is one-shot, and must be re-enabled if you want to get another one.
You can re-enable the callback in the callback function itself, but you must completely service the
file descriptor before doing so. For example, if you create a CFFileDescriptor for a pipe and get a
callback because there are bytes to be read, then if you don’t read all of the bytes but nevertheles
re-enable the CFFileDescriptor for read activity, you’ll get called back again immediately.
You can monitor kqueue file descriptors for read activity to find out when an event the kqueue is
filtering for has occurred. You are responsible for understanding the use of the kevent() API and
inserting and removing filters from the kqueue file descriptor yourself.
The following example takes a UNIX process ID as argument, and watches up to 20 seconds, and
reports if the process terminates in that time:
Overview
Core Foundation / CFFileDescriptor
Class
CFFileDescriptor
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 69

func CFFileDescriptorCreate(CFAllocator!, CFFileDescriptorNative
Descriptor, Bool, CFFileDescriptorCallBack!, UnsafePointer<CFFile
DescriptorContext>!) -> CFFileDescriptor!
Creates a new CFFileDescriptor.
func CFFileDescriptorGetNativeDescriptor(CFFileDescriptor!) -> CFFile
DescriptorNativeDescriptor
Returns the native file descriptor for a given CFFileDescriptor.
func CFFileDescriptorIsValid(CFFileDescriptor!) -> Bool
Returns a Boolean value that indicates whether the native file descriptor for a given
CFFileDescriptor is valid.
Topics
Creating a CFFileDescriptor
Getting Information About a File Descriptor


## Page 70

func CFFileDescriptorGetContext(CFFileDescriptor!, UnsafeMutablePointer
CFFileDescriptorContext>!)
Gets the context for a given CFFileDescriptor.
func CFFileDescriptorInvalidate(CFFileDescriptor!)
Invalidates a CFFileDescriptor object.
func CFFileDescriptorEnableCallBacks(CFFileDescriptor!, CFOptionFlags)
Enables callbacks for a given CFFileDescriptor.
func CFFileDescriptorDisableCallBacks(CFFileDescriptor!, CFOptionFlags)
Disables callbacks for a given CFFileDescriptor.
func CFFileDescriptorCreateRunLoopSource(CFAllocator!, CFFileDescriptor
!, CFIndex) -> CFRunLoopSource!
Creates a new runloop source for a given CFFileDescriptor.
func CFFileDescriptorGetTypeID() -> CFTypeID
Returns the type identifier for the CFFileDescriptor opaque type.
typealias CFFileDescriptorNativeDescriptor
Defines a type for the native file descriptor.
typealias CFFileDescriptorCallBack
Defines a structure for a callback for a CFFileDescriptor.
struct CFFileDescriptorContext
Defines a structure for the context of a CFFileDescriptor.
Invalidating a File Descriptor
Managing Callbacks
Creating a Run Loop Source
Getting the CFFileDescriptor Type ID
Data Types


## Page 71

Callback Identifiers
Constants that identify the read and write callbacks.
Equatable, Hashable
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
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 72

class CFDictionary
class CFError


## Page 73

Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
Relationships
Conforms To
See Also
Opaque Types
Core Foundation / CFFileSecurity
Class
CFFileSecurity
Encapsulates a file system object’s security information in a Core Foundation
object.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 74

class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 75

Unicode operations such as collation and text boundary determination can be affected by the
conventions of a particular language or region. CFLocale objects specify language-specific or
region-specific information for locale-sensitive operations.
The CFLocale opaque type provides support for obtaining available locales, obtaining localized
locale names, and converting among locale data formats. Locale identifiers in macOS follow the
IETF’s BCP 47. CFLocale never uses Script Manager codes (except for the legacy support provide
by CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(_:_:_:
—the Script Manager and all its concepts are deprecated.
For more information on locale identifiers, read Internationalization and Localization Guide. It is als
useful to read the ICU’s User Guide for the Locale Class.
CFLocale is “toll-free bridged” with its Cocoa Foundation counterpart, NSLocale. This means tha
the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSLocale * parameter, you can
pass in a CFLocaleRef, and in a function where you see a CFLocaleRef parameter, you can
pass in an NSLocale instance. See Toll-Free Bridged Types for more information on toll-free
bridging.
Overview
Topics
Creating a Locale
Core Foundation / CFLocale
Class
CFLocale
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 76

func CFLocaleCopyCurrent() -> CFLocale!
Returns a copy of the logical locale for the current user.
func CFLocaleCreate(CFAllocator!, CFLocaleIdentifier!) -> CFLocale!
Creates a locale for the given arbitrary locale identifier.
func CFLocaleCreateCopy(CFAllocator!, CFLocale!) -> CFLocale!
Returns a copy of a locale.
func CFLocaleGetSystem() -> CFLocale!
Returns the root, canonical locale.
func CFLocaleCopyAvailableLocaleIdentifiers() -> CFArray!
Returns an array of CFString objects that represents all locales for which locale data is
available.
func CFLocaleCopyISOCountryCodes() -> CFArray!
Returns an array of CFString objects that represents all known legal ISO country codes.
func CFLocaleCopyISOLanguageCodes() -> CFArray!
Returns an array of CFString objects that represents all known legal ISO language codes.
func CFLocaleCopyISOCurrencyCodes() -> CFArray!
Returns an array of CFString objects that represents all known legal ISO currency codes.
func CFLocaleCopyCommonISOCurrencyCodes() -> CFArray!
Returns an array of strings that represents ISO currency codes for currencies in common us
func CFLocaleCopyPreferredLanguages() -> CFArray!
Returns the array of canonicalized language IDs that the user prefers.
func CFLocaleCopyDisplayNameForPropertyValue(CFLocale!, CFLocaleKey!,
CFString!) -> CFString!
Getting System Locale Information
Getting ISO Information
Language Preferences
Getting Information About a Locale


## Page 77

Returns the display name for the given value.
func CFLocaleGetValue(CFLocale!, CFLocaleKey!) -> CFTypeRef!
Returns the corresponding value for the given key of a locale’s key-value pair.
func CFLocaleGetIdentifier(CFLocale!) -> CFLocaleIdentifier!
Returns the given locale’s identifier.
func CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(
CFAllocator!, LangCode, RegionCode) -> CFLocaleIdentifier!
Returns a canonical locale identifier from given language and region codes.
func CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocator!,
CFString!) -> CFLocaleIdentifier!
Returns a canonical language identifier by mapping an arbitrary locale identification string to
the canonical identifier
func CFLocaleCreateCanonicalLocaleIdentifierFromString(CFAllocator!,
CFString!) -> CFLocaleIdentifier!
Returns a canonical locale identifier by mapping an arbitrary locale identification string to the
canonical identifier.
func CFLocaleCreateComponentsFromLocaleIdentifier(CFAllocator!, CFLocal
Identifier!) -> CFDictionary!
Returns a dictionary containing the result from parsing a locale ID consisting of language,
script, country or region, variant, and keyword/value pairs.
func CFLocaleCreateLocaleIdentifierFromComponents(CFAllocator!,
CFDictionary!) -> CFLocaleIdentifier!
Returns a locale identifier consisting of language, script, country or region, variant, and
keyword/value pairs derived from a dictionary containing the source information.
func CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode(CFAllocator!,
UInt32) -> CFLocaleIdentifier!
Returns a locale identifier from a Windows locale code.
func CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(CFLocaleIdentifie
!) -> UInt32
Returns a Windows locale code from the locale identifier.
Getting and Creating Locale Identifiers


## Page 78

func CFLocaleGetLanguageCharacterDirection(CFString!) -> CFLocale
LanguageDirection
Returns the character direction for the specified ISO language code.
func CFLocaleGetLanguageLineDirection(CFString!) -> CFLocaleLanguage
Direction
Returns the line direction for the specified ISO language code.
func CFLocaleGetTypeID() -> CFTypeID
Returns the type identifier for the CFLocale opaque type.
enum CFLocaleLanguageDirection
These constants describe the text direction for a language. They are returned by the functio
CFLocaleGetLanguageCharacterDirection(_:) and CFLocaleGetLanguageLin
Direction(_:).
Locale Property Keys
Predefined locale keys used to get property values.
Locale Calendar Identifiers
Predefined locale keys used to get calendar values—values for kCFLocaleCalendar
Identifier.
Locale Change Notification
Identifier for notification sent if the current locale changes.
Getting Line and Character Direction for a Language
Getting the CFLocale Type ID
Constants
Relationships
Conforms To


## Page 79

Equatable, Hashable
Internationalization and Localization Guide
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
class CFError
See Also
Related Documentation
Opaque Types


## Page 80

A CFMachPort object is a wrapper for a native Mach port (mach_port_t). Mach ports are the
native communication channel for the macOS kernel.
CFMachPort does not provide a function to send messages, so you primarily use a CFMachPort
object if you need to listen to a Mach port that you obtained by other means. You can get a callba
when a message arrives on the port or when the port becomes invalid, such as when the native
port dies.
To listen for messages you need to create a run loop source with CFMachPortCreateRunLoop
Source(_:_:_:) and add it to a run loop with CFRunLoopAddSource(_:_:_:).
Important
If you want to tear down the connection, you must invalidate the port (using CFMachPort
Invalidate(_:)) before releasing the runloop source and the Mach port object.
To send data, you must use the Mach APIs with the native Mach port, which is not described here
Alternatively, you can use a CFMessagePort object, which can send arbitrary data.
Mach ports only support communication on the local machine. For network communication, you
have to use a CFSocket object.
Overview
Topics
Core Foundation / CFMachPort
Class
CFMachPort
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 81

func CFMachPortCreate(CFAllocator!, CFMachPortCallBack!, UnsafeMutable
Pointer<CFMachPortContext>!, UnsafeMutablePointer<DarwinBoolean>!) ->
CFMachPort!
Creates a CFMachPort object with a new Mach port.
func CFMachPortCreateWithPort(CFAllocator!, mach_port_t, CFMachPortCall
Back!, UnsafeMutablePointer<CFMachPortContext>!, UnsafeMutablePointer<
DarwinBoolean>!) -> CFMachPort!
Creates a CFMachPort object for a pre-existing native Mach port.
func CFMachPortInvalidate(CFMachPort!)
Invalidates a CFMachPort object, stopping it from receiving any more messages.
func CFMachPortCreateRunLoopSource(CFAllocator!, CFMachPort!, CFIndex) 
> CFRunLoopSource!
Creates a CFRunLoopSource object for a CFMachPort object.
func CFMachPortSetInvalidationCallBack(CFMachPort!, CFMachPort
InvalidationCallBack!)
Sets the callback function invoked when a CFMachPort object is invalidated.
func CFMachPortGetContext(CFMachPort!, UnsafeMutablePointer<CFMachPort
Context>!)
Returns the context information for a CFMachPort object.
func CFMachPortGetInvalidationCallBack(CFMachPort!) -> CFMachPort
InvalidationCallBack!
Returns the invalidation callback function for a CFMachPort object.
func CFMachPortGetPort(CFMachPort!) -> mach_port_t
Returns the native Mach port represented by a CFMachPort object.
func CFMachPortIsValid(CFMachPort!) -> Bool
Returns a Boolean value that indicates whether a CFMachPort object is valid and able to
receive messages.
Creating a CFMachPort Object
Configuring a CFMachPort Object
Examining a CFMachPort Object


## Page 82

func CFMachPortGetTypeID() -> CFTypeID
Returns the type identifier for the CFMachPort opaque type.
typealias CFMachPortCallBack
Callback invoked to process a message received on a CFMachPort object.
typealias CFMachPortInvalidationCallBack
Callback invoked when a CFMachPort object is invalidated.
struct CFMachPortContext
A structure that contains program-defined data and callbacks with which you can configure 
CFMachPort object’s behavior.
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
Getting the CFMachPort Type ID
Callbacks
Data Types
Relationships
Conforms To
See Also
Opaque Types


## Page 83

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


## Page 84

CFMessagePort objects provide a communications channel that can transmit arbitrary data
between multiple threads or processes on the local machine.
You create a local message port with CFMessagePortCreateLocal(_:_:_:_:_:) and make
available to other processes by giving it a name, either when you create it or later with CFMessag
PortSetName(_:_:). Other processes then connect to it using CFMessagePortCreate
Remote(_:_:), specifying the name of the port.
To listen for messages, you need to create a run loop source with CFMessagePortCreateRun
LoopSource(_:_:_:) and add it to a run loop with CFRunLoopAddSource(_:_:_:).
Important
If you want to tear down the connection, you must invalidate the port (using CFMessagePort
Invalidate(_:)) before releasing the runloop source and the message port object.
Your message port’s callback function will be called when a message arrives. To send data, you
store the data in a CFData object and call CFMessagePortSendRequest(_:_:_:_:_:_:_:)
You can optionally have the function wait for a reply and return the reply in another CFData object
Message ports only support communication on the local machine. For network communication, yo
have to use a CFSocket object.
Overview
Core Foundation / CFMessagePort
Class
CFMessagePort
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 85

func CFMessagePortCreateLocal(CFAllocator!, CFString!, CFMessagePortCal
Back!, UnsafeMutablePointer<CFMessagePortContext>!, UnsafeMutablePointe
<DarwinBoolean>!) -> CFMessagePort!
Returns a local CFMessagePort object.
func CFMessagePortCreateRemote(CFAllocator!, CFString!) -> CFMessagePor
!
Returns a CFMessagePort object connected to a remote port.
func CFMessagePortCreateRunLoopSource(CFAllocator!, CFMessagePort!,
CFIndex) -> CFRunLoopSource!
Creates a CFRunLoopSource object for a CFMessagePort object.
func CFMessagePortSetInvalidationCallBack(CFMessagePort!, CFMessagePort
InvalidationCallBack!)
Sets the callback function invoked when a CFMessagePort object is invalidated.
func CFMessagePortSetName(CFMessagePort!, CFString!) -> Bool
Sets the name of a local CFMessagePort object.
func CFMessagePortInvalidate(CFMessagePort!)
Invalidates a CFMessagePort object, stopping it from receiving or sending any more
messages.
func CFMessagePortSendRequest(CFMessagePort!, Int32, CFData!, CFTime
Interval, CFTimeInterval, CFString!, UnsafeMutablePointer<Unmanaged<
CFData>?>!) -> Int32
Sends a message to a remote CFMessagePort object.
func CFMessagePortSetDispatchQueue(CFMessagePort!, dispatch_queue_t!)
Schedules callbacks for the specified message port on the specified dispatch queue.
Topics
Creating a CFMessagePort Object
Configuring a CFMessagePort Object
Using a Message Port


## Page 86

func CFMessagePortGetContext(CFMessagePort!, UnsafeMutablePointer<
CFMessagePortContext>!)
Returns the context information for a CFMessagePort object.
func CFMessagePortGetInvalidationCallBack(CFMessagePort!) -> CFMessage
PortInvalidationCallBack!
Returns the invalidation callback function for a CFMessagePort object.
func CFMessagePortGetName(CFMessagePort!) -> CFString!
Returns the name with which a CFMessagePort object is registered.
func CFMessagePortIsRemote(CFMessagePort!) -> Bool
Returns a Boolean value that indicates whether a CFMessagePort object represents a remot
port.
func CFMessagePortIsValid(CFMessagePort!) -> Bool
Returns a Boolean value that indicates whether a CFMessagePort object is valid and able to
send or receive messages.
func CFMessagePortGetTypeID() -> CFTypeID
Returns the type identifier for the CFMessagePort opaque type.
typealias CFMessagePortCallBack
Callback invoked to process a message received on a CFMessagePort object.
typealias CFMessagePortInvalidationCallBack
Callback invoked when a CFMessagePort object is invalidated.
struct CFMessagePortContext
A structure that contains program-defined data and callbacks with which you can configure 
CFMessagePort object’s behavior.
Examining a Message Port
Getting the CFMessagePort Type ID
Callbacks
Data Types


## Page 87

CFMessagePortSendRequest Error Codes
Error codes for CFMessagePortSendRequest.
Equatable, Hashable
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
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 88

class CFDictionary
class CFError


## Page 89

CFMutableArray manages dynamic arrays. The basic interface for managing arrays is provided by
CFArray. CFMutableArray adds functions to modify the contents of an array.
You create a mutable array object using either the CFArrayCreateMutable(_:_:_:) or
CFArrayCreateMutableCopy(_:_:_:) function.
CFMutableArray provides several functions for changing the contents of an array, for example the
CFArrayAppendValue(_:_:) and CFArrayInsertValueAtIndex(_:_:_:) functions add
values to an array and CFArrayRemoveValueAtIndex(_:_:) removes values from an array.
You can also reorder the contents of an array using CFArrayExchangeValuesAtIndices(_:
_:_:) and CFArraySortValues(_:_:_:_:).
CFMutableArray is “toll-free bridged” with its Cocoa Foundation counterpart, NSMutableArray
This means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSMutableArray *
parameter, you can pass in a CFMutableArrayRef, and in a function where you see a
CFMutableArrayRef parameter, you can pass in an NSMutableArray instance. This fact also
applies to concrete subclasses of NSMutableArray. See Toll-Free Bridged Types for more
information on toll-free bridging.
Overview
Topics
CFMutableArray Miscellaneous Functions
Core Foundation / CFMutableArray
Class
CFMutableArray
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 90

func CFArrayAppendArray(CFMutableArray!, CFArray!, CFRange)
Adds the values from one array to another array.
func CFArrayAppendValue(CFMutableArray!, UnsafeRawPointer!)
Adds a value to an array giving it the new largest index.
func CFArrayCreateMutable(CFAllocator!, CFIndex, UnsafePointer<CFArray
CallBacks>!) -> CFMutableArray!
Creates a new empty mutable array.
func CFArrayCreateMutableCopy(CFAllocator!, CFIndex, CFArray!) ->
CFMutableArray!
Creates a new mutable array with the values from another array.
func CFArrayExchangeValuesAtIndices(CFMutableArray!, CFIndex, CFIndex)
Exchanges the values at two indices of an array.
func CFArrayInsertValueAtIndex(CFMutableArray!, CFIndex, UnsafeRaw
Pointer!)
Inserts a value into an array at a given index.
func CFArrayRemoveAllValues(CFMutableArray!)
Removes all the values from an array, making it empty.
func CFArrayRemoveValueAtIndex(CFMutableArray!, CFIndex)
Removes the value at a given index from an array.
func CFArrayReplaceValues(CFMutableArray!, CFRange, UnsafeMutablePointe
<UnsafeRawPointer?>!, CFIndex)
Replaces a range of values in an array.
func CFArraySetValueAtIndex(CFMutableArray!, CFIndex, UnsafeRawPointer!
Changes the value at a given index in an array.
func CFArraySortValues(CFMutableArray!, CFRange, CFComparatorFunction!,
UnsafeMutableRawPointer!)
Sorts the values in an array using a given comparison function.
Relationships


## Page 91

CFArray
Equatable, Hashable
Collections Programming Topics for Core Foundation
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
Inherits From
Conforms To
See Also
Related Documentation
Opaque Types


## Page 92

class CFError


## Page 93

Instances of CFMutableAttributedString manage mutable character strings and associated sets o
attributes (for example, font and kerning information) that apply to individual characters or ranges
of characters in the string. CFAttributedString as defined in CoreFoundation provides the basic
container functionality, while higher levels provide definitions for standard attributes, their values,
and additional behaviors involving these. CFMutableAttributedString represents a mutable string—
use CFAttributedString to create and manage an attributed string that cannot be changed after it
has been created.
CFMutableAttributedString is not a “subclass” of CFMutableString; that is, it does not respond to
CFMutableString (or CFString) function calls. CFAttributedString conceptually contains a
CFMutableString to which it applies attributes. This protects you from ambiguities caused by the
semantic differences between simple and attributed string. Functions defined for
CFAttributedString can be applied to a CFMutableAttributedString object.
Attributes are identified by key/value pairs stored in CFDictionary objects. Keys must be CFString
objects, while the corresponding values are CFType objects of an appropriate type. See the
attribute constants in NSAttributedString Application Kit Additions Reference for standard attribut
names in macOS and NSAttributedString UIKit Additions Reference on iOS.
Important
Attribute dictionaries set for an attributed string must always be created with
kCFCopyStringDictionaryKeyCallbacks for their dictionary key callbacks and
kCFTypeDictionaryValueCallBacks for their value callbacks; otherwise it’s an error.
Overview
Core Foundation / CFMutableAttributedString
Class
CFMutableAttributedString
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 94

When you modify the contents of a mutable attributed string, it may have to do a lot of work to
ensure it is internally consistent, and to coalesce runs of identical attributes. You can call
CFAttributedStringBeginEditing(_:) and CFAttributedStringEndEditing(_:)
around a set of related mutation calls that don’t require the string to be in consistent state in
between, and thereby reduce the amount of work necessary. These calls can be nested.
CFMutableAttributedString is “toll-free bridged” with its Foundation counterpart,
NSMutableAttributedString. This means that the Core Foundation type is interchangeable in
function or method calls with the bridged Foundation object. Therefore, in a method where you se
an NSMutableAttributedString * parameter, you can pass in an object of type CFMutable
AttributedStringRef, and in a function where you see a CFMutableAttributedString
Ref parameter, you can pass in an NSMutableAttributedString instance. See Toll-Free
Bridged Types for more information on toll-free bridging.
There is not always a 1:1 mapping between NSMutableAttributedString‘s methods and
CFMutableAttributedString’s functions. For example, to perform an operation equivalent to
NSMutableAttributedString’s append(_:) method on a CFMutableAttributedString objec
you can use CFAttributedStringReplaceAttributedString(_:_:_:) and specify
CFRangeMake(CFAttributedStringGetLength(attrStr), 0) as the range. Alternativel
you can cast the CFMutableAttributedString object to an NSMutableAttributedString objec
and send the appendAttributedString: message.
func CFAttributedStringCreateMutable(CFAllocator!, CFIndex) -> CFMutabl
AttributedString!
Creates a mutable attributed string.
func CFAttributedStringCreateMutableCopy(CFAllocator!, CFIndex,
CFAttributedString!) -> CFMutableAttributedString!
Creates a mutable copy of an attributed string.
func CFAttributedStringBeginEditing(CFMutableAttributedString!)
Defers internal consistency-checking and coalescing for a mutable attributed string.
func CFAttributedStringEndEditing(CFMutableAttributedString!)
Re-enables internal consistency-checking and coalescing for a mutable attributed string.
Topics
Creating a CFMutableAttributedString
Modifying a CFMutableAttributedString


## Page 95

func CFAttributedStringGetMutableString(CFMutableAttributedString!) ->
CFMutableString!
Gets as a mutable string the string for an attributed string.
func CFAttributedStringRemoveAttribute(CFMutableAttributedString!,
CFRange, CFString!)
Removes the value of a single attribute over a specified range.
func CFAttributedStringReplaceString(CFMutableAttributedString!, CFRang
, CFString!)
Modifies the string of an attributed string.
func CFAttributedStringReplaceAttributedString(CFMutableAttributedStrin
!, CFRange, CFAttributedString!)
Replaces the attributed substring over a range with another attributed string.
func CFAttributedStringSetAttribute(CFMutableAttributedString!, CFRange
CFString!, CFTypeRef!)
Sets the value of a single attribute over the specified range.
func CFAttributedStringSetAttributes(CFMutableAttributedString!, CFRang
, CFDictionary!, Bool)
Sets the value of attributes of a mutable attributed string over a specified range.
CFAttributedString
Equatable, Hashable
Relationships
Inherits From
Conforms To
See Also
Related Documentation


## Page 96

Property List Programming Topics for Core Foundation
String Programming Guide for Core Foundation
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
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
Opaque Types


## Page 97

CFMutableBag manages dynamic bags. The basic interface for managing bags is provided by
CFBag. CFMutableBag adds functions to modify the contents of a bag.
You create a mutable bag object using either the CFBagCreateMutable(_:_:_:) or CFBag
CreateMutableCopy(_:_:_:) function.
CFMutableBag provides several functions for adding and removing values from a bag. The CFBag
AddValue(_:_:) function adds a value to a bag and CFBagRemoveValue(_:_:) removes
values from a bag.
func CFBagCreateMutable(CFAllocator!, CFIndex, UnsafePointer<CFBagCall
Backs>!) -> CFMutableBag!
Creates a new empty mutable bag.
func CFBagCreateMutableCopy(CFAllocator!, CFIndex, CFBag!) -> CFMutable
Bag!
Creates a new mutable bag with the values from another bag.
Overview
Topics
Creating a Mutable Bag
Core Foundation / CFMutableBag
Class
CFMutableBag
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 98

func CFBagAddValue(CFMutableBag!, UnsafeRawPointer!)
Adds a value to a mutable bag.
func CFBagRemoveAllValues(CFMutableBag!)
Removes all values from a mutable bag.
func CFBagRemoveValue(CFMutableBag!, UnsafeRawPointer!)
Removes a value from a mutable bag.
func CFBagReplaceValue(CFMutableBag!, UnsafeRawPointer!)
Replaces a value in a mutable bag.
func CFBagSetValue(CFMutableBag!, UnsafeRawPointer!)
Sets a value in a mutable bag.
CFBag
Equatable, Hashable
Collections Programming Topics for Core Foundation
Modifying a Mutable Bag
Relationships
Inherits From
Conforms To
See Also
Related Documentation
Opaque Types


## Page 99

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
class CFError


## Page 100

CFMutableBitVector objects manage dynamic bit vectors. The basic interface for managing bit
vectors is provided by CFBitVector. CFMutableBitVector adds functions to modify the contents
of a bit vector.
You create a mutable bit vector object using either the CFBitVectorCreateMutable(_:_:) o
CFBitVectorCreateMutableCopy(_:_:_:) function. You add to and remove from a bit
vector by altering the size of the bit vector with the CFBitVectorSetCount(_:_:) function
func CFBitVectorCreateMutable(CFAllocator!, CFIndex) -> CFMutableBit
Vector!
Creates a mutable bit vector.
func CFBitVectorCreateMutableCopy(CFAllocator!, CFIndex, CFBitVector!) 
> CFMutableBitVector!
Creates a new mutable bit vector from a pre-existing bit vector.
Overview
Topics
Creating a CFMutableBitVector Object
Modifying a Bit Vector
Core Foundation / CFMutableBitVector
Class
CFMutableBitVector
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 101

func CFBitVectorFlipBitAtIndex(CFMutableBitVector!, CFIndex)
Flips a bit value in a bit vector.
func CFBitVectorFlipBits(CFMutableBitVector!, CFRange)
Flips a range of bit values in a bit vector.
func CFBitVectorSetAllBits(CFMutableBitVector!, CFBit)
Sets all bits in a bit vector to a particular value.
func CFBitVectorSetBitAtIndex(CFMutableBitVector!, CFIndex, CFBit)
Sets the value of a particular bit in a bit vector.
func CFBitVectorSetBits(CFMutableBitVector!, CFRange, CFBit)
Sets a range of bits in a bit vector to a particular value.
func CFBitVectorSetCount(CFMutableBitVector!, CFIndex)
Changes the size of a mutable bit vector.
CFBitVector
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
Relationships
Inherits From
Conforms To
See Also
Opaque Types


## Page 102

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


## Page 103

CFMutableCharacterSet manages dynamic character sets. The basic interface for managing
character sets is provided by CFCharacterSet. CFMutableCharacterSet adds functions to
modify the contents of a character set.
You create a mutable character set object using either the CFCharacterSetCreate
Mutable(_:) or CFCharacterSetCreateMutableCopy(_:_:) function.
CFMutableCharacterSet is “toll-free bridged” with its Cocoa Foundation counterpart, NSMutable
CharacterSet. This means that the Core Foundation type is interchangeable in function or
method calls with the bridged Foundation object. Therefore, in a method where you see an
NSMutableCharacterSet * parameter, you can pass in a CFMutableCharacterSetRef, a
in a function where you see a CFMutableCharacterSetRef parameter, you can pass in an
NSMutableCharacterSet instance. This capability also applies to concrete subclasses of
NSMutableCharacterSet. See Toll-Free Bridged Types for more information on toll-free bridging.
func CFCharacterSetCreateMutable(CFAllocator!) -> CFMutableCharacterSet
Creates a new empty mutable character set.
Overview
Topics
Creating a Mutable Character Set
Core Foundation / CFMutableCharacterSet
Class
CFMutableCharacterSet
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 104

func CFCharacterSetCreateMutableCopy(CFAllocator!, CFCharacterSet!) ->
CFMutableCharacterSet!
Creates a new mutable character set with the values from another character set.
func CFCharacterSetAddCharactersInRange(CFMutableCharacterSet!, CFRange
Adds a given range to a character set.
func CFCharacterSetAddCharactersInString(CFMutableCharacterSet!,
CFString!)
Adds the characters in a given string to a character set.
func CFCharacterSetRemoveCharactersInRange(CFMutableCharacterSet!,
CFRange)
Removes a given range of Unicode characters from a character set.
func CFCharacterSetRemoveCharactersInString(CFMutableCharacterSet!,
CFString!)
Removes the characters in a given string from a character set.
func CFCharacterSetIntersect(CFMutableCharacterSet!, CFCharacterSet!)
Forms an intersection of two character sets.
func CFCharacterSetInvert(CFMutableCharacterSet!)
Inverts the content of a given character set.
func CFCharacterSetUnion(CFMutableCharacterSet!, CFCharacterSet!)
Forms the union of two character sets.
Adding Characters
Removing Characters
Logical Operations
Relationships
Inherits From


## Page 105

CFCharacterSet
Equatable, Hashable
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
class CFDate
class CFDateFormatter
class CFDictionary
class CFError
Conforms To
See Also
Related Documentation
Opaque Types


## Page 106

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


## Page 107

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


## Page 108

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


## Page 109

class CFDateFormatter
class CFDictionary
class CFError


## Page 110

CFMutableDictionary manages dynamic dictionaries. The basic interface for managing dictionarie
is provided by CFDictionary. CFMutableDictionary adds functions to modify the contents of a
dictionary.
You create a mutable dictionary object using either the CFDictionaryCreateMutable(_:_:_
_:) or CFDictionaryCreateMutableCopy(_:_:_:) function. You can add key-value pairs
using the CFDictionaryAddValue(_:_:_:) and CFDictionarySetValue(_:_:_:)
functions. When adding key-value pairs to a dictionary, the keys and values are not copied—they
are retained so they are not invalidated before the dictionary is deallocated. You can remove key-
value pairs using the CFDictionaryRemoveValue(_:_:) function. When removing key-value
pairs from a dictionary, the keys and values are released.
CFMutableDictionary is “toll-free bridged” with its Cocoa Foundation counterpart, NSMutable
Dictionary. What this means is that the Core Foundation type is interchangeable in function or
method calls with the bridged Foundation object. This means that in a method where you see an
NSMutableDictionary * parameter, you can pass in a CFMutableDictionaryRef, and in a
function where you see a CFMutableDictionaryRef parameter, you can pass in an
NSMutableDictionary instance. This also applies to concrete subclasses of NSMutableDictionary.
See Toll-Free Bridged Types for more information on toll-free bridging.
Overview
Topics
Core Foundation / CFMutableDictionary
Class
CFMutableDictionary
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 111

func CFDictionaryCreateMutable(CFAllocator!, CFIndex, UnsafePointer<
CFDictionaryKeyCallBacks>!, UnsafePointer<CFDictionaryValueCallBacks>!)
-> CFMutableDictionary!
Creates a new mutable dictionary.
func CFDictionaryCreateMutableCopy(CFAllocator!, CFIndex, CFDictionary!
-> CFMutableDictionary!
Creates a new mutable dictionary with the key-value pairs from another dictionary.
func CFDictionaryAddValue(CFMutableDictionary!, UnsafeRawPointer!,
UnsafeRawPointer!)
Adds a key-value pair to a dictionary if the specified key is not already present.
func CFDictionaryRemoveAllValues(CFMutableDictionary!)
Removes all the key-value pairs from a dictionary, making it empty.
func CFDictionaryRemoveValue(CFMutableDictionary!, UnsafeRawPointer!)
Removes a key-value pair.
func CFDictionaryReplaceValue(CFMutableDictionary!, UnsafeRawPointer!,
UnsafeRawPointer!)
Replaces a value corresponding to a given key.
func CFDictionarySetValue(CFMutableDictionary!, UnsafeRawPointer!,
UnsafeRawPointer!)
Sets the value corresponding to a given key.
CFDictionary
Creating a Mutable Dictionary
Modifying a Dictionary
Relationships
Inherits From
Conforms To


## Page 112

Equatable, Hashable
Property List Programming Topics for Core Foundation
Collections Programming Topics for Core Foundation
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
class CFError
See Also
Related Documentation
Opaque Types


## Page 113

CFMutableSet manages dynamic sets. The basic interface for managing sets is provided by CFSe
CFMutableSet adds functions to modify the contents of a set.
You create a mutable set object using either the CFSetCreateMutable(_:_:_:) or CFSet
CreateMutableCopy(_:_:_:) function.
CFMutableSet provides several functions for adding and removing values from a set. The CFSet
AddValue(_:_:) function adds a value to a set and CFSetRemoveValue(_:_:) removes a
value from a set.
CFMutableSet is “toll-free bridged” with its Cocoa Foundation counterpart, NSMutableSet. Wha
this means is that the Core Foundation type is interchangeable in function or method calls with th
bridged Foundation object. This means that in a method where you see an NSMutableSet *
parameter, you can pass in a CFMutableSetRef, and in a function where you see a CFMutable
SetRef parameter, you can pass in an NSMutableSet instance. This also applies to concrete
subclasses of NSMutableSet. See Toll-Free Bridged Types for more information on toll-free
bridging.
func CFSetAddValue(CFMutableSet!, UnsafeRawPointer!)
Overview
Topics
CFMutableSet Miscellaneous Functions
Core Foundation / CFMutableSet
Class
CFMutableSet
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 114

Adds a value to a CFMutableSet object.
func CFSetCreateMutable(CFAllocator!, CFIndex, UnsafePointer<CFSetCall
Backs>!) -> CFMutableSet!
Creates an empty CFMutableSet object.
func CFSetCreateMutableCopy(CFAllocator!, CFIndex, CFSet!) -> CFMutable
Set!
Creates a new mutable set with the values from another set.
func CFSetRemoveAllValues(CFMutableSet!)
Removes all values from a CFMutableSet object.
func CFSetRemoveValue(CFMutableSet!, UnsafeRawPointer!)
Removes a value from a CFMutableSet object.
func CFSetReplaceValue(CFMutableSet!, UnsafeRawPointer!)
Replaces a value in a CFMutableSet object.
func CFSetSetValue(CFMutableSet!, UnsafeRawPointer!)
Sets a value in a CFMutableSet object.
CFSet
Equatable, Hashable
Collections Programming Topics for Core Foundation
Relationships
Inherits From
Conforms To
See Also
Related Documentation


## Page 115

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
class CFError
Opaque Types


## Page 116

CFMutableString manages dynamic strings. The basic interface for managing strings is provided 
CFString. CFMutableString adds functions to modify the contents of a string.
CFMutableString is “toll-free bridged” with its Cocoa Foundation counterpart, NSMutableStrin
This means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSMutableString *
parameter, you can pass in a CFMutableStringRef, and in a function where you see a
CFMutableStringRef parameter, you can pass in an NSMutableString instance. This also
applies to concrete subclasses of NSMutableString. See Toll-Free Bridged Types for more
information on toll-free bridging.
func CFStringAppend(CFMutableString!, CFString!)
Appends the characters of a string to those of a CFMutableString object.
func CFStringAppendCharacters(CFMutableString!, UnsafePointer<UniChar>!
CFIndex)
Appends a buffer of Unicode characters to the character contents of a CFMutableString
object.
Overview
Topics
CFMutableString Miscellaneous Functions
Core Foundation / CFMutableString
Class
CFMutableString
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 117

func CFStringAppendCString(CFMutableString!, UnsafePointer<CChar>!,
CFStringEncoding)
Appends a C string to the character contents of a CFMutableString object.
func CFStringAppendFormatAndArguments(CFMutableString!, CFDictionary!,
CFString!, CVaListPointer)
Appends a formatted string to the character contents of a CFMutableString object.
func CFStringAppendPascalString(CFMutableString!, ConstStr255Param!,
CFStringEncoding)
Appends a Pascal string to the character contents of a CFMutableString object.
func CFStringCapitalize(CFMutableString!, CFLocale!)
Changes the first character in each word of a string to uppercase (if it is a lowercase
alphabetical character).
func CFStringCreateMutable(CFAllocator!, CFIndex) -> CFMutableString!
Creates an empty CFMutableString object.
func CFStringCreateMutableCopy(CFAllocator!, CFIndex, CFString!) ->
CFMutableString!
Creates a mutable copy of a string.
func CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocator!,
UnsafeMutablePointer<UniChar>!, CFIndex, CFIndex, CFAllocator!) ->
CFMutableString!
Creates a CFMutableString object whose Unicode character buffer is controlled externally.
func CFStringDelete(CFMutableString!, CFRange)
Deletes a range of characters in a string.
func CFStringFindAndReplace(CFMutableString!, CFString!, CFString!,
CFRange, CFStringCompareFlags) -> CFIndex
Replaces all occurrences of a substring within a given range.
func CFStringFold(CFMutableString!, CFStringCompareFlags, CFLocale!)
Folds a given string into the form specified by optional flags.
func CFStringInsert(CFMutableString!, CFIndex, CFString!)
Inserts a string at a specified location in the character buffer of a CFMutableString object.
func CFStringLowercase(CFMutableString!, CFLocale!)
Changes all uppercase alphabetical characters in a CFMutableString to lowercase.


## Page 118

func CFStringNormalize(CFMutableString!, CFStringNormalizationForm)
Normalizes the string into the specified form as described in Unicode Technical Report #15.
func CFStringPad(CFMutableString!, CFString!, CFIndex, CFIndex)
Enlarges a string, padding it with specified characters, or truncates the string.
func CFStringReplace(CFMutableString!, CFRange, CFString!)
Replaces part of the character contents of a CFMutableString object with another string.
func CFStringReplaceAll(CFMutableString!, CFString!)
Replaces all characters of a CFMutableString object with other characters.
func CFStringSetExternalCharactersNoCopy(CFMutableString!, UnsafeMutabl
Pointer<UniChar>!, CFIndex, CFIndex)
Notifies a CFMutableString object that its external backing store of Unicode characters has
changed.
func CFStringTransform(CFMutableString!, UnsafeMutablePointer<CFRange>!
CFString!, Bool) -> Bool
Perform in-place transliteration on a mutable string.
func CFStringTrim(CFMutableString!, CFString!)
Trims a specified substring from the beginning and end of a CFMutableString object.
func CFStringTrimWhitespace(CFMutableString!)
Trims whitespace from the beginning and end of a CFMutableString object.
func CFStringUppercase(CFMutableString!, CFLocale!)
Changes all lowercase alphabetical characters in a CFMutableString object to uppercase.
enum CFStringNormalizationForm
Unicode normalization forms as described in Unicode Technical Report #15.
Transform Identifiers for CFStringTransform
Constants that identify transforms used with CFStringTransform(_:_:_:_:).
Constants
Relationships


## Page 119

CFString
Equatable, Hashable
Property List Programming Topics for Core Foundation
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
class CFDate
class CFDateFormatter
Inherits From
Conforms To
See Also
Related Documentation
Opaque Types


## Page 120

class CFDictionary
class CFError


## Page 121

A CFNotificationCenter object provides the means by which you can send a message, or
notification, to any number of recipients, or observers, without having to know anything about the
recipients. A notification message consists of a notification name (a CFString), a pointer value tha
identifies the object posting the notification, and an optional dictionary that contains additional
information about the particular notification.
To register as an observer of a notification, you call CFNotificationCenterAddObserver(_
_:_:_:_:_:), providing an identifier for your observer, the callback function that should be call
when the notification is posted, and the name of the notification and the object in which you are
interested. The observer identifier is passed back to the callback function, along with the
notification information. You can use the identifier to distinguish multiple observers using the sam
callback function. The identifier is also used to unregister the observer with CFNotification
CenterRemoveObserver(_:_:_:_:) and CFNotificationCenterRemoveEvery
Observer(_:_:).
To send a notification, you call CFNotificationCenterPostNotification(_:_:_:_:_:)
passing in the notification information. The notification center then looks up all the observers that
registered for this notification and sends the notification information to their callback functions.
There are three types of CFNotificationCenter—a distributed notification center, a local notificatio
center, and a Darwin notification center—an application may have at most one of each type. The
distributed notification is obtained with CFNotificationCenterGetDistributedCenter()
A distributed notification center delivers notifications between applications. In this case, the
notification object must always be a CFString object and the notification dictionary must contain
only property list values. The local and Darwin notification centers are available in macOS 10.4 an
Overview
Core Foundation / CFNotificationCenter
Class
CFNotificationCenter
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 122

later, and obtained using CFNotificationCenterGetLocalCenter() and CFNotificatio
CenterGetDarwinNotifyCenter() respectively.
Unlike some other Core Foundation opaque types with names similar to a Cocoa Foundation class
(such as CFString and NSString), CFNotificationCenter objects cannot be cast (“toll-free
bridged”) to NotificationCenter objects or vice-versa.
func CFNotificationCenterGetDarwinNotifyCenter() -> CFNotificationCente
!
Returns the application’s Darwin notification center.
func CFNotificationCenterGetDistributedCenter() -> CFNotificationCenter
Returns the application’s distributed notification center.
func CFNotificationCenterGetLocalCenter() -> CFNotificationCenter!
Returns the application’s local notification center.
func CFNotificationCenterPostNotification(CFNotificationCenter!,
CFNotificationName!, UnsafeRawPointer!, CFDictionary!, Bool)
Posts a notification for an object.
func CFNotificationCenterPostNotificationWithOptions(CFNotification
Center!, CFNotificationName!, UnsafeRawPointer!, CFDictionary!, CFOptio
Flags)
Posts a notification for an object using specified options.
func CFNotificationCenterAddObserver(CFNotificationCenter!, UnsafeRaw
Pointer!, CFNotificationCallback!, CFString!, UnsafeRawPointer!,
CFNotificationSuspensionBehavior)
Registers an observer to receive notifications.
func CFNotificationCenterRemoveEveryObserver(CFNotificationCenter!,
UnsafeRawPointer!)
Topics
Accessing a Notification Center
Posting a Notification
Adding and Removing Observers


## Page 123

Stops an observer from receiving any notifications from any object.
func CFNotificationCenterRemoveObserver(CFNotificationCenter!, UnsafeRa
Pointer!, CFNotificationName!, UnsafeRawPointer!)
Stops an observer from receiving certain notifications.
func CFNotificationCenterGetTypeID() -> CFTypeID
Returns the type identifier for the CFNotificationCenter opaque type.
typealias CFNotificationCallback
Callback function invoked for each observer of a notification when the notification is posted.
enum CFNotificationSuspensionBehavior
Suspension flags that indicate how distributed notifications should be handled when the
receiving application is in the background.
Notification Posting Options
Possible options when posting notifications.
Equatable, Hashable
Notification Programming Topics
Getting the CFNotificationCenter Type ID
Callbacks
Constants
Relationships
Conforms To
See Also
Related Documentation


## Page 124

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
class CFError
Opaque Types


## Page 125

The CFNull opaque type defines a unique object used to represent null values in collection object
(which don’t allow NULL values). CFNull objects are neither created nor destroyed. Instead, a sing
CFNull constant object—kCFNull—is defined and is used wherever a null value is needed.
The CFNull opaque type is available in macOS 10.2 and later.
func CFNullGetTypeID() -> CFTypeID
Returns the type identifier for the CFNull opaque type.
Predefined Value
Predefined CFNull object.
Overview
Topics
CFNull Miscellaneous Functions
Constants
Core Foundation / CFNull
Class
CFNull
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 126

Equatable, Hashable
Collections Programming Topics for Core Foundation
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


## Page 127

class CFError


## Page 128

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


## Page 129

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


## Page 130

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


## Page 131

class CFError


## Page 132

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


## Page 133

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


## Page 134

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


## Page 135

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


## Page 136

class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 137

CFPlugIn provides a standard architecture for application extensions. With CFPlugIn, you can
design your application as a host framework that uses a set of executable code modules called
plug-ins to provide certain well-defined areas of functionality. This approach allows third-party
developers to add features to your application without requiring access to your source code. You
can also bundle together plug-ins for multiple platforms and let CFPlugIn transparently load the
appropriate plug-in at runtime. You can use CFPlugIn to add plug-in capability to, or write a plug
in for, your application.
func CFPlugInCreate(CFAllocator!, CFURL!) -> CFPlugIn!
Creates a CFPlugIn given its URL.
func CFPlugInInstanceCreate(CFAllocator!, CFUUID!, CFUUID!) -> Unsafe
MutableRawPointer!
Creates a CFPlugIn instance of a given type using a given factory.
Overview
Topics
Creating Plug-ins
Registration
Core Foundation / CFPlugIn
Class
CFPlugIn
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 138

func CFPlugInRegisterFactoryFunction(CFUUID!, CFPlugInFactoryFunction!)
-> Bool
Registers a factory function and its UUID with a CFPlugIn object.
func CFPlugInRegisterFactoryFunctionByName(CFUUID!, CFPlugIn!, CFString
!) -> Bool
Registers a factory function with a CFPlugIn object using the function’s name instead of its
UUID.
func CFPlugInRegisterPlugInType(CFUUID!, CFUUID!) -> Bool
Registers a type and its corresponding factory function with a CFPlugIn object.
func CFPlugInUnregisterFactory(CFUUID!) -> Bool
Removes the given function from a plug-in’s list of registered factory functions.
func CFPlugInUnregisterPlugInType(CFUUID!, CFUUID!) -> Bool
Removes the given type from a plug-in’s list of registered types.
func CFPlugInAddInstanceForFactory(CFUUID!)
Registers a new instance of a type with CFPlugIn.
func CFPlugInFindFactoriesForPlugInType(CFUUID!) -> CFArray!
Searches all registered plug-ins for factory functions capable of creating an instance of the
given type.
func CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUID!, CFPlugIn!) ->
CFArray!
Searches the given plug-in for factory functions capable of creating an instance of the given
type.
func CFPlugInGetBundle(CFPlugIn!) -> CFBundle!
Returns a plug-in’s bundle.
func CFPlugInGetTypeID() -> CFTypeID
Returns the type identifier for the CFPlugIn opaque type.
func CFPlugInIsLoadOnDemand(CFPlugIn!) -> Bool
Determines whether or not a plug-in is loaded on demand.
func CFPlugInRemoveInstanceForFactory(CFUUID!)
Unregisters an instance of a type with CFPlugIn.
CFPlugIn Miscellaneous Functions


## Page 139

func CFPlugInSetLoadOnDemand(CFPlugIn!, Bool)
Enables or disables load on demand for plug-ins that do dynamic registration (only when a
client requests an instance of a supported type).
typealias CFPlugInDynamicRegisterFunction
A callback which provides a plug-in the opportunity to dynamically register its types with a
host.
typealias CFPlugInFactoryFunction
Callback function that a plug-in author must implement to create a plug-in instance.
typealias CFPlugInUnloadFunction
Callback function that is called, if present, just before a plug-in’s code is unloaded.
Information Property List Keys
A plug-in’s information property list can contain these keys used for registering types,
factories, and interfaces.
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
Callbacks
Constants
Relationships
Conforms To
See Also
Opaque Types


## Page 140

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


## Page 141

CFPlugInInstance is deprecated. Use the functions defined by CFPlugIn instead.
func CFPlugInInstanceCreateWithInstanceDataSize(CFAllocator!, CFIndex,
CFPlugInInstanceDeallocateInstanceDataFunction!, CFString!, CFPlugIn
InstanceGetInterfaceFunction!) -> CFPlugInInstance!
Not recommended.
func CFPlugInInstanceGetFactoryName(CFPlugInInstance!) -> CFString!
Not recommended.
func CFPlugInInstanceGetInstanceData(CFPlugInInstance!) -> UnsafeMutabl
RawPointer!
Not recommended.
func CFPlugInInstanceGetInterfaceFunctionTable(CFPlugInInstance!,
CFString!, UnsafeMutablePointer<UnsafeMutableRawPointer?>!) -> Bool
Not recommended.
Overview
Topics
Deprecated
Core Foundation / CFPlugInInstance
Class
CFPlugInInstance
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 142

func CFPlugInInstanceGetTypeID() -> CFTypeID
Not recommended.
typealias CFPlugInInstanceDeallocateInstanceDataFunction
Not recommended.
typealias CFPlugInInstanceGetInterfaceFunction
Not recommended.
Equatable, Hashable
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
Callbacks
Relationships
Conforms To
See Also
Opaque Types


## Page 143

class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 144

CFPropertyList provides functions that convert property list objects to and from several serialized
formats such as XML. The CFPropertyList type that denotes CFPropertyList objects is an
abstract type for property list objects. Depending on the contents of the XML data used to create
the property list, CFPropertyListRef can be any of the property list objects: CFData, CFString
CFArray, CFDictionary, CFDate, CFBoolean, and CFNumber. Note that if you use a property list to
generate XML, the keys of any dictionaries in the property list must be CFString objects.
It is important to understand that CFPropertyList provides an abstraction for all the property list
types—you can think of CFPropertyList in object-oriented terms as being the superclass of
CFString, CFNumber, CFDictionary, and so on. When a Core Foundation function returns a
CFPropertyListRef, it means that the value may be any of the property list types. For example
CFPreferencesCopyAppValue(_:_:) returns a CFPropertyListRef. This means that the
value returned can be a CFString object, a CFNumber object, a CFDictionary object, and so on
again. You can use CFGetTypeID(_:) to determine what type of object a property list value is.
You use one of the CFPropertyListCreate... functions to create a property list object given
an existing property list object, raw XML data (as in a file), or a stream. You can also convert a
property list object to XML using the CFPropertyListCreateXMLData(_:_:) function. You
use the CFPropertyListWriteToStream(_:_:_:_:) function to write a property list to an
output stream, and validate a property list object using the CFPropertyListIsValid(_:_:)
function. CFPropertyList properly takes care of endian issues—a property list (whether represente
by a stream, XML, or a CFData object) created on a PowerPC-based Macintosh is correctly
interpreted on an Intel-based Macintosh, and vice versa.
For code examples illustrating how to read and write property list files, see Property List
Programming Topics for Core Foundation and in particular Saving and Restoring Property Lists.
Overview
Core Foundation / CFPropertyList
Type Alias
CFPropertyList
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 145

func CFPropertyListCreateWithData(CFAllocator!, CFData!, CFOptionFlags,
UnsafeMutablePointer<CFPropertyListFormat>!, UnsafeMutablePointer<
Unmanaged<CFError>?>!) -> Unmanaged<CFPropertyList>!
Creates a property list from a given CFData object.
func CFPropertyListCreateWithStream(CFAllocator!, CFReadStream!, CFInde
, CFOptionFlags, UnsafeMutablePointer<CFPropertyListFormat>!, Unsafe
MutablePointer<Unmanaged<CFError>?>!) -> Unmanaged<CFPropertyList>!
Create and return a property list with a CFReadStream input.
func CFPropertyListCreateDeepCopy(CFAllocator!, CFPropertyList!,
CFOptionFlags) -> CFPropertyList!
Recursively creates a copy of a given property list.
func CFPropertyListCreateFromXMLData(CFAllocator!, CFData!, CFOption
Flags, UnsafeMutablePointer<Unmanaged<CFString>?>!) -> Unmanaged<
CFPropertyList>!
Creates a property list using the specified XML or binary property list data.
Deprecated
func CFPropertyListCreateFromStream(CFAllocator!, CFReadStream!, CFInde
, CFOptionFlags, UnsafeMutablePointer<CFPropertyListFormat>!, Unsafe
MutablePointer<Unmanaged<CFString>?>!) -> Unmanaged<CFPropertyList>!
Creates a property list using data from a stream.
Deprecated
func CFPropertyListCreateData(CFAllocator!, CFPropertyList!, CFProperty
ListFormat, CFOptionFlags, UnsafeMutablePointer<Unmanaged<CFError>?>!) 
> Unmanaged<CFData>!
Returns a CFData object containing a serialized representation of a given property list in a
specified format.
Topics
Creating a Property List
Exporting a Property List


## Page 146

func CFPropertyListWrite(CFPropertyList!, CFWriteStream!, CFPropertyLis
Format, CFOptionFlags, UnsafeMutablePointer<Unmanaged<CFError>?>!) ->
CFIndex
Write the bytes of a serialized property list out to a stream.
func CFPropertyListCreateXMLData(CFAllocator!, CFPropertyList!) ->
Unmanaged<CFData>!
Creates an XML representation of the specified property list.
Deprecated
func CFPropertyListWriteToStream(CFPropertyList!, CFWriteStream!,
CFPropertyListFormat, UnsafeMutablePointer<Unmanaged<CFString>?>!) ->
CFIndex
Writes the bytes of a property list serialization out to a stream.
Deprecated
func CFPropertyListIsValid(CFPropertyList!, CFPropertyListFormat) ->
Bool
Determines if a property list is valid.
struct CFPropertyListMutabilityOptions
Type for flags that determine the degree of mutability of newly created property lists.
enum CFPropertyListFormat
Specifies the format of a property list.
Property List Mutability Options
Option flags that determine the degree of mutability of newly created property lists.
Reading and Writing Error Codes
Error codes for property list reading and writing functions such as CFPropertyListCreat
WithData(_:_:_:_:_:).
Validating a Property List
Data Types
Constants


## Page 147

Property List Programming Topics for Core Foundation
XML Programming Topics for Core Foundation
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
class CFError
See Also
Related Documentation
Opaque Types


## Page 148

CFReadStream provides an interface for reading a byte stream either synchronously or
asynchronously. You can create streams that read bytes from a block of memory, a file, or a gene
socket. All streams need to be opened, using CFReadStreamOpen(_:), before reading.
Use CFWriteStream for writing byte streams. The CFNetwork framework defines an additional
type of stream for reading responses to HTTP requests.
CFReadStream is “toll-free bridged” with its Cocoa Foundation counterpart, InputStream. This
means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSInputStream *
parameter, you can pass in a CFReadStreamRef, and in a function where you see a
CFReadStreamRef parameter, you can pass in an NSInputStream instance. Note, however, that
you may have either a delegate or callbacks but not both. See Toll-Free Bridged Types for more
information on toll-free bridging.
func CFReadStreamCreateWithBytesNoCopy(CFAllocator!, UnsafePointer<UInt
>!, CFIndex, CFAllocator!) -> CFReadStream!
Creates a readable stream for a block of memory.
Overview
Topics
Creating a Read Stream
Core Foundation / CFReadStream
Class
CFReadStream
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 149

func CFReadStreamCreateWithFile(CFAllocator!, CFURL!) -> CFReadStream!
Creates a readable stream for a file.
func CFReadStreamClose(CFReadStream!)
Closes a readable stream.
func CFReadStreamOpen(CFReadStream!) -> Bool
Opens a stream for reading.
func CFReadStreamRead(CFReadStream!, UnsafeMutablePointer<UInt8>!,
CFIndex) -> CFIndex
Reads data from a readable stream.
func CFReadStreamScheduleWithRunLoop(CFReadStream!, CFRunLoop!, CFRun
LoopMode!)
Schedules a stream into a run loop.
func CFReadStreamUnscheduleFromRunLoop(CFReadStream!, CFRunLoop!, CFRun
LoopMode!)
Removes a read stream from a given run loop.
func CFReadStreamCopyProperty(CFReadStream!, CFStreamPropertyKey!) ->
CFTypeRef!
Returns the value of a property for a stream.
func CFReadStreamGetBuffer(CFReadStream!, CFIndex, UnsafeMutablePointer
CFIndex>!) -> UnsafePointer<UInt8>!
Returns a pointer to a stream’s internal buffer of unread data, if possible.
func CFReadStreamCopyError(CFReadStream!) -> CFError!
Returns the error associated with a stream.
func CFReadStreamGetError(CFReadStream!) -> CFStreamError
Opening and Closing a Read Stream
Reading from a Stream
Scheduling a Read Stream
Examining Stream Properties


## Page 150

Returns the error status of a stream.
Deprecated
func CFReadStreamGetStatus(CFReadStream!) -> CFStreamStatus
Returns the current state of a stream.
func CFReadStreamHasBytesAvailable(CFReadStream!) -> Bool
Returns a Boolean value that indicates whether a readable stream has data that can be read
without blocking.
func CFReadStreamSetClient(CFReadStream!, CFOptionFlags, CFReadStream
ClientCallBack!, UnsafeMutablePointer<CFStreamClientContext>!) -> Bool
Assigns a client to a stream, which receives callbacks when certain events occur.
func CFReadStreamSetProperty(CFReadStream!, CFStreamPropertyKey!, CFTyp
Ref!) -> Bool
Sets the value of a property for a stream.
func CFReadStreamGetTypeID() -> CFTypeID
Returns the type identifier the CFReadStream opaque type.
typealias CFReadStreamClientCallBack
Callback invoked when certain types of activity takes place on a readable stream.
struct CFStreamClientContext
A structure that contains program-defined data and callbacks with which you can configure 
stream’s client behavior.
Setting Stream Properties
Getting the CFReadStream Type ID
Callbacks
Data Types
Relationships


## Page 151

Equatable, Hashable
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
class CFError
Conforms To
See Also
Opaque Types


## Page 152

A CFRunLoop object monitors sources of input to a task and dispatches control when they becom
ready for processing. Examples of input sources might include user input devices, network
connections, periodic or time-delayed events, and asynchronous callbacks.
Three types of objects can be monitored by a run loop: sources (CFRunLoopSource), timers
(CFRunLoopTimer), and observers (CFRunLoopObserver). To receive callbacks when these
objects need processing, you must first place these objects into a run loop with CFRunLoopAdd
Source(_:_:_:), CFRunLoopAddTimer(_:_:_:), or CFRunLoopAddObserver(_:_:_:)
You can later remove an object from the run loop (or invalidate it) to stop receiving its callback.
Each source, timer, and observer added to a run loop must be associated with one or more run loo
modes. Modes determine what events are processed by the run loop during a given iteration. Eac
time the run loop executes, it does so in a specific mode. While in that mode, the run loop
processes only the events associated with sources, timers, and observers associated with that
mode. You assign most sources to the default run loop mode (designated by the defaultMode
constant), which is used to process events when the application (or thread) is idle. However, the
system defines other modes and may execute the run loop in those other modes to limit which
sources, timers, and observers are processed. Because run-loop modes are simply specified as
strings, you can also define your own custom modes to limit the processing of events
Core Foundation defines a special pseudo-mode, called the common modes, that allow you to
associate more than one mode with a given source, timer, or observer. To specify the common
modes, use the commonModes constant for the mode when configuring the object. Each run loop
has its own independent set of common modes and the default mode (defaultMode) is always a
member of the set. To add a mode to the set of common modes, use the CFRunLoopAddCommon
Mode(_:_:) function.
Overview
Core Foundation / CFRunLoop
Class
CFRunLoop
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 153

There is exactly one run loop per thread. You neither create nor destroy a thread’s run loop. Core
Foundation automatically creates it for you as needed. You obtain the current thread’s run loop w
CFRunLoopGetCurrent(). Call CFRunLoopRun() to run the current thread’s run loop in the
default mode until the run loop is stopped with CFRunLoopStop(_:). You can also call CFRun
LoopRunInMode(_:_:_:) to run the current thread’s run loop in a specified mode for a set
period of time (or until the run loop is stopped). A run loop can only run if the requested mode has
at least one source or timer to monitor.
Run loops can be run recursively. You can call CFRunLoopRun() or CFRunLoopRunInMode(_:
_:_:) from within any run loop callout and create nested run loop activations on the current
thread’s call stack. You are not restricted in which modes you can run from within a callout. You c
create another run loop activation running in any available run loop mode, including any modes
already running higher in the call stack.
Cocoa applications build upon CFRunLoop to implement their own higher-level event loop. When
writing an application, you can add your sources, timers, and observers to their run loop objects
and modes. Your objects will then get monitored as part of the regular application event loop. Use
the getCFRunLoop() method of RunLoop to obtain the corresponding CFRunLoop type. In
Carbon applications, use the GetCFRunLoopFromEventLoop function.
For more information about how run loops behave, see Run Loops in Threading Programming
Guide.
func CFRunLoopGetCurrent() -> CFRunLoop!
Returns the CFRunLoop object for the current thread.
func CFRunLoopGetMain() -> CFRunLoop!
Returns the main CFRunLoop object.
func CFRunLoopRun()
Runs the current thread’s CFRunLoop object in its default mode indefinitely.
func CFRunLoopRunInMode(CFRunLoopMode!, CFTimeInterval, Bool) -> CFRun
LoopRunResult
Runs the current thread’s CFRunLoop object in a particular mode.
func CFRunLoopWakeUp(CFRunLoop!)
Topics
Getting a Run Loop
Starting and Stopping a Run Loop


## Page 154

Wakes a waiting CFRunLoop object.
func CFRunLoopStop(CFRunLoop!)
Forces a CFRunLoop object to stop running.
func CFRunLoopIsWaiting(CFRunLoop!) -> Bool
Returns a Boolean value that indicates whether the run loop is waiting for an event.
func CFRunLoopAddSource(CFRunLoop!, CFRunLoopSource!, CFRunLoopMode!)
Adds a CFRunLoopSource object to a run loop mode.
func CFRunLoopContainsSource(CFRunLoop!, CFRunLoopSource!, CFRunLoopMod
!) -> Bool
Returns a Boolean value that indicates whether a run loop mode contains a particular
CFRunLoopSource object.
func CFRunLoopRemoveSource(CFRunLoop!, CFRunLoopSource!, CFRunLoopMode!
Removes a CFRunLoopSource object from a run loop mode.
func CFRunLoopAddObserver(CFRunLoop!, CFRunLoopObserver!, CFRunLoopMode
!)
Adds a CFRunLoopObserver object to a run loop mode.
func CFRunLoopContainsObserver(CFRunLoop!, CFRunLoopObserver!, CFRunLoo
Mode!) -> Bool
Returns a Boolean value that indicates whether a run loop mode contains a particular
CFRunLoopObserver object.
func CFRunLoopRemoveObserver(CFRunLoop!, CFRunLoopObserver!, CFRunLoop
Mode!)
Removes a CFRunLoopObserver object from a run loop mode.
func CFRunLoopAddCommonMode(CFRunLoop!, CFRunLoopMode!)
Adds a mode to the set of run loop common modes.
func CFRunLoopCopyAllModes(CFRunLoop!) -> CFArray!
Managing Sources
Managing Observers
Managing Run Loop Modes


## Page 155

Returns an array that contains all the defined modes for a CFRunLoop object.
func CFRunLoopCopyCurrentMode(CFRunLoop!) -> CFRunLoopMode!
Returns the name of the mode in which a given run loop is currently running.
func CFRunLoopAddTimer(CFRunLoop!, CFRunLoopTimer!, CFRunLoopMode!)
Adds a CFRunLoopTimer object to a run loop mode.
func CFRunLoopGetNextTimerFireDate(CFRunLoop!, CFRunLoopMode!) ->
CFAbsoluteTime
Returns the time at which the next timer will fire.
func CFRunLoopRemoveTimer(CFRunLoop!, CFRunLoopTimer!, CFRunLoopMode!)
Removes a CFRunLoopTimer object from a run loop mode.
func CFRunLoopContainsTimer(CFRunLoop!, CFRunLoopTimer!, CFRunLoopMode!
-> Bool
Returns a Boolean value that indicates whether a run loop mode contains a particular
CFRunLoopTimer object.
func CFRunLoopPerformBlock(CFRunLoop!, CFTypeRef!, (() -> Void)!)
Enqueues a block object on a given runloop to be executed as the runloop cycles in specifie
modes.
func CFRunLoopGetTypeID() -> CFTypeID
Returns the type identifier for the CFRunLoop opaque type.
CFRunLoopRunInMode Exit Codes
Return codes for CFRunLoopRunInMode, identifying the reason the run loop exited.
Common Mode Flag
A run loop pseudo-mode that manages objects monitored in the “common” modes.
Managing Timers
Scheduling Blocks
Getting the CFRunLoop Type ID
Constants


## Page 156

Default Run Loop Mode
Default run loop mode.
Equatable, Hashable
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
Opaque Types


## Page 157

class CFError


## Page 158

A CFRunLoopObserver provides a general means to receive callbacks at different points within a
running run loop. In contrast to sources, which fire when an asynchronous event occurs, and
timers, which fire when a particular time passes, observers fire at special locations within the
execution of the run loop, such as before sources are processed or before the run loop goes to
sleep, waiting for an event to occur. Observers can be either one-time events or repeated every
time through the run loop’s loop.
Each run loop observer can be registered in only one run loop at a time, although it can be added 
multiple run loop modes within that run loop.
func CFRunLoopObserverCreateWithHandler(CFAllocator!, CFOptionFlags,
Bool, CFIndex, ((CFRunLoopObserver?, CFRunLoopActivity) -> Void)!) ->
CFRunLoopObserver!
Creates a CFRunLoopObserver object with a block-based handler.
func CFRunLoopObserverCreate(CFAllocator!, CFOptionFlags, Bool, CFIndex
CFRunLoopObserverCallBack!, UnsafeMutablePointer<CFRunLoopObserver
Context>!) -> CFRunLoopObserver!
Overview
Topics
CFRunLoopObserver Miscellaneous Functions
Core Foundation / CFRunLoopObserver
Class
CFRunLoopObserver
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 159

Creates a CFRunLoopObserver object with a function callback.
func CFRunLoopObserverDoesRepeat(CFRunLoopObserver!) -> Bool
Returns a Boolean value that indicates whether a CFRunLoopObserver repeats.
func CFRunLoopObserverGetActivities(CFRunLoopObserver!) -> CFOptionFlag
Returns the run loop stages during which an observer runs.
func CFRunLoopObserverGetContext(CFRunLoopObserver!, UnsafeMutable
Pointer<CFRunLoopObserverContext>!)
Returns the context information for a CFRunLoopObserver object.
func CFRunLoopObserverGetOrder(CFRunLoopObserver!) -> CFIndex
Returns the ordering parameter for a CFRunLoopObserver object.
func CFRunLoopObserverGetTypeID() -> CFTypeID
Returns the type identifier for the CFRunLoopObserver opaque type.
func CFRunLoopObserverInvalidate(CFRunLoopObserver!)
Invalidates a CFRunLoopObserver object, stopping it from ever firing again.
func CFRunLoopObserverIsValid(CFRunLoopObserver!) -> Bool
Returns a Boolean value that indicates whether a CFRunLoopObserver object is valid and ab
to fire.
typealias CFRunLoopObserverCallBack
Callback invoked when a CFRunLoopObserver object is fired.
struct CFRunLoopObserverContext
A structure that contains program-defined data and callbacks with which you can configure 
CFRunLoopObserver object’s behavior.
struct CFRunLoopActivity
Run loop activity stages in which run loop observers can be scheduled.
Callbacks
Data Types
Constants


## Page 160

Equatable, Hashable
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
class CFError
Relationships
Conforms To
See Also
Opaque Types


## Page 161

A CFRunLoopSource object is an abstraction of an input source that can be put into a run loop.
Input sources typically generate asynchronous events, such as messages arriving on a network
port or actions performed by the user.
An input source type normally defines an API for creating and operating on objects of the type, as
it were a separate entity from the run loop, then provides a function to create a CFRunLoopSource
for an object. The run loop source can then be registered with the run loop and act as an
intermediary between the run loop and the actual input source type object. Examples of input
sources include CFMachPort, CFMessagePort, and CFSocket.
There are two categories of sources. Version 0 sources, so named because the version field of
their context structure is 0, are managed manually by the application. When a source is ready to
fire, some part of the application, perhaps code on a separate thread waiting for an event, must c
CFRunLoopSourceSignal(_:) to tell the run loop that the source is ready to fire. The run loop
source for CFSocket is currently implemented as a version 0 source.
Version 1 sources are managed by the run loop and kernel. These sources use Mach ports to sign
when the sources are ready to fire. A source is automatically signaled by the kernel when a
message arrives on the source’s Mach port. The contents of the message are given to the source
to process when the source is fired. The run loop sources for CFMachPort and CFMessagePort ar
currently implemented as version 1 sources.
When creating your own custom run loop source, you can choose which version works best for yo
A run loop source can be registered in multiple run loops and run loop modes at the same time.
When the source is signaled, whichever run loop that happens to detect the signal first will fire th
source. Adding a source to multiple threads’ run loops can be used to manage a pool of “worker”
Overview
Core Foundation / CFRunLoopSource
Class
CFRunLoopSource
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 162

threads that is processing discrete sets of data, such as client-server messages over a network o
entries in a job queue filled by a “manager” thread. As messages arrive or jobs get added to the
queue, the source gets signaled and a random thread receives and processes the request.
func CFRunLoopSourceCreate(CFAllocator!, CFIndex, UnsafeMutablePointer<
CFRunLoopSourceContext>!) -> CFRunLoopSource!
Creates a CFRunLoopSource object.
func CFRunLoopSourceGetContext(CFRunLoopSource!, UnsafeMutablePointer<
CFRunLoopSourceContext>!)
Returns the context information for a CFRunLoopSource object.
func CFRunLoopSourceGetOrder(CFRunLoopSource!) -> CFIndex
Returns the ordering parameter for a CFRunLoopSource object.
func CFRunLoopSourceGetTypeID() -> CFTypeID
Returns the type identifier of the CFRunLoopSource opaque type.
func CFRunLoopSourceInvalidate(CFRunLoopSource!)
Invalidates a CFRunLoopSource object, stopping it from ever firing again.
func CFRunLoopSourceIsValid(CFRunLoopSource!) -> Bool
Returns a Boolean value that indicates whether a CFRunLoopSource object is valid and able 
fire.
func CFRunLoopSourceSignal(CFRunLoopSource!)
Signals a CFRunLoopSource object, marking it as ready to fire.
var cancel: ((UnsafeMutableRawPointer?, CFRunLoop?, CFRunLoopMode?) ->
Void)!
var equal: ((UnsafeRawPointer?, UnsafeRawPointer?) -> DarwinBoolean)!
An equality test callback for your program-defined info pointer. Can be NULL.
var hash: ((UnsafeRawPointer?) -> CFHashCode)!
A hash calculation callback for your program-defined info pointer. Can be NULL.
Topics
CFRunLoopSource Miscellaneous Functions
Callbacks


## Page 163

var perform: ((UnsafeMutableRawPointer?) -> Void)!
A perform callback for the run loop source. This callback is called when the source has fired
var schedule: ((UnsafeMutableRawPointer?, CFRunLoop?, CFRunLoopMode?) -
Void)!
A scheduling callback for the run loop source. This callback is called when the source is
added to a run loop mode. Can be NULL.
struct CFRunLoopSourceContext
A structure that contains program-defined data and callbacks with which you can configure 
version 0 CFRunLoopSource’s behavior.
struct CFRunLoopSourceContext1
A structure that contains program-defined data and callbacks with which you can configure 
version 1 CFRunLoopSource’s behavior.
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
Data Types
Relationships
Conforms To
See Also
Opaque Types


## Page 164

class CFBoolean
class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 165

A CFRunLoopTimer object represents a specialized run loop source that fires at a preset time in th
future. Timers can fire either only once or repeatedly at fixed time intervals. Repeating timers can
also have their next firing time manually adjusted.
A timer is not a real-time mechanism; it fires only when one of the run loop modes to which the
timer has been added is running and able to check if the timer’s firing time has passed. If a timer’
firing time occurs while the run loop is in a mode that is not monitoring the timer or during a long
callout, the timer does not fire until the next time the run loop checks the timer. Therefore, the
actual time at which the timer fires potentially can be a significant period of time after the
scheduled firing time.
A repeating timer reschedules itself based on the scheduled firing time, not the actual firing time.
For example, if a timer is scheduled to fire at a particular time and every 5 seconds after that, the
scheduled firing time will always fall on the original 5 second time intervals, even if the actual firin
time gets delayed. If the firing time is delayed so far that it passes one or more of the scheduled
firing times, the timer is fired only once for that time period; the timer is then rescheduled, after
firing, for the next scheduled firing time in the future.
Each run loop timer can be registered in only one run loop at a time, although it can be added to
multiple run loop modes within that run loop.
CFRunLoopTimer is “toll-free bridged” with its Cocoa Foundation counterpart, Timer. This mean
that the Core Foundation type is interchangeable in function or method calls with the bridged
Foundation object. Therefore, in a method where you see an NSTimer * parameter, you can pas
in a CFRunLoopTimerRef, and in a function where you see a CFRunLoopTimerRef parameter
you can pass in an NSTimer instance. This also applies to concrete subclasses of NSTimer. See
Toll-Free Bridged Types for more information on toll-free bridging.
Overview
Core Foundation / CFRunLoopTimer
Class
CFRunLoopTimer
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 166

func CFRunLoopTimerCreateWithHandler(CFAllocator!, CFAbsoluteTime,
CFTimeInterval, CFOptionFlags, CFIndex, ((CFRunLoopTimer?) -> Void)!) -
CFRunLoopTimer!
Creates a new CFRunLoopTimer object with a block-based handler.
func CFRunLoopTimerCreate(CFAllocator!, CFAbsoluteTime, CFTimeInterval,
CFOptionFlags, CFIndex, CFRunLoopTimerCallBack!, UnsafeMutablePointer<
CFRunLoopTimerContext>!) -> CFRunLoopTimer!
Creates a new CFRunLoopTimer object with a function callback.
func CFRunLoopTimerDoesRepeat(CFRunLoopTimer!) -> Bool
Returns a Boolean value that indicates whether a CFRunLoopTimer object repeats.
func CFRunLoopTimerGetContext(CFRunLoopTimer!, UnsafeMutablePointer<
CFRunLoopTimerContext>!)
Returns the context information for a CFRunLoopTimer object.
func CFRunLoopTimerGetInterval(CFRunLoopTimer!) -> CFTimeInterval
Returns the firing interval of a repeating CFRunLoopTimer object.
func CFRunLoopTimerGetNextFireDate(CFRunLoopTimer!) -> CFAbsoluteTime
Returns the next firing time for a CFRunLoopTimer object.
func CFRunLoopTimerGetOrder(CFRunLoopTimer!) -> CFIndex
Returns the ordering parameter for a CFRunLoopTimer object.
func CFRunLoopTimerGetTypeID() -> CFTypeID
Returns the type identifier of the CFRunLoopTimer opaque type.
func CFRunLoopTimerInvalidate(CFRunLoopTimer!)
Invalidates a CFRunLoopTimer object, stopping it from ever firing again.
func CFRunLoopTimerIsValid(CFRunLoopTimer!) -> Bool
Returns a Boolean value that indicates whether a CFRunLoopTimer object is valid and able to
fire.
func CFRunLoopTimerSetNextFireDate(CFRunLoopTimer!, CFAbsoluteTime)
Topics
CFRunLoopTimer Miscellaneous Functions


## Page 167

Sets the next firing date for a CFRunLoopTimer object .
typealias CFRunLoopTimerCallBack
Callback invoked when a CFRunLoopTimer object fires.
struct CFRunLoopTimerContext
A structure that contains program-defined data and callbacks with which you can configure 
CFRunLoopTimer’s behavior.
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
class CFBundle
class CFCalendar
Callbacks
Data Types
Relationships
Conforms To
See Also
Opaque Types


## Page 168

class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 169

CFSet and its derived mutable type, CFMutableSet, provide support for the mathematical
concept of a set. A set, both in its mathematical sense and in the implementation of CFSet, is an
unordered collection of distinct elements. CFSet creates static sets and CFMutableSet creates
dynamic sets.
Use bags or sets as an alternative to arrays when the order of elements isn’t important and
performance in testing whether a value is contained in the collection is a consideration—while
arrays are ordered, testing for membership is slower than with bags or sets. Use bags over sets if
you want to allow duplicate values in your collections.
You create a static set object using either the CFSetCreate(_:_:_:_:) or CFSetCreate
Copy(_:_:) function. These functions return a set containing the values you pass in as
arguments. (Note that sets can’t contain NULL pointers; in most cases, though, you can use the k
CFNull constant instead.) Values are not copied but retained using the retain callback provided
when the set was created. Similarly, when a value is removed from a set, it is released using the
release callback.
CFSet provides functions for querying the values of a set. The CFSetGetCount(_:) returns the
number of values in a set, the CFSetContainsValue(_:_:) function checks if a value is in a
set, and CFSetGetValues(_:_:) returns a C array containing all the values in a set.
CFSet is “toll-free bridged” with its Cocoa Foundation counterpart, NSSet. This means that the
Core Foundation type is interchangeable in function or method calls with the bridged Foundation
object. Therefore, in a method where you see an NSSet * parameter, you can pass in a CFSet
Ref, and in a function where you see a CFSetRef parameter, you can pass in an NSSet instance
This also applies to concrete subclasses of NSSet. See Toll-Free Bridged Types for more
information on toll-free bridging.
Overview
Core Foundation / CFSet
Class
CFSet
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 170

func CFSetCreate(CFAllocator!, UnsafeMutablePointer<UnsafeRawPointer?>!
CFIndex, UnsafePointer<CFSetCallBacks>!) -> CFSet!
Creates an immutable CFSet object containing supplied values.
func CFSetCreateCopy(CFAllocator!, CFSet!) -> CFSet!
Creates an immutable set containing the values of an existing set.
func CFSetContainsValue(CFSet!, UnsafeRawPointer!) -> Bool
Returns a Boolean that indicates whether a set contains a given value.
func CFSetGetCount(CFSet!) -> CFIndex
Returns the number of values currently in a set.
func CFSetGetCountOfValue(CFSet!, UnsafeRawPointer!) -> CFIndex
Returns the number of values in a set that match a given value.
func CFSetGetValue(CFSet!, UnsafeRawPointer!) -> UnsafeRawPointer!
Obtains a specified value from a set.
func CFSetGetValueIfPresent(CFSet!, UnsafeRawPointer!, UnsafeMutable
Pointer<UnsafeRawPointer?>!) -> Bool
Reports whether or not a value is in a set, and if it exists returns the value indirectly.
func CFSetGetValues(CFSet!, UnsafeMutablePointer<UnsafeRawPointer?>!)
Obtains all values in a set.
func CFSetApplyFunction(CFSet!, ((UnsafeRawPointer?, UnsafeMutableRaw
Pointer?) -> Void)!, UnsafeMutableRawPointer!)
Calls a function once for each value in a set.
Topics
Creating Sets
Examining a Set
Applying a Function to Set Members
Getting the CFSet Type ID


## Page 171

func CFSetGetTypeID() -> CFTypeID
Returns the type identifier for the CFSet type.
typealias CFSetApplierFunction
Prototype of a callback function that may be applied to every value in a set.
typealias CFSetCopyDescriptionCallBack
Prototype of a callback function used to get a description of a value in a set.
typealias CFSetEqualCallBack
Prototype of a callback function used to determine if two values in a set are equal.
typealias CFSetHashCallBack
Prototype of a callback function called to compute a hash code for a value. Hash codes are
used when values are accessed, added, or removed from a collection.
typealias CFSetReleaseCallBack
Prototype of a callback function used to release a value before it’s removed from a set.
typealias CFSetRetainCallBack
Prototype of a callback function used to retain a value being added to a set.
struct CFSetCallBacks
This structure contains the callbacks used to retain, release, describe, and compare the
values of a CFSet object.
Predefined Callback Structures
CFSet provides some predefined callbacks for your convenience.
Callbacks
Data Types
Constants
Relationships
Inherited By


## Page 172

CFMutableSet
Equatable, Hashable
Collections Programming Topics for Core Foundation
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
class CFError
Conforms To
See Also
Related Documentation
Opaque Types


## Page 173



## Page 174

A CFSocket is a communications channel implemented with a BSD socket.
For most uses of this API, you will need to include three headers:
CFSocket can be created from scratch with CFSocketCreate(_:_:_:_:_:_:_:) and
CFSocketCreateWithSocketSignature(_:_:_:_:_:). CFSocket objects can also be
created to wrap an existing BSD socket by calling CFSocketCreateWithNative(_:_:_:_:
_:). Finally, you can create a CFSocket and connect simultaneously to a remote host by calling
CFSocketCreateConnectedToSocketSignature(_:_:_:_:_:_:).
To listen for messages, you need to create a run loop source with CFSocketCreateRunLoop
Source(_:_:_:) and add it to a run loop with CFRunLoopAddSource(_:_:_:). You can
select the types of socket activities, such as connection attempts or data arrivals, that cause the
source to fire and invoke your CFSocket’s callback function. To send data, you store the data in a
CFData and call CFSocketSendData(_:_:_:_:).
Unlike Mach and message ports, sockets support communication over a network.
Overview
Topics
Core Foundation / CFSocket
Class
CFSocket
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 175

func CFSocketCreate(CFAllocator!, Int32, Int32, Int32, CFOptionFlags,
CFSocketCallBack!, UnsafePointer<CFSocketContext>!) -> CFSocket!
Creates a CFSocket object of a specified protocol and type.
func CFSocketCreateConnectedToSocketSignature(CFAllocator!, Unsafe
Pointer<CFSocketSignature>!, CFOptionFlags, CFSocketCallBack!, Unsafe
Pointer<CFSocketContext>!, CFTimeInterval) -> CFSocket!
Creates a CFSocket object and opens a connection to a remote socket.
func CFSocketCreateWithNative(CFAllocator!, CFSocketNativeHandle,
CFOptionFlags, CFSocketCallBack!, UnsafePointer<CFSocketContext>!) ->
CFSocket!
Creates a CFSocket object for a pre-existing native socket.
func CFSocketCreateWithSocketSignature(CFAllocator!, UnsafePointer<
CFSocketSignature>!, CFOptionFlags, CFSocketCallBack!, UnsafePointer<
CFSocketContext>!) -> CFSocket!
Creates a CFSocket object using information from a CFSocketSignature structure.
func CFSocketCopyAddress(CFSocket!) -> CFData!
Returns the local address of a CFSocket object.
func CFSocketCopyPeerAddress(CFSocket!) -> CFData!
Returns the remote address to which a CFSocket object is connected.
func CFSocketDisableCallBacks(CFSocket!, CFOptionFlags)
Disables the callback function of a CFSocket object for certain types of socket activity.
func CFSocketEnableCallBacks(CFSocket!, CFOptionFlags)
Enables the callback function of a CFSocket object for certain types of socket activity.
func CFSocketGetContext(CFSocket!, UnsafeMutablePointer<CFSocketContext
>!)
Returns the context information for a CFSocket object.
func CFSocketGetNative(CFSocket!) -> CFSocketNativeHandle
Returns the native socket associated with a CFSocket object.
Creating Sockets
Configuring Sockets


## Page 176

func CFSocketGetSocketFlags(CFSocket!) -> CFOptionFlags
Returns flags that control certain behaviors of a CFSocket object.
func CFSocketSetAddress(CFSocket!, CFData!) -> CFSocketError
Binds a local address to a CFSocket object and configures it for listening.
func CFSocketSetSocketFlags(CFSocket!, CFOptionFlags)
Sets flags that control certain behaviors of a CFSocket object.
func CFSocketConnectToAddress(CFSocket!, CFData!, CFTimeInterval) ->
CFSocketError
Opens a connection to a remote socket.
func CFSocketCreateRunLoopSource(CFAllocator!, CFSocket!, CFIndex) ->
CFRunLoopSource!
Creates a CFRunLoopSource object for a CFSocket object.
func CFSocketGetTypeID() -> CFTypeID
Returns the type identifier for the CFSocket opaque type.
func CFSocketInvalidate(CFSocket!)
Invalidates a CFSocket object, stopping it from sending or receiving any more messages.
func CFSocketIsValid(CFSocket!) -> Bool
Returns a Boolean value that indicates whether a CFSocket object is valid and able to send o
receive messages.
func CFSocketSendData(CFSocket!, CFData!, CFData!, CFTimeInterval) ->
CFSocketError
Sends data over a CFSocket object.
typealias CFSocketCallBack
Callback invoked when certain types of activity takes place on a CFSocket object.
struct CFSocketContext
Using Sockets
Callbacks
Data Types


## Page 177

A structure that contains program-defined data and callbacks with which you can configure 
CFSocket object’s behavior.
typealias CFSocketNativeHandle
Type for the platform-specific native socket handle.
struct CFSocketSignature
A structure that fully specifies the communication protocol and connection address of a
CFSocket object.
struct CFSocketCallBackType
Types of socket activity that can cause the callback function of a CFSocket object to be
called.
CFSocket Flags
Flags that can be set on a CFSocket object to control its behavior.
enum CFSocketError
Error codes for many CFSocket functions.
Equatable, Hashable
Threading Programming Guide
CFNetwork Programming Guide
Constants
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 178

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
class CFError


## Page 179

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


## Page 180

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


## Page 181

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


## Page 182

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


## Page 183

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


## Page 184

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


## Page 185

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


## Page 186

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


## Page 187

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


## Page 188

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


## Page 189

class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 190

CFStringTokenizer allows you to tokenize strings into words, sentences or paragraphs in a
language-neutral way. It supports languages such as Japanese and Chinese that do not delimit
words by spaces, as well as de-compounding German compounds. You can obtain Latin
transcription for tokens. It also provides language identification API.
You can use a CFStringTokenizer to break a string into tokens (sub-strings) on the basis of words
sentences, or paragraphs. When you create a tokenizer, you can supply options to further modify
the tokenization—see Tokenization Modifiers.
In addition, with CFStringTokenizer:
You can de-compound German compounds
You can identify the language used in a string (using CFStringTokenizerCopyBestStrin
Language(_:_:))
You can obtain Latin transcription for tokens
To find a token that includes the character specified by character index and set it as the current
token, you call CFStringTokenizerGoToTokenAtIndex(_:_:). To advance to the next toke
and set it as the current token, you call CFStringTokenizerAdvanceToNextToken(_:). To
get the range of current token, you call CFStringTokenizerGetCurrentTokenRange(_:).
You can use CFStringTokenizerCopyCurrentTokenAttribute(_:_:) to get the attribut
of the current token. If the current token is a compound, you can call CFStringTokenizerGet
CurrentSubTokens(_:_:_:_:) to retrieve the subtokens or derived subtokens contained in
the compound token. To guess the language of a string, you call CFStringTokenizerCopyBes
StringLanguage(_:_:).
Overview
Core Foundation / CFStringTokenizer
Class
CFStringTokenizer
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 191

func CFStringTokenizerCreate(CFAllocator!, CFString!, CFRange, CFOption
Flags, CFLocale!) -> CFStringTokenizer!
Returns a tokenizer for a given string.
func CFStringTokenizerSetString(CFStringTokenizer!, CFString!, CFRange)
Sets the string for a tokenizer.
func CFStringTokenizerAdvanceToNextToken(CFStringTokenizer!) -> CFStrin
TokenizerTokenType
Advances the tokenizer to the next token and sets that as the current token.
func CFStringTokenizerGoToTokenAtIndex(CFStringTokenizer!, CFIndex) ->
CFStringTokenizerTokenType
Finds a token that includes the character at a given index, and set it as the current token.
func CFStringTokenizerCopyCurrentTokenAttribute(CFStringTokenizer!,
CFOptionFlags) -> CFTypeRef!
Returns a given attribute of the current token.
func CFStringTokenizerGetCurrentTokenRange(CFStringTokenizer!) ->
CFRange
Returns the range of the current token.
func CFStringTokenizerGetCurrentSubTokens(CFStringTokenizer!, Unsafe
MutablePointer<CFRange>!, CFIndex, CFMutableArray!) -> CFIndex
Retrieves the subtokens or derived subtokens contained in the compound token.
Topics
Creating a Tokenizer
Setting the String
Changing the Location
Getting Information About the Current Token
Identifying a Language


## Page 192

func CFStringTokenizerCopyBestStringLanguage(CFString!, CFRange) ->
CFString!
Guesses a language of a given string and returns the guess as a BCP 47 string.
func CFStringTokenizerGetTypeID() -> CFTypeID
Returns the type ID for CFStringTokenizer.
Tokenization Modifiers
Tokenization options are used with CFStringTokenizerCreate(_:_:_:_:_:) to speci
how the string should be tokenized
struct CFStringTokenizerTokenType
Token types returned by CFStringTokenizerGoToTokenAtIndex(_:_:) and
CFStringTokenizerAdvanceToNextToken(_:).
Equatable, Hashable
String Programming Guide for Core Foundation
class CFAllocator
class CFArray
Getting the CFStringTokenizer Type ID
Constants
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 193

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


## Page 194

CFTimeZone defines the behavior of time zone objects. Time zone objects represent geopolitical
regions. Consequently, these objects have names for these regions. Time zone objects also
represent a temporal offset, either plus or minus, from Greenwich Mean Time (GMT) and an
abbreviation (such as PST for Pacific Standard Time).
CFTimeZone provides several functions to create time zone objects: CFTimeZoneCreateWith
Name(_:_:_:) and CFTimeZoneCreateWithTimeIntervalFromGMT(_:_:). CFTimeZone
also permits you to set the default time zone within your application using the CFTimeZoneSet
Default(_:) function. You can access this default time zone at any time with the CFTimeZone
CopyDefault() function.
CFTimeZone is “toll-free bridged” with its Cocoa Foundation counterpart, NSTimeZone. This
means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSTimeZone * parameter,
you can pass in a CFTimeZoneRef, and in a function where you see a CFTimeZoneRef
parameter, you can pass in an NSTimeZone instance. This fact also applies to concrete subclasse
of NSTimeZone. See Toll-Free Bridged Types for more information on toll-free bridging.
Overview
Topics
Creating a Time Zone
Core Foundation / CFTimeZone
Class
CFTimeZone
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 195

func CFTimeZoneCreateWithName(CFAllocator!, CFString!, Bool) -> CFTime
Zone!
Returns the time zone object identified by a given name or abbreviation.
func CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocator!, CFTime
Interval) -> CFTimeZone!
Returns a time zone object for the specified time interval offset from Greenwich Mean Time
(GMT).
func CFTimeZoneCreate(CFAllocator!, CFString!, CFData!) -> CFTimeZone!
Creates a time zone with a given name and data.
func CFTimeZoneCopyAbbreviationDictionary() -> CFDictionary!
Returns a dictionary holding the mappings of time zone abbreviations to time zone names.
func CFTimeZoneCopyAbbreviation(CFTimeZone!, CFAbsoluteTime) -> CFStrin
!
Returns the abbreviation of a time zone at a specified date.
func CFTimeZoneCopyDefault() -> CFTimeZone!
Returns the default time zone set for your application.
func CFTimeZoneCopySystem() -> CFTimeZone!
Returns the time zone currently used by the system.
func CFTimeZoneSetDefault(CFTimeZone!)
Sets the default time zone for your application the given time zone.
func CFTimeZoneCopyKnownNames() -> CFArray!
Returns an array of strings containing the names of all the time zones known to the system.
func CFTimeZoneResetSystem()
Clears the previously determined system time zone, if any.
func CFTimeZoneSetAbbreviationDictionary(CFDictionary!)
Sets the abbreviation dictionary to a given dictionary.
func CFTimeZoneGetName(CFTimeZone!) -> CFString!
System and Default Time Zones and Information
Getting Information About Time Zones


## Page 196

Returns the geopolitical region name that identifies a given time zone.
func CFTimeZoneCopyLocalizedName(CFTimeZone!, CFTimeZoneNameStyle,
CFLocale!) -> CFString!
Returns the localized name of a given time zone.
func CFTimeZoneGetSecondsFromGMT(CFTimeZone!, CFAbsoluteTime) -> CFTime
Interval
Returns the difference in seconds between the receiver and Greenwich Mean Time (GMT) at
the specified date.
func CFTimeZoneGetData(CFTimeZone!) -> CFData!
Returns the data that stores the information used by a time zone.
func CFTimeZoneIsDaylightSavingTime(CFTimeZone!, CFAbsoluteTime) -> Boo
Returns whether or not a time zone is in daylight savings time at a specified date.
func CFTimeZoneGetDaylightSavingTimeOffset(CFTimeZone!, CFAbsoluteTime)
-> CFTimeInterval
Returns the daylight saving time offset for a time zone at a given time.
func CFTimeZoneGetNextDaylightSavingTimeTransition(CFTimeZone!,
CFAbsoluteTime) -> CFAbsoluteTime
Returns the time in a given time zone of the next daylight saving time transition after a given
time.
func CFTimeZoneGetTypeID() -> CFTypeID
Returns the type identifier for the CFTimeZone opaque type.
enum CFTimeZoneNameStyle
Index type for constants used to specify styles of time zone names.
Notification Name
Getting Daylight Savings Time Information
Getting the CFTimeZone Type ID
Data Types
Constants


## Page 197

Name of the notification posted when the time zone changes.
Time Zone Name Styles
Constants to specify styles for time zone names.
Equatable, Hashable
Date and Time Programming Guide for Core Foundation
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
Conforms To
See Also
Related Documentation
Opaque Types


## Page 198

class CFDateFormatter
class CFDictionary
class CFError


## Page 199

You use CFTree to create tree structures that represent hierarchical organizations of information. 
such structures, each tree node has exactly one parent tree (except for the root tree, which has n
parent) and can have multiple children. Each CFTree object in the structure has a context
associated with it; this context includes some program-defined data as well as callbacks that
operate on that data. The program-defined data is often used as the basis for determining where
CFTree objects fit within the structure. All CFTree objects are mutable.
You create a CFTree object using the CFTreeCreate(_:_:) function. This function takes an
allocator and pointer to a CFTreeGetContext(_:_:) structure as parameters. The CFTree
Context structure contains the program-defined data and callbacks needed to describe, retain,
and release that data. If you do not implement these callbacks, your program-defined data will no
be retained or released when trees are added and removed from a parent.
Each CFTree object has a parent and list of children, all of which may be NULL. CFTree provides
functions for adding and removing tree objects from the tree structure. Use the CFTreeAppend
Child(_:_:), CFTreeInsertSibling(_:_:), or CFTreePrependChild(_:_:) functions
to add trees to a tree structure, and the CFTreeRemove(_:) or CFTreeRemoveAll
Children(_:) functions to remove trees.
For the purposes of memory management, CFTree can be thought of as a collection. Typically the
only object that retains a child tree is its parent. Usually, therefore, when you remove a child tree
from a tree, the child tree is destroyed. If you want to use a child tree after you remove it from its
parent, you should retain the child tree first, prior to removing it.
Releasing a tree releases its child trees, and all of their child trees (recursively). Note also that the
final release of a tree (when its retain count decreases to zero) causes all of its child trees, and all
Overview
Core Foundation / CFTree
Class
CFTree
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 200

of their child trees (recursively), to be destroyed, regardless of their retain counts. Releasing a ch
that is still in a tree is therefore a programming error, and may cause your application to crash.
You can use any of the get functions (functions containing the word “Get”) to obtain the parent,
children, or attributes of a tree. For example, use CFTreeGetChildAtIndex(_:_:) to obtain a
child of a tree at a specified location. In common with other Core Foundation “Get” functions, the
functions do not retain the tree that is returned. If you are making other modifications to the tree,
you should either retain or make a deep copy of the child tree returned.
You can apply a function to all children of a tree using the CFTreeApplyFunctionTo
Children(_:_:_:) function, and sort children of a tree using the CFTreeSortChildren(_:
_:_:) function.
func CFTreeCreate(CFAllocator!, UnsafePointer<CFTreeContext>!) -> CFTre
!
Creates a new CFTree object.
func CFTreeAppendChild(CFTree!, CFTree!)
Adds a new child to a tree as the last in its list of children.
func CFTreeInsertSibling(CFTree!, CFTree!)
Inserts a new sibling after a given tree.
func CFTreeRemoveAllChildren(CFTree!)
Removes all the children of a tree.
func CFTreePrependChild(CFTree!, CFTree!)
Adds a new child to the specified tree as the first in its list of children.
func CFTreeRemove(CFTree!)
Removes a tree from its parent.
func CFTreeSetContext(CFTree!, UnsafePointer<CFTreeContext>!)
Replaces the context of a tree by releasing the old information pointer and retaining the new
one.
Topics
Creating Trees
Modifying a Tree


## Page 201

func CFTreeSortChildren(CFTree!, CFComparatorFunction!, UnsafeMutableRa
Pointer!)
Sorts the immediate children of a tree using a specified comparator function.
func CFTreeFindRoot(CFTree!) -> CFTree!
Returns the root tree of a given tree.
func CFTreeGetChildAtIndex(CFTree!, CFIndex) -> CFTree!
Returns the child of a tree at the specified index.
func CFTreeGetChildCount(CFTree!) -> CFIndex
Returns the number of children in a tree.
func CFTreeGetChildren(CFTree!, UnsafeMutablePointer<Unmanaged<CFTree>?
>!)
Fills a buffer with children from the tree.
func CFTreeGetContext(CFTree!, UnsafeMutablePointer<CFTreeContext>!)
Returns the context of the specified tree.
func CFTreeGetFirstChild(CFTree!) -> CFTree!
Returns the first child of a tree.
func CFTreeGetNextSibling(CFTree!) -> CFTree!
Returns the next sibling, adjacent to a given tree, in the parent’s children list.
func CFTreeGetParent(CFTree!) -> CFTree!
Returns the parent of a given tree.
func CFTreeApplyFunctionToChildren(CFTree!, ((UnsafeRawPointer?, Unsafe
MutableRawPointer?) -> Void)!, UnsafeMutableRawPointer!)
Calls a function once for each immediate child of a tree.
Sorting a Tree
Examining a Tree
Performing an Operation on Tree Elements
Getting the Tree Type ID


## Page 202

func CFTreeGetTypeID() -> CFTypeID
Returns the type identifier of the CFTree opaque type.
typealias CFTreeApplierFunction
Type of the callback function used by the CFTree apply function.
typealias CFTreeCopyDescriptionCallBack
Callback function used to provide a description of the program-defined information pointer.
typealias CFTreeReleaseCallBack
Callback function used to release a previously retained program-defined information pointer
typealias CFTreeRetainCallBack
Callback function used to retain a program-defined information pointer.
struct CFTreeContext
Structure containing program-defined data and callbacks for a CFTree object.
Equatable, Hashable
Collections Programming Topics for Core Foundation
Callbacks
Data Types
Relationships
Conforms To
See Also
Related Documentation
Opaque Types


## Page 203

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
class CFError


## Page 204

The CFURL opaque type provides facilities for creating, parsing, and dereferencing URL strings.
CFURL is useful to applications that need to use URLs to access resources, including local files.
A CFURL object is composed of two parts—a base URL, which can be NULL, and a string that is
resolved relative to the base URL. A CFURL object whose string is fully resolved without a base U
is considered absolute; all others are considered relative.
CFURL is “toll-free bridged” with its Cocoa Foundation counterpart, NSURL. This means that the
Core Foundation type is interchangeable in function or method calls with the bridged Foundation
object. In other words, in a method where you see an NSURL * parameter, you can pass in a
CFURLRef, and in a function where you see a CFURLRef parameter, you can pass in an NSURL
instance. This also applies to concrete subclasses of NSURL. See Toll-Free Bridged Types for mor
information on toll-free bridging.
Starting in OS X v10.6, the CFURL opaque type provides a facility for creating and using
bookmarks. A bookmark provides a persistent reference to a file-system resource. When you
resolve a bookmark, you obtain a URL to the resource’s current location. A bookmark’s associatio
with a file-system resource (typically a file or folder) usually continues to work if the user moves o
renames the resource, or if the user relaunches your app or restarts the system.
In a macOS app that adopts App Sandbox, to gain persistent access to a file-system resource you
must use a security-scoped bookmark. Such a bookmark preserves, across app launches, a user
intent to give your app access to a resource. For details on how this works, including information o
the entitlements you need in your Xcode project, read Security-Scoped Bookmarks and Persisten
Resource Access in App Sandbox Design Guide.
Overview
Core Foundation / CFURL
Class
CFURL
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 205

When you resolve a security-scoped bookmark, you get a security-scoped URL. The file system
resource that the URL points to is not available for use inside your app’s sandbox until you call the
CFURLStartAccessingSecurityScopedResource(_:) function (or its Cocoa equivalent, t
startAccessingSecurityScopedResource() method) on the URL.
When you no longer need access to a resource that you obtained using security scope (typically,
after you close the resource) you must call the CFURLStopAccessingSecurityScoped
Resource(_:) method (or its Cocoa equivalent, the stopAccessingSecurityScoped
Resource() method) on the resource’s URL.
Warning
You must balance every call to the CFURLStartAccessingSecurityScoped
Resource(_:) method with a corresponding call to the CFURLStopAccessingSecurity
ScopedResource(_:) method. If you fail to relinquish your access when you no longer need
a file-system resource, your app leaks kernel resources. If sufficient kernel resources are
leaked, your app loses its ability to add file-system locations to its sandbox, such as via
Powerbox or security-scoped bookmarks, until relaunched.
The functions for using security-scoped bookmarks are described in this document in Working w
Bookmark Data. For a general introduction to using bookmarks in macOS, read Locating Files Usin
Bookmarks in File System Programming Guide.
When you copy a security-scoped URL (as obtained from a security-scoped bookmark), the copy
has the security scope of the original. You gain access to the file-system resource (that the URL
points to) just as you would with the original URL: by calling the CFURLStartAccessing
SecurityScopedResource(_:) function (or its Cocoa equivalent).
If you need a security-scoped URL’s path as a string value (as provided by the CFURLGet
String(_:) function), such as to provide to an API that requires a string value, obtain the path
from the URL as needed. Note, however, that a string-based path obtained from a security-scope
URL does not have security scope and you cannot use that string to obtain access a security-
scoped resource.
CFURL fails to create an object if the string passed is not well-formed (that is, if it does not comp
with RFC 2396). Examples of cases that will not succeed are strings containing space characters
and high-bit characters. If a function fails to create a CFURL object, it returns NULL, which you
must be prepared to handle. If you create CFURL objects using file system paths, you should use
the CFURLCreateFromFileSystemRepresentation(_:_:_:_:) and CFURLCreateFrom
FileSystemRepresentationRelativeToBase(_:_:_:_:_:) functions, which handle the
subtle differences between URL paths and file system paths.
For functions that read and write data from a URL, see Core Foundation URL Access Utilities


## Page 206

func CFURLCopyAbsoluteURL(CFURL!) -> CFURL!
Creates a new CFURL object by resolving the relative portion of a URL against its base.
func CFURLCreateAbsoluteURLWithBytes(CFAllocator!, UnsafePointer<UInt8
>!, CFIndex, CFStringEncoding, CFURL!, Bool) -> CFURL!
Creates a new CFURL object by resolving the relative portion of a URL, specified as bytes,
against its given base URL.
func CFURLCreateByResolvingBookmarkData(CFAllocator!, CFData!,
CFURLBookmarkResolutionOptions, CFURL!, CFArray!, UnsafeMutablePointer<
DarwinBoolean>!, UnsafeMutablePointer<Unmanaged<CFError>?>!) ->
Unmanaged<CFURL>!
Returns a new URL made by resolving bookmark data.
func CFURLCreateCopyAppendingPathComponent(CFAllocator!, CFURL!,
CFString!, Bool) -> CFURL!
Creates a copy of a given URL and appends a path component.
func CFURLCreateCopyAppendingPathExtension(CFAllocator!, CFURL!,
CFString!) -> CFURL!
Creates a copy of a given URL and appends a path extension.
func CFURLCreateCopyDeletingLastPathComponent(CFAllocator!, CFURL!) ->
CFURL!
Creates a copy of a given URL with the last path component deleted.
func CFURLCreateCopyDeletingPathExtension(CFAllocator!, CFURL!) -> CFUR
!
Creates a copy of a given URL with its last path extension removed.
func CFURLCreateFilePathURL(CFAllocator!, CFURL!, UnsafeMutablePointer<
Unmanaged<CFError>?>!) -> Unmanaged<CFURL>!
Returns a new file path URL that refers to the same resource as a specified URL.
func CFURLCreateFileReferenceURL(CFAllocator!, CFURL!, UnsafeMutable
Pointer<Unmanaged<CFError>?>!) -> Unmanaged<CFURL>!
Returns a new file reference URL that points to the same resource as a specified URL.
Topics
Creating a CFURL


## Page 207

func CFURLCreateFromFileSystemRepresentation(CFAllocator!, UnsafePointe
<UInt8>!, CFIndex, Bool) -> CFURL!
Creates a new CFURL object for a file system entity using the native representation.
func CFURLCreateFromFileSystemRepresentationRelativeToBase(CFAllocator!
UnsafePointer<UInt8>!, CFIndex, Bool, CFURL!) -> CFURL!
Creates a CFURL object from a native character string path relative to a base URL.
func CFURLCreateFromFSRef(CFAllocator!, OpaquePointer!) -> CFURL!
Creates a URL from a given directory or file.
Deprecated
func CFURLCreateWithBytes(CFAllocator!, UnsafePointer<UInt8>!, CFIndex,
CFStringEncoding, CFURL!) -> CFURL!
Creates a CFURL object using a given character bytes.
func CFURLCreateWithFileSystemPath(CFAllocator!, CFString!, CFURLPath
Style, Bool) -> CFURL!
Creates a CFURL object using a local file system path string.
func CFURLCreateWithFileSystemPathRelativeToBase(CFAllocator!, CFString
!, CFURLPathStyle, Bool, CFURL!) -> CFURL!
Creates a CFURL object using a local file system path string relative to a base URL.
func CFURLCreateWithString(CFAllocator!, CFString!, CFURL!) -> CFURL!
Creates a CFURL object using a given CFString object.
func CFURLCanBeDecomposed(CFURL!) -> Bool
Determines if the given URL conforms to RFC 1808 and therefore can be decomposed.
func CFURLCopyFileSystemPath(CFURL!, CFURLPathStyle) -> CFString!
Returns the path portion of a given URL.
func CFURLCopyFragment(CFURL!, CFString!) -> CFString!
Returns the fragment from a given URL.
func CFURLCopyHostName(CFURL!) -> CFString!
Returns the host name of a given URL.
func CFURLCopyLastPathComponent(CFURL!) -> CFString!
Returns the last path component of a given URL.
Accessing the Parts of a URL


## Page 208

func CFURLCopyNetLocation(CFURL!) -> CFString!
Returns the net location portion of a given URL.
func CFURLCopyParameterString(CFURL!, CFString!) -> CFString!
Returns the parameter string from a given URL.
Deprecated
func CFURLCopyPassword(CFURL!) -> CFString!
Returns the password of a given URL.
func CFURLCopyPath(CFURL!) -> CFString!
Returns the path portion of a given URL.
func CFURLCopyPathExtension(CFURL!) -> CFString!
Returns the path extension of a given URL.
func CFURLCopyQueryString(CFURL!, CFString!) -> CFString!
Returns the query string of a given URL.
func CFURLCopyResourceSpecifier(CFURL!) -> CFString!
Returns any additional resource specifiers after the path.
func CFURLCopyScheme(CFURL!) -> CFString!
Returns the scheme portion of a given URL.
func CFURLCopyStrictPath(CFURL!, UnsafeMutablePointer<DarwinBoolean>!) 
> CFString!
Returns the path portion of a given URL.
func CFURLCopyUserName(CFURL!) -> CFString!
Returns the user name from a given URL.
func CFURLGetPortNumber(CFURL!) -> Int32
Returns the port number from a given URL.
func CFURLHasDirectoryPath(CFURL!) -> Bool
Determines if a given URL’s path represents a directory.
func CFURLCreateData(CFAllocator!, CFURL!, CFStringEncoding, Bool) ->
CFData!
Creates a CFData object containing the content of a given URL.
Converting URLs to Other Representations


## Page 209

func CFURLCreateStringByAddingPercentEscapes(CFAllocator!, CFString!,
CFString!, CFString!, CFStringEncoding) -> CFString!
Creates a copy of a string, replacing certain characters with the equivalent percent escape
sequence based on the specified encoding.
Deprecated
func CFURLCreateStringByReplacingPercentEscapes(CFAllocator!, CFString!
CFString!) -> CFString!
Creates a new string by replacing any percent escape sequences with their character
equivalent.
func CFURLCreateStringByReplacingPercentEscapesUsingEncoding(CFAllocato
!, CFString!, CFString!, CFStringEncoding) -> CFString!
Creates a new string by replacing any percent escape sequences with their character
equivalent.
Deprecated
func CFURLGetFileSystemRepresentation(CFURL!, Bool, UnsafeMutablePointe
<UInt8>!, CFIndex) -> Bool
Fills a buffer with the file system’s native string representation of a given URL’s path.
func CFURLGetFSRef(CFURL!, OpaquePointer!) -> Bool
Converts a given URL to a file or directory object.
Deprecated
func CFURLGetString(CFURL!) -> CFString!
Returns the URL as a CFString object.
func CFURLGetBaseURL(CFURL!) -> CFURL!
Returns the base URL of a given URL if it exists.
func CFURLGetBytes(CFURL!, UnsafeMutablePointer<UInt8>!, CFIndex) ->
CFIndex
Returns by reference the byte representation of a URL object.
func CFURLGetByteRangeForComponent(CFURL!, CFURLComponentType, Unsafe
MutablePointer<CFRange>!) -> CFRange
Returns the range of the specified component in the bytes of a URL.
func CFURLGetTypeID() -> CFTypeID
Getting URL Properties


## Page 210

Returns the type identifier for the CFURL opaque type.
func CFURLResourceIsReachable(CFURL!, UnsafeMutablePointer<Unmanaged<
CFError>?>!) -> Bool
Returns whether the resource pointed to by a file URL can be reached.
func CFURLClearResourcePropertyCache(CFURL!)
Removes all cached resource values and temporary resource values from the URL object.
func CFURLClearResourcePropertyCacheForKey(CFURL!, CFString!)
Removes the cached resource value identified by a given key from the URL object.
func CFURLCopyResourcePropertiesForKeys(CFURL!, CFArray!, UnsafeMutable
Pointer<Unmanaged<CFError>?>!) -> Unmanaged<CFDictionary>!
Returns the resource values for the properties identified by specified array of keys.
func CFURLCopyResourcePropertyForKey(CFURL!, CFString!, UnsafeMutableRa
Pointer!, UnsafeMutablePointer<Unmanaged<CFError>?>!) -> Bool
Returns the value of a given resource property of a given URL.
func CFURLCreateResourcePropertiesForKeysFromBookmarkData(CFAllocator!,
CFArray!, CFData!) -> Unmanaged<CFDictionary>!
Returns the resource values for properties identified by a specified array of keys contained in
specified bookmark data.
func CFURLCreateResourcePropertyForKeyFromBookmarkData(CFAllocator!,
CFString!, CFData!) -> Unmanaged<CFTypeRef>!
Returns the value of a resource property from specified bookmark data.
func CFURLSetResourcePropertiesForKeys(CFURL!, CFDictionary!, Unsafe
MutablePointer<Unmanaged<CFError>?>!) -> Bool
Sets the URL’s resource properties for a given set of keys to a given set of values.
func CFURLSetResourcePropertyForKey(CFURL!, CFString!, CFTypeRef!,
UnsafeMutablePointer<Unmanaged<CFError>?>!) -> Bool
Sets the URL’s resource property for a given key to a given value.
func CFURLSetTemporaryResourcePropertyForKey(CFURL!, CFString!, CFType
Ref!)
Sets a temporary resource value on the URL.
Getting and Setting File System Resource Properties


## Page 211

func CFURLCreateBookmarkData(CFAllocator!, CFURL!, CFURLBookmarkCreatio
Options, CFArray!, CFURL!, UnsafeMutablePointer<Unmanaged<CFError>?>!) 
> Unmanaged<CFData>!
Returns bookmark data for a URL, created with specified options and resource values.
func CFURLCreateBookmarkDataFromAliasRecord(CFAllocator!, CFData!) ->
Unmanaged<CFData>!
Initializes and returns bookmark data derived from an alias record.
Deprecated
func CFURLCreateBookmarkDataFromFile(CFAllocator!, CFURL!, UnsafeMutabl
Pointer<Unmanaged<CFError>?>!) -> Unmanaged<CFData>!
Initializes and returns bookmark data derived from a file pointed to by a specified URL.
func CFURLWriteBookmarkDataToFile(CFData!, CFURL!, CFURLBookmarkFile
CreationOptions, UnsafeMutablePointer<Unmanaged<CFError>?>!) -> Bool
Creates an alias file on disk at a specified location with specified bookmark data.
func CFURLStartAccessingSecurityScopedResource(CFURL!) -> Bool
In an app that has adopted App Sandbox, makes the resource pointed to by a security-scop
URL available to the app.
func CFURLStopAccessingSecurityScopedResource(CFURL!)
In an app that adopts App Sandbox, revokes access to the resource pointed to by a security
scoped URL.
struct CFURLBookmarkCreationOptions
Type for bookmark data creation options.
typealias CFURLBookmarkFileCreationOptions
Type for bookmark file creation options.
struct CFURLBookmarkResolutionOptions
Type for bookmark data resolution options.
Working with Bookmark Data
Bookmark Data Types
Bookmark Data Constants


## Page 212

Bookmark Data Creation Options
Options used when creating bookmark data.
Bookmark Data Resolution Options
Options used when resolving bookmark data.
Common File System Resource Keys
Keys that are applicable to file system URLs.
File Resource Types
Possible values for the kCFURLFileResourceTypeKey key.
File Property Keys
Keys that apply to properties of files.
iCloud Constants
These constants can be used to determining whether a file is stored in the cloud and to obta
information about its status.
Volume Property Keys
Keys that apply to volumes.
CFError userInfo Dictionary Keys
Keys in the userInfo dictionary of a CFError object when certain CFURL functions return an
error.
enum CFURLComponentType
The types of components in a URL.
enum CFURLPathStyle
Options you can use to determine how CFURL functions parse a file system path name.
File System Constants
Miscellaneous
Relationships
Conforms To


## Page 213

Equatable, Hashable
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
class CFError
See Also
Opaque Types


## Page 214

A CFUserNotification object presents a simple dialog on the screen and optionally receives
feedback from the user. The contents of the dialog can include a header, a message, an icon, text
fields, a pop-up button, radio buttons or checkboxes, and up to three ordinary buttons. Use
CFUserNotification in processes that do not otherwise have user interfaces, but may need
occasional interaction with the user.
You create a user notification with the CFUserNotificationCreate(_:_:_:_:_:) function.
You pass in a dictionary whose keys describe the items to place into the dialog. (See Dialog
Description Keys for the list of keys.) A set of flags passed to the function determines, among oth
things, whether secure text fields are used (such as for password fields), whether radio buttons o
checkboxes are used, and which of these buttons are checked by default. You can also specify a
timeout for the dialog, in which case the dialog cancels itself if the user does not respond in the
allotted time period.
A user notification displays its dialog as soon as it is created. If any reply is required, it may be
awaited in one of two ways: either synchronously, using CFUserNotificationReceive
Response(_:_:_:), or asynchronously, using a run loop source created with CFUser
NotificationCreateRunLoopSource(_:_:_:_:). CFUserNotificationReceive
Response(_:_:_:) has a timeout parameter that determines how long it will block (zero
meaning indefinitely) and it may be called as many times as necessary until a response arrives. If 
user notification has not yet received a response, it may be updated with new information or it ma
be cancelled. User notifications may not be reused.
CFUserNotification provides two convenience functions, CFUserNotificationDisplay
Notice(_:_:_:_:_:_:_:_:) and CFUserNotificationDisplayAlert(_:_:_:_:_:_:
Overview
Core Foundation / CFUserNotification
Class
CFUserNotification
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 215

_:_:_:_:_:), to display very basic dialogs that either require no response from the user or
require only a single button to be pressed, respectively.
func CFUserNotificationCancel(CFUserNotification!) -> Int32
Cancels a user notification dialog.
func CFUserNotificationCheckBoxChecked(CFIndex) -> CFOptionFlags
Returns a flag used to set or test a checkbox’s state.
func CFUserNotificationCreate(CFAllocator!, CFTimeInterval, CFOption
Flags, UnsafeMutablePointer<Int32>!, CFDictionary!) -> CFUser
Notification!
Creates a CFUserNotification object and displays its notification dialog on screen.
func CFUserNotificationCreateRunLoopSource(CFAllocator!, CFUser
Notification!, CFUserNotificationCallBack!, CFIndex) -> CFRunLoopSource
Creates a run loop source for a user notification.
func CFUserNotificationDisplayAlert(CFTimeInterval, CFOptionFlags, CFUR
!, CFURL!, CFURL!, CFString!, CFString!, CFString!, CFString!, CFString
!, UnsafeMutablePointer<CFOptionFlags>!) -> Int32
Displays a user notification dialog and waits for a user response.
func CFUserNotificationDisplayNotice(CFTimeInterval, CFOptionFlags,
CFURL!, CFURL!, CFURL!, CFString!, CFString!, CFString!) -> Int32
Displays a user notification dialog that does not need a user response.
func CFUserNotificationGetResponseDictionary(CFUserNotification!) ->
CFDictionary!
Returns the dictionary containing all the text field values from a dismissed notification dialog
func CFUserNotificationGetResponseValue(CFUserNotification!, CFString!,
CFIndex) -> CFString!
Extracts the values of the text fields from a dismissed notification dialog.
func CFUserNotificationGetTypeID() -> CFTypeID
Returns the type identifier for the CFUserNotification opaque type.
Topics
CFUserNotification Miscellaneous Functions


## Page 216

func CFUserNotificationPopUpSelection(CFIndex) -> CFOptionFlags
Returns a flag used to set the selected element of a pop-up menu.
func CFUserNotificationReceiveResponse(CFUserNotification!, CFTime
Interval, UnsafeMutablePointer<CFOptionFlags>!) -> Int32
Waits for the user to respond to a notification or for the notification to time out.
func CFUserNotificationSecureTextField(CFIndex) -> CFOptionFlags
Returns a flag used to set the secure state of a text field.
func CFUserNotificationUpdate(CFUserNotification!, CFTimeInterval,
CFOptionFlags, CFDictionary!) -> Int32
Updates a displayed user notification dialog with new user interface information.
typealias CFUserNotificationCallBack
Callback invoked when an asynchronous user notification dialog is dismissed.
Alert Levels
Flags identifying the seriousness of a user notification.
Response Codes
Response codes identifying the button that was pressed to dismiss a notification dialog.
Button Flags
Flags that alter the display of buttons in a user notification dialog.
Alert Levels
Flags identifying the seriousness of a user notification.
Response Codes
Response codes identifying the button that was pressed to dismiss a notification dialog.
Button Flags
Flags that alter the display of buttons in a user notification dialog.
Dialog Description Keys
Callbacks
Constants


## Page 217

Keys used in a user notification’s description dictionary, which describes the contents of the
notification dialog to display.
Equatable, Hashable
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
class CFError
Relationships
Conforms To
See Also
Opaque Types


## Page 218



## Page 219

Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
class CFBinaryHeap
class CFBitVector
class CFBoolean
Relationships
Conforms To
See Also
Opaque Types
Core Foundation / CFURLEnumerator
Class
CFURLEnumerator
A reference to a CFURLEnumerator object.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 220

class CFBundle
class CFCalendar
class CFCharacterSet
class CFData
class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 221

CFUUID objects are used by plug-ins to uniquely identify types, interfaces, and factories. When
creating a new type, host developers must generate UUIDs to identify the type as well as its
interfaces and factories.
UUIDs (Universally Unique Identifiers), also known as GUIDs (Globally Unique Identifiers) or IIDs
(Interface Identifiers), are 128-bit values designed to be unique.
The standard format for UUIDs represented in ASCII is a string punctuated by hyphens, for examp
68753A44-4D6F-1226-9C60-0050E4C00067. The hex representation looks, as you might
expect, like a list of numerical values preceded by 0x. For example, 0x68, 0x75, 0x3A, 0x44
0x4D, 0x6F, 0x12, 0x26, 0x9C, 0x60, 0x00, 0x50, 0xE4, 0xC0, 0x00, 0x67 
To use a UUID, you create it and then copy the resulting strings into your header and C language
source files. Because a UUID is expressed as an array of bytes, there are no endianness
considerations for different platforms.
You can create a CFUUID object using any one of the CFUUIDCreate... functions. Use the
CFUUIDGetConstantUUIDWithBytes(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)
function if you want to declare a UUID constant in a #define statement. You can get the raw byt
of an existing CFUUID object using the CFUUIDGetUUIDBytes(_:) function.
Overview
Topics
Creating CFUUID Objects
Core Foundation / CFUUID
Class
CFUUID
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 222

func CFUUIDCreate(CFAllocator!) -> CFUUID!
Creates a Universally Unique Identifier (UUID) object.
func CFUUIDCreateFromString(CFAllocator!, CFString!) -> CFUUID!
Creates a CFUUID object for a specified string.
func CFUUIDCreateFromUUIDBytes(CFAllocator!, CFUUIDBytes) -> CFUUID!
Creates a CFUUID object from raw UUID bytes.
func CFUUIDCreateWithBytes(CFAllocator!, UInt8, UInt8, UInt8, UInt8,
UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8,
UInt8, UInt8) -> CFUUID!
Creates a CFUUID object from raw UUID bytes.
func CFUUIDCreateString(CFAllocator!, CFUUID!) -> CFString!
Returns the string representation of a specified CFUUID object.
func CFUUIDGetConstantUUIDWithBytes(CFAllocator!, UInt8, UInt8, UInt8,
UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8, UInt8,
UInt8, UInt8, UInt8) -> CFUUID!
Returns a CFUUID object from raw UUID bytes.
func CFUUIDGetUUIDBytes(CFUUID!) -> CFUUIDBytes
Returns the value of a UUID object as raw bytes.
func CFUUIDGetTypeID() -> CFTypeID
Returns the type identifier for all CFUUID objects.
struct CFUUIDBytes
A 128-bit struct that represents a UUID as raw bytes.
Getting Information About CFUUID Objects
Getting the CFUUID Type Identifier
Data Types
Relationships


## Page 223

Equatable, Hashable
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
class CFError
Conforms To
See Also
Opaque Types


## Page 224

CFWriteStream provides an interface for writing a byte stream either synchronously or
asynchronously. You can create streams that write bytes to a block of memory, a file, or a generic
socket. All streams need to be opened, using CFWriteStreamOpen(_:), before writing.
Use CFReadStream for reading byte streams, and for the functions, such as CFStreamCreate
PairWithSocketToHost(_:_:_:_:_:), that create socket streams).
CFWriteStream is “toll-free bridged” with its Cocoa Foundation counterpart, OutputStream.
This means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSOutputStream *
parameter, you can pass in a CFWriteStreamRef, and in a function where you see a CFWrite
StreamRef parameter, you can pass in an NSOutputStream instance. Note, however, that you
may have either a delegate or callbacks but not both. See Toll-Free Bridged Types for more
information on toll-free bridging.
func CFWriteStreamCreateWithAllocatedBuffers(CFAllocator!, CFAllocator!
-> CFWriteStream!
Creates a writable stream for a growable block of memory.
Overview
Topics
Creating a Write Stream
Core Foundation / CFWriteStream
Class
CFWriteStream
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 225

func CFWriteStreamCreateWithBuffer(CFAllocator!, UnsafeMutablePointer<
UInt8>!, CFIndex) -> CFWriteStream!
Creates a writable stream for a fixed-size block of memory.
func CFWriteStreamCreateWithFile(CFAllocator!, CFURL!) -> CFWriteStream
Creates a writable stream for a file.
func CFWriteStreamClose(CFWriteStream!)
Closes a writable stream.
func CFWriteStreamOpen(CFWriteStream!) -> Bool
Opens a stream for writing.
func CFWriteStreamWrite(CFWriteStream!, UnsafePointer<UInt8>!, CFIndex)
-> CFIndex
Writes data to a writable stream.
func CFWriteStreamScheduleWithRunLoop(CFWriteStream!, CFRunLoop!, CFRun
LoopMode!)
Schedules a stream into a run loop.
func CFWriteStreamUnscheduleFromRunLoop(CFWriteStream!, CFRunLoop!,
CFRunLoopMode!)
Removes a stream from a particular run loop.
func CFWriteStreamCanAcceptBytes(CFWriteStream!) -> Bool
Returns whether a writable stream can accept new data without blocking.
func CFWriteStreamCopyProperty(CFWriteStream!, CFStreamPropertyKey!) ->
CFTypeRef!
Returns the value of a property for a stream.
func CFWriteStreamCopyError(CFWriteStream!) -> CFError!
Opening and Closing a Stream
Writing to a Stream
Scheduling a Write Stream
Examining Stream Properties


## Page 226

Returns the error associated with a stream.
func CFWriteStreamGetError(CFWriteStream!) -> CFStreamError
Returns the error status of a stream.
Deprecated
func CFWriteStreamGetStatus(CFWriteStream!) -> CFStreamStatus
Returns the current state of a stream.
func CFWriteStreamSetClient(CFWriteStream!, CFOptionFlags, CFWriteStrea
ClientCallBack!, UnsafeMutablePointer<CFStreamClientContext>!) -> Bool
Assigns a client to a stream, which receives callbacks when certain events occur.
func CFWriteStreamSetProperty(CFWriteStream!, CFStreamPropertyKey!,
CFTypeRef!) -> Bool
Sets the value of a property for a stream.
func CFWriteStreamGetTypeID() -> CFTypeID
Returns the type identifier of all CFWriteStream objects.
typealias CFWriteStreamClientCallBack
Callback invoked when certain types of activity takes place on a writable stream.
Equatable, Hashable
Setting Stream Properties
Getting the CFWriteStream Type ID
Callbacks
Relationships
Conforms To
See Also


## Page 227

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
class CFError
Opaque Types


## Page 228

A CFXMLNode object describes an individual XML construct—like a tag, or a comment, or a string
of character data. CFXMLNode is intended to be used with the CFXMLParser and CFXMLTree
opaque types.
Each CFXMLNode object contains three main pieces of information—the node’s type, the data
string, and a pointer to an additional information data structure. A CFXMLNode object’s type is on
of the enumerations described in CFXMLNodeTypeCode. The data string is always a CFString
object; the meaning of the string is dependent on the node’s type. The format of the additional da
is also dependent on the node’s type; in general, there is a custom structure for each type that
requires additional data. See CFXMLNodeTypeCode for the mapping from a node type to meanin
of the data string, and structure of the additional information. Note that these structures are
versioned and may change as the parser changes. The current version can always be identified by
the kCFXMLNodeCurrentVersion constant; earlier versions can be identified and used by
passing earlier values for the version number (although the older structures would have been
removed from the header).
You create a CFXMLNode object using one of the create or copy functions. Use the CFXMLNode
GetTypeCode, CFXMLNodeGetString, and CFXMLNodeGetInfoPtr functions to get the nod
type, data string, and additional information respectively. Use the CFXMLNodeGetVersion
function to get a node’s version number.
Overview
Topics
Core Foundation / CFXMLNode
Class
CFXMLNode
macOS


## Page 229

struct CFXMLAttributeDeclarationInfo
Contains information about an element attribute definition.
struct CFXMLAttributeListDeclarationInfo
Contains a list of the attributes associated with an element.
struct CFXMLDocumentInfo
Contains the source URL and text encoding information for the XML document.
struct CFXMLDocumentTypeInfo
Contains the external ID of the DTD.
struct CFXMLElementInfo
Contains a list of element attributes packaged as CFDictionary key/value pairs.
struct CFXMLElementTypeDeclarationInfo
Contains a description of the element type.
struct CFXMLEntityInfo
Contains information describing an XML entity.
struct CFXMLEntityReferenceInfo
Contains information describing an XML entity reference.
struct CFXMLExternalID
Contains the system and public IDs for an external entity reference.
struct CFXMLNotationInfo
Contains the external ID of the notation.
struct CFXMLProcessingInstructionInfo
Contains the text of the processing instruction.
enum CFXMLEntityTypeCode
The entity type identification codes that the parser uses to describe XML entities.
Node Current Version
Data Types
Constants


## Page 230

The version of a CFXMLNode object.
enum CFXMLNodeTypeCode
The various XML data type identification codes that the parser uses to describe XML
structures.
Equatable, Hashable
XML Programming Topics for Core Foundation
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


## Page 231

class CFDate
class CFDateFormatter
class CFDictionary
class CFError


## Page 232

CFXMLParser provides an XML parser you can use to find and extract data in XML documents. Yo
can use a high-level interface to load an XML document into a Core Foundation collection object.
low-level callback-based interface allows you to perform any action you wish on an XML structure
type when it is detected by the parser. This opaque type is relevant for applications that need
information about an XML document’s structure or content.
typealias CFXMLParserAddChildCallBack
Callback function invoked by the parser to notify your application of parent/child relationship
between XML structures.
typealias CFXMLParserCopyDescriptionCallBack
Callback function invoked by the parser when handling the information pointer.
typealias CFXMLParserCreateXMLStructureCallBack
Callback function invoked when the parser encounters an XML open tag.
typealias CFXMLParserEndXMLStructureCallBack
Overview
Topics
Callbacks
Core Foundation / CFXMLParser
Class
CFXMLParser
macOS


## Page 233

Callback function invoked by the parser to notify your application that an XML structure (and
all its children) have been completely parsed.
typealias CFXMLParserHandleErrorCallBack
Callback function invoked by the parser to notify your application that an error has occurred
typealias CFXMLParserReleaseCallBack
Callback function invoked by the parser when it wants to release a reference to the
information pointer.
typealias CFXMLParserResolveExternalEntityCallBack
Callback function invoked by the parser to notify your application that an external entity has
been referenced.
typealias CFXMLParserRetainCallBack
Callback function invoked by the parser when it needs another reference to the information
pointer.
struct CFXMLParserCallBacks
Contains version information and function pointers to callbacks needed when parsing XML.
struct CFXMLParserContext
Contains version information and function pointers to callbacks used when handling a
program-defined context.
struct CFXMLParserStatusCode
The various status and error flags that can be returned by the parser.
struct CFXMLParserOptions
Options you can use to control the parser’s treatment of an XML document.
Data Types
Constants
Relationships
Conforms To


## Page 234

Equatable, Hashable
XML Programming Topics for Core Foundation
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
class CFError
See Also
Related Documentation
Opaque Types


## Page 235

A CFXMLTree object is simply a CFTree object whose context data is known to be a CFXMLNode
object. CFXMLTree is derived from CFTree—you can pass CFXMLTree objects in all the CFTree
functions. As such, a CFXMLTree object can be used to represent an entire XML document; the
CFTree object provides the tree structure of the document, while the CFXMLNode objects identify
and describe the nodes of the tree. An XML document can be parsed to a CFXMLTree object, and
CFXMLTree object can generate the data for the equivalent XML document. This opaque type is
expected to be used in conjunction with CFXMLParser and CFXMLNode objects.
func CFXMLCreateStringByEscapingEntities(CFAllocator!, CFString!,
CFDictionary!) -> CFString!
Given a CFString object containing XML source with unescaped entities, returns a string with
specified XML entities escaped.
func CFXMLCreateStringByUnescapingEntities(CFAllocator!, CFString!,
CFDictionary!) -> CFString!
Given a CFString object containing XML source with escaped entities, returns a string with
specified XML entities unescaped.
Overview
Topics
CFXMLTree Miscellaneous Functions
Core Foundation / CFXMLTree
Type Alias
CFXMLTree
macOS


## Page 236

Error Dictionary Keys
The keys used in an error dictionary returned by some functions to provide more information
about XML parse errors.
XML Programming Topics for Core Foundation
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
class CFError
Constants
See Also
Related Documentation
Opaque Types


## Page 237



