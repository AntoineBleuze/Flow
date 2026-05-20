# 002_CIImageProcessorOutput.pdf

## Page 1

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


## Page 2

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


## Page 3

class CIImageProcessorKernel
The abstract class you extend to create custom image processors that can integrate with Co
Image workflows.
protocol CIImageProcessorInput
A container of image data and information for use in a custom image processor.
See Also
Custom Image Processors


