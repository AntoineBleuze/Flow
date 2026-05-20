# 002_ArchiveByteStreamProtocol.pdf

## Page 1

func read(into: UnsafeMutableRawBufferPointer) throws -> Int
Reads data to the specified buffer, not exceeding the buffer’s previously allocated size.
Required
func read(into: UnsafeMutableRawBufferPointer, atOffset: Int64) throws 
> Int
Reads data at the supplied offset to the specified buffer, not exceeding the buffer’s previous
allocated size.
Required
func write(from: UnsafeRawBufferPointer) throws -> Int
Writes data from the specified buffer, not exceeding the buffer’s allocated size.
Required
func write(from: UnsafeRawBufferPointer, atOffset: Int64) throws -> Int
Writes data at the supplied offset from the specified buffer, not exceeding the buffer’s
allocated size.
Required
Topics
Reading and Writing Data
Apple Archive / ArchiveByteStreamProtocol
Protocol
ArchiveByteStreamProtocol
A set of methods that defines the interface for using an archive stream that reads
from and writes to buffers.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst
macOS 11.0+
tvOS 14.0+
visionOS
watchOS 7.0+


## Page 2

func seek(toOffset: Int64, relativeTo: FileDescriptor.SeekOrigin) throw
-> Int64
Updates the internal stream position to the specified offset relative to the specified origin.
Required
func cancel()
Cancels stream operations.
Required
func close() throws
Closes the stream and releases associated resources.
Required
ArchiveByteStream
protocol ArchiveStreamProtocol
A set of methods that defines the interface for using an archive stream that reads from and
writes to data blobs.
class ArchiveStream
An archive stream that reads from and writes to data blobs
class ArchiveByteStream
An archive stream that reads from and writes to buffers.
Using Archive Byte Streams
Relationships
Conforming Types
See Also
Apple Archive streams


## Page 3



