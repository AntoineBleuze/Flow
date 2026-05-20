# 001_Converting color images to grayscale.pdf

## Page 1

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


## Page 2

To support 8- and 32-bit matrix multiply, the sample code defines four pixel buffers: two ARGB
source buffers and two grayscale destination buffers.
Luma coefficients model an eye’s response to red, green, and blue light. The following formula
shows the Rec. 709 luma coefficients for the sample app’s default color-to-grayscale conversion.
The sample code app provides a user interface that allows a user to change the red, green, and
blue coefficients. To ensure the grayscale image isn’t darker or brighter than the original image, th
following code normalizes the coefficient values so that their sum equals 1.0:
Define the source and destination pixel buffers
Define the coefficient values


## Page 3

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


## Page 4

The makeCGImage(cgImageFormat:) function is available for both the 8- and 32-bit pixel
buffers. The following code creates a CGImage instance from the 32-bit grayscale pixel buffer:
On return, result contains the grayscale representation of the original image:
See Also


## Page 5

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


