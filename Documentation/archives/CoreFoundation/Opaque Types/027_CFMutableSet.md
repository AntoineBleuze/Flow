# 027_CFMutableSet.pdf

## Page 1

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


## Page 2

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


## Page 3

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


