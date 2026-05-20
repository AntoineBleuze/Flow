# 001_Integrating vImage pixel buffers into a Core Image workflow.pdf

## Page 1

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


## Page 2

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


## Page 3

The source vImage.PixelBuffer shares its memory with the input CVPixelBuffer. The
following code creates a vImageConverter that allows the pixel buffer to reference the Core
Video buffer’s memory:
The sample code app uses the same vImageConverter to create the destination pixel buffer,
which shares memory with the output Core Video buffer’s memory.
Create the destination pixel buffer


## Page 4

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


## Page 5

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


