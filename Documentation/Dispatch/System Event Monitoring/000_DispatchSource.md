# 000_DispatchSource.pdf

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


