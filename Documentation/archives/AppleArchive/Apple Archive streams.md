# Apple Archive streams.pdf

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


## Page 3

init(object: _AAOptionalObjectWrapperWithFilter<_AAArchiveStreamTraits>
AAType?, owned: Bool, messageProc: ArchiveHeader._EntryFilterWrapper?)
Returns a new archive stream from the specified traits and entry message processing
callback.
func writeDirectoryContents(archiveFrom: FilePath, path: FilePath?, key
Set: ArchiveHeader.FieldKeySet, selectUsing: ArchiveHeader.EntryFilter?
flags: ArchiveFlags, threadCount: Int) throws
Writes all entries from a directory to the archive stream.
static func extractStream(extractingTo: FilePath, selectUsing: Archive
Header.EntryFilter?, flags: ArchiveFlags, threadCount: Int) -> Archive
Stream?
Opens an extract output archive stream.
Topics
Creating an Archive Stream
Writing Directory Contents
Extracting Data
Apple Archive / ArchiveStream
Class
ArchiveStream
An archive stream that reads from and writes to data blobs
iOS 14.0+
iPadOS 14.0+
Mac Catalyst
macOS 11.0+
tvOS 14.0+
visionOS
watchOS 7.0+


## Page 4

static func withExtractStream<E>(extractingTo: FilePath, selectUsing:
ArchiveHeader.EntryFilter?, flags: ArchiveFlags, threadCount: Int, (
ArchiveStream) throws -> E) throws -> E
Calls the given closure with an extract output archive stream.
static func encodeStream(writingTo: ArchiveByteStream, selectUsing:
ArchiveHeader.EntryFilter?, flags: ArchiveFlags, threadCount: Int) ->
ArchiveStream?
Opens an encode output archive stream.
static func withEncodeStream<E>(writingTo: ArchiveByteStream, select
Using: ArchiveHeader.EntryFilter?, flags: ArchiveFlags, threadCount: In
, (ArchiveStream) throws -> E) throws -> E
Calls the given closure with an encode output archive stream.
static func decodeStream(readingFrom: ArchiveByteStream, selectUsing:
ArchiveHeader.EntryFilter?, flags: ArchiveFlags, threadCount: Int) ->
ArchiveStream?
Opens a decode input archive stream.
static func withDecodeStream<E>(readingFrom: ArchiveByteStream, select
Using: ArchiveHeader.EntryFilter?, flags: ArchiveFlags, threadCount: In
, (ArchiveStream) throws -> E) throws -> E
Calls the given closure with a decode input archive stream.
static func convertStream(writingTo: ArchiveStream, insertKeySet:
ArchiveHeader.FieldKeySet, removeKeySet: ArchiveHeader.FieldKeySet,
selectUsing: ArchiveHeader.EntryFilter?, flags: ArchiveFlags, thread
Count: Int) -> ArchiveStream?
Opens a convert output archive stream.
static func withConvertStream<E>(writingTo: ArchiveStream, insertKeySet
ArchiveHeader.FieldKeySet, removeKeySet: ArchiveHeader.FieldKeySet,
selectUsing: ArchiveHeader.EntryFilter?, flags: ArchiveFlags, thread
Count: Int, (ArchiveStream) throws -> E) throws -> E
Encoding Data
Decoding Data
Converting Data


## Page 5

Calls the given closure with a convert output archive stream.
static func process(readingFrom: ArchiveStream, writingTo: ArchiveStrea
, selectUsing: ArchiveHeader.EntryFilter?, flags: ArchiveFlags, thread
Count: Int) throws -> Int
Processes archive elements between two archive streams.
static func customStream<C>(instance: C) -> ArchiveStream?
Returns a new archive stream instance mapped to an object that conforms to the archive
stream protocol.
static func withStream<C, E>(wrapping: C, (ArchiveStream) throws -> E)
throws -> E
Calls the given closure with an archive stream instance mapped to an object that conforms t
the archive stream protocol.
ArchiveStreamProtocol
protocol ArchiveStreamProtocol
A set of methods that defines the interface for using an archive stream that reads from and
writes to data blobs.
protocol ArchiveByteStreamProtocol
Processing Data
Using Custom Streams
Relationships
Conforms To
See Also
Apple Archive streams


## Page 6

A set of methods that defines the interface for using an archive stream that reads from and
writes to buffers.
class ArchiveByteStream
An archive stream that reads from and writes to buffers.


## Page 7

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


## Page 8

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


## Page 9



## Page 10

init(object: _AAOptionalObjectWrapper<_AAByteStreamTraits>.AAType?,
owned: Bool)
Returns a new archive byte stream from the specified traits and entry message processing
callback.
func close(updatingContext: ArchiveEncryptionContext) throws
Closes the stream, releases associated resources, and writes the sealed container attributes
to the specified encryption context.
static func compressionStream(using: ArchiveCompression, writingTo:
ArchiveByteStream, blockSize: Int, flags: ArchiveFlags, threadCount: In
) -> ArchiveByteStream?
Creates a compression sequential output stream.
Topics
Creating an Archive Byte Stream
Using Archive Byte Streams
Compressing Data
Apple Archive / ArchiveByteStream
Class
ArchiveByteStream
An archive stream that reads from and writes to buffers.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst
macOS 11.0+
tvOS 14.0+
visionOS
watchOS 7.0+


