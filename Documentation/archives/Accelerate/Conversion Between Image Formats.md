# Conversion Between Image Formats.pdf

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


## Page 4

The vImage multiply(by:divisor:preBias:postBias:destination:)) and
multiply(by:preBias:postBias:destination:) functions multiply each channel of an
interleaved image with the corresponding value in a matrix and return the sum of the multiplicatio
to generate a planar image. These functions wrap vImageMatrixMultiply_ARGB8888To
Planar8(_:_:_:_:_:_:_:) and vImageMatrixMultiply_ARGBFFFFToPlanarF(_:_:_
_:_:_:), respectively.
The following shows how the 8-bit matrix multiply operation calculates the result for each pixel:
The 8-bit matrix multiply operation creates a maximum of 255 gray tones. However, even with an
8-bit-per-channel source image, the 32-bit matrix multiply operation can create up to 255 x 255 
255 (16,581,375) gray tones. This sample code project includes 8- and 32-bit color-to-grayscale
conversion and provides a function to count the distinct tones in the output image.
Before exploring the code, build and run the app to familiarize yourself with the different visual
results it generates from setting different coefficients for the red, green, and blue channels.
Overview
Accelerate / Converting color images to grayscale
Sample Code
Converting color images to grayscale
Convert an RGB image to grayscale using matrix multiplication.
Download
macOS 13.3+
Xcode 14.3+


## Page 5

To support 8- and 32-bit matrix multiply, the sample code defines four pixel buffers: two ARGB
source buffers and two grayscale destination buffers.
Luma coefficients model an eye’s response to red, green, and blue light. The following formula
shows the Rec. 709 luma coefficients for the sample app’s default color-to-grayscale conversion.
The sample code app provides a user interface that allows a user to change the red, green, and
blue coefficients. To ensure the grayscale image isn’t darker or brighter than the original image, th
following code normalizes the coefficient values so that their sum equals 1.0:
Define the source and destination pixel buffers
Define the coefficient values


## Page 6

The 8-bit matrix multiply operation accepts integer matrix values. The following code defines a
divisor that it uses to multiply the floating-point coefficient values and that the function uses to
renormalize the image after scaling by the matrix:
On return, the destinationBuffer8 pixel buffer contains a grayscale representation of the
original image.
The 32-bit matrix multiply operation accepts floating-point matrix values and, therefore, doesn’t
require a divisor. The following code performs the 32-bit color-to-grayscale conversion.
On return, the destinationBufferF pixel buffer contains a grayscale representation of the
original image.
The sample app displays the 8- and 32-bit grayscale images in the user interface. To support this
the following code defines two single-channel vImage_CGImageFormat structures:
Perform the 8-bit matrix multiply operation
Perform the 32-bit matrix multiply operation
Create a grayscale Core Graphics image


## Page 7

The makeCGImage(cgImageFormat:) function is available for both the 8- and 32-bit pixel
buffers. The following code creates a CGImage instance from the 32-bit grayscale pixel buffer:
On return, result contains the grayscale representation of the original image:
See Also


## Page 8

Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Applying color transforms to images with a multidimensional lookup table
Precompute translation values to optimize color space conversion and other pointwise
operations.
Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Converting luminance and chrominance planes to an ARGB image
Create a displayable ARGB image using the luminance and chrominance information from yo
device’s camera.
Conversion
Convert an image to a different format.
Conversion Between Image Formats


## Page 9

When you perform color space conversions or other color transformations, it can be quicker to
precompute the conversion values rather than performing the calculation for each individual pixel
The vImage library provides functionality for transforming images using multidimensional lookup
tables. A multidimensional lookup table allows you to define such complex color transformations
between image formats with the same or different numbers of channels.
An example of a multidimensional lookup table is a 3D lookup table that converts RGB colors to th
CMYK color model that’s commonly used in printing. As the following image illustrates, an RGB to
CMYK multidimensional lookup table is a cube that represents the RGB color space, with axes for
red, green, and blue. Each point in that cube corresponds to a unique RGB color that contains the
corresponding CMYK value.
Overview
Accelerate / Applying color transforms to images with a multidimensional lookup table
Article
Applying color transforms to images with a
multidimensional lookup table
Precompute translation values to optimize color space conversion and other
pointwise operations.


## Page 10

