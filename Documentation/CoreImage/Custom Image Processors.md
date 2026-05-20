# Custom Image Processors.pdf

## Page 1

Unlike the CIKernel class and its other subclasses that allow you to create new image-processi
effects with the Core Image Kernel Language, the CIImageProcessorKernel class provides
direct access to the underlying bitmap image data for a step in the Core Image processing pipelin
As such, you can create subclasses of this class to integrate other image-processing technologie
—such as Metal compute shaders, Metal Performance Shaders, Accelerate vImage operations, or
your own CPU-based image-processing routines—with a Core Image filter chain.
Your custom image processing operation is invoked by your subclassed image processor kernel’s
process(with:arguments:output:) method. The method can accept zero, one or more
inputs: kernels that generate imagery (such as a noise or pattern generator) need no inputs, while
kernels that composite source images together require multiple inputs. The arguments dictionar
allows the caller to pass in additional parameter values (such as the radius of a blur) and the
output contains the destination for your image processing code to write to.
The following code shows how you can subclass CIImageProcessorKernel to apply the Meta
Performance Shader MPSImageThresholdBinary kernel to a CIImage:
Overview
Core Image / CIImageProcessorKernel
Class
CIImageProcessorKernel
The abstract class you extend to create custom image processors that can
integrate with Core Image workflows.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 2

To apply to kernel to an image, the calling side invokes the image processor’s apply(with
Extent:inputs:arguments:) method. The following code generates a new CIImage object
named result which contains a thresholded version of the source image, inputImage.
Important
Core Image will concatenate filters in a network into as fewer kernels as possible, avoiding the
creation of intermediate buffers. However, it is unable to do this with image processor kernels.
To get the best performance, you should only use CIImageProcessorKernel objects when
your image processing algorithms can’t be expressed as Core Image Kernel Language.
The CIImageProcessorKernel class is abstract; to create a custom image processor, you
define a subclass of this class.
Subclassing Notes


## Page 3

You do not directly create instances of a custom CIImageProcessorKernel subclass. Image
processors must not carry or use state specific to any single invocation of the processor, so all
methods (and accessors for readonly properties) of an image processor kernel class are class
methods.
Your subclass should override at least the process(with:arguments:output:) method to
perform its image processing.
If your image processor needs to work with a larger or smaller region of interest in the input image
than each corresponding region of the output image (for example, a blur filter, which samples
several input pixels for each output pixel), you should also override the roi(forInput:
arguments:outputRect:) method.
You can also override the formatForInput(at:) method and outputFormat property getter
to customize the input and output pixel formats for your processor (for example, as part of a mult
step workflow where you extract a single channel from an RGBA image, apply an effect to that
channel only, then recombine the channels).
To apply your custom image processor class to filter one or more images, call the apply(with
Extent:inputs:arguments:) class method. (Do not override this method.)
class var outputFormat: CIFormat
Override this class property if you want your processor’s output to be in a specific pixel
format.
class var outputIsOpaque: Bool
Override this class property if your processor’s output stores 1.0 into the alpha channel of al
pixels within the output extent.
class var synchronizeInputs: Bool
Override this class property to return false if you want your processor to be given input
objects that have not been synchronized for CPU access.
Using a Custom Image Processor
Topics
Type Properties
Type Methods


## Page 4

class func apply(withExtent: CGRect, inputs: [CIImage]?, arguments: [
String : Any]?) throws -> CIImage
Call this method on your Core Image Processor Kernel subclass to create a new image of the
specified extent.
class func formatForInput(at: Int32) -> CIFormat
Override this class method if you want your any of the inputs to be in a specific pixel format.
class func process(with: [any CIImageProcessorInput]?, arguments: [
String : Any]?, output: any CIImageProcessorOutput) throws
Override this class method to implement your Core Image Processor Kernel subclass.
class func roi(forInput: Int32, arguments: [String : Any]?, outputRect:
CGRect) -> CGRect
Override this class method to implement your processor’s ROI callback.
class func roiTileArray(forInput: Int32, arguments: [String : Any]?,
outputRect: CGRect) -> [CIVector]
Override this class method to implement your processor’s tiled ROI callback.
class func apply(withExtents: [CIVector], inputs: [CIImage]?, arguments
[String : Any]?) throws -> [CIImage]
Call this method on your multiple-output Core Image Processor Kernel subclass to create an
array of new image objects given the specified array of extents.
class func outputFormat(at: Int32, arguments: [String : Any]?) ->
CIFormat
Override this class method if your processor has more than one output and you want your
processor’s output to be in a specific supported CIPixelFormat.
class func process(with: [any CIImageProcessorInput]?, arguments: [
String : Any]?, outputs: [any CIImageProcessorOutput]) throws
Override this class method of your Core Image Processor Kernel subclass if it needs to
produce multiple outputs.
NSObject
Relationships
Inherits From


