# 030_CFNull.pdf

## Page 1

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


## Page 2

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


## Page 3

class CFError


