# Sample Processing.pdf

## Page 1

Sample buffers are Core Foundation objects that the system uses to move media sample data
through the media pipeline. An instance of CMSampleBuffer contains zero or more compressed
(or uncompressed) samples of a particular media type and contains one of the following:
A CMBlockBuffer of one or more media samples
A CVImageBuffer, a reference to the format description for the stream of CMSampleBuffers,
size and timing information for each of the contained media samples, and both buffer-level and
sample-level attachments
A sample buffer can contain both sample-level and buffer-level attachments. Each individual
sample in a buffer may provide attachments that include information such as timestamps and vide
frame dependencies. You read and write sample-level attachments using the CMSampleBuffer
GetSampleAttachmentsArray(_:createIfNecessary:) function. Buffer-level attachmen
provide information about the buffer as a whole, such as playback speed and actions to perform
upon consuming the buffer. You can read and write buffer-level attachments using the APIs
described in CMAttachment and the keys listed under Sample Attachment Keys.
It’s possible for a sample buffer to describe samples it doesn’t yet contain. For example, some
media services may have access to sample size, timing, and format information before they read
the data. Such services may create sample buffers with that information and insert them into
queues early, and attach (or fill) the buffer of media data later, when it becomes ready. Sample
buffers have the concept of data-readiness, which means you can test, set, and force them to
become ready “now.” It’s also possible for a sample buffer to contain nothing but a special buffer-
level attachment that describes a media stream event (for example, “discontinuity: drain and rese
decoder before processing the next CMSampleBuffer”).
Overview
Core Media / CMSampleBuffer
API Collection
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.


## Page 2

func CMSampleBufferCreateReady(allocator: CFAllocator?, dataBuffer:
CMBlockBuffer?, formatDescription: CMFormatDescription?, sampleCount:
CMItemCount, sampleTimingEntryCount: CMItemCount, sampleTimingArray:
UnsafePointer<CMSampleTimingInfo>?, sampleSizeEntryCount: CMItemCount,
sampleSizeArray: UnsafePointer<Int>?, sampleBufferOut: UnsafeMutable
Pointer<CMSampleBuffer?>) -> OSStatus
Creates a sample buffer with media data.
func CMSampleBufferCreateReadyWithImageBuffer(allocator: CFAllocator?,
imageBuffer: CVImageBuffer, formatDescription: CMVideoFormatDescription
sampleTiming: UnsafePointer<CMSampleTimingInfo>, sampleBufferOut: Unsaf
MutablePointer<CMSampleBuffer?>) -> OSStatus
Creates a sample buffer with image data.
func CMAudioSampleBufferCreateReadyWithPacketDescriptions(allocator:
CFAllocator?, dataBuffer: CMBlockBuffer, formatDescription: CMFormat
Description, sampleCount: CMItemCount, presentationTimeStamp: CMTime,
packetDescriptions: UnsafePointer<AudioStreamPacketDescription>?, sampl
BufferOut: UnsafeMutablePointer<CMSampleBuffer?>) -> OSStatus
Creates a sample buffer with packet descriptions.
func CMSampleBufferCreateWithMakeDataReadyHandler(CFAllocator?, CMBlock
Buffer?, Bool, CMFormatDescription?, CMItemCount, CMItemCount, Unsafe
Pointer<CMSampleTimingInfo>?, CMItemCount, UnsafePointer<Int>?, Unsafe
MutablePointer<CMSampleBuffer?>, CMSampleBufferMakeDataReadyHandler?) -
OSStatus
Creates a sample buffer with a handler to make the data ready for use.
func CMSampleBufferCreateForImageBufferWithMakeDataReadyHandler(
CFAllocator?, CVImageBuffer, Bool, CMVideoFormatDescription, Unsafe
Pointer<CMSampleTimingInfo>, UnsafeMutablePointer<CMSampleBuffer?>,
CMSampleBufferMakeDataReadyHandler?) -> OSStatus
Creates a sample buffer with an image buffer and a handler to make the data ready for use.
Topics
Creating Sample Buffers


## Page 3

func CMAudioSampleBufferCreateWithPacketDescriptionsAndMakeDataReady
Handler(CFAllocator?, CMBlockBuffer?, Bool, CMFormatDescription, CMItem
Count, CMTime, UnsafePointer<AudioStreamPacketDescription>?, Unsafe
MutablePointer<CMSampleBuffer?>, CMSampleBufferMakeDataReadyHandler?) -
OSStatus
Creates a sample buffer with packet descriptions and a handler to make the data ready for
use.
func CMSampleBufferCreate(allocator: CFAllocator?, dataBuffer: CMBlock
Buffer?, dataReady: Bool, makeDataReadyCallback: CMSampleBufferMakeData
ReadyCallback?, refcon: UnsafeMutableRawPointer?, formatDescription:
CMFormatDescription?, sampleCount: CMItemCount, sampleTimingEntryCount:
CMItemCount, sampleTimingArray: UnsafePointer<CMSampleTimingInfo>?,
sampleSizeEntryCount: CMItemCount, sampleSizeArray: UnsafePointer<Int>?
sampleBufferOut: UnsafeMutablePointer<CMSampleBuffer?>) -> OSStatus
Creates a sample buffer with a callback to make the data ready for use.
func CMSampleBufferCreateForImageBuffer(allocator: CFAllocator?, image
Buffer: CVImageBuffer, dataReady: Bool, makeDataReadyCallback: CMSample
BufferMakeDataReadyCallback?, refcon: UnsafeMutableRawPointer?, format
Description: CMVideoFormatDescription, sampleTiming: UnsafePointer<
CMSampleTimingInfo>, sampleBufferOut: UnsafeMutablePointer<CMSample
Buffer?>) -> OSStatus
Creates a sample buffer with an image buffer and a callback to make the data ready for use.
func CMAudioSampleBufferCreateWithPacketDescriptions(allocator:
CFAllocator?, dataBuffer: CMBlockBuffer?, dataReady: Bool, makeDataRead
Callback: CMSampleBufferMakeDataReadyCallback?, refcon: UnsafeMutableRa
Pointer?, formatDescription: CMFormatDescription, sampleCount: CMItem
Count, presentationTimeStamp: CMTime, packetDescriptions: UnsafePointer
AudioStreamPacketDescription>?, sampleBufferOut: UnsafeMutablePointer<
CMSampleBuffer?>) -> OSStatus
Creates a sample buffer with packet descriptions and a callback to make the data ready for
use.
func CMSampleBufferCreateCopy(allocator: CFAllocator?, sampleBuffer:
CMSampleBuffer, sampleBufferOut: UnsafeMutablePointer<CMSampleBuffer?>)
-> OSStatus
Creates a copy of a sample buffer.
Copying Sample Buffers


## Page 4

