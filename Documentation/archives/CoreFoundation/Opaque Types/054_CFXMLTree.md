# 054_CFXMLTree.pdf

## Page 1

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


## Page 2

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


## Page 3



