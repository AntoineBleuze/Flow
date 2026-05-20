# System Event Monitoring.pdf

## Page 1

Use the methods of this class to construct new dispatch sources of the appropriate types.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.
class func makeTimerSource(flags: DispatchSource.TimerFlags, queue:
DispatchQueue?) -> any DispatchSourceTimer
Creates a new dispatch source object for monitoring timer events.
protocol DispatchSourceTimer
A dispatch source that submits the event handler block based on a timer.
Overview
Topics
Managing Common Dispatch Source Properties
Creating a Timer Source
Dispatch / DispatchSource
Class
DispatchSource
An object that coordinates the processing of specific low-level system events,
such as file-system events, timers, and UNIX signals.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

struct TimerFlags
Flags to use when configuring a timer dispatch source.
class func makeReadSource(fileDescriptor: Int32, queue: DispatchQueue?)
-> any DispatchSourceRead
Creates a new dispatch source object for reading bytes from the specified file.
class func makeWriteSource(fileDescriptor: Int32, queue: DispatchQueue?
-> any DispatchSourceWrite
Creates a new dispatch source object for writing data to the specified file.
class func makeFileSystemObjectSource(fileDescriptor: Int32, eventMask:
DispatchSource.FileSystemEvent, queue: DispatchQueue?) -> any Dispatch
SourceFileSystemObject
Creates a new dispatch source object for monitoring file-system events.
protocol DispatchSourceRead
A dispatch source object for reading data from a file descriptor.
protocol DispatchSourceWrite
A dispatch source object for writing data to a file descriptor.
protocol DispatchSourceFileSystemObject
A dispatch source that monitors events associated with a file descriptor.
struct FileSystemEvent
Events involving a change to a file system object.
class func makeProcessSource(identifier: pid_t, eventMask: Dispatch
Source.ProcessEvent, queue: DispatchQueue?) -> any DispatchSourceProces
Creates a new dispatch source object for monitoring the specified process.
protocol DispatchSourceProcess
A dispatch source that monitors an external process for events.
struct ProcessEvent
Events related to a process.
Creating a File System Source
Creating a Process Source


## Page 3

class func makeMemoryPressureSource(eventMask: DispatchSource.Memory
PressureEvent, queue: DispatchQueue?) -> any DispatchSourceMemory
Pressure
Creates a new dispatch source object that monitors the system for changes in the memory
pressure condition.
protocol DispatchSourceMemoryPressure
A dispatch source that monitors the system for changes in the memory pressure condition.
struct MemoryPressureEvent
Memory pressure events.
class func makeSignalSource(signal: Int32, queue: DispatchQueue?) -> an
DispatchSourceSignal
Creates a new dispatch source object that monitors the arrival of a UNIX signal.
protocol DispatchSourceSignal
A dispatch source that monitors the current process for UNIX signals.
class func makeMachReceiveSource(port: mach_port_t, queue: DispatchQueu
?) -> any DispatchSourceMachReceive
Creates a new dispatch source object for monitoring a Mach port for pending messages.
class func makeMachSendSource(port: mach_port_t, eventMask: Dispatch
Source.MachSendEvent, queue: DispatchQueue?) -> any DispatchSourceMach
Send
A dispatch source that monitors a Mach port for dead name notifications.
protocol DispatchSourceMachReceive
A dispatch source that monitors a Mach port for pending messages.
protocol DispatchSourceMachSend
A dispatch source that monitors a Mach port for dead name notifications, indicating that a
send right no longer has a corresponding receive right.
Creating a Memory Pressure Source
Creating a Signal Source
Creating a Mach Port Source


## Page 4

struct MachSendEvent
Mach-related events.
class func makeUserDataAddSource(queue: DispatchQueue?) -> any Dispatch
SourceUserDataAdd
Creates a new dispatch source object that you use to coalesce custom app data using an AN
operator.
class func makeUserDataOrSource(queue: DispatchQueue?) -> any Dispatch
SourceUserDataOr
Creates a new dispatch source object that you use to coalesce custom app data using an OR
operator.
class func makeUserDataReplaceSource(queue: DispatchQueue?) -> any
DispatchSourceUserDataReplace
Creates a new dispatch source object that you use to track custom app data.
protocol DispatchSourceUserDataAdd
A dispatch source that coalesces data you provide using an AND operation.
protocol DispatchSourceUserDataOr
A dispatch source that coalesces data you provide using an OR operation.
protocol DispatchSourceUserDataReplace
A dispatch source that replaces any pending data with the new value you provide.
DispatchObject
CVarArg
Copyable
DispatchSourceFileSystemObject
Creating a Custom Source
Relationships
Inherits From
Conforms To


## Page 5

DispatchSourceMachReceive
DispatchSourceMachSend
DispatchSourceMemoryPressure
DispatchSourceProcess
DispatchSourceProtocol
DispatchSourceRead
DispatchSourceSignal
DispatchSourceTimer
DispatchSourceUserDataAdd
DispatchSourceUserDataOr
DispatchSourceUserDataReplace
DispatchSourceWrite
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Dispatch Source
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
class DispatchIO
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
struct DispatchData
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
struct DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
Dispatch I/O
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
See Also
System Event Monitoring


## Page 6

Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.


## Page 7

typealias dispatch_source_t
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
typealias dispatch_source_mach_recv_flags_t
Mach receive-right flags.
class DispatchSource
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
class DispatchIO
Topics
Creating a Dispatch Source
Getting Dispatch Source Attributes
See Also
System Event Monitoring
Dispatch / Dispatch Source
API Collection
Dispatch Source
An object that coordinates the processing of specific low-level system events,
such as file-system events, timers, and UNIX signals.


## Page 8

An object that manages operations on a file descriptor using either stream-based or random
access semantics.
struct DispatchData
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
struct DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
Dispatch I/O
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.


## Page 9

convenience init(type: DispatchIO.StreamType, fileDescriptor: Int32,
queue: DispatchQueue, cleanupHandler: (Int32) -> Void)
Creates a new I/O channel that accesses the specified file descriptor.
convenience init?(type: DispatchIO.StreamType, path: UnsafePointer<Int8
>, oflag: Int32, mode: mode_t, queue: DispatchQueue, cleanupHandler: (
Int32) -> Void)
Creates a new I/O channel that accesses the file at the specified path, potentially creating th
file in the process.
convenience init(type: DispatchIO.StreamType, io: DispatchIO, queue:
DispatchQueue, cleanupHandler: (Int32) -> Void)
Creates a new I/O channel from an existing I/O channel.
enum StreamType
The semantics for accessing the contents of a file descriptor.
Topics
Creating a Dispatch I/O Object
Reading from the File
Dispatch / DispatchIO
Class
DispatchIO
An object that manages operations on a file descriptor using either stream-based
or random-access semantics.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 10

func read(offset: off_t, length: Int, queue: DispatchQueue, ioHandler: 
Bool, DispatchData?, Int32) -> Void)
Schedules an asynchronous read operation on the specified channel.
class func read(fromFileDescriptor: Int32, maxLength: Int, running
HandlerOn: DispatchQueue, handler: (DispatchData, Int32) -> Void)
Schedules an asynchronous read operation using the specified file descriptor.
func write(offset: off_t, data: DispatchData, queue: DispatchQueue, io
Handler: (Bool, DispatchData?, Int32) -> Void)
Schedules an asynchronous write operation for the specified channel.
class func write(toFileDescriptor: Int32, data: DispatchData, running
HandlerOn: DispatchQueue, handler: (DispatchData?, Int32) -> Void)
Schedules an asynchronous write operation to the specified file descriptor.
func close(flags: DispatchIO.CloseFlags)
Closes the channel to new read and write operations.
struct CloseFlags
Additional flags to use when closing an I/O channel.
var fileDescriptor: Int32
Returns the file descriptor associated with the specified channel.
func setLimit(highWater: Int)
Sets the maximum number of bytes to process before enqueueing a handler block.
func setLimit(lowWater: Int)
Sets the minimum number of bytes to process before enqueueing a handler block.
func setInterval(interval: DispatchTimeInterval, flags: DispatchIO.
IntervalFlags)
Sets the interval, in nanoseconds, at which to invoke the I/O handlers for the channel.
Writing to the File
Closing the File
Managing the File Descriptor