func CMSampleBufferCreateCopyWithNewTiming(allocator: CFAllocator?,
sampleBuffer: CMSampleBuffer, sampleTimingEntryCount: CMItemCount,
sampleTimingArray: UnsafePointer<CMSampleTimingInfo>?, sampleBufferOut:
UnsafeMutablePointer<CMSampleBuffer?>) -> OSStatus
Creates a copy of a sample buffer with new timing information.
func CMSampleBufferCopySampleBufferForRange(allocator: CFAllocator?,
sampleBuffer: CMSampleBuffer, sampleRange: CFRange, sampleBufferOut:
UnsafeMutablePointer<CMSampleBuffer?>) -> OSStatus
Creates a sample buffer that contains a range of samples from an existing sample buffer.
func CMSampleBufferDataIsReady(CMSampleBuffer) -> Bool
Returns a Boolean value that indicates whether the sample buffer’s data is ready for use.
func CMSampleBufferSetDataReady(CMSampleBuffer) -> OSStatus
Marks a sample buffer’s data as ready for use.
func CMSampleBufferSetDataFailed(CMSampleBuffer, status: OSStatus) ->
OSStatus
Marks the sample buffer’s data as failed to indicate that it won’t become ready.
func CMSampleBufferHasDataFailed(CMSampleBuffer, statusOut: Unsafe
MutablePointer<OSStatus>?) -> Bool
Returns a Boolean value that indicates whether the sample buffer’s data loading request
failed.
func CMSampleBufferMakeDataReady(CMSampleBuffer) -> OSStatus
Makes the sample buffer’s data ready for use by invoking its callback to load the data.
func CMSampleBufferTrackDataReadiness(CMSampleBuffer, sampleBufferTo
Track: CMSampleBuffer) -> OSStatus
Associates a sample buffer’s data readiness with that of another sample buffer.
func CMSampleBufferSetInvalidateHandler(CMSampleBuffer, invalidate
Handler: CMSampleBufferInvalidateHandler) -> OSStatus
Sets the sample buffer’s invalidation handler.
func CMSampleBufferInvalidate(CMSampleBuffer) -> OSStatus
Determining Readiness
Invalidating Sample Buffers


## Page 5

Invalidates a sample buffer by calling its invalidation callback.
func CMSampleBufferIsValid(CMSampleBuffer) -> Bool
Returns a Boolean value that indicates whether a sample buffer is valid.
func CMSampleBufferSetInvalidateCallback(CMSampleBuffer, callback:
CMSampleBufferInvalidateCallback, refcon: UInt64) -> OSStatus
Sets the sample buffer’s invalidation callback.
func CMSampleBufferGetNumSamples(CMSampleBuffer) -> CMItemCount
Returns the number of media samples in a sample buffer.
func CMSampleBufferGetTotalSampleSize(CMSampleBuffer) -> Int
Returns the total size in bytes of sample data in a sample buffer.
func CMSampleBufferGetSampleSize(CMSampleBuffer, at: CMItemIndex) -> In
Returns the size in bytes of a specified sample in a sample buffer.
func CMSampleBufferGetSampleSizeArray(CMSampleBuffer, entryCount: CMIte
Count, arrayToFill: UnsafeMutablePointer<Int>?, entriesNeededOut: Unsaf
MutablePointer<CMItemCount>?) -> OSStatus
Retrieves an array of sample sizes that represents each sample in a sample buffer.
func CMSampleBufferGetDuration(CMSampleBuffer) -> CMTime
Returns the total duration of a sample buffer.
func CMSampleBufferGetDecodeTimeStamp(CMSampleBuffer) -> CMTime
Returns the decode timestamp that’s the earliest numerically of all the samples in a sample
buffer.
func CMSampleBufferGetPresentationTimeStamp(CMSampleBuffer) -> CMTime
Returns the presentation timestamp that’s the earliest numerically of all the samples in a
sample buffer.
func CMSampleBufferGetOutputDuration(CMSampleBuffer) -> CMTime
Returns the output duration of a sample buffer.
func CMSampleBufferGetOutputDecodeTimeStamp(CMSampleBuffer) -> CMTime
Inspecting Size Information
Inspecting Duration and Timing


## Page 6

Returns the output decode timestamp of a sample buffer.
func CMSampleBufferGetOutputPresentationTimeStamp(CMSampleBuffer) ->
CMTime
Returns the output presentation timestamp of a sample buffer.
func CMSampleBufferSetOutputPresentationTimeStamp(CMSampleBuffer, new
Value: CMTime) -> OSStatus
Sets an output presentation timestamp to use in place of a calculated value.
func CMSampleBufferGetSampleTimingInfo(CMSampleBuffer, at: CMItemIndex,
timingInfoOut: UnsafeMutablePointer<CMSampleTimingInfo>) -> OSStatus
Retrieves a timing information structure that describes a specified sample in a sample buffer
func CMSampleBufferGetSampleTimingInfoArray(CMSampleBuffer, entryCount:
CMItemCount, arrayToFill: UnsafeMutablePointer<CMSampleTimingInfo>?,
entriesNeededOut: UnsafeMutablePointer<CMItemCount>?) -> OSStatus
Retrieves an array of sample timing information structures that represents each sample in a
sample buffer.
func CMSampleBufferGetOutputSampleTimingInfoArray(CMSampleBuffer, entry
Count: CMItemCount, arrayToFill: UnsafeMutablePointer<CMSampleTimingInf
>?, entriesNeededOut: UnsafeMutablePointer<CMItemCount>?) -> OSStatus
Retrieves an array of output timing information structures that represents each sample in a
sample buffer.
func CMSampleBufferGetFormatDescription(CMSampleBuffer) -> CMFormat
Description?
Returns the format description of the samples in a sample buffer.
func CMSampleBufferGetDataBuffer(CMSampleBuffer) -> CMBlockBuffer?
Returns a block buffer that contains the media data.
func CMSampleBufferSetDataBuffer(CMSampleBuffer, newValue: CMBlockBuffe
) -> OSStatus
Sets a block buffer of media data on a sample buffer.
func CMSampleBufferGetImageBuffer(CMSampleBuffer) -> CVImageBuffer?
Accessing the Format Description
Modifying Sample Buffers


## Page 7

