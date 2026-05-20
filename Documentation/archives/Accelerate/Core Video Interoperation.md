# Core Video Interoperation.pdf

## Page 1

This sample code project captures video from a macOS device’s camera and applies video effect
in real time. The sample converts the 8-bit YpCbCr video frames to 32-bit RGB vImage.Pixel
Buffer images and demonstrates image-processing techniques that are available only for 32-bi
data.
Before exploring the code, build and run the app to familiarize yourself with the different visual
results the app generates from the camera.
Overview
Accelerate / Using vImage pixel buffers to generate video effects
Sample Code
Using vImage pixel buffers to generate
video effects
Render real-time video effects with the vImage Pixel Buffer.
Download
macOS 13.0+
Xcode 14.3+


## Page 2

The code creates a vImageConverter instance that converts the YpCbCr video frames to three
channel, 32-bit-per-channel, floating-point interleaved image data.
The code defines destinationBuffer as a vImage.InterleavedFx3 pixel buffer. The
conversion function creates a vImage.DynamicPixelFormat source buffer that references th
locked CVPixelBuffer instance and passes that to the any-to-any converter.
Create the any-to-any converter
Convert a Core Video pixel buffer to RGB


## Page 3

On return, destinationBuffer contains the RGB representation of the YpCbCr video frame.
The sample simulates noise or film grain by adding Gaussian noise (with a mean of zero) to each
frame. The image below shows an example of the noise effect:
Accelerate’s BNNS library provides the BNNSRandomFillNormalFloat(_:_:_:_:) function
that fills an array descriptor with random floating-point values mapped to a normal distribution. U
the withUnsafeMutableBufferPointer(_:) function to pass a pointer to the pixel buffer’s
underlying data to a BNNSNDArrayDescriptor.
The following code generates the noise effect:
Apply the noise effect


## Page 4

The temporal blur effect blurs the image over time by calculating a weighted average of the curre
frame and previous frames. The effect is analogous to an exaggerated motion blur.
The image below shows an example of a rotating image with the temporal blur effect:
Apply the temporal blur effect


## Page 5

The linearInterpolate(bufferB:interpolationConstant:destination:) function
calls the vDSP function vDSP_vintb to calculate the linear interpolation between the current
frame and the previous interpolated frame.
The following code generates the temporal blur effect:
The posterization effect reduces the continuous colors of an image to fewer tones. The effect
produces results with regions of solid colors. The image below shows an example of the
posterization effect:
Apply the posterization effect


## Page 6

The sample generates the posterization effect using histogram specification. The code achieves
the reduced color count by calculating and specifying a histogram that has a low bin count. For
more information about histogram specification, see Specifying histograms with vImage.
The code populates a multiple-plane pixel buffer from the interleaved destination buffer. The
multiple-plane pixel buffer contains three discrete planar buffers, and the vImage.PixelBuffe
.Histogram888 function returns the histogram for the individual red, green, and blue channels.
Specifying a bin count of 4 returns a result that contains a maximum of 4 * 4 * 4 (64) colors.
The following code generates the posterization effect:
Apply the color threshold effect


## Page 7

The color threshold effect is similar to the posterization effect, but reduces each color channel to
single-bit, so each color is either 0 or 1. The image below shows the color threshold effect:
The colorThreshold(_:destination:) function sets pixel values equal to or greater than t
specified threshold to 1 and other pixel values to 0. Because the function works over the individua
red, green, and blue values, the result contains a maximum of 2 * 2 * 2 (8) colors. The effect 
identical to the posterization effect with binCount set to 2.
The following code generates the color threshold effect:
Integrating vImage pixel buffers into a Core Image workflow
Share image data between Core Video pixel buffers and vImage buffers to integrate vImage
operations into a Core Image workflow.
See Also
Core Video Interoperation


## Page 8

Applying vImage operations to video sample buffers
Use the vImage convert-any-to-any functionality to perform real-time image processing of
video frames streamed from your device’s camera.
Improving the quality of quantized images with dithering
Apply dithering to simulate colors that are unavailable in reduced bit depths.
Core Video interoperability
Pass image data between Core Video and vImage.


