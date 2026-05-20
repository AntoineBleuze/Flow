# 002_CVMutablePixelBuffer.pdf

## Page 1

class Pool
Manage and recycle pixel buffer backings.
init(CVPixelBufferCreationAttributes) throws
Creates a CVPixelBuffer with given attributes. It allocates the necessary memory based on th
dimensions, pixel format and extended pixels described in the CVPixel
Buffer/Attributes.
init(unsafeBacking: IOSurface, matching: CVPixelBufferCreationAttribute
) throws
Creates a CVPixelBuffer backed by the given ioSurface. The CVPixelBuffer will retain the i
Surface. IMPORTANT If you are using IOSurface to share CVPixelBuffers between
processes and those CVPixelBuffers are allocated via a CVPixelBufferPool, it is important tha
the CVPixelBufferPool does not reuse CVPixelBuffers whose IOSurfaces are still in use in oth
processes. CoreVideo and IOSurface will take care of this for if you use
Topics
Classes
Initializers
Core Video / CVMutablePixelBuffer
Structure
CVMutablePixelBuffer
CVMutablePixelBuffer provides read-write access to the pixel data and
attachments.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

IOSurfaceCreateMachPort and IOSurfaceLookupFromMachPort, but NOT if you pass
IOSurfaceIDs.
init(unsafeBuffer: sending CVPixelBuffer)
Initialize a mutable pixel buffer by transferring existing CVPixelBuffer value.
func accessUnsafeMutableRawPlaneBytes<R>(([(properties: CVPixelBuffer
PlaneProperties, bytes: UnsafeMutableRawBufferPointer)]) throws ->
sending R) rethrows -> sending R
Access the pixels in the planes contained within this buffer. The base address is locked for
writing during the execution of the block.
func fillExtendedPixels() -> Bool
Fills the extended pixels of the pixel buffer. This method replicates the edge pixels to fill the
entire extended region of the image.
func withUnsafeBuffer<R>((CVPixelBuffer) throws -> sending R) rethrows 
> sending R
CVBufferRepresentable
CVImageBufferRepresentable
CVPixelBufferRepresentable
Sendable
SendableMetatype
Instance Methods
Relationships
Conforms To


