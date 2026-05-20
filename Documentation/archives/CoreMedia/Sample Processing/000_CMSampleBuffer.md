# 000_CMSampleBuffer.pdf

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


