# 009_CMSampleDataReference.pdf

## Page 1

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


## Page 2

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


## Page 3

Buffer carrying readily available samples of media data.
struct CMTaggedDynamicBuffer
Contains a collection of tags associated with a read-only media buffer.