## Page 11

struct IntervalFlags
The desired delivery behavior for interval events.
func barrier(execute: () -> Void)
Schedules a barrier operation on the specified channel.
convenience init(type: DispatchIO.StreamType, path: UnsafePointer<Int8>
oflag: Int32, mode: mode_t, queue: DispatchQueue, cleanupHandler: (Int3
) -> Void)
DispatchObject
CVarArg
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class DispatchSource
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
Synchronizing File Operations
Initializers
Relationships
Inherits From
Conforms To
See Also
System Event Monitoring


## Page 12

Dispatch Source
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
struct DispatchData
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
struct DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
Dispatch I/O
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.


## Page 13

The memory buffer managed by this object may be a single contiguous block of memory, or it ma
consist of multiple discontiguous blocks. For the discontiguous case, the dispatch data object
makes it appear as if the memory is contiguous.
init(bytes: UnsafeRawBufferPointer)
Creates a new dispatch data object from the specified memory buffer.
init(bytesNoCopy: UnsafeRawBufferPointer, deallocator: DispatchData.
Deallocator)
Creates a new dispatch data object using the specified memory buffer and deallocator.
func withUnsafeBytes<Result, ContentType>(body: (UnsafePointer<Content
Type>) throws -> Result) rethrows -> Result
enum Deallocator
Overview
Topics
Creating a Dispatch Data Structure
Dispatch / DispatchData
Structure
DispatchData
An object that manages a memory-based data buffer and exposes it as a
contiguous block of memory.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 14