## Page 9

vImage supports reading from and writing to Core Video pixel buffers. This sample implements
ends-in contrast stretching using vImage and makes that operation available to Core Image
workflows by subclassing CIImageProcessorKernel. An image processor kernel uses Core
Video pixel buffers for input and output, so the app creates vImage pixel buffers that share data
with CVPixelBuffer instances.
The example below shows a photograph before (left) and after (right) the app has applied ends-in
contrast stretching:
Overview
Accelerate / Integrating vImage pixel buffers into a Core Image workflow
Sample Code
Integrating vImage pixel buffers into a
Core Image workflow
Share image data between Core Video pixel buffers and vImage buffers to
integrate vImage operations into a Core Image workflow.
Download
macOS 13.0+
Xcode 14.3+


## Page 10

To learn more about ends-in contrast stretching, see Enhancing image contrast with histogram
manipulation.
Before exploring the code, try building and running the app to familiarize yourself with the effect o
the different parameters on the image.
The ContrastStretchImageProcessorKernel inherits from the Core Image CIImage
ProcessorKernel class.
The sample code defines a vImage_CGImageFormat structure that represents a four-channel, 
bit-per-channel interleaved image format. The image processor kernel supports kCIFormatR8, k
CIFormatBGRA8, kCIFormatRGBAh, and kCIFormatRGBAf input and output formats. For this
sample project, the code overrides outputFormat and formatForInput(at:) to return a
BGRA8 that’s the same as the bitmapInfo property of the vImage_CGImageFormat structure
When the app applies ends-in contrast stretching, Core Image calls the processor kernel’s
process(with:arguments:output:) function. The following code ensures that the input an
output CVPixelBuffer instances are available:
Define an ends-in contrast-stretch image processor kernel
Create the source pixel buffer


## Page 11

The source vImage.PixelBuffer shares its memory with the input CVPixelBuffer. The
following code creates a vImageConverter that allows the pixel buffer to reference the Core
Video buffer’s memory:
The sample code app uses the same vImageConverter to create the destination pixel buffer,
which shares memory with the output Core Video buffer’s memory.
Create the destination pixel buffer


## Page 12

The vImageEndsInContrastStretch_ARGB8888(_:_:_:_:_:) function applies an ends-i
contrast-stretch operation to the source pixel buffer and writes the result to the destination pixel
buffer. This function works equally well on all channel orderings; for example, RGBA or BGRA.
Because the destination pixel buffer shares memory with the output Core Video pixel buffer, the
operation is complete after the vImageEndsInContrastStretch_ARGB8888(_:_:_:_:_:)
returns.
The apply(withExtent:inputs:arguments:) method generates a CIImage instance base
on the output of the processor’s process(with:arguments:output:) function.
Apply ends-in contrast stretching
Apply the ends-in contrast stretching operation to an
image


## Page 13

Using vImage pixel buffers to generate video effects
Render real-time video effects with the vImage Pixel Buffer.
Applying vImage operations to video sample buffers
Use the vImage convert-any-to-any functionality to perform real-time image processing of
video frames streamed from your device’s camera.
Improving the quality of quantized images with dithering
Apply dithering to simulate colors that are unavailable in reduced bit depths.
Core Video interoperability
Pass image data between Core Video and vImage.
See Also
Core Video Interoperation


## Page 14

The vImage library provides the high-level convert-any-to-any vImageConverter class to
convert image data between Core Video and Core Graphics formats. The convert-any-to-any
functionality is suited for apps that work across different platforms where AVFoundation may
provide video frames in different formats.
This sample code app uses AVFoundation to access the Mac camera and vImage to convert the
camera image to an RGB image that the app displays onscreen.
To ensure that AVCapture doesn’t have to perform a conversion from the capture format to the
output format, the sample code specifies the output format as the camera’s active format. After
declaring videoOutput as an AVCaptureVideoDataOutput instance, the following code
defines the output pixel format by creating the videoSettings dictionary:
Overview
Specify the pixel format
Lock the Core Video pixel buffer
Accelerate / Applying vImage operations to video sample buffers
Sample Code
Applying vImage operations to video
sample buffers
Use the vImage convert-any-to-any functionality to perform real-time image
processing of video frames streamed from your device’s camera.
Download
macOS 13.3+
Xcode 14.3+


