# Essentials.pdf

## Page 1

You can add effects to images by applying Core Image filters to CIImage objects. Figure 1 shows
three filters chained together to achieve a cumulative effect:
1. Apply the sepia filter to tint an image with a reddish-brown hue.
2. Add the bloom filter to accentuate highlights.
3. Use the Lanczos scale filter to scale an image down.
CIImage processing occurs in a CIContext object. Creating a CIContext is expensive, so
create one during your initial setup and reuse it throughout your app.
Overview
Create a Context
Core Image / Processing an Image Using Built-in Filters
Article
Processing an Image Using Built-in Filters
Apply effects such as sepia tint, highlight strengthening, and scaling to images.


## Page 2

The next step is to load an image to process. This example loads an image from the project bundl
The CIImage object isn’t itself a displayable image, but rather image data. To display it, you mus
convert it to another type, such as UIImage.
A CIFilter represents a single operation or recipe for a particular effect. To process a CIImage
object, pass it through CIFilter objects. You can subclass CIFilter or draw from the existing
library of built-in filters.
Although you can chain filters without separating them into functions, the following example show
how to configure a single CIFilter, the sepiaTone() filter.
To pass the image through the filter, call the sepia filter function.
You can check the intermediate result at any point in the filter chain by converting from CIImage
to a UIImage. You can then assign this UIImage to a UIImageView for display.
Load an Image to Process
Apply Built-In Core Image Filters
Tint Reddish-Brown with the Sepia Filter
Strengthen Highlights with the Bloom Filter


## Page 3

The bloom filter accentuates the highlights of an image. You can apply it as part of a chain withou
factoring it into a separate function, but this example encapsulates its functionality into a function
Like the sepia filter, the intensity of the bloom filter’s effect ranges between 0 and 1, with 1 being
the most intense effect. The bloom filter has an additional radius parameter to determine how
much the glowing regions expand. Experiment with a range to values to fine tune the effect, or
assign the input parameter to a control like a UISlider to allow your users to tweak its values.
Note
The gloom() filter performs the opposite effect.
To display the output, convert the CIImage to a UIImage.
Apply the lanczosScaleTransform() to obtain a high-quality downsampling of the image,
preserving the original image’s aspect ratio through the lanczosScaleTransform() filter’s
parameter aspectRatio. For built-in Core Image filters, calculate the aspect ratio as the image’
width over height.
Like other built-in filters, the lanczosScaleTransform() filter also outputs its result as a
CIImage.
Scale Image Size with the Lanczos Scale Filter


## Page 4

Important
To optimize computation, Core Image doesn’t actually render any intermediate CIImage result
until you force the CIImage to display its content onscreen, as you might do using UIImage
View.
Note
Core Image optimizes filtering by reordering the three chained filters and concatenating them
into a single image processing kernel, saving computation and rendering cycles.
In addition to trying out the built-in filters for a fixed effect, you can combine filters in certain Filte
Recipes to accomplish tasks such as Applying a Chroma Key Effect, Selectively Focusing on an
Image, Customizing Image Transitions, and Simulating Scratchy Analog Film.
class CIContext
The Core Image context class provides an evaluation context for Core Image processing with
Metal, OpenGL, or OpenCL.
class CIImage
A representation of an image to be processed or produced by Core Image filters.
See Also
Essentials


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

A representation of an image to be processed or produced by Core Image filters.


## Page 14

Processing an Image Using Built-in Filters
Selectively Focusing on an Image
Customizing Image Transitions
You use CIImage objects in conjunction with other Core Image classes—such as CIFilter,
CIContext, CIVector, and CIColor—to take advantage of the built-in Core Image filters when
processing images. You can create CIImage objects with data supplied from a variety of sources
including Quartz 2D images, Core Video image buffers (CVImageBuffer), URL-based objects,
and NSData objects.
Although a CIImage object has image data associated with it, it is not an image. You can think of
CIImage object as an image “recipe.” A CIImage object has all the information necessary to
produce an image, but Core Image doesn’t actually render an image until it is told to do so. This
lazy evaluation allows Core Image to operate as efficiently as possible. To show a CIImage objec
as an on-screen image, you can display it as a UIImage in UIImageView:
Mentioned in
Overview
Objective-C
Core Image / CIImage
Class
CIImage
A representation of an image to be processed or produced by Core Image filters.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+
Swift


