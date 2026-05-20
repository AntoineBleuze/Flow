# 007_DispatchSourceProtocol.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