Memory deallocators for dispatch data objects.
static let empty: DispatchData
A dispatch data object representing a zero-length memory region.
func append(DispatchData)
func append<SourceType>(UnsafeBufferPointer<SourceType>)
func append(UnsafeRawBufferPointer)
func copyBytes(to: UnsafeMutableRawBufferPointer, count: Int)
func copyBytes<DestinationType>(to: UnsafeMutableBufferPointer<
DestinationType>, from: Range<DispatchData.Index>?) -> Int
func copyBytes(to: UnsafeMutableRawBufferPointer, from: Range<Dispatch
Data.Index>)
subscript(DispatchData.Index) -> UInt8
func region(location: Int) -> (data: DispatchData, offset: Int)
struct Region
func makeIterator() -> DispatchData.Iterator
func enumerateBytes((UnsafeBufferPointer<UInt8>, Int, inout Bool) ->
Void)
func subdata(in: Range<DispatchData.Index>) -> DispatchData
func append(DispatchData)
Appending Data to the Buffer
Copying Bytes
Accessing Buffer Data
Iterating Over the Buffer Contents
Retrieving Buffer Subsequences
Combining Sequence Elements


## Page 15

func append<SourceType>(UnsafeBufferPointer<SourceType>)
func append(UnsafeRawBufferPointer)
func append(UnsafePointer<UInt8>, count: Int)
func copyBytes(to: UnsafeMutablePointer<UInt8>, count: Int)
func copyBytes(to: UnsafeMutableRawBufferPointer, count: Int)
func copyBytes<DestinationType>(to: UnsafeMutableBufferPointer<
DestinationType>, from: Range<DispatchData.Index>?) -> Int
func copyBytes(to: UnsafeMutablePointer<UInt8>, from: Range<DispatchDat
.Index>)
func copyBytes(to: UnsafeMutableRawBufferPointer, from: Range<Dispatch
Data.Index>)
func enumerateBytes((UnsafeBufferPointer<UInt8>, Int, inout Bool) ->
Void)
func makeIterator() -> DispatchData.Iterator
func region(location: Int) -> (data: DispatchData, offset: Int)
func subdata(in: Range<DispatchData.Index>) -> DispatchData
func withUnsafeBytes<Result, ContentType>(body: (UnsafePointer<Content
Type>) throws -> Result) rethrows -> Result
init(bytes: UnsafeBufferPointer<UInt8>)
Initialize a data object with copied memory content.
init(bytesNoCopy: UnsafeBufferPointer<UInt8>, deallocator: DispatchData
Deallocator)
Initialize a data object without copying the bytes.
func append(UnsafePointer<UInt8>, count: Int)
func copyBytes(to: UnsafeMutablePointer<UInt8>, count: Int)
func copyBytes(to: UnsafeMutablePointer<UInt8>, from: Range<DispatchDat
.Index>)
Deprecated
Instance Methods


## Page 16

