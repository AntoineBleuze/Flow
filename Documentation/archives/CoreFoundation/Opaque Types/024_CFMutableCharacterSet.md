# 024_CFMutableCharacterSet.pdf

## Page 1

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


## Page 2

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


## Page 3

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


