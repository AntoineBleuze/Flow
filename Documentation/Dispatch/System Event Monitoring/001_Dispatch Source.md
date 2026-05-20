# 001_Dispatch Source.pdf

## Page 1

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


## Page 2

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