Each dimension of the RGB cube in the image above contains eight entries — that is, there are 8³ 
512 source samples, which appear as small cubes. Each sample contains four values that represe
the CMYK values for the corresponding RGB color. For example, the sample for pure red (RGB [1
0, 0]) contains the CMYK values [0, 1, 1, 0], and the sample for cyan (RGB [0, 1, 1])
contains the CMYK values [1, 0, 0, 0].
Define the number of elements in the lookup table from the number of table entries per channel,
the number of source channels, and the number of destination channels. For the RGB to CMYK
conversion, in the following example, the lookup table contains four values (for cyan, magenta,
yellow, and black) at each point in the RGB cube. The RGB cube contains the number of table
entries per channels cubed.
Define the lookup table size


## Page 11

You can set the vImage multidimensional lookup table functions to linearly interpolate between
values. A high entriesPerChannel value provides greater color fidelity than a low value, but
with a corresponding performance and memory overhead.
Supply the lookup table as a contiguous array of samples that define the lookup table values. The
following code iterates over red, green, and blue values and creates an RGB CGColor instance fo
each permutation. The code converts the RGB color instance to the CMYK color space and
populates the lookup table with the cyan, magenta, yellow, and black components.
Create the table data


## Page 12

In the following example, the RGB-to-CMYK value conversion code uses a vImageConverter
instance to convert a single RGB pixel to a single CMYK pixel:


## Page 13

Call vImageMultidimensionalTable_Create(_:_:_:_:_:_:_:) to create a
multidimensional lookup table from the table data array. Because the code in this example only
uses the 32-bit transform function, pass the kvImageMDTableHint_Float hint to reduce
memory overhead:
The lookup table structure is immutable and thread-safe, and therefore you can use it with multip
and concurrent calls to the appropriate transform function. After you finish using the lookup table
call vImageMultidimensionalTable_Release(_:) to free its resources.
Create the lookup table
Apply the transform


## Page 14

vImage provides two functions to apply the multidimensional lookup table to an image: vImage
MultiDimensionalInterpolatedLookupTable_PlanarF(_:_:_:_:_:_:) for 32-bit
planar buffers, and vImageMultiDimensionalInterpolatedLookupTable
_Planar16Q12(_:_:_:_:_:_:) for 16Q12 planar buffers.
The code below applies the lookup table to three 32-bit source buffers (srcRedBuffer, src
GreenBuffer, and srcBlueBuffer) and writes the result to four 32-bit destination buffers
(destCyanBuffer, destMagentaBuffer, destYellowBuffer, and destBlackBuffer). F
more information about working with planar buffers, see Optimizing image-processing
performance.
On return, the four destination planar buffers contain the cyan, magenta, yellow, and black
channels of the original RGB source image, as the following image shows:


## Page 15

If you’re creating apps for recent operating systems that support the vImage.PixelBuffer AP
the vImage library includes the vImage.MultidimensionalLookupTable structure, which
provides a simple interface to a vImage_MultidimensionalTable structure. A vImage
.MultidimensionalLookupTable structure uses the same lookup table data as a vImage
_MultidimensionalTable structure. The code below performs an RGB-to-CMYK conversion
using 32-bit planar pixel buffers:
Apply multidimensional lookup tables to pixel buffers


## Page 16

Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Converting color images to grayscale
Convert an RGB image to grayscale using matrix multiplication.
Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Converting luminance and chrominance planes to an ARGB image
Create a displayable ARGB image using the luminance and chrominance information from yo
device’s camera.
Conversion
Convert an image to a different format.
See Also
Conversion Between Image Formats


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

As an alternative to the any-to-any conversion technique that Using vImage pixel buffers to
generate video effects describes, vImage provides low-level functions for creating RGB images
from the separate luminance and chrominance planes that an AVCaptureSession instance
provides. These functions offer better performance and more granular configuration than using a
ImageConverter instance.
The vImageConvert_YpCbCrToARGB_GenerateConversion(_:_:_:_:_:_:) function
generates the information that vImage requires to convert the luminance and chrominance planes
to a single ARGB image.
Video-range YpCbCr formats often don’t use very low and very high values. For example, an 8-bit
video range format typically uses the range 16...235 for luminance and 16...240 for
chrominance. The generate conversion function accepts a vImage_YpCbCrPixelRange
structure that defines the pixel range.
The following code example populates a vImage_YpCbCrToARGB structure with the required
conversion information for video-range 8-bit pixels:
Overview
Configure the YpCbCr-to-ARGB information
Accelerate / Converting luminance and chrominance planes to an ARGB image
Sample Code
Converting luminance and chrominance
planes to an ARGB image
Create a displayable ARGB image using the luminance and chrominance
information from your device’s camera.
Download
macOS 13.3+
Xcode 14.3+


## Page 21

