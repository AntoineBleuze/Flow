# 001_Adding a bokeh effect to images.pdf

## Page 1

This sample app creates a bokeh effect, where parts of an image that are out of focus adopt the
shape of the lens’s aperture. The app dynamically generates a polygon-shaped kernel — also
known as a structuring element — and applies a morphology operation to an image based on that
kernel. The following sample shows a photograph after the app has applied dilation with a
triangular kernel:
Overview
Accelerate / Adding a bokeh effect to images
Sample Code
Adding a bokeh effect to images
Simulate a bokeh effect by applying dilation.
Download
macOS 13.3+
Xcode 14.0+


## Page 2

Kernels are 1D or 2D matrices of values that the morphology operation subtracts from a
corresponding pixel value in the image. The final value of each transformed pixel is either the
lightest result (for dilation) or darkest result (for erosion) of each subtraction.
The following formula shows how a dilation operation calculates the value for the pixel at the cent
of the grid. The operation subtracts each of the nine kernel values from the image’s correspondin
pixel and returns the maximum value.
The MorphologyTransformer.makeBokehStructuringElement(ofRadius:atAngle:
withSides:) method returns a vImage.StructuringElement structure. Within that
structure, the diaphragmBladeCount variable defines the number of sides. For example, to
create a hexagon-shaped bokeh effect, the sample app calls the MorphologyTransformer
.makeBokehStructuringElement(ofRadius:atAngle:withSides:) method with the
number of sides set to 6.
Generate the structuring element


## Page 3

On return, bokeh contains the following values:
To optimize the dilation operations, the sample app calls the planar morphology function, apply
Morphology(operation:destination:), concurrently on the three planar pixel buffers tha
represent the individual red, green, and blue channels.
Apply the dilation


## Page 4

To learn more about improving your app’s performance by converting image buffer formats from
interleaved to planar, see Optimizing image-processing performance.
The following code calls the three functions inside a withtaskgroup(of:returning:
isolation:body:) closure:
On return, the destination buffer contains the dilation result:


## Page 5

Blurring an image
Filter an image by convolving it with custom and high-speed kernels.
Convolution
Apply a convolution kernel to an image.
Morphology
Dilate and erode images.
See Also
Convolution and Morphology


