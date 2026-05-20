# 051_CFWriteStream.pdf

## Page 1

CFWriteStream provides an interface for writing a byte stream either synchronously or
asynchronously. You can create streams that write bytes to a block of memory, a file, or a generic
socket. All streams need to be opened, using CFWriteStreamOpen(_:), before writing.
Use CFReadStream for reading byte streams, and for the functions, such as CFStreamCreate
PairWithSocketToHost(_:_:_:_:_:), that create socket streams).
CFWriteStream is “toll-free bridged” with its Cocoa Foundation counterpart, OutputStream.
This means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSOutputStream *
parameter, you can pass in a CFWriteStreamRef, and in a function where you see a CFWrite
StreamRef parameter, you can pass in an NSOutputStream instance. Note, however, that you
may have either a delegate or callbacks but not both. See Toll-Free Bridged Types for more
information on toll-free bridging.
func CFWriteStreamCreateWithAllocatedBuffers(CFAllocator!, CFAllocator!
-> CFWriteStream!
Creates a writable stream for a growable block of memory.
Overview
Topics
Creating a Write Stream
Core Foundation / CFWriteStream
Class
CFWriteStream
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFWriteStreamCreateWithBuffer(CFAllocator!, UnsafeMutablePointer<
UInt8>!, CFIndex) -> CFWriteStream!
Creates a writable stream for a fixed-size block of memory.
func CFWriteStreamCreateWithFile(CFAllocator!, CFURL!) -> CFWriteStream
Creates a writable stream for a file.
func CFWriteStreamClose(CFWriteStream!)
Closes a writable stream.
func CFWriteStreamOpen(CFWriteStream!) -> Bool
Opens a stream for writing.
func CFWriteStreamWrite(CFWriteStream!, UnsafePointer<UInt8>!, CFIndex)
-> CFIndex
Writes data to a writable stream.
func CFWriteStreamScheduleWithRunLoop(CFWriteStream!, CFRunLoop!, CFRun
LoopMode!)
Schedules a stream into a run loop.
func CFWriteStreamUnscheduleFromRunLoop(CFWriteStream!, CFRunLoop!,
CFRunLoopMode!)
Removes a stream from a particular run loop.
func CFWriteStreamCanAcceptBytes(CFWriteStream!) -> Bool
Returns whether a writable stream can accept new data without blocking.
func CFWriteStreamCopyProperty(CFWriteStream!, CFStreamPropertyKey!) ->
CFTypeRef!
Returns the value of a property for a stream.
func CFWriteStreamCopyError(CFWriteStream!) -> CFError!
Opening and Closing a Stream
Writing to a Stream
Scheduling a Write Stream
Examining Stream Properties


## Page 3

Returns the error associated with a stream.
func CFWriteStreamGetError(CFWriteStream!) -> CFStreamError
Returns the error status of a stream.
Deprecated
func CFWriteStreamGetStatus(CFWriteStream!) -> CFStreamStatus
Returns the current state of a stream.
func CFWriteStreamSetClient(CFWriteStream!, CFOptionFlags, CFWriteStrea
ClientCallBack!, UnsafeMutablePointer<CFStreamClientContext>!) -> Bool
Assigns a client to a stream, which receives callbacks when certain events occur.
func CFWriteStreamSetProperty(CFWriteStream!, CFStreamPropertyKey!,
CFTypeRef!) -> Bool
Sets the value of a property for a stream.
func CFWriteStreamGetTypeID() -> CFTypeID
Returns the type identifier of all CFWriteStream objects.
typealias CFWriteStreamClientCallBack
Callback invoked when certain types of activity takes place on a writable stream.
Equatable, Hashable
Setting Stream Properties
Getting the CFWriteStream Type ID
Callbacks
Relationships
Conforms To
See Also


## Page 4

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


