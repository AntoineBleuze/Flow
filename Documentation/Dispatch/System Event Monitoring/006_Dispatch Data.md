# 006_Dispatch Data.pdf

## Page 1

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


## Page 2

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


