# 001_CIContext.pdf

## Page 1

Processing an Image Using Built-in Filters
You use a CIContext instance to render a CIImage instance which represents a graph of image
processing operations which are built using other Core Image classes, such as CIFilter,
CIKernel, CIColor and CIImage. You can also use a CIContext with the CIDetector class
to analyze images — for example, to detect faces or barcodes.
Contexts support automatic color management by performing all processing operations in a
working color space. This means that unless told otherwise:
All input images are color matched from the input’s color space to the working space.
All renders are color matched from the working space to the destination space. (For more
information on CGColorSpace see CGColorSpace)
CIContext and CIImage instances are immutable, so multiple threads can use the same
CIContext instance to render CIImage instances. However, CIFilter instances are mutable
and thus cannot be shared safely among threads. Each thread must take case not to access or
modify a CIFilter instance while it is being used by another thread.
The CIContext manages various internal state such as MTLCommandQueue and caches for
compiled kernels and intermediate buffers. For this reason it is not recommended to create many
Mentioned in
Overview
Core Image / CIContext
Class
CIContext
The Core Image context class provides an evaluation context for Core Image
processing with Metal, OpenGL, or OpenCL.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+


## Page 2

CIContext instances. As a rule, it recommended that you create one CIContext instance for
each view that renders CIImage or each background task.
init()
Initializes a context without a specific rendering destination, using default options.
init(cgContext: CGContext, options: [CIContextOption : Any]?)
Creates a Core Image context from a Quartz context, using the specified options.
init(mtlDevice: any MTLDevice)
Creates a Core Image context using the specified Metal device.
init(mtlDevice: any MTLDevice, options: [CIContextOption : Any]?)
Creates a Core Image context using the specified Metal device and options.
init(mtlCommandQueue: any MTLCommandQueue)
init(mtlCommandQueue: any MTLCommandQueue, options: [CIContextOption :
Any]?)
func createCGImage(CIImage, from: CGRect) -> CGImage?
Creates a Core Graphics image from a region of a Core Image image instance.
func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace:
CGColorSpace?) -> CGImage?
Creates a Core Graphics image from a region of a Core Image image instance with an option
for controlling the pixel format and color space of the CGImage.
func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace:
CGColorSpace?, deferred: Bool) -> CGImage?
Topics
Creating a Context Without Specifying a Destination
Creating a Context for CPU-Based Rendering
Creating a Context for GPU-Based Rendering
Rendering Images


## Page 3

Creates a Core Graphics image from a region of a Core Image image instance with an option
for controlling when the image is rendered.
func render(CIImage, toBitmap: UnsafeMutableRawPointer, rowBytes: Int,
bounds: CGRect, format: CIFormat, colorSpace: CGColorSpace?)
Renders to the given bitmap.
func render(CIImage, to: CVPixelBuffer)
Renders an image into a pixel buffer.
func render(CIImage, to: CVPixelBuffer, bounds: CGRect, colorSpace:
CGColorSpace?)
Renders a region of an image into a pixel buffer.
func render(CIImage, to: IOSurfaceRef, bounds: CGRect, colorSpace:
CGColorSpace?)
Renders a region of an image into an IOSurface object.
func render(CIImage, to: any MTLTexture, commandBuffer: (any MTLCommand
Buffer)?, bounds: CGRect, colorSpace: CGColorSpace)
Renders a region of an image to a Metal texture.
func draw(CIImage, in: CGRect, from: CGRect)
Renders a region of an image to a rectangle in the context destination.
func inputImageMaximumSize() -> CGSize
Returns the maximum size allowed for any image rendered into the context.
func outputImageMaximumSize() -> CGSize
Returns the maximum size allowed for any image created by the context.
func clearCaches()
Frees any cached data, such as temporary images, associated with the context and runs the
garbage collector.
func reclaimResources()
Drawing Images
Determining the Allowed Extents for Images Used by a Context
Managing Resources


## Page 4

Runs the garbage collector to reclaim any resources that the context no longer requires.
class func offlineGPUCount() -> UInt32
Returns the number of GPUs not currently driving a display.
var workingColorSpace: CGColorSpace?
The working color space of the Core Image context.
var workingFormat: CIFormat
The working pixel format of the Core Image context.
func tiffRepresentation(of: CIImage, format: CIFormat, colorSpace:
CGColorSpace, options: [CIImageRepresentationOption : Any]) -> Data?
Renders the image and exports the resulting image data in TIFF format.
func jpegRepresentation(of: CIImage, colorSpace: CGColorSpace, options:
[CIImageRepresentationOption : Any]) -> Data?
Renders the image and exports the resulting image data in JPEG format.
func pngRepresentation(of: CIImage, format: CIFormat, colorSpace:
CGColorSpace, options: [CIImageRepresentationOption : Any]) -> Data?
Renders the image and exports the resulting image data in PNG format.
func heifRepresentation(of: CIImage, format: CIFormat, colorSpace:
CGColorSpace, options: [CIImageRepresentationOption : Any]) -> Data?
Renders the image and exports the resulting image data in HEIF format.
func heif10Representation(of: CIImage, colorSpace: CGColorSpace, option
: [CIImageRepresentationOption : Any]) throws -> Data
Renders the image and exports the resulting image data in HEIF10 format.
func openEXRRepresentation(of: CIImage, options: [CIImageRepresentation
Option : Any]) throws -> Data
Renders the image and exports the resulting image data in open EXR format.
func writeTIFFRepresentation(of: CIImage, to: URL, format: CIFormat,
colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any])
throws
Renders the image and exports the resulting image data as a file in TIFF format.
Rendering Images for Data or File Export


## Page 5

