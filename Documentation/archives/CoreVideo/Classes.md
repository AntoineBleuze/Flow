# Classes.pdf

## Page 1

Equatable, Hashable
Relationships
Conforms To
Core Video / CVMetalBufferCache
Class
CVMetalBufferCache
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 2

init(consuming CVMutablePixelBuffer)
Initialize a read-only pixel buffer by consuming a mutable pixel buffer value.
init(unsafeBuffer: sending CVPixelBuffer)
Initialize a read-only pixel buffer by transferring existing CVPixelBuffer value.
func withUnsafeBuffer<R>((CVPixelBuffer) throws -> sending R) rethrows 
> sending R
CMSampleBuffer.Content
Topics
Initializers
Instance Methods
Relationships
Conforms To
Core Video / CVReadOnlyPixelBuffer
Class
CVReadOnlyPixelBuffer
CVReadOnlyPixelBuffer provides an immutable view of the pixel data held by the
pixel buffer.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 3

CMSampleBuffer.ContentWithFormatDescription
CVBufferRepresentable
CVImageBufferRepresentable
CVPixelBufferRepresentable
Copyable
Sendable
SendableMetatype


