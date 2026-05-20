# 011_CFDate.pdf

## Page 1

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


## Page 2

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


## Page 3

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


