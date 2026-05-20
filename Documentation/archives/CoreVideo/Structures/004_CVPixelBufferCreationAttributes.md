# 004_CVPixelBufferCreationAttributes.pdf

## Page 1

init?(CVPixelBufferAttributes)
Convert Attributes to CreationAttributes. This init will fail if pixelFormatType or size
properties are absent.
init(pixelFormatType: CVPixelFormatType, size: CVImageSize,
compatibility: CVPixelFormatDescription.Compatibility, bytesPerRow
Alignment: Int?, planeAlignment: Int?, extendedPixels: CVPixelBuffer
Padding?)
var backing: CVPixelBufferCreationAttributes.Backing
Defines how the memory for the pixel buffer backing is allocated. IOSurface backed pixel
buffers can be shared between CPU and GPU also across process boundaries. Defaults to
Backing.ioSurface.
var bytesPerRowAlignment: Int?
The number of bytes per row in the pixel buffer must be a multiple of this number.
var compatibility: CVPixelFormatDescription.Compatibility
Topics
Initializers
Instance Properties
Core Video / CVPixelBufferCreationAttributes
Structure
CVPixelBufferCreationAttributes
Attributes needed for creating a pixel buffer.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

Defines interoperability of pixel buffers with other frameworks
var extendedPixels: CVPixelBufferPadding?
Sets the amount of extended pixel padding in the pixel buffer.
var pixelFormatType: CVPixelFormatType
Format of the pixel buffer bytes
var planeAlignment: Int?
Planes start on a byte number that’s a multiple of this value.
var size: CVImageSize
Size of the buffer in pixels
enum Backing
Type of backing storage used by the pixel buffer
Equatable, Sendable, SendableMetatype
Enumerations
Relationships
Conforms To