## Page 15

When the app starts the flow of data through the capture pipeline, AVFoundation calls capture
Output(_:didOutput:from:) for each new video frame. The following code locks the
CVPixelBuffer structure’s underlying memory to make it available exclusively to the vImage
conversion function:
The vImage convert-any-to-any function requires a converter that describes the source and
destination formats. The sample code app converts a Core Video pixel buffer to a Core Graphics
image. The code calls the make(buffer:) function to derive the source Core Video image form
from the CVPixelBuffer. In some cases, the vImageCVImageFormat instance that the make
function returns may have incomplete information. The following code ensures that the format ha
a color space and chrominance siting information:
The sample app specifies a three-channel, 8-bit-per-channel vImage_CGImageFormat as the
conversion destination format.
Create a Core Video-to-Core Graphics converter


## Page 16

The make(sourceFormat:destinationFormat:flags:) type method creates a vImage
Converter instance from the source and destination formats.
The destination pixel buffer contains the RGB image after conversion. The code defines it as a
three-channel, 8-bit-per-channel vImage.PixelBuffer structure.
The first time that the app calls the conversion function, it runs the following code to initialize the
destination pixel buffer with the same dimensions as the Core Video pixel buffer:
Although the sample code app knows that the Core Graphics image format requires only a single
buffer at compile time, the camera’s active format defines the number of source buffers and their
pixel formats at runtime. Therefore, the code defines the source buffers as an array of vImage
.DynamicPixelFormat pixel buffers.
Initialize the destination buffer
Initialize the source buffers


## Page 17

The vImageConverter provides the makeCVToCGPixelBuffers(referencing:) function
that returns an array of pixel buffers. These pixel buffers reference the underlying memory of eac
plane of the Core Video pixel buffer.
The convert(from:to:) function accepts the source and destination pixel buffers and conver
the Core Video pixel buffer’s contents to a Core Graphics image.
Finally, the code calls makeCGImage(cgImageFormat:) to create a Core Graphics image that 
displays in the user interface.
Using vImage pixel buffers to generate video effects
Render real-time video effects with the vImage Pixel Buffer.
Integrating vImage pixel buffers into a Core Image workflow
Share image data between Core Video pixel buffers and vImage buffers to integrate vImage
operations into a Core Image workflow.
Improving the quality of quantized images with dithering
Apply dithering to simulate colors that are unavailable in reduced bit depths.
Core Video interoperability
Pass image data between Core Video and vImage.
Convert the Core Video buffer contents to a Core Graphics
format image
Create an output Core Graphics image
See Also
Core Video Interoperation


## Page 18



## Page 19

When you convert images to lower bit depths, some colors may be unavailable in the destination 
depth. As a solution, the vImage library provides options to apply dithering, a process that uses a
pattern of random pixels to simulate unavailable colors. For example, a mid-gray color from an 8-
grayscale image that’s quantized to 1 bit returns data that contains 50% white pixels and 50%
black pixels.
This sample code app converts an 8-bit grayscale image to a 1-bit dithered image and provides a
user interface to select between different dithering types.
The example below shows an image with continuous tones (left) and the same image with ditherin
applied (right):
Overview
Accelerate / Improving the quality of quantized images with dithering
Sample Code
Improving the quality of quantized images
with dithering
Apply dithering to simulate colors that are unavailable in reduced bit depths.
Download
macOS 13.3+
Xcode 14.3+


## Page 20

