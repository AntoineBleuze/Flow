# Color and Tone Adjustment.pdf

## Page 1

This sample code project uses the vImage piecewise gamma function to adjust the response curv
(that is, the value of an output pixel based on the value of the corresponding input pixel) of an 8-b
RGB image. Changing the shape of the response curve changes the brightness and contrast of an
image.
You can use a piecewise gamma function to apply either a linear or an exponential response curve
to pixels in an image based on their value.
This app displays a sample image and uses a SwiftUI Picker control to apply different preset
linear (labeled L1 to L4) and exponential (labeled E1 to E3) response curves. This sample code
project demonstrates how different response curves affect an image by changing its brightness
and contrast.
The sample app defines a structure, ResponseCurvePreset, that contains the coefficients the
linear function uses, the gamma the exponential function uses, and the boundary between the
linear and exponential functions.
Overview
Define response curve presets
Accelerate / Adjusting the brightness and contrast of an image
Sample Code
Adjusting the brightness and contrast of
an image
Use a gamma function to apply a linear or exponential curve.
Download
macOS 13.0+
Xcode 14.3+


## Page 2

The presets array contains sample presets that apply different adjustments to the sample imag
When the user changes the selected value of the Picker control, the app passes the appropriate
preset structure to the getGammaCorrectedImage(preset:source:destination:imag
Format:) function. This function applies the adjustment to the image and returns the result.
The sample app specifies the division between linear and gamma adjustments by passing a
boundary parameter to the piecewise gamma function, applyGamma(linearParameters:
exponentialParameters:boundary:destination:). The function uses the exponential
curve to calculate the output value when the input value is greater than or equal to the boundary
value. Otherwise, the function uses the linear curve.
For 8-bit images, the boundary is a Pixel_8 value.
A value of 0 specifies that the gamma function applies the exponential adjustment to all pixels.
A value of 255 specifies that the gamma function applies the linear adjustment to all pixels.
A value of 127 specifies that the gamma function applies the linear adjustment to all pixels with
a value less than one-half, and the exponential adjustment to the remaining pixels.
The sample app passes the linear and exponential coefficients (for example, the scale and bias
in (scale * inputvalue) + bias) as tuples of floating-point values.
The applyGamma(linearParameters:exponentialParameters:boundary:
destination:) function in the sample app treats an interleaved buffer as a single plane and
applies the same gamma adjustment to all channels — including any alpha channel. Adjusting the
response curve of the alpha channel changes transparency properties. To avoid this, the sample
app converts the RGBA source image to RGB and applies the adjustment to that.
The sample app creates the RGB version of the source image by creating a three-channel, 8-bit-
per-channel format.
Define the adjustment parameters
Remove the alpha channel


## Page 3

Then it declares three-channel source and destination buffers.
Finally, it creates the source buffer using the init(cgImage:cgImageFormat:pixel
Format:) initializer.
On return, sourceBuffer contains the red, green, and blue channels of sourceImage.
The sample app calls applyGamma(linearParameters:exponentialParameters:
boundary:destination:) to apply the adjustment.
To create the image, the sample app passes the destination buffer and RGB format to make
CGImage(cgImageFormat:).
Apply the adjustment


## Page 4

The following sections explain the presets in more detail.
The following presets use the linear adjustment (that is, boundary is 255). The output value for
each pixel is calculated as:
The L1 preset returns each pixel unchanged.
Apply linear adjustment


## Page 5

The L2 preset returns a washed-out image where blacks transform to grays. When the input valu
is 0, the output value is 0.5.
The L3 preset returns an image with a lot of contrast. When the input value is less than one-third,
the output value is 0; when the input value is greater than two-thirds, the output value is 1. The
preset transforms input values between one-third and two-thirds to the range 0 - 1.


## Page 6

The L4 preset returns a negative version of the image. When the input value is 1, the output value
is 0; when the input value is 0, the output value is 1.


## Page 7

The following presets use the exponential adjustment (that is, boundary is 0). The output value f
each pixel is calculated as:
In these examples, exponentialCoefficients is defined as (1, 0, 0) and the calculation
can be simplified to pow(inputValue, gamma).
The E1 preset returns each pixel unchanged.
The E2 preset has an overall darkening effect.
Apply exponential adjustment


