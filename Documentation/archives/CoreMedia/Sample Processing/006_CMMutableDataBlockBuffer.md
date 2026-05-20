# 006_CMMutableDataBlockBuffer.pdf

## Page 1

Mutable block buffer provides a contiguous range of data offsets (from 0 to count) a possibly
non-contiguous range of bytes. The bytes referenced by this buffer are mutable.
class MemoryPool
Optimize memory allocations when working with large block buffers.
struct BlockRegion
A contiguous region of mutable memory within a block buffer.
struct BlockSource
Provides ability to allocate memory for blocks using custom allocator
Overview
Topics
Classes
Structures
Core Media / CMMutableDataBlockBuffer
Structure
CMMutableDataBlockBuffer
A block buffer that provides read-write access to a range of bytes.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 2

static func += (inout CMMutableDataBlockBuffer, consuming CMMutableData
BlockBuffer)
Appends the bytes of another block buffer without copying.
init(copying: UnsafePointer<AudioBufferList>, blockSource: CMMutableDat
BlockBuffer.BlockSource?)
Creates a block buffer by copying the given audio buffer list.
init(count: Int, blockSource: CMMutableDataBlockBuffer.BlockSource?)
Creates a block buffer with count number of bytes.
init(subBlockCapacity: Int, blockSource: CMMutableDataBlockBuffer.Block
Source?)
Creates a block buffer with at least subBlockCapacity number of sub blocks.
init(unsafeBlockBuffer: sending CMBlockBuffer)
Creates a mutable block buffer from an existing block buffer.
var count: Int
The number of bytes in the block buffer.
var endIndex: Int
The position one greater than the last valid subscript argument.
var indices: CMMutableDataBlockBuffer.Indices
The indices that are valid for subscripting the collection, in ascending order.
var isContiguous: Bool
Determine whether the block buffer is contiguous.
var isEmpty: Bool
Indicates whether the block buffer is empty.
var startIndex: Int
The position of the first element.
Operators
Initializers
Instance Properties


## Page 3

func append(referenceOf: consuming CMMutableDataBlockBuffer, range:
Range<Int>?, optimizeDepth: Bool)
Append a reference to a range of another block buffer.
func copyBytes(to: UnsafeMutableRawBufferPointer)
Copy all bytes to the destination buffer.
func copyBytes<R>(to: UnsafeMutableRawBufferPointer, from: R)
Copy the bytes from the given range to the destination buffer.
func extend(by: Int)
Extend block buffer by appending a memory block of count bytes.
func isRangeContiguous(Range<Int>) -> Bool
Returns true if the given range refers to a contiguous block of memory.
func replaceAll(repeating: UInt8)
Replace all bytes in the buffer with the given byte.
func replaceAll(with: UnsafeRawBufferPointer)
Replace all data in the buffer with new bytes.
func replaceAll(with: some DataProtocol)
Replace all data in the buffer with new bytes.
func replaceSubrange(Range<Int>, repeating: UInt8)
Fill a range in the buffer with given byte.
func replaceSubrange(Range<Int>, with: some DataProtocol)
Replace a range of bytes in the block buffer.
func replaceSubrange(Range<Int>, with: UnsafeRawBufferPointer)
Replace a range of bytes in the block buffer.
func withContiguousMutableStorageIfAvailable<R>(in: Range<Int>?, (Unsaf
MutableRawBufferPointer) throws -> sending R) rethrows -> sending R?
Access contents of the buffer if available as contiguous memory block.
func withContiguousStorageIfAvailable<R>(in: Range<Int>?, (UnsafeRaw
BufferPointer) throws -> sending R) rethrows -> sending R?
Instance Methods


## Page 4

Access contents of the buffer if available as contiguous memory block.
func withUnsafeBlockBuffer<R>((CMBlockBuffer) throws -> sending R)
rethrows -> sending R
Access the underlying CMBlockBuffer instance.
func withUnsafeBlockRegions<R>(([CMReadOnlyDataBlockBuffer.BlockRegion]
throws -> sending R) rethrows -> sending R
Access the potentially non-contiguous memory region referenced by this block buffer.
func withUnsafeMutableBlockRegions<R>(([CMMutableDataBlockBuffer.Block
Region]) throws -> sending R) rethrows -> sending R
Access the potentially non-contiguous memory region referenced by this block buffer.
subscript(Int) -> UInt8
Accesses the data byte at the specified position.
typealias Index
typealias Indices
Sendable, SendableMetatype
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
Subscripts
Type Aliases
Relationships
Conforms To
See Also
Sample Processing


## Page 5

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
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