Before exploring the code, try building and running the app to familiarize yourself with the effect o
the different dithering algorithms on the image.
The sample code defines two vImage_CGImageFormat structures that represent the source an
destination image formats. The sourceFormat structure is an 8-bit grayscale format that
supports 256 levels of gray. The destinationFormat structure is a 1-bit format with pixels tha
are either black or white.
The code populates the contents of the source vImage_Buffer structure with a grayscale
version of the source image. Because the code passes a populated vImage_CGImageFormat
structure to the init(cgImage:format:flags:) initializer, vImage converts the source imag
to an 8-bit grayscale format.
The call to init(size:bitsPerPixel:) creates the destination buffer, which is the same size
as the source buffer but with only 1 bit per pixel.
Define the source and destination Core Graphics image
formats
Allocate the source and destination image buffers


## Page 21

To support dither-type selection in the user interface, the sample code includes an enumeration
that wraps the available vImage dithering algorithms.
The sample code app supports the following dithering types:
kvImageConvert_DitherNone: Doesn’t apply any dithering. This algorithm rounds the inpu
values to the nearest representable value in the destination format.
kvImageConvert_DitherOrdered: Adds precomputed blue noise to the source image
before it rounds the input values to the nearest representable value in the destination format.
The vImage conversion functions support uniform and Gaussian noise by including kvImage
Convert_OrderedUniformBlue and kvImageConvert_OrderedGaussianBlue,
respectively.
kvImageConvert_DitherFloydSteinberg: Applies Floyd-Steinberg dithering to the imag
kvImageConvert_DitherAtkinson Applies Atkinson dithering to the image.
The vImage library also includes kvImageConvert_DitherOrderedReproducible, which
returns the same result as kvImageConvert_DitherOrdered but uses the same offset into th
Create a dither-type enumeration


## Page 22

blue noise for each call.
The vImageConvert_Planar8toPlanar1(_:_:_:_:_:) function converts the 8-bit
grayscale to a 1-bit image using the dithering type that the user interface defines.
On return, the destination buffer contains the 1-bit dithered version of the source image.
The vImage library provides dithering options for many conversion functions, such as vImage
Convert_ARGBFFFFtoARGB8888_dithered(_:_:_:_:_:_:_:), which converts a 32-bit-
per-pixel ARGB image to an 8-bit-per-pixel ARGB image. Refer to Conversion for more details.
Using vImage pixel buffers to generate video effects
Render real-time video effects with the vImage Pixel Buffer.
Integrating vImage pixel buffers into a Core Image workflow
Share image data between Core Video pixel buffers and vImage buffers to integrate vImage
operations into a Core Image workflow.
Applying vImage operations to video sample buffers
Use the vImage convert-any-to-any functionality to perform real-time image processing of
video frames streamed from your device’s camera.
Core Video interoperability
Apply dithering to the image
See Also
Core Video Interoperation


## Page 23

Pass image data between Core Video and vImage.


## Page 24

The vImage library provides two approaches for working with Core Video pixel buffers:
Use the vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) and vImageBuffe
_CopyToCVPixelBuffer(_:_:_:_:_:_:) to copy and convert data between vImage
buffers and Core Video pixel buffers with a single function call. This approach provides a simpl
API if you need to convert between image formats.
Use the vImageBuffer_InitForCopyFromCVPixelBuffer(_:_:_:_:) and vImage
Buffer_InitForCopyToCVPixelBuffer(_:_:_:_:) functions to create vImage buffers
that reference the data in Core Video pixel buffers. This approach allows you to work directly
with the underlying data if you don’t need to convert between image formats.
Use the vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) and vImageBuffer
_CopyToCVPixelBuffer(_:_:_:_:_:_:) functions to copy and convert data between vIma
and Core Video.
The vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) function allocates new
memory and, after you finish with the buffer, call free() to avoid memory leaks.
The following code shows an example of a CIImageProcessorKernel that reflects an image
vertically. The example calls vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) to
initialize the source vImage buffer with a copy of the input CVPixelBuffer instance’s data. The cod
calls vImageBuffer_CopyToCVPixelBuffer(_:_:_:_:_:_:) to copy the destination
vImage buffer’s contents to the output CVPixelBuffer instance.
The code uses a defer statement to deallocate the source and destination vImage buffers after th
image-processing operation completes.
Overview
Copying data between the vImage library and Core Video
Accelerate / Core Video interoperability
API Collection
Core Video interoperability
Pass image data between Core Video and vImage.