Returns an image buffer that contains the media data.
func CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(CMSample
Buffer, bufferListSizeNeededOut: UnsafeMutablePointer<Int>?, bufferList
Out: UnsafeMutablePointer<AudioBufferList>?, bufferListSize: Int, block
BufferAllocator: CFAllocator?, blockBufferMemoryAllocator: CFAllocator?
flags: UInt32, blockBufferOut: UnsafeMutablePointer<CMBlockBuffer?>?) -
OSStatus
Returns an audio buffer list that contains the media data.
func CMSampleBufferSetDataBufferFromAudioBufferList(CMSampleBuffer,
blockBufferAllocator: CFAllocator?, blockBufferMemoryAllocator:
CFAllocator?, flags: UInt32, bufferList: UnsafePointer<AudioBufferList>
-> OSStatus
Creates a block buffer that contains a copy of the data from an audio buffer list.
func CMSampleBufferCopyPCMDataIntoAudioBufferList(CMSampleBuffer, at:
Int32, frameCount: Int32, into: UnsafeMutablePointer<AudioBufferList>) 
> OSStatus
Copies PCM audio data from a sample buffer into an audio buffer list.
func CMSampleBufferGetAudioStreamPacketDescriptions(CMSampleBuffer,
allocatedSize: Int, packetDescriptionsOut: UnsafeMutablePointer<Audio
StreamPacketDescription>?, packetDescriptionsSizeNeededOut: Unsafe
MutablePointer<Int>?) -> OSStatus
Creates an array of audio stream packet descriptions.
func CMSampleBufferGetAudioStreamPacketDescriptionsPtr(CMSampleBuffer,
packetDescriptionsPointerOut: UnsafeMutablePointer<UnsafePointer<Audio
StreamPacketDescription>?>?, sizeOut: UnsafeMutablePointer<Int>?) ->
OSStatus
Returns a pointer to a constant array of audio stream packet descriptions.
func CMSampleBufferGetSampleAttachmentsArray(CMSampleBuffer, createIf
Necessary: Bool) -> CFArray?
Retrieves an array of sample attachment dictionaries that represents each sample in a samp
buffer.
Sample Attachment Keys
Keys that specify attachments to individual samples in a buffer.
Managing Attachments


## Page 8

func CMSampleBufferCallBlockForEachSample(CMSampleBuffer, (CMSample
Buffer, CMItemCount) -> OSStatus) -> OSStatus
Calls a block for every individual sample in a sample buffer.
func CMSampleBufferCallForEachSample(CMSampleBuffer, callback: (CMSampl
Buffer, CMItemCount, UnsafeMutableRawPointer?) -> OSStatus, refcon:
UnsafeMutableRawPointer?) -> OSStatus
Calls a function for every individual sample in a sample buffer.
func CMSampleBufferGetTypeID() -> CFTypeID
Returns the type identifier of sample buffer objects.
class CMSampleBuffer
A reference to a buffer of media data.
Sample Buffer Flags
Flags that customize the behavior of framework operations.
struct CMSampleTimingInfo
A collection of timing information for a sample in a sample buffer.
typealias CMBuffer
A reference to a buffer object.
typealias CMBufferGetSizeCallback
A client callback that returns a size.
typealias CMItemIndex
A datatype that represents an item index.
typealias CMItemCount
A datatype that represents an item count.
typealias CMPersistentTrackID
A datatype that represents a persistent track identifier.
Processing Samples
Accessing the Type Identifier
Data Types


## Page 9

typealias CMMuxedStreamType
A datatype that represents a muxed stream of data.
Sample Buffer Notifications
Notifications the system posts when processing sample buffer objects.
Sample Buffer Error Codes
Errors that occur when processing sample buffer objects.
var kCMPersistentTrackID_Invalid: CMPersistentTrackID
Indicates an invalid track ID.
func CMTimeFoldIntoRange(CMTime, foldRange: CMTimeRange) -> CMTime
Folds a time into a time range.
func CMVideoFormatDescriptionGetHEVCParameterSetAtIndex(CMFormat
Description, parameterSetIndex: Int, parameterSetPointerOut: Unsafe
MutablePointer<UnsafePointer<UInt8>?>?, parameterSetSizeOut: Unsafe
MutablePointer<Int>?, parameterSetCountOut: UnsafeMutablePointer<Int>?,
nalUnitHeaderLengthOut: UnsafeMutablePointer<Int32>?) -> OSStatus
Returns a parameter set contained in an HEVC (H.265) format description.
CMBlockBuffer
An object the system uses to move blocks of memory through a processing system.
CMTaggedBufferGroup
Objective-C types and interfaces for working with Core Media tagged buffer groups.
Notifications
Errors
Functions
See Also
Sample Processing


## Page 10

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
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


## Page 16

typealias CMTaggedBufferGroupFormatDescription
A type for tagged buffer format descriptions.
typealias CMTaggedBufferGroupFormatType
A type for tagged buffer format information.
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
CMBlockBuffer
An object the system uses to move blocks of memory through a processing system.
CMFormatDescription
A media format descriptor that describes the samples in a sample buffer.
CMAttachment
Topics
Types
See Also
Sample Processing
Core Media / CMTaggedBufferGroup
API Collection
CMTaggedBufferGroup
Objective-C types and interfaces for working with Core Media tagged buffer
groups.


## Page 17

Add supporting metadata to sample buffers.
struct CMTaggedBuffer
An instance of a media buffer containing metadata tags.
struct CMMutableDataBlockBuffer
A block buffer that provides read-write access to a range of bytes.
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


## Page 18

CMFormatDescriptions are immutable Core Foundation objects that describe media data of
various types, including audio, video, and muxed media data. There are two types of API: media-
type-agnostic APIs (supported by all CMFormatDescriptions) and media-type-specific APIs. The
media-type-agnostic APIs are prefixed with CMFormatDescription, and the media-type-
specific APIs are prefixed with CMAudioFormatDescription, CMVideoFormatDescription
and so on.
func CMFormatDescriptionCreate(allocator: CFAllocator?, mediaType:
CMMediaType, mediaSubType: FourCharCode, extensions: CFDictionary?,
formatDescriptionOut: UnsafeMutablePointer<CMFormatDescription?>) ->
OSStatus
Creates a format description for general use.
func CMFormatDescriptionEqual(CMFormatDescription?, otherFormat
Description: CMFormatDescription?) -> Bool
Returns a Boolean value that indicates whether two format descriptions are equal.
Overview
Topics
Creating Format Descriptions
Comparing Format Descriptions
Core Media / CMFormatDescription
API Collection
CMFormatDescription
A media format descriptor that describes the samples in a sample buffer.


## Page 19

func CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescription?
otherFormatDescription: CMFormatDescription?, extensionKeysToIgnore:
CFTypeRef?, sampleDescriptionExtensionAtomKeysToIgnore: CFTypeRef?) ->
Bool
Returns a Boolean value that indicates whether two format descriptions are equal, ignoring
differences in the extension keys you specify.
func CMFormatDescriptionGetMediaType(CMFormatDescription) -> CMMediaTyp
Returns the media type of a format description.
func CMFormatDescriptionGetMediaSubType(CMFormatDescription) -> FourCha
Code
Returns the media subtype of a format description.
func CMFormatDescriptionGetExtension(CMFormatDescription, extensionKey:
CFString) -> CFPropertyList?
Returns an extension from the format description by using an extension key.
func CMFormatDescriptionGetExtensions(CMFormatDescription) ->
CFDictionary?
Returns all of the extensions for a format description.
func CMFormatDescriptionGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier that identifies format description objects.
struct CMSoundDescriptionFlavor
Types that represent sound format descriptions.
func CMAudioFormatDescriptionCreateSummary(allocator: CFAllocator?,
formatDescriptionArray: CFArray, flags: UInt32, formatDescriptionOut:
UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Creates a summary audio format description from an array of descriptions.
func CMAudioFormatDescriptionCreate(allocator: CFAllocator?, asbd:
UnsafePointer<AudioStreamBasicDescription>, layoutSize: Int, layout:
UnsafePointer<AudioChannelLayout>?, magicCookieSize: Int, magicCookie:
UnsafeRawPointer?, extensions: CFDictionary?, formatDescriptionOut:
UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Inspecting Format Descriptions
Working with Audio Descriptions


## Page 20

Creates a format description for an audio media stream.
func CMAudioFormatDescriptionEqual(CMAudioFormatDescription, otherForma
Description: CMAudioFormatDescription, equalityMask: CMAudioFormat
DescriptionMask, equalityMaskOut: UnsafeMutablePointer<CMAudioFormat
DescriptionMask>?) -> Bool
Returns a Boolean value that indicates whether the two audio format descriptions are equal.
func CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescription,
sizeOut: UnsafeMutablePointer<Int>?) -> UnsafePointer<AudioChannelLayou
>?
Returns a read-only pointer to, and the size of, the audio channel layout inside an audio form
description.
func CMAudioFormatDescriptionGetFormatList(CMAudioFormatDescription,
sizeOut: UnsafeMutablePointer<Int>?) -> UnsafePointer<AudioFormatList
Item>?
Returns a read-only pointer to, and size of, the array of audio format list item structures in an
audio format description.
func CMAudioFormatDescriptionGetMagicCookie(CMAudioFormatDescription,
sizeOut: UnsafeMutablePointer<Int>?) -> UnsafeRawPointer?
Returns a read-only pointer to, and size of, the magic cookie in an audio format description.
func CMAudioFormatDescriptionGetMostCompatibleFormat(CMAudioFormat
Description) -> UnsafePointer<AudioFormatListItem>?
Returns a read-only pointer to the appropriate audio format list item in an audio format
description.
func CMAudioFormatDescriptionGetRichestDecodableFormat(CMAudioFormat
Description) -> UnsafePointer<AudioFormatListItem>?
Returns a read-only pointer to the appropriate audio format list item in an audio format
description.
func CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormat
Description) -> UnsafePointer<AudioStreamBasicDescription>?
Returns a read-only pointer to the audio stream description in an audio format description.
func CMDoesBigEndianSoundDescriptionRequireLegacyCBRSampleTableLayout(
CMBlockBuffer, flavor: CMSoundDescriptionFlavor?) -> Bool
Returns a Boolean value that indicates whether the sample tables need to use the legacy
constant bit-rate encoding layout.