func enumerateBytes(block: (UnsafeBufferPointer<UInt8>, Int, inout Bool
-> Void)
BidirectionalCollection
Collection
Copyable
DataProtocol
RandomAccessCollection
Sendable
SendableMetatype
Sequence
class DispatchSource
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
Dispatch Source
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
class DispatchIO
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
struct DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
Dispatch I/O
Relationships
Conforms To
See Also
System Event Monitoring


## Page 17

An object that manages operations on a file descriptor using either stream-based or random
access semantics.
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.


## Page 18

func next() -> DispatchData.Element?
IteratorProtocol
Sendable
SendableMetatype
Sequence
Topics
Iterating Over a Sequence’s Elements
Relationships
Conforms To
See Also
System Event Monitoring
Dispatch / DispatchDataIterator
Structure
DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 19

class DispatchSource
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
Dispatch Source
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
class DispatchIO
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
struct DispatchData
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
Dispatch I/O
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.


## Page 20

typealias dispatch_io_t
A dispatch I/O channel.
var fileDescriptor: Int32
Returns the file descriptor associated with the specified channel.
func setLimit(lowWater: Int)
Sets the minimum number of bytes to process before enqueueing a handler block.
func setLimit(highWater: Int)
Sets the maximum number of bytes to process before enqueueing a handler block.
func barrier(execute: () -> Void)
Schedules a barrier operation on the specified channel.
Topics
Creating a Dispatch I/O Object
Managing the File Descriptor
Synchronizing File Operations
Dispatch / Dispatch I/O
API Collection
Dispatch I/O
An object that manages operations on a file descriptor using either stream-based
or random-access semantics.


## Page 21

class DispatchSource
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
Dispatch Source
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
class DispatchIO
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
struct DispatchData
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
struct DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.
See Also
System Event Monitoring


## Page 22

The memory buffer managed by this object may be a single contiguous block of memory, or it ma
consist of multiple discontiguous blocks. For the discontiguous case, the dispatch data object
makes it appear as if the memory is contiguous.
typealias dispatch_data_t
An immutable object representing a contiguous or sparse region of memory.
class DispatchSource
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
Dispatch Source
Overview
Topics
Creating a Dispatch Data Object
See Also
System Event Monitoring
Dispatch / Dispatch Data
API Collection
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a
contiguous block of memory.


## Page 23

An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
class DispatchIO
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
struct DispatchData
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
struct DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
Dispatch I/O
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.


## Page 24

You do not adopt this protocol in your objects. Instead, use the makeSignalSource(signal:
queue:) method to create an object that adopts this protocol.
func activate()
Activates the dispatch source.
func suspend()
Suspends the dispatch source.
func resume()
Resumes the dispatch source.
Overview
Topics
Activating, Suspending, and Resuming a Source
Canceling a Dispatch Source
Dispatch / DispatchSourceProtocol
Protocol
DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatc
source types.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 25

func cancel()
Asynchronously cancels the dispatch source, preventing any further invocation of its event
handler block.
var isCancelled: Bool
Returns a Boolean indicating whether the given dispatch source has been canceled.
func setCancelHandler(handler: DispatchWorkItem)
Sets the cancellation handler block for the dispatch source.
func setCancelHandler(qos: DispatchQoS, flags: DispatchWorkItemFlags,
handler: Self.DispatchSourceHandler?)
Sets the cancellation handler block for the dispatch source with the specified quality-of-
service class and work item options.
func setEventHandler(handler: DispatchWorkItem)
Sets the event handler work item for the dispatch source.
func setEventHandler(qos: DispatchQoS, flags: DispatchWorkItemFlags,
handler: Self.DispatchSourceHandler?)
func setRegistrationHandler(handler: DispatchWorkItem)
Sets the registration handler work item for the dispatch source.
func setRegistrationHandler(qos: DispatchQoS, flags: DispatchWorkItem
Flags, handler: Self.DispatchSourceHandler?)
typealias DispatchSourceHandler
var handle: UInt
Returns the underlying system handle associated with the specified dispatch source.
var data: UInt
Returns pending data for the dispatch source.
var mask: UInt
Returns the mask of events monitored by the dispatch source.
Installing Event Handlers
Getting the Dispatch Source Attributes


## Page 26

NSObjectProtocol
DispatchSourceFileSystemObject
DispatchSourceMachReceive
DispatchSourceMachSend
DispatchSourceMemoryPressure
DispatchSourceProcess
DispatchSourceRead
DispatchSourceSignal
DispatchSourceTimer
DispatchSourceUserDataAdd
DispatchSourceUserDataOr
DispatchSourceUserDataReplace
DispatchSourceWrite
DispatchSource
class DispatchSource
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
Dispatch Source
An object that coordinates the processing of specific low-level system events, such as file-
system events, timers, and UNIX signals.
Relationships
Inherits From
Inherited By
Conforming Types
See Also
System Event Monitoring


## Page 27

class DispatchIO
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
struct DispatchData
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
struct DispatchDataIterator
A byte-by-byte iterator over the contents of a dispatch data object.
Dispatch I/O
An object that manages operations on a file descriptor using either stream-based or random
access semantics.
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.


