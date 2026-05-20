# 036_CFReadStream.pdf

## Page 1

CFReadStream provides an interface for reading a byte stream either synchronously or
asynchronously. You can create streams that read bytes from a block of memory, a file, or a gene
socket. All streams need to be opened, using CFReadStreamOpen(_:), before reading.
Use CFWriteStream for writing byte streams. The CFNetwork framework defines an additional
type of stream for reading responses to HTTP requests.
CFReadStream is “toll-free bridged” with its Cocoa Foundation counterpart, InputStream. This
means that the Core Foundation type is interchangeable in function or method calls with the
bridged Foundation object. Therefore, in a method where you see an NSInputStream *
parameter, you can pass in a CFReadStreamRef, and in a function where you see a
CFReadStreamRef parameter, you can pass in an NSInputStream instance. Note, however, that
you may have either a delegate or callbacks but not both. See Toll-Free Bridged Types for more
information on toll-free bridging.
func CFReadStreamCreateWithBytesNoCopy(CFAllocator!, UnsafePointer<UInt
>!, CFIndex, CFAllocator!) -> CFReadStream!
Creates a readable stream for a block of memory.
Overview
Topics
Creating a Read Stream
Core Foundation / CFReadStream
Class
CFReadStream
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func CFReadStreamCreateWithFile(CFAllocator!, CFURL!) -> CFReadStream!
Creates a readable stream for a file.
func CFReadStreamClose(CFReadStream!)
Closes a readable stream.
func CFReadStreamOpen(CFReadStream!) -> Bool
Opens a stream for reading.
func CFReadStreamRead(CFReadStream!, UnsafeMutablePointer<UInt8>!,
CFIndex) -> CFIndex
Reads data from a readable stream.
func CFReadStreamScheduleWithRunLoop(CFReadStream!, CFRunLoop!, CFRun
LoopMode!)
Schedules a stream into a run loop.
func CFReadStreamUnscheduleFromRunLoop(CFReadStream!, CFRunLoop!, CFRun
LoopMode!)
Removes a read stream from a given run loop.
func CFReadStreamCopyProperty(CFReadStream!, CFStreamPropertyKey!) ->
CFTypeRef!
Returns the value of a property for a stream.
func CFReadStreamGetBuffer(CFReadStream!, CFIndex, UnsafeMutablePointer
CFIndex>!) -> UnsafePointer<UInt8>!
Returns a pointer to a stream’s internal buffer of unread data, if possible.
func CFReadStreamCopyError(CFReadStream!) -> CFError!
Returns the error associated with a stream.
func CFReadStreamGetError(CFReadStream!) -> CFStreamError
Opening and Closing a Read Stream
Reading from a Stream
Scheduling a Read Stream
Examining Stream Properties


## Page 3

Returns the error status of a stream.
Deprecated
func CFReadStreamGetStatus(CFReadStream!) -> CFStreamStatus
Returns the current state of a stream.
func CFReadStreamHasBytesAvailable(CFReadStream!) -> Bool
Returns a Boolean value that indicates whether a readable stream has data that can be read
without blocking.
func CFReadStreamSetClient(CFReadStream!, CFOptionFlags, CFReadStream
ClientCallBack!, UnsafeMutablePointer<CFStreamClientContext>!) -> Bool
Assigns a client to a stream, which receives callbacks when certain events occur.
func CFReadStreamSetProperty(CFReadStream!, CFStreamPropertyKey!, CFTyp
Ref!) -> Bool
Sets the value of a property for a stream.
func CFReadStreamGetTypeID() -> CFTypeID
Returns the type identifier the CFReadStream opaque type.
typealias CFReadStreamClientCallBack
Callback invoked when certain types of activity takes place on a readable stream.
struct CFStreamClientContext
A structure that contains program-defined data and callbacks with which you can configure 
stream’s client behavior.
Setting Stream Properties
Getting the CFReadStream Type ID
Callbacks
Data Types
Relationships


## Page 4

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
Conforms To
See Also
Opaque Types