## Page 21

func CMSwapBigEndianSoundDescriptionToHost(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a sound description data structure from big-endian to host-endian, in place.
func CMSwapHostEndianSoundDescriptionToBig(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a sound description data structure from host-endian to big-endian, in place.
func CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionData(
allocator: CFAllocator?, bigEndianSoundDescriptionData: UnsafePointer<
UInt8>, size: Int, flavor: CMSoundDescriptionFlavor?, formatDescription
Out: UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Creates an audio format description from a big-endian sound description data structure.
func CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionBlock
Buffer(allocator: CFAllocator?, bigEndianSoundDescriptionBlockBuffer:
CMBlockBuffer, flavor: CMSoundDescriptionFlavor?, formatDescriptionOut:
UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Creates an audio format description from a big-endian sound description data structure in a
buffer.
func CMAudioFormatDescriptionCopyAsBigEndianSoundDescriptionBlockBuffer
allocator: CFAllocator?, audioFormatDescription: CMAudioFormat
Description, flavor: CMSoundDescriptionFlavor?, blockBufferOut: Unsafe
MutablePointer<CMBlockBuffer?>) -> OSStatus
Copies the contents of an audio format description to a buffer in big-endian byte ordering.
struct CMImageDescriptionFlavor
Types that represent image format descriptions.
func CMVideoFormatDescriptionCreate(allocator: CFAllocator?, codecType:
CMVideoCodecType, width: Int32, height: Int32, extensions: CFDictionary
?, formatDescriptionOut: UnsafeMutablePointer<CMVideoFormatDescription?
>) -> OSStatus
Creates a format description for a video media stream.
func CMVideoFormatDescriptionCreateForImageBuffer(allocator: CFAllocato
?, imageBuffer: CVImageBuffer, formatDescriptionOut: UnsafeMutable
Pointer<CMVideoFormatDescription?>) -> OSStatus
Creates a format description for a video media stream by using an image buffer.
Working with Video Descriptions


## Page 22

func CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescription,
originIsAtTopLeft: Bool) -> CGRect
Returns a rectangle that defines the portion of the encoded pixel dimensions that represent
the image data that’s valid for displaying.
func CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescription) ->
CMVideoDimensions
Returns the video dimensions, in encoded pixels.
func CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers() -
CFArray
Returns an array of keys that you use for video format description extensions, image buffer
attachments, and attributes.
func CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormat
Description, usePixelAspectRatio: Bool, useCleanAperture: Bool) ->
CGSize
Returns the dimensions after taking the pixel aspect ratio and clean aperture into account.
func CMVideoFormatDescriptionMatchesImageBuffer(CMVideoFormatDescriptio
, imageBuffer: CVImageBuffer) -> Bool
Returns a Boolean value that indicates whether a format description matches an image buffe
func CMVideoFormatDescriptionCreateFromH264ParameterSets(allocator:
CFAllocator?, parameterSetCount: Int, parameterSetPointers: Unsafe
Pointer<UnsafePointer<UInt8>>, parameterSetSizes: UnsafePointer<Int>,
nalUnitHeaderLength: Int32, formatDescriptionOut: UnsafeMutablePointer<
CMFormatDescription?>) -> OSStatus
Creates a format description for a video media stream that the parameter set describes.
func CMVideoFormatDescriptionCreateFromHEVCParameterSets(allocator:
CFAllocator?, parameterSetCount: Int, parameterSetPointers: Unsafe
Pointer<UnsafePointer<UInt8>>, parameterSetSizes: UnsafePointer<Int>,
nalUnitHeaderLength: Int32, extensions: CFDictionary?, formatDescriptio
Out: UnsafeMutablePointer<CMFormatDescription?>) -> OSStatus
Creates a format description for a video media stream using HEVC (H.265) parameter set NA
units.
func CMVideoFormatDescriptionGetH264ParameterSetAtIndex(CMFormat
Description, parameterSetIndex: Int, parameterSetPointerOut: Unsafe
MutablePointer<UnsafePointer<UInt8>?>?, parameterSetSizeOut: Unsafe
MutablePointer<Int>?, parameterSetCountOut: UnsafeMutablePointer<Int>?,
nalUnitHeaderLengthOut: UnsafeMutablePointer<Int32>?) -> OSStatus


## Page 23

