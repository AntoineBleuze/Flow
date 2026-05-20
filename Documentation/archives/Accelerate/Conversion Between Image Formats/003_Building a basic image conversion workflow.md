# 003_Building a basic image conversion workflow.pdf

## Page 1

The functions in the vImage library that perform image-processing operations are specific to
properties such as bit-depth, the number of channels, and channel ordering. For example, the v
ImageAlphaBlend_ARGB8888(_:_:_:_:) function works with 8-bit-per-channel, ARGB imag
data. The convert-any-to-any functionality allows you to convert images with formats you know a
runtime to a format you define at compile time.
You can use the vImage convert-any-to-any functionality to convert image data between differen
bit depths, different channel counts, and different color spaces. In this example, the code convert
a 16-bit-per-channel CMYK source image to an 8-bit-per-channel RGB destination image. In som
cases, working in a non-RGB color space simplifies image-processing tasks. For an example of
using convert-any-to-any to work in L*a*b* color space, see Adjusting the hue of an image.
A vImageConverter instance – that contains the information to perform image conversion –
requires two vImage_CGImageFormat structures that describe the source and destination
formats. The code below defines the CMYK source format and the RGB destination format:
Overview
Create the source and destination image formats
Accelerate / Building a basic image conversion workflow
Article
Building a basic image conversion
workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMY
image to an RGB image.


## Page 2

The Swift make(sourceFormat:destinationFormat:flags:) method calls the underlying
vImageConverter_CreateWithCGImageFormat(_:_:_:_:_:) function and returns a new
any-to-any converter instance.
The code below converts the CMYK image data that cmykSourceBuffer contains and writes th
RGB result to rgbDestinationBuffer. In this example, cmykSourceBuffer is a vImage
.PixelBuffer structure with a vImage.Interleaved16Ux4 format.
The Swift convert(from:to:) method calls the underlying vImageConvert_AnyToAny(_:
_:_:_:_:) function.
On return, rgbDestinationBuffer contains the RGB representation of the CMYK source imag
If you’re creating apps for older operating systems that don’t support the vImage.PixelBuffe
API, the following code performs the same conversion using vImage_Buffer structures.
The Swift convert(source:destination:flags:) method calls the underlying vImage
Convert_AnyToAny(_:_:_:_:_:) function
Create the converter
Perform the conversion using pixel buffers
Perform the conversion using vImage buffers


## Page 3

On return, rgbDestinationBuffer contains the RGB representation of the CMYK source imag
Converting color images to grayscale
Convert an RGB image to grayscale using matrix multiplication.
Applying color transforms to images with a multidimensional lookup table
Precompute translation values to optimize color space conversion and other pointwise
operations.
Converting luminance and chrominance planes to an ARGB image
Create a displayable ARGB image using the luminance and chrominance information from yo
device’s camera.
Conversion
Convert an image to a different format.
See Also
Conversion Between Image Formats


