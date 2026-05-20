# 038_CFRunLoopObserver.pdf

## Page 1

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


## Page 2

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


## Page 3

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


