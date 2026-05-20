# 006_CVPixelBufferPlaneProperties.pdf

## Page 1

init(size: CVImageSize, bytesPerRow: Int)
var bytesPerRow: Int
Number of bytes in each row of the plane. Note that this may be greater than the bytes
required for all pixels in the row.
var size: CVImageSize
Size of the plane in pixels
Equatable
Topics
Initializers
Instance Properties
Relationships
Conforms To
Core Video / CVPixelBufferPlaneProperties
Structure
CVPixelBufferPlaneProperties
Properties of a plane of pixels in pixel buffer
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

Hashable
Sendable
SendableMetatype