## Page 11

static func withCompressionStream<E>(using: ArchiveCompression, writing
To: ArchiveByteStream, blockSize: Int, flags: ArchiveFlags, threadCount
Int, (ArchiveByteStream) throws -> E) throws -> E
Calls the given closure with a compression sequential output stream.
static func compressionStream(appendingTo: ArchiveByteStream, flags:
ArchiveFlags, threadCount: Int) -> ArchiveByteStream?
Reopens a compression sequential output stream.
static func withCompressionStream<E>(appendingTo: ArchiveByteStream,
flags: ArchiveFlags, threadCount: Int, (ArchiveByteStream) throws -> E)
throws -> E
Reopens a compression sequential output stream and calls the given closure.
static func decompressionStream(readingFrom: ArchiveByteStream, flags:
ArchiveFlags, threadCount: Int) -> ArchiveByteStream?
Creates a decompression sequential input stream.
static func withDecompressionStream<E>(readingFrom: ArchiveByteStream,
flags: ArchiveFlags, threadCount: Int, (ArchiveByteStream) throws -> E)
throws -> E
Calls the given closure with a decompression sequential input stream.
static func randomAccessDecompressionStream(readingFrom: ArchiveByte
Stream, allocationLimit: Int, flags: ArchiveFlags, threadCount: Int) ->
ArchiveByteStream?
Creates a decompression random-access input stream.
static func withRandomAccessDecompressionStream<E>(readingFrom: Archive
ByteStream, allocationLimit: Int, flags: ArchiveFlags, threadCount: Int
(ArchiveByteStream) throws -> E) throws -> E
Calls the given closure with a decompression random access input stream.
static func encryptionStream(appendingTo: ArchiveByteStream, encryption
Context: ArchiveEncryptionContext, flags: ArchiveFlags, threadCount: In
) -> ArchiveByteStream?
Reopens an existing encryption sequential output stream.
Decompressing Data
Encrypting Data


## Page 12

static func encryptionStream(writingTo: ArchiveByteStream, encryption
Context: ArchiveEncryptionContext, flags: ArchiveFlags, threadCount: In
) -> ArchiveByteStream?
Creates a encryption sequential input stream.
static func decryptionStream(readingFrom: ArchiveByteStream, encryption
Context: ArchiveEncryptionContext, flags: ArchiveFlags, threadCount: In
) -> ArchiveByteStream?
Creates a decryption sequential input stream.
static func randomAccessDecryptionStream(readingFrom: ArchiveByteStream
encryptionContext: ArchiveEncryptionContext, allocationLimit: Int, flag
: ArchiveFlags, threadCount: Int) -> ArchiveByteStream?
Creates a decryption random access input stream.
static func process(readingFrom: ArchiveByteStream, writingTo: Archive
ByteStream) throws -> Int64
Processes data between two byte streams.
static func fileStream(fd: FileDescriptor, automaticClose: Bool) ->
ArchiveByteStream?
Creates a stream from an open file descriptor.
static func withFileStream<E>(fd: FileDescriptor, automaticClose: Bool,
(ArchiveByteStream) throws -> E) throws -> E
Calls the given closure with a file stream created from the specified file descriptor.
static func fileStream(path: FilePath, mode: FileDescriptor.AccessMode,
options: FileDescriptor.OpenOptions, permissions: FilePermissions) ->
ArchiveByteStream?
Opens a new file descriptor using the given path and parameters, and creates a stream from
the file descriptor.
Decrypting Data
Processing Data
File Streaming


## Page 13

static func withFileStream<E>(path: FilePath, mode: FileDescriptor.
AccessMode, options: FileDescriptor.OpenOptions, permissions: File
Permissions, (ArchiveByteStream) throws -> E) throws -> E
Calls the given closure with a file stream.
static func temporaryFileStream() -> ArchiveByteStream?
Creates a new temporary file stream.
static func withTemporaryFileStream<E>((ArchiveByteStream) throws -> E)
throws -> E
Calls the given closure with a temporary file stream.
static func customStream<C>(instance: C) -> ArchiveByteStream?
Returns a new archive byte stream instance mapped to an object that conforms to the archiv
byte stream protocol.
static func withStream<C, E>(wrapping: C, (ArchiveByteStream) throws ->
E) throws -> E
Calls the given closure with an archive byte stream instance mapped to an object that
conforms to the archive byte stream protocol.
static func sharedBufferPipe(capacity: Int) -> (output: ArchiveByte
Stream, input: ArchiveByteStream)?
Creates a pair of streams and links them by a shared buffer.
ArchiveByteStreamProtocol
Streaming with Custom Streams
Relationships
Conforms To
See Also
Apple Archive streams


## Page 14

protocol ArchiveStreamProtocol
A set of methods that defines the interface for using an archive stream that reads from and
writes to data blobs.
class ArchiveStream
An archive stream that reads from and writes to data blobs
protocol ArchiveByteStreamProtocol
A set of methods that defines the interface for using an archive stream that reads from and
writes to buffers.


