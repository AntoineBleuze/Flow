# 001_CIImageProcessorInput.pdf

## Page 1

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


## Page 2

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


## Page 3

Required
class CIImageProcessorKernel
The abstract class you extend to create custom image processors that can integrate with Co
Image workflows.
protocol CIImageProcessorOutput
A container for writing image data and information produced by a custom image processor.
See Also
Custom Image Processors


