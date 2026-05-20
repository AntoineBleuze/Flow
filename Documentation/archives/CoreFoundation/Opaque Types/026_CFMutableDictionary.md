# 026_CFMutableDictionary.pdf

## Page 1

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


## Page 2

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


## Page 3

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


