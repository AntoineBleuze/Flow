# 018_CFMachPort.pdf

## Page 1

A CFMachPort object is a wrapper for a native Mach port (mach_port_t). Mach ports are the
native communication channel for the macOS kernel.
CFMachPort does not provide a function to send messages, so you primarily use a CFMachPort
object if you need to listen to a Mach port that you obtained by other means. You can get a callba
when a message arrives on the port or when the port becomes invalid, such as when the native
port dies.
To listen for messages you need to create a run loop source with CFMachPortCreateRunLoop
Source(_:_:_:) and add it to a run loop with CFRunLoopAddSource(_:_:_:).
Important
If you want to tear down the connection, you must invalidate the port (using CFMachPort
Invalidate(_:)) before releasing the runloop source and the Mach port object.
To send data, you must use the Mach APIs with the native Mach port, which is not described here
Alternatively, you can use a CFMessagePort object, which can send arbitrary data.
Mach ports only support communication on the local machine. For network communication, you
have to use a CFSocket object.
Overview
Topics
Core Foundation / CFMachPort
Class
CFMachPort
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFMachPortCreate(CFAllocator!, CFMachPortCallBack!, UnsafeMutable
Pointer<CFMachPortContext>!, UnsafeMutablePointer<DarwinBoolean>!) ->
CFMachPort!
Creates a CFMachPort object with a new Mach port.
func CFMachPortCreateWithPort(CFAllocator!, mach_port_t, CFMachPortCall
Back!, UnsafeMutablePointer<CFMachPortContext>!, UnsafeMutablePointer<
DarwinBoolean>!) -> CFMachPort!
Creates a CFMachPort object for a pre-existing native Mach port.
func CFMachPortInvalidate(CFMachPort!)
Invalidates a CFMachPort object, stopping it from receiving any more messages.
func CFMachPortCreateRunLoopSource(CFAllocator!, CFMachPort!, CFIndex) 
> CFRunLoopSource!
Creates a CFRunLoopSource object for a CFMachPort object.
func CFMachPortSetInvalidationCallBack(CFMachPort!, CFMachPort
InvalidationCallBack!)
Sets the callback function invoked when a CFMachPort object is invalidated.
func CFMachPortGetContext(CFMachPort!, UnsafeMutablePointer<CFMachPort
Context>!)
Returns the context information for a CFMachPort object.
func CFMachPortGetInvalidationCallBack(CFMachPort!) -> CFMachPort
InvalidationCallBack!
Returns the invalidation callback function for a CFMachPort object.
func CFMachPortGetPort(CFMachPort!) -> mach_port_t
Returns the native Mach port represented by a CFMachPort object.
func CFMachPortIsValid(CFMachPort!) -> Bool
Returns a Boolean value that indicates whether a CFMachPort object is valid and able to
receive messages.
Creating a CFMachPort Object
Configuring a CFMachPort Object
Examining a CFMachPort Object


## Page 3

func CFMachPortGetTypeID() -> CFTypeID
Returns the type identifier for the CFMachPort opaque type.
typealias CFMachPortCallBack
Callback invoked to process a message received on a CFMachPort object.
typealias CFMachPortInvalidationCallBack
Callback invoked when a CFMachPort object is invalidated.
struct CFMachPortContext
A structure that contains program-defined data and callbacks with which you can configure 
CFMachPort object’s behavior.
Equatable, Hashable
class CFAllocator
class CFArray
class CFAttributedString
class CFBag
Getting the CFMachPort Type ID
Callbacks
Data Types
Relationships
Conforms To
See Also
Opaque Types


## Page 4

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


