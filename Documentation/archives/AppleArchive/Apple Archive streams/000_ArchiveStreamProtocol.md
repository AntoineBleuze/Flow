# 000_ArchiveStreamProtocol.pdf

## Page 1

func readBlob(key: ArchiveHeader.FieldKey, into: UnsafeMutableRawBuffer
Pointer) throws
Reads the current entry blob data.
Required
func writeBlob(key: ArchiveHeader.FieldKey, from: UnsafeRawBufferPointe
) throws
Writes an entry blob data.
Required
func readHeader() throws -> ArchiveHeader?
Reads the next entry header.
Required
func writeHeader(ArchiveHeader) throws
Writes an entry header.
Topics
Reading and Writing Blobs
Reading and Writing Headers
Apple Archive / ArchiveStreamProtocol
Protocol
ArchiveStreamProtocol
A set of methods that defines the interface for using an archive stream that reads
from and writes to data blobs.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst
macOS 11.0+
tvOS 14.0+
visionOS
watchOS 7.0+


## Page 2

Required
func cancel()
Cancels stream operations.
Required
func close() throws
Closes the stream and releases associated resources.
Required
ArchiveStream
class ArchiveStream
An archive stream that reads from and writes to data blobs
protocol ArchiveByteStreamProtocol
A set of methods that defines the interface for using an archive stream that reads from and
writes to buffers.
class ArchiveByteStream
An archive stream that reads from and writes to buffers.
Using Archive Streams
Relationships
Conforming Types
See Also
Apple Archive streams


