# 004_Specifying histograms with vImage.pdf

## Page 1

Histogram specification is an image-processing operation that calculates the histogram of a
reference image and applies it to an input image. The operation changes the colors and tones of
the input image to match those of the reference image.
The example below shows a source image (bottom left) and a histogram reference image (top left
with the histogram specification output on the right.
Overview
Accelerate / Specifying histograms with vImage
Sample Code
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Download
macOS 13.3+
Xcode 14.3+


## Page 2

Before exploring the code, build and run the app to familiarize yourself with the different visual
results the app generates when you select different source and reference images.
The vImage.PixelBuffer structure provides a simple API to calculate and specify a histogram
The histogram() function returns the histogram of a pixel buffer, and the specify
Histogram(_:destination:) function performs the histogram specification operation.
The following code creates the pixel buffers that the operation requires, performs the specificatio
and returns a Core Graphics image that contains the result:
Perform histogram specification using pixel buffers


## Page 3

If you’re creating apps for older operating systems that don’t support the vImage.PixelBuffe
API, the sample code project also includes source code for performing histogram specification
using vImage_Buffer structures.
The vImageHistogramCalculation_ARGB8888(_:_:_:) calculates and stores histogram
data in four arrays — one for each channel — where the value of each element is the number of
pixels in the reference image with that color value. In an 8-bit-per-channel image, each color
channel can hold 256 different values, and the sample code defines each array with a count of 25
The following code calculates the histogram of the histogramSource vImage_Buffer
structure:
Calculate the reference histogram using vImage buffers


## Page 4

On return, the four arrays contain the histogram data from the histogramSource.
The vImageHistogramSpecification_ARGB8888(_:_:_:_:) performs the histogram
specification operation. The following code matches the histogram of the reference image to the
input image:
Specify the image histogram using vImage buffers


## Page 5

On return, destinationBuffer contains the original input image with the histogram that the
reference image specified.
Adjusting the brightness and contrast of an image
Use a gamma function to apply a linear or exponential curve.
Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Histogram
Calculate or manipulate an image’s histogram.
See Also
Color and Tone Adjustment


