# 010_CMTaggedDynamicBuffer.pdf

## Page 1

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


## Page 2

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


## Page 3

A block buffer that provides read-write access to a range of bytes.
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.


