# 001_Adjusting saturation and applying tone mapping.pdf

## Page 1

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


## Page 2

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


## Page 3

To support the 4:2:0 YpCbCr representation of the source image, the sample project defines a
Yp8CbCr8PixelBuffers structure that contains two pixel buffers. The luminance buffer is the
same size as the source buffer. The chrominance buffer’s height is half the source height, and its
width is the same as the source width. This size enables the chrominance buffer to store both the
Cb and Cr data as interleaved pixels.
The following code creates two Yp8CbCr8PixelBuffers structures that contain a
representation of the source image before and after saturation adjustment and tone mapping:


## Page 4

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


## Page 5

The vImageConvert_ARGB8888To420Yp8_CbCr8(_:_:_:_:_:_:) function populates two
vImage buffers — one that contains luminance data and one that contains chrominance data —
from the contents of a single ARGB buffer.
The following image shows the luminance result on the left and the interleaved chrominance resu
on the right. Because the interleaved chrominance result contains both the Cb and Cr information
it’s half the height of the luminance channel, but has the same width.
This sample uses two techniques to adjust saturation:
Perform the RGB-to-YpCbCr conversion
Apply saturation adjustment to the image


## Page 6

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


## Page 7

The following image shows two photographs, from left to right, with saturations of 0.25, 0.75,
and 1.0 (that is, the rightmost image has an unchanged saturation).
The simple linear adjustment that multiply(by:divisor:preBias:postBias:
destination:) provides is fine for desaturating an image, however, when increasing saturation
multiplication can clip the CbCr values, leading to areas of solid color. An alternative technique to
increase saturation is to apply an exponential adjustment. The applyGamma(_:destination:
function applies a gamma value to the CbCr values to increase saturation.
Apply gamma to CbCr to increase saturation


## Page 8

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


## Page 9

After the sample app completes the YpCbCr representation, it converts the YpCbCr data to RGB.
The process is very similar to the RGB to YpCbCr conversion and uses the same pixel range, but
the vImageConvert_YpCbCrToARGB_GenerateConversion(_:_:_:_:_:_:) function
generates the conversion.
The Yp8CbCr8PixelBuffers structure exposes a method for converting to ARGB.
Define the YpCbCr-to-RGB conversion


## Page 10

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


## Page 11

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