## Page 5

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol CIImageProcessorInput
A container of image data and information for use in a custom image processor.
protocol CIImageProcessorOutput
A container for writing image data and information produced by a custom image processor.
Conforms To
See Also
Custom Image Processors


## Page 6

Your app does not define classes that adopt this protocol; Core Image provides an object of this
type when applying a custom image processor you create with a CIImageProcessorKernel
subclass.
In your image processor class’ process(with:arguments:output:) method, use the
provided CIImageProcessorInput object to access the image data and supporting informatio
to perform your custom image processing routine. For example, if you process the image using a
Metal shader, use the metalTexture property to bind the image as an input texture. Or, if you
process the image using a CPU-based routine, use the baseAddress property to access pixel
data in memory.
To finish setting up or performing your image processing routine, use the provided CIImage
ProcessorOutput object to return processed pixel data to Core Image.
var baseAddress: UnsafeRawPointer
The base address of CPU memory that your Core Image Processor Kernel can read pixels
from.
Overview
Topics
Accessing Input Image Data
Core Image / CIImageProcessorInput
Protocol
CIImageProcessorInput
A container of image data and information for use in a custom image processor.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 7

Required
var metalTexture: (any MTLTexture)?
A MTLTexture object that can be bound for input using Metal.
Required
var pixelBuffer: CVPixelBuffer?
An input pixel buffer object that your Core Image Processor Kernel can read from.
Required
var surface: IOSurfaceRef
An input surface object that your Core Image Processor Kernel can read from.
Required
var region: CGRect
The rectangular region of the input image that your Core Image Processor Kernel can use to
provide the output.
Required
var bytesPerRow: Int
The bytes per row of the CPU memory that your Core Image Processor Kernel can read
pixelsfrom.
Required
var format: CIFormat
The pixel format of the CPU memory that your Core Image Processor Kernel can read pixels
from.
Required
var digest: UInt64
A 64-bit digest that uniquely describes the contents of the input to a processor.
Required
var roiTileCount: Int
This property tells a tiled-input processor how many input tiles will be processed.
Required
var roiTileIndex: Int
This property tells a tiled-input processor which input tile index is being processed.
Getting Supplemental Information for Image Processing
Instance Properties


## Page 8

Required
class CIImageProcessorKernel
The abstract class you extend to create custom image processors that can integrate with Co
Image workflows.
protocol CIImageProcessorOutput
A container for writing image data and information produced by a custom image processor.
See Also
Custom Image Processors


## Page 9

Your app does not define classes that adopt this protocol; Core Image provides an object of this
type when applying a custom image processor you create with a CIImageProcessorKernel
subclass.
In your image processor class’ process(with:arguments:output:) method, use an
appropriate property of the provided CIImageProcessorOutput object to return processed
pixel data to Core Image. For example, if you process the image using a Metal shader, bind the
metalTexture property as an attachment in a render pass or as an output texture in a compute
pass. Or, if you process the image using a CPU-based routine, write processed pixel data to
memory using the baseAddress pointer. You must provide rendered output to one (and only one
of the properties listed in Providing Output Image Data.
To access input pixel data in your image processor block, see the CIImageProcessorInput
class.
var baseAddress: UnsafeMutableRawPointer
Overview
Topics
Providing Output Image Data
Core Image / CIImageProcessorOutput
Protocol
CIImageProcessorOutput
A container for writing image data and information produced by a custom image
processor.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+


## Page 10

The base address of CPU memory that your Core Image Processor Kernel can write pixels to
Required
var metalTexture: (any MTLTexture)?
A Metal texture object that can be bound for output using Metal.
Required
var pixelBuffer: CVPixelBuffer?
An output pixelBuffer object that your Core Image Processor Kernel can write to.
Required
var surface: IOSurfaceRef
An output surface object that your Core Image Processor Kernel can write to.
Required
var region: CGRect
The rectangular region of the output image that your Core Image Processor Kernel must
provide.
Required
var metalCommandBuffer: (any MTLCommandBuffer)?
Returns a Metal command buffer object that can be used for encoding commands.
Required
var bytesPerRow: Int
The bytes per row of the CPU memory that your Core Image Processor Kernel can write pixe
to.
Required
var format: CIFormat
The pixel format of the CPU memory that your Core Image Processor Kernel can write pixels
to.
Required
var digest: UInt64
A 64-bit digest that uniquely describes the contents of the output of a processor.
Required
Getting Supplemental Information for Image Processing
Instance Properties


## Page 11

class CIImageProcessorKernel
The abstract class you extend to create custom image processors that can integrate with Co
Image workflows.
protocol CIImageProcessorInput
A container of image data and information for use in a custom image processor.
See Also
Custom Image Processors