func writeJPEGRepresentation(of: CIImage, to: URL, colorSpace: CGColor
Space, options: [CIImageRepresentationOption : Any]) throws
Renders the image and exports the resulting image data as a file in JPEG format.
func writePNGRepresentation(of: CIImage, to: URL, format: CIFormat,
colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any])
throws
Renders the image and exports the resulting image data as a file in PNG format.
func writeHEIFRepresentation(of: CIImage, to: URL, format: CIFormat,
colorSpace: CGColorSpace, options: [CIImageRepresentationOption : Any])
throws
Renders the image and exports the resulting image data as a file in HEIF format.
func writeHEIF10Representation(of: CIImage, to: URL, colorSpace: CGColo
Space, options: [CIImageRepresentationOption : Any]) throws
Renders the image and exports the resulting image data as a file in HEIF10 format.
func writeOpenEXRRepresentation(of: CIImage, to: URL, options: [CIImage
RepresentationOption : Any]) throws
Renders the image and exports the resulting image data as a file in open EXR format.
struct CIImageRepresentationOption
func depthBlurEffectFilter(for: CIImage, disparityImage: CIImage,
portraitEffectsMatte: CIImage?, hairSemanticSegmentation: CIImage?,
glassesMatte: CIImage?, gainMap: CIImage?, orientation: CGImageProperty
Orientation, options: [AnyHashable : Any]?) -> CIFilter?
func depthBlurEffectFilter(for: CIImage, disparityImage: CIImage,
portraitEffectsMatte: CIImage?, hairSemanticSegmentation: CIImage?,
orientation: CGImagePropertyOrientation, options: [AnyHashable : Any]?)
-> CIFilter?
func depthBlurEffectFilter(for: CIImage, disparityImage: CIImage,
portraitEffectsMatte: CIImage?, orientation: CGImagePropertyOrientation
options: [AnyHashable : Any]?) -> CIFilter?
func depthBlurEffectFilter(forImageData: Data, options: [AnyHashable :
Any]?) -> CIFilter?
func depthBlurEffectFilter(forImageURL: URL, options: [AnyHashable : An
]?) -> CIFilter?
Creating Depth Blur Filters


## Page 6

Keys to be used in the options dictionary when creating a CIContext object.
struct CIContextOption
An enum string type that your code can use to select different options when creating a Core
Image context.
func prepareRender(CIImage, from: CGRect, to: CIRenderDestination, at:
CGPoint) throws
An optional call to warm up a CIContext so that subsequent calls to render with the same
arguments run more efficiently.
func startTask(toClear: CIRenderDestination) throws -> CIRenderTask
Fills the entire destination with black or clear depending on its alphaMode.
func startTask(toRender: CIImage, from: CGRect, to: CIRenderDestination
at: CGPoint) throws -> CIRenderTask
Renders a portion of an image to a point in the destination.
func startTask(toRender: CIImage, to: CIRenderDestination) throws ->
CIRenderTask
Renders an image to a destination so that point (0, 0) of the image maps to point (0, 0) of th
destination.
init(cglContext: CGLContextObj, pixelFormat: CGLPixelFormatObj?, color
Space: CGColorSpace?, options: [CIContextOption : Any]?)
Creates a Core Image context from a CGL context, using the specified options, color space,
and pixel format object.
Deprecated
init(eaglContext: EAGLContext)
Creates a Core Image context from an EAGL context.
Deprecated
init(eaglContext: EAGLContext, options: [CIContextOption : Any]?)
Creates a Core Image context from an EAGL context using the specified options.
Constants
Customizing Render Destination
Deprecated


## Page 7

Deprecated
init?(forOfflineGPUAtIndex: UInt32)
Creates an OpenGL-based Core Image context using a GPU that is not currently driving a
display.
Deprecated
init?(forOfflineGPUAtIndex: UInt32, colorSpace: CGColorSpace?, options:
[CIContextOption : Any]?, sharedContext: CGLContextObj?)
Creates an OpenGL-based Core Image context using a GPU that is not currently driving a
display, with the specified options.
Deprecated
func createCGLayer(with: CGSize, info: CFDictionary?) -> CGLayer?
Creates a CGLayer object from the provided parameters.
Deprecated
func draw(CIImage, at: CGPoint, from: CGRect)
Renders a region of an image to a point in the context destination.
Deprecated
init(options: [CIContextOption : Any]?)
Initializes a context without a specific rendering destination, using the specified options.
func calculateHDRStats(for: CGImage) -> CGImage
Given a Core Graphics image, use the receiving Core Image context to calculate its HDR
statistics (content headroom and content average light level) and then return a new Core
Graphics image that has the calculated values.
func calculateHDRStats(for: IOSurfaceRef)
Given an IOSurface, use the receiving Core Image context to calculate its HDR statistics
(content headroom and content average light level) and then update the surface’s
attachments to store the values.
func calculateHDRStats(for: CVPixelBuffer)
Given a CVPixelBuffer, use the receiving Core Image context to calculate its HDR statistics
(content headroom and content average light level) and then update the buffers’s
Initializers
Instance Methods


## Page 8

attachments to store the values.
func calculateHDRStats(for: CIImage) -> CIImage?
Given a Core Image image, use the receiving Core Image context to calculate its HDR
statistics (content headroom and content average light level) and then return a new Core
Image image that has the calculated values.
func createCGImage(CIImage, from: CGRect, format: CIFormat, colorSpace:
CGColorSpace?, deferred: Bool, calculateHDRStats: Bool) -> CGImage?
Creates a Core Graphics image from a region of a Core Image image instance with an option
for calculating HDR statistics.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Processing an Image Using Built-in Filters
Apply effects such as sepia tint, highlight strengthening, and scaling to images.
class CIImage
Relationships
Inherits From
Conforms To
See Also
Essentials


## Page 9

A representation of an image to be processed or produced by Core Image filters.


