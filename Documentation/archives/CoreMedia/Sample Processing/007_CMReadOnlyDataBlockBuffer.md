# 007_CMReadOnlyDataBlockBuffer.pdf

## Page 1

Block buffer provides a contiguous range of data offsets (from 0 to count) across a possibly non
contiguous range of bytes. The byte range may contain memory blocks and buffer references. Th
bytes held by this buffer can not be modified. However, the composition of the byte range can be
changed by appending other memory blocks or buffer references.
struct BlockRegion
A contiguous region of memory within a block buffer.
static func + (CMReadOnlyDataBlockBuffer, CMReadOnlyDataBlockBuffer) ->
CMReadOnlyDataBlockBuffer
Creates a new block buffer by concatenating two block buffers.
Overview
Topics
Structures
Operators
Core Media / CMReadOnlyDataBlockBuffer
Structure
CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 2

static func + (CMReadOnlyDataBlockBuffer, consuming CMMutableDataBlock
Buffer) -> CMReadOnlyDataBlockBuffer
Creates a new block buffer by concatenating two block buffers.
static func += (inout CMReadOnlyDataBlockBuffer, CMReadOnlyDataBlock
Buffer)
Appends the bytes of another block buffer without copying.
static func += (inout CMReadOnlyDataBlockBuffer, consuming CMMutableDat
BlockBuffer)
Appends the bytes of another block buffer without copying.
init(consuming CMMutableDataBlockBuffer)
Create a readonly block buffer from existing block buffer.
init(DispatchData)
Create a new block buffer referencing bytes from DispatchData. DispatchData objects
consisting of multiple regions will produce a non-contiguous block buffer with each dispatch
data region corresponding to a region in the block buffer.
init(Data)
Create a new block buffer referencing bytes from Data.
init(subBlockCapacity: Int)
Create empty block buffer.
init(unsafeBlockBuffer: sending CMBlockBuffer)
Create a readonly block buffer from an existing block buffer.
var isContiguous: Bool
Determine whether the block buffer is contiguous.
func append(referenceOf: CMReadOnlyDataBlockBuffer, optimizeDepth: Bool
Append a reference to a range of another block buffer.
Initializers
Instance Properties
Instance Methods


## Page 3

func append(referenceOf: consuming CMMutableDataBlockBuffer, optimize
Depth: Bool)
Append a reference to a range of another block buffer.
func withContiguousStorageIfAvailable<R>((UnsafeRawBufferPointer) throw
-> sending R) rethrows -> sending R?
Access contents of the buffer if available as contiguous memory block.
func withUnsafeBlockBuffer<R>((CMBlockBuffer) throws -> sending R)
rethrows -> sending R
Access the underlying CMBlockBuffer instance.
Collection Implementations
DataProtocol Implementations
RandomAccessCollection Implementations
Sequence Implementations
BidirectionalCollection
CMSampleBuffer.Content
CMSampleBuffer.ContentWithFormatDescription
CMSampleBuffer.MultiSampleContent
Collection
Copyable
DataProtocol
RandomAccessCollection
Sendable
SendableMetatype
Sequence
Default Implementations
Relationships
Conforms To
See Also


## Page 4

CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
CMBlockBuffer
An object the system uses to move blocks of memory through a processing system.
CMTaggedBufferGroup
Objective-C types and interfaces for working with Core Media tagged buffer groups.
CMFormatDescription
A media format descriptor that describes the samples in a sample buffer.
CMAttachment
Add supporting metadata to sample buffers.
struct CMTaggedBuffer
An instance of a media buffer containing metadata tags.
struct CMMutableDataBlockBuffer
A block buffer that provides read-write access to a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.
Sample Processing


