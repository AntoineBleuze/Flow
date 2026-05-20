# 000_Base Utilities.pdf

## Page 1

Core Foundation defines a number of miscellaneous symbols that are either used by many differe
opaque types, such as CFIndex, or apply to Core Foundation as a whole, such as kCFCore
FoundationVersionNumber. These symbols are collected together and documented here.
func CFRangeMake(CFIndex, CFIndex) -> CFRange
Declares and initializes a CFRange structure.
typealias CFComparatorFunction
Callback function that compares two values. You provide a pointer to this callback in certain
Core Foundation sorting functions.
typealias CFIndex
Priority values used for kAXPriorityKey
typealias CFOptionFlags
A bitfield used for passing special allocation and other requests into Core Foundation
functions.
Overview
Topics
Core Foundation Base Utilities Miscellaneous Functions
Callbacks
Data Types
Core Foundation / Base Utilities
API Collection
Base Utilities


## Page 2

struct CFRange
A structure representing a range of sequential items in a container, such as characters in a
buffer or elements in a collection.
enum CFComparisonResult
Constants returned by comparison functions, indicating whether a value is equal to, less tha
or greater than another value.
Value Not Found
Special value returned when a Core Foundation function cannot locate a requested value.
Current Framework Version Number
Current version number of the Core Foundation framework.
Framework Version Numbers
Version numbers of the Core Foundation framework.
Core Foundation Design Concepts
Byte-Order Utilities
Core Foundation URL Access Utilities
Preferences Utilities
Socket Name Server Utilities
Time Utilities
Constants
See Also
Related Documentation
Utilities