Returns a parameter set that an H.264 format description contains.
func CMVideoFormatDescriptionCopyAsBigEndianImageDescriptionBlockBuffer
allocator: CFAllocator?, videoFormatDescription: CMVideoFormat
Description, stringEncoding: CFStringEncoding, flavor: CMImage
DescriptionFlavor?, blockBufferOut: UnsafeMutablePointer<CMBlockBuffer?
>) -> OSStatus
Copies the contents of a video format description to a buffer in big-endian byte ordering.
func CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionBlock
Buffer(allocator: CFAllocator?, bigEndianImageDescriptionBlockBuffer:
CMBlockBuffer, stringEncoding: CFStringEncoding, flavor: CMImage
DescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<CMVideo
FormatDescription?>) -> OSStatus
Creates a video format description from a big-endian image description inside a buffer.
func CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionData(
allocator: CFAllocator?, bigEndianImageDescriptionData: UnsafePointer<
UInt8>, size: Int, stringEncoding: CFStringEncoding, flavor: CMImage
DescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<CMVideo
FormatDescription?>) -> OSStatus
Creates a video format description from a big-endian image description structure.
func CMSwapBigEndianImageDescriptionToHost(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts an image description data structure from big-endian to host-endian, in place.
func CMSwapHostEndianImageDescriptionToBig(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts an image description data structure from host-endian to big-endian, in place.
func CMMuxedFormatDescriptionCreate(allocator: CFAllocator?, muxType:
CMMuxedStreamType, extensions: CFDictionary?, formatDescriptionOut:
UnsafeMutablePointer<CMMuxedFormatDescription?>) -> OSStatus
Creates a format description for a muxed media stream.
struct CMMetadataDescriptionFlavor
Types that represent metadata format descriptions.
Working with Muxed Descriptions
Working with Metadata Descriptions


## Page 24

func CMMetadataFormatDescriptionCreateWithKeys(allocator: CFAllocator?,
metadataType: CMMetadataFormatType, keys: CFArray?, formatDescriptionOu
: UnsafeMutablePointer<CMMetadataFormatDescription?>) -> OSStatus
Creates a metadata format description with the metadata keys you specify.
func CMMetadataFormatDescriptionGetKeyWithLocalID(CMMetadataFormat
Description, localKeyID: OSType) -> CFDictionary?
Returns the key for the local identifier.
func CMMetadataFormatDescriptionCopyAsBigEndianMetadataDescriptionBlock
Buffer(allocator: CFAllocator?, metadataFormatDescription: CMMetadata
FormatDescription, flavor: CMMetadataDescriptionFlavor?, blockBufferOut
UnsafeMutablePointer<CMBlockBuffer?>) -> OSStatus
Copies the contents of a metadata format description to a buffer in big-endian byte order.
func CMMetadataFormatDescriptionCreateByMergingMetadataFormat
Descriptions(allocator: CFAllocator?, sourceDescription: CMMetadata
FormatDescription, otherSourceDescription: CMMetadataFormatDescription,
formatDescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?
>) -> OSStatus
Creates a metadata format description object by merging with another description.
func CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescription
BlockBuffer(allocator: CFAllocator?, bigEndianMetadataDescriptionBlock
Buffer: CMBlockBuffer, flavor: CMMetadataDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?>) ->
OSStatus
Creates a metadata format description from a big-endian metadata description structure
inside a buffer.
func CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescription
Data(allocator: CFAllocator?, bigEndianMetadataDescriptionData: Unsafe
Pointer<UInt8>, size: Int, flavor: CMMetadataDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?>) ->
OSStatus
Creates a metadata format description from a big-endian metadata description structure.
func CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAnd
MetadataSpecifications(allocator: CFAllocator?, sourceDescription:
CMMetadataFormatDescription, metadataSpecifications: CFArray, format
DescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?>) ->
OSStatus


## Page 25

Creates a metadata format description by extending an existing description with the values
you specify.
func CMMetadataFormatDescriptionCreateWithMetadataSpecifications(
allocator: CFAllocator?, metadataType: CMMetadataFormatType, metadata
Specifications: CFArray, formatDescriptionOut: UnsafeMutablePointer<
CMMetadataFormatDescription?>) -> OSStatus
Creates a metadata format description with the specifications you specify.
func CMSwapBigEndianMetadataDescriptionToHost(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a metadata description data structure from big-endian to host-endian, in place.
func CMSwapHostEndianMetadataDescriptionToBig(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a metadata description data structure from host-endian to big-endian, in place.
func CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormat
Description) -> CFArray?
Returns an array of metadata identifiers from a metadata format description.
struct CMTextDescriptionFlavor
Types that represent text format descriptions.
func CMTextFormatDescriptionGetDefaultStyle(CMFormatDescription, local
FontIDOut: UnsafeMutablePointer<UInt16>?, boldOut: UnsafeMutablePointer
DarwinBoolean>?, italicOut: UnsafeMutablePointer<DarwinBoolean>?,
underlineOut: UnsafeMutablePointer<DarwinBoolean>?, fontSizeOut: Unsafe
MutablePointer<CGFloat>?, colorComponentsOut: UnsafeMutablePointer<
CGFloat>?) -> OSStatus
Returns the default text style.
func CMTextFormatDescriptionGetDefaultTextBox(CMFormatDescription,
originIsAtTopLeft: Bool, heightOfTextTrack: CGFloat, defaultTextBoxOut:
UnsafeMutablePointer<CGRect>) -> OSStatus
Returns the default text box.
func CMTextFormatDescriptionGetDisplayFlags(CMFormatDescription, displa
FlagsOut: UnsafeMutablePointer<CMTextDisplayFlags>) -> OSStatus
Returns the display flags.
Working with Text Descriptions


## Page 26

func CMTextFormatDescriptionGetFontName(CMFormatDescription, localFontI
: UInt16, fontNameOut: AutoreleasingUnsafeMutablePointer<CFString?>) ->
OSStatus
Returns a font name for a local font identifier.
func CMTextFormatDescriptionGetJustification(CMFormatDescription,
horizontalOut: UnsafeMutablePointer<CMTextJustificationValue>?, vertica
Out: UnsafeMutablePointer<CMTextJustificationValue>?) -> OSStatus
Returns the horizontal and vertical justification.
func CMTextFormatDescriptionCopyAsBigEndianTextDescriptionBlockBuffer(
allocator: CFAllocator?, textFormatDescription: CMTextFormatDescription
flavor: CMTextDescriptionFlavor?, blockBufferOut: UnsafeMutablePointer<
CMBlockBuffer?>) -> OSStatus
Copies the contents of a text format description to a buffer in big-endian byte order.
func CMTextFormatDescriptionCreateFromBigEndianTextDescriptionBlock
Buffer(allocator: CFAllocator?, bigEndianTextDescriptionBlockBuffer:
CMBlockBuffer, flavor: CMTextDescriptionFlavor?, mediaType: CMMediaType
formatDescriptionOut: UnsafeMutablePointer<CMTextFormatDescription?>) -
OSStatus
Creates a text format description from a big-endian text description structure inside a buffer
func CMTextFormatDescriptionCreateFromBigEndianTextDescriptionData(
allocator: CFAllocator?, bigEndianTextDescriptionData: UnsafePointer<
UInt8>, size: Int, flavor: CMTextDescriptionFlavor?, mediaType: CMMedia
Type, formatDescriptionOut: UnsafeMutablePointer<CMTextFormatDescriptio
?>) -> OSStatus
Creates a text format description from a big-endian text description structure.
func CMSwapBigEndianTextDescriptionToHost(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a text description structure from big-endian to host-endian, in place.
func CMSwapHostEndianTextDescriptionToBig(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a text description structure from host-endian to big-endian, in place.
struct CMTimeCodeDescriptionFlavor
Types that represent time code format descriptions.
Working with Time Code Descriptions


## Page 27

func CMTimeCodeFormatDescriptionCreate(allocator: CFAllocator?, timeCod
FormatType: CMTimeCodeFormatType, frameDuration: CMTime, frameQuanta:
UInt32, flags: UInt32, extensions: CFDictionary?, formatDescriptionOut:
UnsafeMutablePointer<CMTimeCodeFormatDescription?>) -> OSStatus
Creates a format description for time code media.
func CMTimeCodeFormatDescriptionGetFrameDuration(CMTimeCodeFormat
Description) -> CMTime
Returns the duration of each frame.
func CMTimeCodeFormatDescriptionGetFrameQuanta(CMTimeCodeFormat
Description) -> UInt32
Returns the frames per second for a time code, or frames per tick in counter mode.
func CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormat
Description) -> UInt32
Returns time code flags.
func CMTimeCodeFormatDescriptionCopyAsBigEndianTimeCodeDescriptionBlock
Buffer(allocator: CFAllocator?, timeCodeFormatDescription: CMTimeCode
FormatDescription, flavor: CMTimeCodeDescriptionFlavor?, blockBufferOut
UnsafeMutablePointer<CMBlockBuffer?>) -> OSStatus
Copies the contents of a time code format description to a buffer in big-endian byte order.
func CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescription
BlockBuffer(allocator: CFAllocator?, bigEndianTimeCodeDescriptionBlock
Buffer: CMBlockBuffer, flavor: CMTimeCodeDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMTimeCodeFormatDescription?>) ->
OSStatus
Creates a time code format description from a big-endian time code description data
structure in a buffer.
func CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescription
Data(allocator: CFAllocator?, bigEndianTimeCodeDescriptionData: Unsafe
Pointer<UInt8>, size: Int, flavor: CMTimeCodeDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMTimeCodeFormatDescription?>) ->
OSStatus
Creates a time code format description from a big-endian time code description structure.
func CMSwapBigEndianTimeCodeDescriptionToHost(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a time code description data structure from big-endian to host-endian, in place.


## Page 28

func CMSwapHostEndianTimeCodeDescriptionToBig(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a time code description data structure from host-endian to big-endian, in place.
struct CMClosedCaptionDescriptionFlavor
Types that represent closed caption format descriptions.
func CMClosedCaptionFormatDescriptionCopyAsBigEndianClosedCaption
DescriptionBlockBuffer(allocator: CFAllocator?, closedCaptionFormat
Description: CMClosedCaptionFormatDescription, flavor: CMClosedCaption
DescriptionFlavor?, blockBufferOut: UnsafeMutablePointer<CMBlockBuffer?
>) -> OSStatus
Copies the contents of a closed caption format description to a buffer in big-endian byte
order.
func CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaption
DescriptionBlockBuffer(allocator: CFAllocator?, bigEndianClosedCaption
DescriptionBlockBuffer: CMBlockBuffer, flavor: CMClosedCaption
DescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<CMClosed
CaptionFormatDescription?>) -> OSStatus
Creates a closed caption format description from a big-endian closed caption description
structure in a buffer.
func CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaption
DescriptionData(allocator: CFAllocator?, bigEndianClosedCaption
DescriptionData: UnsafePointer<UInt8>, size: Int, flavor: CMClosed
CaptionDescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<
CMClosedCaptionFormatDescription?>) -> OSStatus
Creates a closed caption format description from a big-endian closed caption description
structure.
func CMSwapHostEndianClosedCaptionDescriptionToBig(UnsafeMutablePointer
UInt8>, Int) -> OSStatus
Converts a closed caption description structure from host-endian to big-endian, in place.
func CMSwapBigEndianClosedCaptionDescriptionToHost(UnsafeMutablePointer
UInt8>, Int) -> OSStatus
Converts a closed caption description structure from big-endian to host-endian, in place.
Working with Closed Captioning Descriptions
Format Description Types


## Page 29

class CMFormatDescription
An object that describes a media format descriptor.
typealias CMAudioFormatDescription
A type you use to interact with audio format descriptions.
typealias CMClosedCaptionFormatDescription
A type you use to interact with closed caption format descriptions.
typealias CMMetadataFormatDescription
A type you use to interact with metadata format descriptions.
typealias CMMuxedFormatDescription
A type you use to interact with muxed format descriptions.
typealias CMTextFormatDescription
A type you use to interact with text format descriptions.
typealias CMTimeCodeFormatDescription
A type you use to interact with time code format descriptions.
typealias CMVideoFormatDescription
A type you use to interact with video format descriptions.
let kCMFormatDescriptionExtension_ContentColorVolume: CFString
let kCMFormatDescriptionExtension_HasAdditionalViews: CFString
let kCMFormatDescriptionExtension_HasLeftStereoEyeView: CFString
let kCMFormatDescriptionExtension_HasRightStereoEyeView: CFString
let kCMFormatDescriptionExtension_HeroEye: CFString
let kCMFormatDescriptionExtension_HorizontalDisparityAdjustment:
CFString
let kCMFormatDescriptionExtension_LogTransferFunction: CFString
let kCMFormatDescriptionExtension_StereoCameraBaseline: CFString
let kCMFormatDescriptionHeroEye_Left: CFString
let kCMFormatDescriptionHeroEye_Right: CFString
Format Description Extension Keys


## Page 30

typealias CMClosedCaptionFormatType
A closed caption format type.
typealias CMMetadataFormatType
A metadata format type.
Metadata Format Types
Constants that represent media format types.
typealias CMSubtitleFormatType
A type that represents a text subtitle format.
Subtitle Format Types
Constants that represent subtitle format types.
typealias CMTimeCodeFormatType
A time code format type.
Time Code Formats
Constants that represent time code format types.
typealias CMTextFormatType
A text format type.
typealias CMPixelFormatType
A pixel format type.
Tagged Buffer Group Format Types
struct CMVideoDimensions
A structure that represents video dimensions.
typealias CMAudioFormatDescriptionMask
A type for mask bits that represent parts of an audio format description.
typealias CMMediaType
Constants that represent media types.
Format Types
Data Types


## Page 31

typealias CMAudioCodecType
An audio codec type.
typealias CMVideoCodecType
A video codec type.
typealias CMTextDisplayFlags
An integer value that describes the display mode flags for text media.
typealias CMTextJustificationValue
An integer value that describes the justification modes for text media.
Media Type Constants
Constants that represent media types.
Muxed Stream Types
Constants that represent muxed stream types.
Audio Codec Types
Constants that represent audio codec types.
Audio Format Description Mask Codes
Mask codes that identify audio formats.
Chroma Location Extension Constants
Constants that identify chroma location extensions.
Clean Aperture Extension Constants
Constants that identify clean aperture extensions.
Closed Caption Format Type Constants
Types that identify closed caption formats.
Color Primary Extension Constants
Constants that identify color primary extensions.
Field Detail Extension Constants
Constants that identify field detail extensions.
Format Description Bridge Error Codes
Bridge errors the system returns from format description calls.
Constants


## Page 32

Format Description Constants
Constants that identify format descriptions.
Format Description Error Codes
Errors the system returns from format description calls.
HEVC Temporal Level Info Constants
Constants that identify HEVC temporal level information.
Metadata Format Description Constants
Constants that identify metadata format descriptions.
MPEG-2-conformant Formats
Constants that identify MPEG-2 formats.
Pixel Aspect Ratio Extension Constants
Constants that identify pixel aspect ratio extensions.
Text Display Flags
Flags that identify text display methods.
Text Format Constants
Types that identify text formats.
Text Format Description Constants
Constants that identify text format descriptions.
Text Justification Constants
Types that identify text justifications.
Time Code Flags
Flags that identify time codes.
Time Code Format Description Constants
Constants that identify time code format descriptions.
Transfer Function Extension Constants
Constants that identify transfer function extensions.
Video Codec Constants
Types that identify video codecs.
Video Pixel Formats


## Page 33

Constants that identify video pixel formats.
Video Profile Constants
Constants that identify video profiles.
YCbCrMatrix Extension Constants
Constants that identify YCbCrMatrix extensions.
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
CMBlockBuffer
An object the system uses to move blocks of memory through a processing system.
CMTaggedBufferGroup
Objective-C types and interfaces for working with Core Media tagged buffer groups.
CMAttachment
Add supporting metadata to sample buffers.
struct CMTaggedBuffer
An instance of a media buffer containing metadata tags.
struct CMMutableDataBlockBuffer
A block buffer that provides read-write access to a range of bytes.
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
See Also
Sample Processing


## Page 34

Contains a collection of tags associated with a read-only media buffer.


## Page 35

An attachment bearer is a Core Foundation type object that supports the suite of key, value, and
mode attachment APIs. You can attach any Core Foundation object to an attachment bearer to
store additional information.
func CMGetAttachment(CMAttachmentBearer, key: CFString, attachmentMode
Out: UnsafeMutablePointer<CMAttachmentMode>?) -> CFTypeRef?
Returns an attachment from an attachment bearer object.
func CMCopyDictionaryOfAttachments(allocator: CFAllocator?, target:
CMAttachmentBearer, attachmentMode: CMAttachmentMode) -> sending
CFDictionary?
Returns a dictionary of all attachments for an attachment bearer object.
func CMSetAttachment(CMAttachmentBearer, key: CFString, value: CFTypeRe
?, attachmentMode: CMAttachmentMode)
Sets or adds an attachment to an attachment bearer object.
func CMSetAttachments(CMAttachmentBearer, attachments: CFDictionary,
attachmentMode: CMAttachmentMode)
Sets a dictionary of attachments on an attachment bearer object.
Overview
Topics
Processing Attachments
Core Media / CMAttachment
API Collection
CMAttachment
Add supporting metadata to sample buffers.


## Page 36

func CMRemoveAttachment(CMAttachmentBearer, key: CFString)
Removes a specific attachment from an attachment bearer object.
func CMRemoveAllAttachments(CMAttachmentBearer)
Removes all attachments from an attachment bearer object.
func CMPropagateAttachments(CMAttachmentBearer, destination:
CMAttachmentBearer)
Copies all propagable attachments from one attachment bearer object to another.
protocol CMAttachmentBearerProtocol
A protocol for objects that can carry attachments.
typealias CMAttachmentBearer
An object that can carry attachments.
typealias CMAttachmentMode
The mode to use when propagating attachments.
var kCMAttachmentMode_ShouldNotPropagate: CMAttachmentMode
A mode that doesn’t propagate attachments to another object.
var kCMAttachmentMode_ShouldPropagate: CMAttachmentMode
A mode that propagates attachments to another object.
let kCMSampleAttachmentKey_HEVCTemporalLevelInfo: CFString
An attachment that indicates a video frame’s level within a hierarchical frame dependency
structure.
let kCMSampleAttachmentKey_HEVCTemporalSubLayerAccess: CFString
An attachment that indicates a temporal sublayer access grouping.
let kCMSampleAttachmentKey_HEVCStepwiseTemporalSubLayerAccess: CFString
An attachment that indicates a step-wise temporal sublayer access (STSA) sample grouping
let kCMSampleAttachmentKey_HEVCSyncSampleNALUnitType: CFString
An attachment that indicates a sync sample NAL unit type.
Data Types
Constants


## Page 37

let kCMSampleAttachmentKey_CryptorSubsampleAuxiliaryData: CFString
An attachment that describes the ranges of protected and unprotected data within a
protected sample buffer.
let kCMSampleAttachmentKey_AudioIndependentSampleDecoderRefreshCount:
CFString
An attachment that’s only present if the audio sample is an independent frame or immediate
playout frame.
let kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix: CFString
An attachment that indicates a 3x3 camera intrinsic matrix to apply to the current sample
buffer.
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
CMBlockBuffer
An object the system uses to move blocks of memory through a processing system.
CMTaggedBufferGroup
Objective-C types and interfaces for working with Core Media tagged buffer groups.
CMFormatDescription
A media format descriptor that describes the samples in a sample buffer.
struct CMTaggedBuffer
An instance of a media buffer containing metadata tags.
struct CMMutableDataBlockBuffer
A block buffer that provides read-write access to a range of bytes.
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
See Also
Sample Processing


## Page 38

struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


## Page 39

init(tags: [CMTag], buffer: CMTaggedBuffer.Buffer)
Creates a new tagged buffer from tags and an existing media buffer.
init(tags: [CMTag], sampleBuffer: CMSampleBuffer)
Creates a new tagged buffer from tags and an existing sample buffer.
init(tags: [CMTag], pixelBuffer: CVPixelBuffer)
Creates a new tagged buffer from tags and an existing pixel buffer.
let tags: [CMTag]
The tags for this buffer.
let buffer: CMTaggedBuffer.Buffer
The underlying buffer containing media data.
Topics
Creating Tagged Buffers
Inspecting Data
Buffer Wrappers
Core Media / CMTaggedBuffer
Structure
CMTaggedBuffer
An instance of a media buffer containing metadata tags.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 40

enum Buffer
A wrapper type for the underlying buffer of a tagged buffer.
CustomStringConvertible
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
struct CMMutableDataBlockBuffer
A block buffer that provides read-write access to a range of bytes.
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
Relationships
Conforms To
See Also
Sample Processing


## Page 41

struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


## Page 42

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


## Page 43

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


## Page 44

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


## Page 45

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


## Page 46

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


## Page 47

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


## Page 48

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


## Page 49

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


## Page 50

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


## Page 51

init(CMReadySampleBuffer<some CMSampleBuffer.Content>)
Convert a ready sample buffer to dynamic content.
init?(CMReadySampleBuffer<CMSampleBuffer.DynamicContent>)
Converts dynamic sample buffer to a marker sample buffer.
init?(CMReadySampleBuffer<CMSampleBuffer.DynamicContent>)
Converts dynamic sample buffer to a sample buffer containing pixel buffer.
init?(CMReadySampleBuffer<CMSampleBuffer.DynamicContent>)
Converts dynamic sample buffer to a sample buffer containing data buffer.
init?(CMReadySampleBuffer<CMSampleBuffer.DynamicContent>)
Converts dynamic sample buffer to a sample buffer containing tagged buffers.
init(audioDataBuffer: Content, formatDescription: CMAudioFormat
Description, sampleCount: Int, presentationTimeStamp: CMTime)
Creates a sample buffer carrying audio media data.
Topics
Initializers
Core Media / CMReadySampleBuffer
Structure
CMReadySampleBuffer
Buffer carrying readily available samples of media data.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 52

init(compressedAudioDataBuffer: Content, formatDescription: CMAudio
FormatDescription, presentationTimeStamp: CMTime, packetDescriptions: [
AudioStreamPacketDescription])
Creates a sample buffer carrying compressed audio media data.
init(dataBuffer: Content, formatDescription: CMFormatDescription, sampl
Properties: CMSampleBuffer.SamplePropertiesCollection)
Creates a sample buffer with media data.
init(markerAt: CMTime, duration: CMTime)
Creates a marker-only sample buffer with no payload and no format description.
init(pixelBuffer: Content, formatDescription: CMVideoFormatDescription?
presentationTimeStamp: CMTime, duration: CMTime)
Creates a sample buffer carrying image buffer.
init(sampleDataReference: Content, formatDescription: CMFormat
Description, sampleProperties: CMSampleBuffer.SamplePropertiesCollectio
)
Creates a sample buffer with references to sample data.
init(taggedBuffers: Content, formatDescription: CMTaggedBufferGroup
FormatDescription?, presentationTimeStamp: CMTime, duration: CMTime)
Creates a sample buffer carrying tagged buffers.
init(unsafeBuffer: sending CMSampleBuffer)
Create a ready sample buffer with dynamic content from an existing sample buffer.
init(unsafeMarkerOnlySampleBuffer: sending CMSampleBuffer)
Create a ready sample buffer with marker content from an existing sample buffer.
init(unsafeSampleDataReferenceBuffer: sending CMSampleBuffer)
Create a ready sample buffer with data reference content from an existing sample buffer.
init(unsafeWithDataBuffer: sending CMSampleBuffer)
Creates a ready sample buffer with data buffer content from an existing sample buffer.
init(unsafeWithPixelBuffer: sending CMSampleBuffer)
Creates a ready sample buffer with pixel buffer content from an existing sample buffer.
init(unsafeWithTaggedBuffers: sending CMSampleBuffer)
Create a ready sample buffer with tagged buffers content from an existing sample buffer.


## Page 53

var audioStreamPacketDescriptions: [AudioStreamPacketDescription]?
Get an array of AudioStreamPacketDescriptions describing audio samples in the buffer.
var content: CMSampleDataReference
Payload containing the samples.
var content: CMSampleBuffer.DynamicContent
Payload containing the samples.
var content: CVReadOnlyPixelBuffer
Payload containing the samples.
var content: Array<CMTaggedDynamicBuffer>
Payload containing the samples.
var content: CMReadOnlyDataBlockBuffer
Payload containing the samples.
var contentType: CMSampleBuffer.ContentType
Type of the content carried by this sample buffer
var decodeTimeStamp: CMTime
Numerically earliest sample decode timestamp in the sample buffer.
var duration: CMTime
The unmodified sum of the durations of all samples in the sample buffer.
var duration: CMTime
Duration of the sample buffer.
var duration: CMTime
Duration of the sample buffer.
var duration: CMTime
Duration of the sample buffer.
var formatDescription: CMFormatDescription
The format description of the samples in the sample buffer.
var formatDescription: CMFormatDescription?
Instance Properties


## Page 54

The format description of the samples in the sample buffer.
var markerTimeStamp: CMTime
Presentation timestamp of the sample buffer.
var outputDecodeTimeStamp: CMTime
The output decode timestamp of the sample buffer.
var outputDuration: CMTime
The output duration of the sample buffer.
var outputPresentationTimeStamp: CMTime
The output presentation timestamp of the sample buffer.
var outputSampleTimings: CMSampleBuffer.TimingPerSample?
Output timing information of each sample in the sample buffer.
var presentationTimeStamp: CMTime
Presentation timestamp of the sample buffer.
var presentationTimeStamp: CMTime
Presentation timestamp of the sample buffer.
var presentationTimeStamp: CMTime
Numerically earliest sample presentation timestamp in the sample buffer.
var sampleAttachments: CMSampleBuffer.SampleAttachments
Attachments for the sample in this buffer.
var sampleAttachments: CMSampleBuffer.SampleAttachments
Attachments for the sample in this buffer.
var sampleCount: Int
Number of samples in the sample buffer.
var sampleProperties: CMSampleBuffer.SamplePropertiesCollection
Information about the samples in the sample buffer.
var totalSampleSize: Int
Total size in bytes of all samples in the sample buffer.
Instance Methods


## Page 55

func attach(contentKey: AVContentKey) throws
Attaches an AVContentKey to a CMReadySampleBuffer for the purpose of content decryptio
The client is expected to attach AVContentKeys to CMReadySampleBuffers that have been
created by the client for enqueueing with AVSampleBufferDisplayLayer or
AVSampleBufferAudioRenderer, for which the AVContentKeySpecifier matches indications of
suitability that are available to the client according to the content key system that’s in use.
func copyPCMData(fromRange: Range<Int>, into: UnsafeMutablePointer<Audi
BufferList>) throws
Copies PCM audio data from the sample buffer into a pre-allocated AudioBufferList.
func splitSamples() -> [CMReadySampleBuffer<Content>]
Split sample buffer into a smaller representation, ideally carrying a single sample per resultin
sample buffer.
func withUnsafeSampleBuffer<R>((CMSampleBuffer) throws -> sending R)
rethrows -> sending R
Access the underlying CMSampleBuffer instance.
AVAssetReaderOutput.SupportedPayload
Copyable
Sendable
SendableMetatype
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
CMBlockBuffer
An object the system uses to move blocks of memory through a processing system.
Relationships
Conforms To
See Also
Sample Processing


## Page 56

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
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


## Page 57

The size of the data is provided as totalSampleSize.
init(containerLocation: URL, byteOffset: Int)
var byteOffset: Int
Offset of the sample data in the container.
var containerLocation: URL
Container of the sample data.
Overview
Topics
Initializers
Instance Properties
Relationships
Core Media / CMSampleDataReference
Structure
CMSampleDataReference
References sample data in at a URL.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 58

CMSampleBuffer.Content
CMSampleBuffer.ContentWithFormatDescription
CMSampleBuffer.MultiSampleContent
Equatable
Hashable
Sendable
SendableMetatype
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
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Conforms To
See Also
Sample Processing


## Page 59

Buffer carrying readily available samples of media data.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


## Page 60

init(tags: [CMTag], content: CVReadOnlyPixelBuffer)
init(tags: [CMTag], content: CMTaggedDynamicBuffer.Content)
init(tags: [CMTag], content: CMReadySampleBuffer<CVReadOnlyPixelBuffer>
init(tags: [CMTag], content: CMReadySampleBuffer<CMReadOnlyDataBlock
Buffer>)
init(unsafeBuffer: sending CMTaggedBuffer)
var content: CMTaggedDynamicBuffer.Content
Buffer containing media.
var tags: [CMTag]
Tags associated with the content.
Topics
Initializers
Instance Properties
Instance Methods
Core Media / CMTaggedDynamicBuffer
Structure
CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 61

func withUnsafeTaggedBuffer<R>((CMTaggedBuffer) throws -> sending R)
rethrows -> sending R
enum Content
A read-only buffer associated with the tags.
Sendable, SendableMetatype
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
Enumerations
Relationships
Conforms To
See Also
Sample Processing


## Page 62

A block buffer that provides read-write access to a range of bytes.
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.


