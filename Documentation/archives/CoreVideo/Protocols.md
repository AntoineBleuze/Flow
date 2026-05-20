# Protocols.pdf

## Page 1

associatedtype Buffer : CVBuffer
Required
func withUnsafeBuffer<R>((Self.Buffer) throws -> sending R) rethrows ->
sending R
Access the underlying Buffer object. This function should be used to bridge existing code
that uses the Buffer type.
Required
Topics
Associated Types
Instance Methods
Relationships
Inherited By
Core Video / CVBufferRepresentable
Protocol
CVBufferRepresentable
CVBufferRepresentable protocol is a sealed protocol intended to be implemented
by the types in CoreVideo framework. This protocol facilitates Swift types that
wrap a value of CVBuffer type.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

CVImageBufferRepresentable, CVPixelBufferRepresentable
CVMutablePixelBuffer, CVReadOnlyPixelBuffer
Conforming Types


## Page 3

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


## Page 4

Position of {0, 0} coordinates in the image
CVBufferRepresentable
CVPixelBufferRepresentable
CVMutablePixelBuffer, CVReadOnlyPixelBuffer
Relationships
Inherits From
Inherited By
Conforming Types


## Page 5

var creationAttributes: CVPixelBufferCreationAttributes
Attributes used for creating this pixel buffer
var extendedPixels: CVPixelBufferPadding
Padding pixels around this pixel buffer
var isPlanar: Bool
True if the buffer was created with support for one or more planes.
var pixelFormatType: CVPixelFormatType
Pixel format of this pixel buffer
var planeCount: Int
Number of planes in this pixel buffer. This value will always be greater than 0. planeCount 
more efficient to access than count property of planes. A non-planar pixel buffer implicitly
defines a single plane. To check if the pixel buffer was defined with planes use isPlanar
property.
Topics
Instance Properties
Core Video / CVPixelBufferRepresentable
Protocol
CVPixelBufferRepresentable
CVPixelBufferRepresentable protocol is a sealed protocol intended to be
implemented by the types in CoreVideo framework. This protocol facilitates Swift
types that wrap a value of CVPixelBuffer type.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 6

var planeProperties: [CVPixelBufferPlaneProperties]
Properties of all the planes in this pixel buffer. This array will contain at least one element. In
case of non-planar pixel buffers, the first value represents the entire pixel data.
var size: CVImageSize
Size of the pixel buffer in pixels
func accessUnsafeRawPlaneBytes<R>(([(properties: CVPixelBufferPlane
Properties, bytes: UnsafeRawBufferPointer)]) throws -> sending R)
rethrows -> sending R
Access the pixels in the planes contained within this buffer. The base address is locked for
reading during the execution of the block.
func isCompatibleWith(CVPixelBufferAttributes) -> Bool
Returns true if the pixel buffer is compatible with the specified attributes.
func isCompatibleWith(CVPixelBufferCreationAttributes) -> Bool
Returns true if the pixel buffer is compatible with the specified creation attributes.
func withUnsafeBackingIOSurfaceIfPresent<R>((IOSurface) throws ->
sending R) rethrows -> sending R?
Access the IOSurface backing the pixel buffer if present.
CVBufferRepresentable, CVImageBufferRepresentable
CVMutablePixelBuffer, CVReadOnlyPixelBuffer
Instance Methods
Relationships
Inherits From
Conforming Types