## Page 15

CIContext and CIImage objects are immutable, which means each can be shared safely amon
threads. Multiple threads can use the same GPU or CPU CIContext object to render CIImage
objects. However, this is not the case for CIFilter objects, which are mutable. A CIFilter
object cannot be shared safely among threads. If you app is multithreaded, each thread must
create its own CIFilter objects. Otherwise, your app could behave unexpectedly.
Core Image also provides auto-adjustment methods. These methods analyze an image for comm
deficiencies and return a set of filters to correct those deficiencies. The filters are preset with
values for improving image quality by altering values for skin tones, saturation, contrast, and
shadows and for removing red-eye or other artifacts caused by flash. (See Getting Autoadjustme
Filters.)
For a discussion of all the methods you can use to create CIImage objects on iOS and macOS, s
Core Image Programming Guide.
class func empty() -> CIImage
Creates and returns an empty image object.
init?(image: UIImage)
Initializes an image object with the specified UIKit image object.
init?(image: UIImage, options: [CIImageOption : Any]?)
Initializes an image object with the specified UIKit image object, using the specified options.
init?(contentsOf: URL)
Initializes an image object by reading an image from a URL.
init?(contentsOf: URL, options: [CIImageOption : Any]?)
Initializes an image object by reading an image from a URL, using the specified options.
Topics
Creating an Image


## Page 16

init(cgImage: CGImage)
Initializes an image object with a Quartz 2D image.
init(cgImage: CGImage, options: [CIImageOption : Any]?)
Initializes an image object with a Quartz 2D image, using the specified options.
init(cgImageSource: CGImageSource, index: Int, options: [CIImageOption 
Any]?)
init?(data: Data)
Initializes an image object with the supplied image data.
init?(data: Data, options: [CIImageOption : Any]?)
Initializes an image object with the supplied image data, using the specified options.
init(bitmapData: Data, bytesPerRow: Int, size: CGSize, format: CIFormat
colorSpace: CGColorSpace?)
Initializes an image object with bitmap data.
init?(bitmapImageRep: NSBitmapImageRep)
Initializes an image object with the specified bitmap image representation.
init(imageProvider: Any, size: Int, Int, format: CIFormat, colorSpace:
CGColorSpace?, options: [CIImageOption : Any]?)
Initializes an image object based on pixels from an image provider object.
init?(depthData: AVDepthData)
init?(depthData: AVDepthData, options: [String : Any]?)
init?(portaitEffectsMatte: AVPortraitEffectsMatte)
init?(portaitEffectsMatte: AVPortraitEffectsMatte, options: [CIImage
Option : Any]?)
init?(semanticSegmentationMatte: AVSemanticSegmentationMatte)
init?(semanticSegmentationMatte: AVSemanticSegmentationMatte, options: 
CIImageOption : Any]?)
init(cvImageBuffer: CVImageBuffer)
Initializes an image object from the contents of a Core Video image buffer.
init(cvImageBuffer: CVImageBuffer, options: [CIImageOption : Any]?)
Initializes an image object from the contents of a Core Video image buffer, using the specifie
options.


## Page 17