Before the sample app accesses the pixel data that AVFoundation supplies as a CVPixelBuffer
it calls CVPixelBufferLockBaseAddress(_:_:) to lock the pixel buffer and make the
underlying memory available.
After the YpCbCr-to-RGB conversion is complete, the code calls CVPixelBufferUnlockBase
Address(_:_:) to unlock the pixel buffer.
The convertYpCbCrToRGB(cvPixelBuffer:) function performs the YpCbCr-to-RGB
conversion.
Lock the Core Video pixel buffer


## Page 22

The convertYpCbCrToRGB(cvPixelBuffer:) function creates two pixel buffers that share
memory with the CVPixelBuffer. The Core Video pixel buffer contains two planes: the plane at
index 0 contains one channel that represents the luminance component, the plane at index 1
contains two interleaved channels that represent the two chrominance components.
The init(referencing:planeIndex:overrideSize:pixelFormat:) function initializes
vImage.PixelBuffer that references a single plane of a multiple-plane Core Video pixel buffe
The sample app provides a Slider for changing the contrast of the final image. The following
code example uses the tone-mapping technique that Adjusting saturation and applying tone
mapping describes:
The convert(lumaSource:chromaSource:conversionInfo:) converts the luminance an
chrominance information in lumaPixelBuffer and chromaPixelBuffer to an ARGB image.
This pixel buffer method calls the underlying vImage vImageConvert_420Yp8_CbCr8To
ARGB8888(_:_:_:_:_:_:_:) function.
Create the source luminance and chrominance pixel
buffers
Adjust the contrast of the image
Convert the YpCbCr image to an ARGB image


## Page 23

Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Converting color images to grayscale
Convert an RGB image to grayscale using matrix multiplication.
Applying color transforms to images with a multidimensional lookup table
Precompute translation values to optimize color space conversion and other pointwise
operations.
Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Conversion
Convert an image to a different format.
See Also
Conversion Between Image Formats


## Page 24

Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Converting chroma-subsampled images
Create vImage buffers with the correct dimensions to convert to and from images with
subsampled chroma information.
Functions that perform any-to-any conversion
Convert between Core Video or Core Graphics image data of arbitrary color spaces and bit
depths.
Functions that convert between integer planar buffers
Convert the bit depths of planar integer image data.
Functions that convert between integer interleaved buffers
Convert the bit depths of interleaved integer image data.
Functions that convert from integer planar buffers to noninteger planar buffers
Convert planar integer image data to fixed- and floating-point format.
Functions that convert from integer interleaved buffers to noninteger interleaved buffers
Convert interleaved integer image data to fixed- and floating-point format.
Topics
Converting any-to-any
Type conversion
Accelerate / Conversion
Conversion
Convert an image to a different format.


## Page 25

Functions that convert between noninteger planar buffers
Convert the bit depths and formats of planar fixed- and floating-point image data.
Functions that convert between noninteger interleaved buffers
Convert the bit depths and formats of interleaved fixed- and floating-point image data.
Functions that convert from noninteger planar buffers to integer planar buffers
Convert planar fixed- and floating-point image data to integer format.
Functions that convert from noninteger interleaved buffers to integer interleaved buffers
Convert interleaved fixed- and floating-point image data to integer format.
Functions that interleave integer planar buffers
Combine discrete integer planar buffers into an interleaved buffer.
Functions that interleave noninteger planar buffers
Combine discrete fixed- and floating-point planar buffers into an interleaved buffer.
Functions that deinterleave integer interleaved buffers
Separate integer interleaved buffers into discrete planar buffers.
Functions that deinterleave noninteger interleaved buffers
Separate fixed- and floating-point interleaved buffers into discrete planar buffers.
Functions that add an alpha channel to three-channel buffers
Add a constant alpha value or planar alpha buffer to an RGB image.
Functions that remove an alpha channel from four-channel buffers
Remove the alpha channel from an RGBA or ARGB buffer.
Functions that convert from YCbCr to RGB
Convert image data represented by luma, blue-difference, and red-difference channels to re
green, and blue channels.
Functions that convert from RGB to YCbCr
Converting between interleaved and planar formats
Adding and removing alpha channels
Converting between YCbCr and RGB color spaces


## Page 26

Convert image data represented by red, green, and blue channels to luma, blue-difference,
and red-difference channels.
Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Converting color images to grayscale
Convert an RGB image to grayscale using matrix multiplication.
Applying color transforms to images with a multidimensional lookup table
Precompute translation values to optimize color space conversion and other pointwise
operations.
Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Converting luminance and chrominance planes to an ARGB image
Create a displayable ARGB image using the luminance and chrominance information from yo
device’s camera.
See Also
Conversion Between Image Formats


