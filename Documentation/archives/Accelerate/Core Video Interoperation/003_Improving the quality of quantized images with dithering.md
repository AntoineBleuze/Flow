# 003_Improving the quality of quantized images with dithering.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

Pass image data between Core Video and vImage.


