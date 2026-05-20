# 002_Applying tone curve adjustments to images.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

The PolynomialEditor class uses the coefficients that the applyPolynomial() function
computes to render a representation of the response curve.
The updatePath() function calls evaluatePolynomial(usingCoefficients:with
Variables:result:) to build a CGPath instance that the editor uses to render a smooth curv
in the user interface.
Adjusting the brightness and contrast of an image
See Also
Color and Tone Adjustment


## Page 6

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


