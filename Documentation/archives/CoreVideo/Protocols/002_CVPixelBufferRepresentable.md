# 002_CVPixelBufferRepresentable.pdf

## Page 1

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


## Page 2

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