init(cvPixelBuffer: CVPixelBuffer)
Initializes an image object from the contents of a Core Video pixel buffer.
init(cvPixelBuffer: CVPixelBuffer, options: [CIImageOption : Any]?)
Initializes an image object from the contents of a Core Video pixel buffer using the specified
options.
init?(mtlTexture: any MTLTexture, options: [CIImageOption : Any]?)
Initializes an image object with data supplied by a Metal texture.
init(ioSurface: IOSurfaceRef)
Initializes an image with the contents of an IOSurface.
init(ioSurface: IOSurfaceRef, options: [CIImageOption : Any]?)
Initializes, using the specified options, an image with the contents of an IOSurface.
func applyingFilter(String, parameters: [String : Any]) -> CIImage
Returns a new image created by applying a filter to the original image with the specified nam
and parameters.
func applyingFilter(String) -> CIImage
Applies the filter to an image and returns the output.
func transformed(by: CGAffineTransform) -> CIImage
Returns a new image that represents the original image after applying an affine transform.
func transformed(by: CGAffineTransform, highQualityDownsample: Bool) ->
CIImage
func cropped(to: CGRect) -> CIImage
Returns a new image with a cropped portion of the original image.
func oriented(forExifOrientation: Int32) -> CIImage
Returns a new image created by transforming the original image to the specified EXIF
orientation.
func clampedToExtent() -> CIImage
Returns a new image created by making the pixel colors along its edges extend infinitely in a
directions.
func clamped(to: CGRect) -> CIImage
Creating an Image by Modifying an Existing Image


## Page 18

Returns a new image created by cropping to a specified area, then making the pixel colors
along the edges of the cropped image extend infinitely in all directions.
func composited(over: CIImage) -> CIImage
Returns a new image created by compositing the original image over the specified destinatio
image.
func convertingWorkingSpaceToLab() -> CIImage
func convertingLabToWorkingSpace() -> CIImage
func matchedToWorkingSpace(from: CGColorSpace) -> CIImage?
Returns a new image created by color matching from the specified color space to the
context’s working color space.
func matchedFromWorkingSpace(to: CGColorSpace) -> CIImage?
Returns a new image created by color matching from the context’s working color space to th
specified color space.
func premultiplyingAlpha() -> CIImage
Returns a new image created by multiplying the image’s RGB values by its alpha values.
func unpremultiplyingAlpha() -> CIImage
Returns a new image created by dividing the image’s RGB values by its alpha values.
func settingAlphaOne(in: CGRect) -> CIImage
Returns a new image created by setting all alpha values to 1.0 within the specified rectangle
and to 0.0 outside of that area.
func applyingGaussianBlur(sigma: Double) -> CIImage
Create an image by applying a gaussian blur to the receiver.
func settingProperties([AnyHashable : Any]) -> CIImage
Return a new image by changing the receiver’s metadata properties.
func insertingIntermediate() -> CIImage
Create an image that inserts a intermediate that is cacheable
func insertingIntermediate(cache: Bool) -> CIImage
Create an image that inserts a intermediate that is cacheable.
init(color: CIColor)
Creating Solid Colors


## Page 19

Initializes an image of infinite extent whose entire content is the specified color.
class var black: CIImage
class var blue: CIImage
class var clear: CIImage
class var cyan: CIImage
class var gray: CIImage
class var green: CIImage
class var magenta: CIImage
class var red: CIImage
class var white: CIImage
class var yellow: CIImage
var definition: CIFilterShape
Returns a filter shape object that represents the domain of definition of the image.
var extent: CGRect
A rectangle that specifies the extent of the image.
var properties: [String : Any]
Returns the metadata properties dictionary of the image.
var url: URL?
The URL from which the image was loaded.
var colorSpace: CGColorSpace?
The color space of the image.
func orientationTransform(forExifOrientation: Int32) -> CGAffine
Transform
Returns the transformation needed to reorient the image to the specified orientation.
Getting Image Information
Drawing Images


## Page 20

