# 001_CMBlockBuffer.pdf

## Page 1

A block buffer is a CFType object that represents a contiguous range of data offsets (from zero t
CMBlockBufferGetDataLength(_:)) across a possibly noncontiguous memory region. The
memory region contains memory blocks and buffer references. The buffer references can in turn
refer to additional regions. CMBlockBuffer uses CMAttachmentBearerProtocol to
propagate attachments.
func CMBlockBufferCreateEmpty(allocator: CFAllocator?, capacity: UInt32
flags: CMBlockBufferFlags, blockBufferOut: UnsafeMutablePointer<CMBlock
Buffer?>) -> OSStatus
Creates an empty block buffer.
func CMBlockBufferCreateWithMemoryBlock(allocator: CFAllocator?, memory
Block: UnsafeMutableRawPointer?, blockLength: Int, blockAllocator:
CFAllocator?, customBlockSource: UnsafePointer<CMBlockBufferCustomBlock
Source>?, offsetToData: Int, dataLength: Int, flags: CMBlockBufferFlags
blockBufferOut: UnsafeMutablePointer<CMBlockBuffer?>) -> OSStatus
Creates a block buffer that’s backed by a memory block.
Overview
Topics
Creating a Block Buffer
Core Media / CMBlockBuffer
API Collection
CMBlockBuffer
An object the system uses to move blocks of memory through a processing
system.


## Page 2

func CMBlockBufferCreateWithBufferReference(allocator: CFAllocator?,
referenceBuffer: CMBlockBuffer, offsetToData: Int, dataLength: Int,
flags: CMBlockBufferFlags, blockBufferOut: UnsafeMutablePointer<CMBlock
Buffer?>) -> OSStatus
Creates a block buffer that refers to another block buffer object.
func CMBlockBufferCreateContiguous(allocator: CFAllocator?, sourceBuffe
: CMBlockBuffer, blockAllocator: CFAllocator?, customBlockSource: Unsaf
Pointer<CMBlockBufferCustomBlockSource>?, offsetToData: Int, dataLength
Int, flags: CMBlockBufferFlags, blockBufferOut: UnsafeMutablePointer<
CMBlockBuffer?>) -> OSStatus
Creates a block buffer that contains a contiguous copy of, or reference to, the data specified
by the parameters.
typealias CMBlockBufferFlags
A type for flags that control behaviors and features of block buffer APIs.
Block Buffer Flags
An enumeration of flags that control behaviors and features of block buffer APIs.
struct CMBlockBufferCustomBlockSource
A structure to support custom memory allocation and deallocation for a block used in a bloc
buffer.
Custom Block Source Version
A custom block source version identifier.
func CMBlockBufferAppendMemoryBlock(CMBlockBuffer, memoryBlock: Unsafe
MutableRawPointer?, length: Int, blockAllocator: CFAllocator?, custom
BlockSource: UnsafePointer<CMBlockBufferCustomBlockSource>?, offsetTo
Data: Int, dataLength: Int, flags: CMBlockBufferFlags) -> OSStatus
Adds a memory block to an existing block buffer.
func CMBlockBufferAppendBufferReference(CMBlockBuffer, targetBBuf:
CMBlockBuffer, offsetToData: Int, dataLength: Int, flags: CMBlockBuffer
Flags) -> OSStatus
Adds a reference to an existing block buffer.
func CMBlockBufferAssureBlockMemory(CMBlockBuffer) -> OSStatus
Assures that the system allocates memory for all memory blocks in a block buffer.
Modifying a Block Buffer


## Page 3

func CMBlockBufferAccessDataBytes(CMBlockBuffer, atOffset: Int, length:
Int, temporaryBlock: UnsafeMutableRawPointer, returnedPointerOut: Unsaf
MutablePointer<UnsafeMutablePointer<CChar>?>) -> OSStatus
Accesses potentially noncontiguous data in a block buffer.
func CMBlockBufferCopyDataBytes(CMBlockBuffer, atOffset: Int, dataLengt
: Int, destination: UnsafeMutableRawPointer) -> OSStatus
Copies bytes from a block buffer into a provided memory area.
func CMBlockBufferReplaceDataBytes(with: UnsafeRawPointer, blockBuffer:
CMBlockBuffer, offsetIntoDestination: Int, dataLength: Int) -> OSStatus
Copies bytes from a given memory block into a block buffer replacing bytes in the underlying
data blocks.
func CMBlockBufferFillDataBytes(with: CChar, blockBuffer: CMBlockBuffer
offsetIntoDestination: Int, dataLength: Int) -> OSStatus
Fills the destination buffer with the specified data byte.
func CMBlockBufferGetDataPointer(CMBlockBuffer, atOffset: Int, lengthAt
OffsetOut: UnsafeMutablePointer<Int>?, totalLengthOut: UnsafeMutable
Pointer<Int>?, dataPointerOut: UnsafeMutablePointer<UnsafeMutablePointe
<CChar>?>?) -> OSStatus
Gains access to the data represented by a block buffer.
func CMBlockBufferGetDataLength(CMBlockBuffer) -> Int
Returns the total length of data that’s accessible by a block buffer.
func CMBlockBufferIsRangeContiguous(CMBlockBuffer, atOffset: Int, lengt
: Int) -> Bool
Returns a Boolean value that indicates whether the specified range within a block buffer is
contiguous.
func CMBlockBufferIsEmpty(CMBlockBuffer) -> Bool
Returns a Boolean value that indicates whether the buffer is empty.
func CMBlockBufferGetTypeID() -> CFTypeID
Returns the type identifier for block buffer objects.
Inspecting a Block Buffer
Accessing the Type Identifier


## Page 4

class CMBlockBuffer
A reference to a block buffer instance.
protocol CMBlockBufferProtocol
A protocol for objects that operate on a range of a block buffer.
Block Buffer Error Codes
Error codes that framework operations produce.
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
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
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
Data Types
Errors
See Also
Sample Processing


## Page 5

struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


