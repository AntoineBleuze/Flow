# 022_CFMutableBag.pdf

## Page 1

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


## Page 2

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


