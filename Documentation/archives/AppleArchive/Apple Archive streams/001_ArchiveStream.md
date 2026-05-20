# 001_ArchiveStream.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

A set of methods that defines the interface for using an archive stream that reads from and
writes to buffers.
class ArchiveByteStream
An archive stream that reads from and writes to buffers.


