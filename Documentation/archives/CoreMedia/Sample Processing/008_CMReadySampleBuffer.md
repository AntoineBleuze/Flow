# 008_CMReadySampleBuffer.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