## Page 25



## Page 26

Use the vImageBuffer_InitForCopyFromCVPixelBuffer(_:_:_:_:) and vImage
Buffer_InitForCopyToCVPixelBuffer(_:_:_:_:) functions to share data between
vImage and Core Video. Both of these functions require a vImageConverter instance that
defines the vImage buffer’s Core Graphics image format and the CVPixelBuffer instance’s Co
Video format.
Because the vImage functions don’t allocate any additional memory, you don’t need to deallocate
the vImage buffer memory. However, you need to lock and unlock the CVPixelBuffer instance
during the image-processing operation using CVPixelBufferLockBaseAddress(_:_:) and
CVPixelBufferUnlockBaseAddress(_:_:), respectively.
The following code shows an example of a CIImageProcessorKernel that reflects an image
vertically. In this example, the base address of the CVPixelBuffer instances and the data
property of their corresponding vImage buffer point to the same memory. The image data in the
CIImageProcessorInput and CIImageProcessorOutput parameters don’t require
conversion, and the code works directly on the pixel buffers.
The code calls vImageBuffer_InitForCopyFromCVPixelBuffer(_:_:_:_:) with a Core
Video-to-Core-Graphics converter to initialize the source vImage buffer.
Sharing data between the vImage library and Core Video


## Page 27

The code calls vImageBuffer_InitForCopyToCVPixelBuffer(_:_:_:_:) with a Core-
Graphics-to-Core-Video converter to initialize the destination vImage buffer.


## Page 28

Topics
Copying Core Video pixel buffer data to vImage buffers


## Page 29

func vImageBuffer_InitWithCVPixelBuffer(UnsafeMutablePointer<vImage
_Buffer>, UnsafeMutablePointer<vImage_CGImageFormat>, CVPixelBuffer, v
ImageCVImageFormat!, UnsafePointer<CGFloat>!, vImage_Flags) -> vImage
_Error
Initializes a vImage buffer with a copy of the contents of a Core Video pixel buffer.
func vImageBuffer_CopyToCVPixelBuffer(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_CGImageFormat>, CVPixelBuffer, vImageCVImageFormat
!, UnsafePointer<CGFloat>!, vImage_Flags) -> vImage_Error
Copies the contents of a vImage buffer to a Core Video pixel buffer.
func vImageBuffer_InitForCopyFromCVPixelBuffer(UnsafeMutablePointer<v
Image_Buffer>, vImageConverter, CVPixelBuffer, vImage_Flags) -> vImage
_Error
Initializes an array of vImage buffers in the order necessary to copy from a Core Video pixel
buffer.
func vImageBuffer_InitForCopyToCVPixelBuffer(UnsafeMutablePointer<vImag
_Buffer>, vImageConverter, CVPixelBuffer, vImage_Flags) -> vImage_Error
Initializes an array of vImage buffers in the order necessary to copy to a Core Video pixel
buffer.
Core Video image format utilities
Create, copy, and query Core Video image format descriptions.
Using vImage pixel buffers to generate video effects
Render real-time video effects with the vImage Pixel Buffer.
Copying and converting data between vImage buffers and Core
Video pixel buffers
Initializing vImage buffers that reference Core Video pixel buffer data
Managing Core Video image formats
See Also
Core Video Interoperation


## Page 30

Integrating vImage pixel buffers into a Core Image workflow
Share image data between Core Video pixel buffers and vImage buffers to integrate vImage
operations into a Core Image workflow.
Applying vImage operations to video sample buffers
Use the vImage convert-any-to-any functionality to perform real-time image processing of
video frames streamed from your device’s camera.
Improving the quality of quantized images with dithering
Apply dithering to simulate colors that are unavailable in reduced bit depths.