func draw(at: NSPoint, from: NSRect, operation: NSCompositingOperation,
fraction: CGFloat)
Draws all or part of the image at the specified point in the current coordinate system.
func draw(in: NSRect, from: NSRect, operation: NSCompositingOperation,
fraction: CGFloat)
Draws all or part of the image in the specified rectangle in the current coordinate system
func autoAdjustmentFilters() -> [CIFilter]
Returns all possible automatically selected and configured filters for adjusting the image.
func autoAdjustmentFilters(options: [CIImageAutoAdjustmentOption : Any
]?) -> [CIFilter]
Returns a subset of automatically selected and configured filters for adjusting the image.
Autoadjustment Keys
Constants used as keys in the options dictionary for the autoAdjustment
Filters(options:) method.
func regionOfInterest(for: CIImage, in: CGRect) -> CGRect
Returns the region of interest for the filter chain that generates the image.
func oriented(CGImagePropertyOrientation) -> CIImage
Transforms the original image by a given orientation.
func orientationTransform(for: CGImagePropertyOrientation) -> CGAffine
Transform
The affine transform for changing the image to the given orientation.
func samplingNearest() -> CIImage
Create an image by changing the receiver’s sample mode to nearest neighbor.
func samplingLinear() -> CIImage
Getting Autoadjustment Filters
Working with Filter Regions of Interest
Working with Orientation
Sampling the Image


## Page 21

Create an image by changing the receiver’s sample mode to bilinear interpolation.
var cgImage: CGImage?
The CoreGraphics image object this image was created from, if applicable.
var pixelBuffer: CVPixelBuffer?
The CoreVideo pixel buffer this image was created from, if applicable.
var depthData: AVDepthData?
Depth data associated with the image.
var portraitEffectsMatte: AVPortraitEffectsMatte?
The portrait effects matte associated with the image.
var semanticSegmentationMatte: AVSemanticSegmentationMatte?
Constants used as keys in the options dictionary when initializing an image.
struct CIImageOption
Constants used as keys in the options dictionary for the autoAdjustmentFilters(options:
method.
struct CIImageAutoAdjustmentOption
init(cgLayer: CGLayer)
Initializes an image object from the contents supplied by a CGLayer object.
Deprecated
init(cgLayer: CGLayer, options: [CIImageOption : Any]?)
Initializes an image object from the contents supplied by a CGLayer object, using the specifi
options.
Deprecated
Accessing Original Image Content
Image Dictionary Keys
AutoAdjustment Keys
Deprecated


## Page 22

init(texture: UInt32, size: CGSize, flipped: Bool, colorSpace: CGColor
Space?)
Initializes an image object with data supplied by an OpenGL texture.
Deprecated
init(texture: UInt32, size: CGSize, flipped: Bool, options: [CIImage
Option : Any]?)
Initializes an image object with data supplied by an OpenGL texture.
Deprecated
init(ioSurface: IOSurfaceRef, plane: Int, format: CIFormat, options: [
CIImageOption : Any]?)
Initializes, using the specified format and options, an image with the contents of a specific
data plane in an IOSurface.
Deprecated
static let textureTarget: CIImageOption
The key for an OpenGL texture target.
Deprecated
static let textureFormat: CIImageOption
The key for an OpenGL texture format.
Deprecated
var contentHeadroom: Float
Returns the content headroom of the image.
var isOpaque: Bool
Returns YES if the image is known to have and alpha value of 1.0 over the entire image
extent.
var metalTexture: (any MTLTexture)?
var contentAverageLightLevel: Float
Returns the content average light level of the image.
func applyingGainMap(CIImage) -> CIImage
Instance Properties
Instance Methods


## Page 23

Create an image that applies a gain map Core Image image to the received Core Image imag
func applyingGainMap(CIImage, headroom: Float) -> CIImage
Create an image that applies a gain map Core Image image with a specified headroom to the
received Core Image image.
func insertingTiledIntermediate() -> CIImage
Create an image that inserts a intermediate that is cached in tiles
func settingContentAverageLightLevel(Float) -> CIImage
Create an image by changing the receiver’s contentAverageLightLevel property.
func settingContentHeadroom(Float) -> CIImage
Create an image by changing the receiver’s contentHeadroom property.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Relationships
Inherits From
Conforms To
See Also


## Page 24

Processing an Image Using Built-in Filters
Apply effects such as sepia tint, highlight strengthening, and scaling to images.
class CIContext
The Core Image context class provides an evaluation context for Core Image processing with
Metal, OpenGL, or OpenCL.
Essentials


