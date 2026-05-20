# 005_CMTaggedBuffer.pdf

## Page 1

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


## Page 2

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


## Page 3

struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


