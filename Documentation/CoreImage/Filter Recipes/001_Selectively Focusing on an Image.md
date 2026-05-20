# 001_Selectively Focusing on an Image.pdf

## Page 1

You can selectively blur areas of an image using maskedVariableBlur() filter.
You specify the region to blur by applying a mask image; the shape and values of the mask image
determine the location and strength of the blurring. Creating this effect involves the following
steps:
1. To focus on a strip across the image, create two linear gradients representing the portions of th
image to blur.
2. To focus on a circular region in the image, create a radial gradient centered on the region to kee
sharp.
3. Composite the gradients into a mask.
4. Apply Core Image’s maskedVariableBlur() filter to the original image, inputting the create
mask.
Overview
Core Image / Selectively Focusing on an Image
Article
Selectively Focusing on an Image
Focus on a part of an image by applying Gaussian blur and gradient masks.


## Page 2

You can build your mask in any shape, but the general strategy remains the same: leave the mask
transparent where you want the original image to stay sharp and focused. This section covers
focusing on a horizontal strip.
To build a mask that leaves out a stripe, create linear gradients from a single color, such as green 
gray. Our goal is to build the mask shown in Figure 2.
The linear gradients cause the blur to taper smoothly as it approaches the focused stripe of the
image. The Core Image CIFilter named linearGradient() generates filters of the desired
color. The linear gradient has four parameters:
point0
A CGPoint representing the starting position of the gradient.
point1
A CGPoint representing the ending position of the gradient.
color0
A CIColor representing the first color to use in the gradient.
color1
A CIColor representing the sexond color to use in the gradient.
Compute the start and stop points of the gradient as fractions of the image height, as obtained
through extent. For this particular mask and example image, focus on the area near the middle, 
the second quarter of the image. Set the linear gradient’s point0 and point1 to reflect the regi
through which the gradient tapers.
Focusing on a Strip of the Image


## Page 3

The lower gradient should complement the upper gradient, so that their combined coverage
delineates the entire area to blur. Express the starting inputPoint0 y-value at 0.35 of the imag
height and taper to 0.6, where the top gradient began. This leaves a gap in the combined mask
through which the sharp image will show.
To create a mask that dilineates where and how strong a blur to apply, combine the two linear
gradients.
Creating a Mask by Compositing Linear Gradients


## Page 4

Since the gradients themselves are CIFilter objects, compositing them is as simple as
concatenating their filter outputs to a compositing filter. Use the built-in CIFilter named
additionCompositing() to composite two images additively.
The resulting mask is now ready to be applied as part of the maskedVariableBlur() filter.
In order to focus on a circular region of an image, you can create a Core Image radial
Gradient() filter.
The filter takes four parameters:
center
A CGPoint representing the center of the effect as x and y coordinates.
color0
A CIColor representing the first color to use in the gradient.
color1
A CIColor representing the second color to use in the gradient.
radius0
A float representing the radius of the starting circle to use in the gradient.
radius1
A float representing the radius of the ending circle to use in the gradient.
1. Set the center to a CGPoint pointing to the center of the region you want to leave unblurred
2. Set the radius0 to a fraction of the image’s dimension, like 0.2*h in this example. You can
tweak this parameter to determine the size of the sharp region.
3. Set the radius1 to a larger fraction of the image’s dimension, like 0.3*h in this example.
Tweaking this parameter changes the extent of the blur’s tapering effect; a larger value makes
the blur more gradual, whereas a smaller value makes the image transition more abruptly from
sharp (at inputRadius0) to blur (at inputRadius1).
4. As with the linear gradients, set color0 to transparency, and color1 to a solid opaque color, 
indicate the blur’s gradation from nonexistent to full.
Focusing on a Circular Region


## Page 5

This yields a circular mask to use with the maskedVariableBlur() filter.
The final step is applying your choice of mask with the input image. The maskedVariable
Blur() built-in CIFilter accomplishes this task with the following input parameters:
inputImage
Set to the original, unprocessed CIImage.
radius
A float representing the area of effect.
mask
An image that masks an area on the input image with the type CIImage
The resulting image shows the original image with portions blurred out according to the mask
applied. The linear gradient mask results in an output image focused on a strip, and the radial
gradient mask results in an output image focused on a circular region.
Masking the Blurred Image to Apply Selective Focus


## Page 6

See Also


## Page 7

Applying a Chroma Key Effect
Replace a color in one image with the background from another.
Customizing Image Transitions
Transition between images in creative ways using Core Image filters.
Simulating Scratchy Analog Film
Degrade the quality of an image to make it look like dated, analog film.
Filter Recipes