## Page 8

The E3 preset has an overall lightening effect.
Many vImage operations — such as convolution and scaling — provide optimal results when
working on images with a linear response curve. When working with nonlinear images — such as
sRGB — best practice is to convert them to a linear color space by applying a reciprocal gamma
(such as 1/2.2), performing the operation, and converting them back to their original domain by
applying the original gamma (such as 2.2).
Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Correct gamma before applying operations
See Also
Color and Tone Adjustment


## Page 9

Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Histogram
Calculate or manipulate an image’s histogram.


## Page 10

This sample code project allows you to apply saturation adjustments to an image without affectin
luminosity, and change the luminance response curve without affecting color.
Many image-processing techniques, such as saturation adjustment and tone mapping, are simple
to implement when you can work on an image’s luminance data separately from its color data. Th
article explains how you can convert an RGB image — with its pixels represented as red, green, an
blue values — to YpCbCr, which stores luminance and chrominance discretely. The Yp in YpCbCr
refers to the luminance, and the Cb and Cr refer to the blue-luminance difference, and red-
luminance difference, respectively.
This sample app converts an ARGB image to YpCbCr and applies adjustments based on user-
interface controls. When you decrease the saturation, the sample app applies gamma to the CbC
buffers. When you increase the saturation, the sample app scales the CbCr buffers, and when you
change contrast, the sample app applies gamma to the Yp buffer.
The following images show two photographs with a range of saturation adjustments that illustrate
the variety of color changes you can make using the sample code app:
Overview
Accelerate / Adjusting saturation and applying tone mapping
Sample Code
Adjusting saturation and applying tone
mapping
Convert an RGB image to discrete luminance and chrominance channels, and
apply color and contrast treatments.
Download
macOS 13.3+
Xcode 14.3+


## Page 11

Before exploring the code, try building and running the app to familiarize yourself with the effect o
the different transformations on the image.
The sample declares two 8-bit, four-channel pixel buffers. The argbSource pixel buffer stores t
source image, and the argbDestination stores the transformed image.
The conversion routine that this sample uses creates a YpCbCr result with a chroma of 4:2:0, whi
means there is one Cb and one Cr pixel for every four luminance pixels. That is, each chrominance
buffer is half of the width, and half of the height of the luminance channel. Reducing the resolutio
for the chrominance channels is known as chroma subsampling, and it relies on the fact that hum
vision is less sensitive to color than luminance.
The image below shows that a 4 x 2 image is represented by a 4 x 2 luminance channel, but each
chrominance channel is 2 x 1 pixels:
Create source and destination ARGB pixel buffers
Create the YpCbCr buffers


## Page 12

To support the 4:2:0 YpCbCr representation of the source image, the sample project defines a
Yp8CbCr8PixelBuffers structure that contains two pixel buffers. The luminance buffer is the
same size as the source buffer. The chrominance buffer’s height is half the source height, and its
width is the same as the source width. This size enables the chrominance buffer to store both the
Cb and Cr data as interleaved pixels.
The following code creates two Yp8CbCr8PixelBuffers structures that contain a
representation of the source image before and after saturation adjustment and tone mapping:


## Page 13

The vImage_YpCbCrPixelRange structure defines the range and clamping information for the
destination YpCbCr format. The destination buffer is 8-bit, therefore, the minimum and maximum
values for luminance and chrominance are 0 and 255, respectively. CbCr_bias specifies the
middle of the CbCr range (that is, where the blue-luminance difference or red-luminance differen
is 0), and the sample sets that to 128.
The Yp8CbCr8PixelBuffers structure uses vImageConvert_ARGBToYpCbCr_Generate
Conversion(_:_:_:_:_:_:) to generate the conversion from ARGB to YpCbCr. The sample
calculates the conversion of RGB values using the conversion matrix for ITU Recommendation
BT.709-2.
Define the RGB-to-YpCbCr conversion


## Page 14

The vImageConvert_ARGB8888To420Yp8_CbCr8(_:_:_:_:_:_:) function populates two
vImage buffers — one that contains luminance data and one that contains chrominance data —
from the contents of a single ARGB buffer.
The following image shows the luminance result on the left and the interleaved chrominance resu
on the right. Because the interleaved chrominance result contains both the Cb and Cr information
it’s half the height of the luminance channel, but has the same width.
This sample uses two techniques to adjust saturation:
Perform the RGB-to-YpCbCr conversion
Apply saturation adjustment to the image


