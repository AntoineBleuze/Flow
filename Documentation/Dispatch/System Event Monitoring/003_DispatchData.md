# 003_DispatchData.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

An object that manages operations on a file descriptor using either stream-based or random
access semantics.
Dispatch Data
An object that manages a memory-based data buffer and exposes it as a contiguous block o
memory.
protocol DispatchSourceProtocol
Defines a common set of properties and methods that are shared with all dispatch source
types.


