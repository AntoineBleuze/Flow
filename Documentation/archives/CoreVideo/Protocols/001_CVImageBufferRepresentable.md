# 001_CVImageBufferRepresentable.pdf

## Page 1

var cleanRect: CGRect
Source rectangle of a CVImageBuffer that represents the clean aperture of the buffer in
encoded pixels. For example, an NTSC DV frame would return a CGRect with an origin of 8,0
and a size of 704,480. Note that the origin of this rect always the lower left corner. This is th
same coordinate system as used by CoreImage.
var colorSpace: CGColorSpace?
Color space of the image if specified
var displaySize: CGSize
Nominal output display size (in square pixels) of a CVImageBuffer. For example, for an NTSC
DV frame this would be 640x480
var encodedSize: CGSize
Full encoded dimensions of a CVImageBuffer. For example, for an NTSC DV frame this would
be 720x480
var originPosition: CVImageBufferOriginPosition
Topics
Instance Properties
Core Video / CVImageBufferRepresentable
Protocol
CVImageBufferRepresentable
CVImageBufferRepresentable protocol is a sealed protocol intended to be
implemented by the types in CoreVideo framework. This protocol facilitates Swift
types that wrap a value of CVImageBuffer type.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

Position of {0, 0} coordinates in the image
CVBufferRepresentable
CVPixelBufferRepresentable
CVMutablePixelBuffer, CVReadOnlyPixelBuffer
Relationships
Inherits From
Inherited By
Conforming Types