## Page 15

Multiply CbCr values to decrease saturation.
Apply gamma to CbCr to increase saturation.
It performs the tone mapping by applying gamma to the luminance channel.
The following formula describes how to adjust the color saturation of a YpCbCr image, without
affecting its luminance:
The multiply(by:divisor:preBias:postBias:destination:) function performs this
math on the source chrominance buffer. The function passes the saturation to the matrix multiply
function as a single-element matrix, and passes the chrominance buffer as the source and
destination.
Multiply CbCr values to decrease saturation


## Page 16

The following image shows two photographs, from left to right, with saturations of 0.25, 0.75,
and 1.0 (that is, the rightmost image has an unchanged saturation).
The simple linear adjustment that multiply(by:divisor:preBias:postBias:
destination:) provides is fine for desaturating an image, however, when increasing saturation
multiplication can clip the CbCr values, leading to areas of solid color. An alternative technique to
increase saturation is to apply an exponential adjustment. The applyGamma(_:destination:
function applies a gamma value to the CbCr values to increase saturation.
Apply gamma to CbCr to increase saturation


## Page 17

The following image shows two photographs, from left to right, with a saturation of 1.0 (that is, the
leftmost image has an unchanged saturation), 1.5, and 2.0:
When decreasing the saturation, the gamma function is not appropriate because pixels with very
saturated color will desaturate very little, or not at all.
The sample app adjusts the contrast of an image, with a technique known as tone mapping, by
applying a gamma adjustment to the luminance channel.
Adjusting contrast is discussed in Adjusting the brightness and contrast of an image, however,
applying a gamma adjustment to red, green, and blue channels changes both the color and tonal
values.
The applyGamma(linearParameters:exponentialParameters:boundary:
destination:) function applies a piecewise gamma tranformation on the planar yp
Destination buffer, which contains the luminance data.
The following image shows two photographs, from left to right, with a gamma applied to the
luminance channel of 2.5, 0.0 (that is, the center image is unchanged), and 0.5:
Apply gamma to luminance to perform tone mapping


## Page 18

After the sample app completes the YpCbCr representation, it converts the YpCbCr data to RGB.
The process is very similar to the RGB to YpCbCr conversion and uses the same pixel range, but
the vImageConvert_YpCbCrToARGB_GenerateConversion(_:_:_:_:_:_:) function
generates the conversion.
The Yp8CbCr8PixelBuffers structure exposes a method for converting to ARGB.
Define the YpCbCr-to-RGB conversion


## Page 19

Many vImage operations provide optimal results when working on images with a linear response
curve. The sample app includes a Toggle control that applies a reciprocal gamma to the sRGB
image, performs the saturation adjustments and tone mapping, and applies the original gamma.
vImage provides predefined gamma functions for converting from linear to sRGB, and from sRGB 
linear. The sample implements the following function as an extension to vImage.PixelBuffer
and remaps the buffer’s contents in-place in the specified direction:
Adjusting the brightness and contrast of an image
Correct gamma before applying operations
See Also
Color and Tone Adjustment


## Page 20

Use a gamma function to apply a linear or exponential curve.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Histogram
Calculate or manipulate an image’s histogram.


## Page 21

The vImage library provides a suite of functions for applying polynomials to images. The results o
these functions are similar to the Curves adjustment tool in the Mac Photos app. You can use the
polynomial adjustment functions to adjust the overall look of a photo, change the look of specific
colors (red, green, and blue), and adjust settings for the black point, midtones, and white point.
This sample code project calculates the polynomial coefficients from a set of values that the user
defines using handles in the user interface. The vImage polynomial functions evaluate the
polynomial coefficients to define the tone curve. The technique that calculates the coefficients is
the Vandermonde method. To learn more about this technique, see Finding an interpolating
polynomial using the Vandermonde method.
To generate the smooth curves in the user interface, the app passes the same coefficients that th
vImage polynomial transform function uses to the vDSP evaluatePolynomial(using
Coefficients:withVariables:) function.
The following image shows the sample code project’s app. The circles on the curves are the
handles that the user can drag vertically, and the image changes to show the effect of the
polynomial transform.
Overview
Accelerate / Applying tone curve adjustments to images
Sample Code
Applying tone curve adjustments to
images
Use the vImage library’s polynomial transform to apply tone curve adjustments to
images.
Download
macOS 13.3+
Xcode 15.0+


## Page 22

The sample code project accepts source images that it converts to RGB, 32-bit per channel form
Because the vImage polynomial transform functions work on planar buffers, the code creates a v
Image.PlanarFx3 multiple-plane vImage.PixelBuffer structure that contains the separate
red, green, and blue channels.
After creating vImage.PixelBuffer structures that store the interleaved and planar
representations of the source image, the populatePlanarSourceBuffers() function copies
and deinterleaves the interleaved image to the planar buffers.
To learn more about working with planar buffers in vImage, see Optimizing image-processing
performance.
The sample code project defines five data points for each color channel that control the tone curv
By default, these form a linear ramp from 0 to 1. The code calls ramp(withInitialValue:
increment:count:) to populate the redHandleValues, greenHandleValues, and blue
Convert the interleaved source image to planar buffers
Create the default curve control points


## Page 23

HandleValues arrays. The following shows the code that populates the greenHandleValues
array:
When the sample code app first launches, the default values form a linear tone curve that renders
as a stright line in the user interface.
The default control points create an output image that’s identical to the input image. That is, for
each pixel, the transformed output value is equal to the input value.
When the user adjusts the control points in the user interface, a didSet property observer applie
the polynomial to the corresponding planar buffer. For example, the following shows the code for
the green values:
Apply the polynomial transform


## Page 24

The calculateAndApplyPolynomial() function calls calculateCoefficients() to
calculate the coefficients using the Vandermonde method. It then passes the coefficients to appl
Polynomial(coefficientSegments:boundaries:destination:). The vImage
polynomial function effectively creates a polynomial curve from the specified coefficients and use
that as the tone curve. For each point on the curve, the horizontal position represents the input
value, and the vertical position represents the output value.
After the transform, the displayPlanarDestinationBuffers() function calls
interleave(destination:) to generate an interleaved image that the sample code displays
the user interface.
Display the tone curve in the user interface


## Page 25

The PolynomialEditor class uses the coefficients that the applyPolynomial() function
computes to render a representation of the response curve.
The updatePath() function calls evaluatePolynomial(usingCoefficients:with
Variables:result:) to build a CGPath instance that the editor uses to render a smooth curv
in the user interface.
Adjusting the brightness and contrast of an image
See Also
Color and Tone Adjustment


## Page 26

Use a gamma function to apply a linear or exponential curve.
Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Histogram
Calculate or manipulate an image’s histogram.


## Page 27

This sample code project allows you to adjust the hue of an image by treating the chrominance
information as 2D coordinates, and transforming those values with a rotation matrix. You can
convert an RGB image — with its pixels represented as red, green, and blue values — to L*a*b*,
where luminance and chrominance are stored discretely. The L* in L*a*b* refers to the lightness,
and the a* and b* refer to the red-green and blue-yellow values, respectively.
The image below shows an approximation of an L*a*b* color chart. The a* value transitions
horizontally (left to right) from negative, through zero, to positive, and the b* value transitions
vertically (bottom to top) from negative, through zero, to positive. Because this sample code
focuses on color rather than lightness, the image doesn’t consider L*.
Overview
Accelerate / Adjusting the hue of an image
Sample Code
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Download
macOS 13.0+
Xcode 14.0+


## Page 28

The sample uses the vImage Any-to-Any converter to convert the source image’s color space to
L*a*b*. The code converts the interleaved L*a*b* image data to multiple-plane image data that it
passes to a matrix multiply operation to apply the hue adjustment.
The following image shows four photographs, from left to right, with a hue adjustment of -90º, 0º
(an unchanged hue), 90º, and 180º:


## Page 29

To create the image format for the L*a*b* color space, the sample app uses the genericLab
system-defined CGColorSpace.
On return, labImageFormat describes the interleaved L*a*b* pixels over which this sample
works. The first channel in each pixel is the lightness, and the second and third channels are the a
and b*, respectively.
The converter that the sample uses to convert the source pixels to L*a*b* color space requires tw
vImage_CGImageFormat structures that describe the source and destination images. The
sample uses the makeDynamicPixelBufferAndCGImageFormat(cgImage:) method to
create a dynamic pixel buffer and image format structure from the source Core Graphics image.
On return, source.cgImageFormat contains the image format of the source image, and sourc
.pixelBuffer is a pixel buffer that contains the source image data.
The sample app uses the source and L*a*b* image formats to create a vImageConverter
instance to convert between the two color spaces.
For more information about vImage’s convert-any-to-any functionality, see Building a basic image
conversion workflow.
Create the L*a*b* image format
Generate the pixel buffer and image format from the source
image
Create the source image color space to L*a*b* converter


## Page 30

The sample creates a pixel buffer that’s the same size as the source image.
The converter’s convert(from:to:) function performs the conversion.
On return, the labInterleavedSource contains the L*a*b* representation of the source image
The function the sample app uses to apply the hue adjustment, multiply(by:divisor:pre
Bias:postBias:destination:), operates on a multiple-plane pixel buffer. To convert the
interleaved L*a*b* buffer to planar buffers, the app creates a vImage.Planar8x3 pixel buffer.
It then calls deinterleave(destination:) to populate the planar buffers with the contents o
the interleaved buffer.
For more information about working with planar buffers, see Optimizing image-processing
performance.
The app adjusts the hue of an image by rotating a two-element vector, described by a* and b*. Fo
more information about working with rotation matrices, see Working with Matrices.
The following visualizes a sample color (marked A) rotated by -90º (marked C) and 45º (marked B
Convert the source image to L*a*b*
Convert the interleaved L*a*b* buffer to planar buffers
Apply the hue adjustment


## Page 31

The following code generates the rotation matrix based on hueAngle:


## Page 32

The preBias and postBias values effectively shift the a* and b* values from 0...255 to
-128...127, so the rotation is centered where a* and b* are zero.
The multiply(by:divisor:preBias:postBias:destination:) function multiplies each
pixel in the source buffer by the matrix and writes the result to the destination buffers. The code
performs the matrix multiplication in-place, so the source and destination point to the same
buffers.
The following code performs the matrix multiply operation:
On return, labPlanarDestination contains the hue-adjusted a* and b* channels.
Finally, the sample code converts the hue-adjusted planar buffer back to an interleaved buffer.
The SwiftUI Image view supports the L*a*b* color space. The following code creates a Core
Graphics image from the interleaved pixel buffer and passes it to the published outputImage
property that the app displays on the screen:
Display the image


## Page 33

Adjusting the brightness and contrast of an image
Use a gamma function to apply a linear or exponential curve.
Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Histogram
Calculate or manipulate an image’s histogram.
See Also
Color and Tone Adjustment


## Page 34

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


## Page 35

Before exploring the code, build and run the app to familiarize yourself with the different visual
results the app generates when you select different source and reference images.
The vImage.PixelBuffer structure provides a simple API to calculate and specify a histogram
The histogram() function returns the histogram of a pixel buffer, and the specify
Histogram(_:destination:) function performs the histogram specification operation.
The following code creates the pixel buffers that the operation requires, performs the specificatio
and returns a Core Graphics image that contains the result:
Perform histogram specification using pixel buffers


## Page 36

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


## Page 37

On return, the four arrays contain the histogram data from the histogramSource.
The vImageHistogramSpecification_ARGB8888(_:_:_:_:) performs the histogram
specification operation. The following code matches the histogram of the reference image to the
input image:
Specify the image histogram using vImage buffers


## Page 38

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


## Page 39

An image histogram is a representation of an image that describes its color tones distribution. Th
histogram contains a series of bins that represent the possible values for each color channel. For
example, each channel of an 8-bit image contains 256 histogram bins. Each bin contains the
image’s pixel count of the corresponding value.
The histogram of the following low-contrast image shows that almost all of its pixel values are
clustered around the mid values. There are no pixels on the left side — corresponding to low value
— indicating the image doesn’t contain any very dark colors. Similarly, there are no pixels on the
right side — corresponding to high values — indicating the images doesn’t contain any very bright
colors. The thin, gray line shows the cumulative histogram, that is, a running sum of pixel counts a
each intensity.
vImage provides functions that can either equalize or stretch an image’s histogram to enhance th
contrast of an image.
Overview
Accelerate / Enhancing image contrast with histogram manipulation
Article
Enhancing image contrast with histogram
manipulation
Enhance and adjust the contrast of an image with histogram equalization and
contrast stretching.


## Page 40

Histogram equalization transforms an image so that its histogram is more uniformly distributed
across the entire range of values. The operation stretches dense parts of the histogram, where
contrast is low, and condenses sparse parts of the histogram, where contrast is high. A truly
uniform histogram is one in which each histogram bin contains the same value, that is, its
cumulative histogram is a diagonal line. The vImage histogram equalization functions approximate
that truly uniform histogram.
The following code shows how to perform histogram equalization for vImage_Buffer and v
Image.PixelBuffer structures:
On return, destinationBuffer contains the transformed image. The picture below shows the
low-contrast image after histogram equalization. The operation distributed the nonzero histogram
bins across the entire range of values, and the result has a lot more contrast. The cumulative
histogram is nearly a straight diagonal line, indicating an almost uniform distribution of values.
Apply histogram equalization to an image


## Page 41

Note that the histogram bins aren’t evenly distributed throughout the resulting histogram. The
amount of stretching correlates to the number of pixels in each bin.
Contrast stretching evenly distributes a histogram’s pixel values across the full range of available
pixel values. This technique is ideal for enhancing the contrast of an image with pixel values
concentrated in one area of the intensity spectrum, such as the original low-contrast image above
The following code shows how to perform contrast stretching for vImage_Buffer and vImage
.PixelBuffer structures:
On return, destinationBuffer contains the transformed image. The picture below shows the
low-contrast image after histogram stretching. The result has a lot more contrast, and its histogra
shows that values are evenly distributed throughout the entire range. The shape of the contrast
stretched image’s cumulative histogram is very similar to the original image’s cumulative histogra
Apply contrast stretching to an image


## Page 42

The vImage ends-in contrast stretching functions accept parameters that allow you to control
which part of the histogram the operation stretches. Use ends-in contrast stretching for images
with the majority of their pixels clustered in a single area and a small number of pixels at either en
of their histogram. In these situations, standard contrast stretching may not yield your desired
result.
The following figure illustrates how ends-in contrast stretching discards elements from a histogra
and stretches the remaining values. The operation maps the 25% low values and 25% high values
to 0 and 255 (for an 8-bit image), respectively. The result contains the central 50% of the source
histogram stretched to fill the remaining 254 bins.
Note that this illustration isn’t to scale; the operation uses percentages based on the number of
pixels for each intensity.
Set the percent_low parameter of the vImageEndsInContrastStretch_ARGB8888(_:_:
_:_:_:) function to define the percentage of pixels that the operation maps to the lowest end o
the transformed image’s histogram. The following code shows how to perform ends-in contrast
stretching for vImage_Buffer and vImage.PixelBuffer structures with percent_low set 
25% for all channels:
Apply ends-in contrast stretching to an image


## Page 43

On return, destinationBuffer contains the transformed image. The picture below shows the
low-contrast image after ends-in contrast stretching. This result is much darker overall with the
histogram shifted to the left.
Set the percent_high parameter of the vImageEndsInContrastStretch_ARGB8888(_:_
_:_:_:) function to define the percentage of pixels that the operation maps to the high end of t
transformed image’s histogram. The following code shows how to perform ends-in contrast
stretching for vImage_Buffer and vImage.PixelBuffer structures with percent_high se
to 25% for all channels:


## Page 44

On return, destinationBuffer contains the transformed image. The picture below shows the
low-contrast image after ends-in contrast stretching. This result is much brighter overall with the
histogram shifted to the right.
func equalizeHistogram(destination: vImage.PixelBuffer<Format>)
Equalizes the histogram of a multiple-plane 8-bit pixel buffer.
See Also
Related Documentation


## Page 45

func contrastStretch(destination: vImage.PixelBuffer<vImage.
Interleaved8x4>)
Stretches the histogram of an 8-bit-per-channel, 4-channel interleaved pixel buffer.
func vImageEqualization_ARGB8888(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs histogram equalization on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageContrastStretch_ARGB8888(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs contrast stretching on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageEndsInContrastStretch_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafePointer<UInt32>, UnsafePointer<
UInt32>, vImage_Flags) -> vImage_Error
Performs ends-in contrast stretching on an 8-bit-per-channel, 4-channel interleaved buffer.
Adjusting the brightness and contrast of an image
Use a gamma function to apply a linear or exponential curve.
Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Histogram
Calculate or manipulate an image’s histogram.
Color and Tone Adjustment


## Page 46

func vImageContrastStretch_Planar8(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs contrast stretching on an 8-bit planar buffer.
func vImageContrastStretch_PlanarF(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs contrast stretching on a 32-bit planar buffer.
func vImageContrastStretch_ARGB8888(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs contrast stretching on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageContrastStretch_ARGBFFFF(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs contrast stretching on a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageEndsInContrastStretch_Planar8(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UInt32, UInt32, vImage_Flags) -> vImage
_Error
Performs ends-in contrast stretching on an 8-bit planar buffer.
Topics
Performing contrast stretching
Performing ends-in contrast stretching
Accelerate / Histogram
API Collection
Histogram
Calculate or manipulate an image’s histogram.


## Page 47

func vImageEndsInContrastStretch_PlanarF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, UInt32,
UInt32, Pixel_F, Pixel_F, vImage_Flags) -> vImage_Error
Performs ends-in contrast stretching on a 32-bit planar buffer.
func vImageEndsInContrastStretch_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafePointer<UInt32>, UnsafePointer<
UInt32>, vImage_Flags) -> vImage_Error
Performs ends-in contrast stretching on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageEndsInContrastStretch_ARGBFFFF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UnsafePointer<
UInt32>, UnsafePointer<UInt32>, UInt32, Pixel_F, Pixel_F, vImage_Flags)
-> vImage_Error
Performs ends-in contrast stretching on a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageEqualization_Planar8(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs histogram equalization on an 8-bit planar buffer.
func vImageEqualization_PlanarF(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs histogram equalization on a 32-bit planar buffer.
func vImageEqualization_ARGB8888(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs histogram equalization on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageEqualization_ARGBFFFF(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs histogram equalization on a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramCalculation_Planar8(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<vImagePixelCount>, vImage_Flags) -> vImage_Error
Calculates the histogram of an 8-bit planar buffer.
Equalizing a histogram
Calculating a histogram


## Page 48

func vImageHistogramCalculation_PlanarF(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<vImagePixelCount>, UInt32, Pixel_F, Pixel_F, vImag
_Flags) -> vImage_Error
Calculates the histogram of a 32-bit planar buffer.
func vImageHistogramCalculation_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<UnsafeMutablePointer<vImagePixelCount>?>, vImage
_Flags) -> vImage_Error
Calculates the histogram of an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramCalculation_ARGBFFFF(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<UnsafeMutablePointer<vImagePixelCount>?>, UInt32,
Pixel_F, Pixel_F, vImage_Flags) -> vImage_Error
Calculates the histogram of a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramSpecification_Planar8(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafePointer<vImagePixelCount>, vImage
_Flags) -> vImage_Error
Specifies the histogram of an 8-bit planar buffer.
func vImageHistogramSpecification_PlanarF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UnsafePointer<v
ImagePixelCount>, UInt32, Pixel_F, Pixel_F, vImage_Flags) -> vImage
_Error
Specifies the histogram of a 32-bit planar buffer.
func vImageHistogramSpecification_ARGB8888(UnsafePointer<vImage_Buffer>
UnsafePointer<vImage_Buffer>, UnsafeMutablePointer<UnsafePointer<vImage
PixelCount>?>, vImage_Flags) -> vImage_Error
Specifies the histogram of an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramSpecification_ARGBFFFF(UnsafePointer<vImage_Buffer>
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UnsafeMutable
Pointer<UnsafePointer<vImagePixelCount>?>!, UInt32, Pixel_F, Pixel_F, v
Image_Flags) -> vImage_Error
Specifes the histogram of a 32-bit-per-channel, 4-channel interleaved buffer.
Specifying a histogram
See Also


## Page 49

Adjusting the brightness and contrast of an image
Use a gamma function to apply a linear or exponential curve.
Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Color and Tone Adjustment


