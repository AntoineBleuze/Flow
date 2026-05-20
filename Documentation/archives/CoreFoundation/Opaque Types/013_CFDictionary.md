# 013_CFDictionary.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


