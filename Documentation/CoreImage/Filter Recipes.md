# Filter Recipes.pdf

## Page 1

Use the chroma key effect, also known as bluescreening or greenscreening, to replace the
background of an image by setting a color or range of colors to transparent.
You apply this technique in three steps:
1. Create a cube map for the colorCube() filter to determine which colors to set transparent.
2. Apply the colorCube() filter to the image to make pixels transparent.
3. Use the sourceOverCompositing() filter to place the image over the background image.
A color cube is a 3D color-lookup table that uses the R, G, and B values from the image to lookup
color. To filter out green from the image, create a color map with the green portion set to
transparent pixels.
Overview
Create a Cube Map
Core Image / Applying a Chroma Key Effect
Article
Applying a Chroma Key Effect
Replace a color in one image with the background from another.


## Page 2

A simple way to construct a color map with these characteristics is to model colors using an HSV
(hue-saturation-value) representation. HSV represents hue as an angle around the central axis, as
in a color wheel. In order to make a chroma key color from the source image transparent, set its
lookup table value to 0 when its hue is in the correct color range.
The value for green in the source image falls within the slice beginning at 108° (108/360 = 0.3)
and ending at 144° (144/360 = 0.4). You’ll set transparency to 0 for this range in the color cube
To create the color cube, iterate across all values of red, green, and blue, entering a value of 0 for
combinations that the filter wiill set to transparent. Refer to the numbered list for details on each
step to the routine.


## Page 3

1. Allocate memory. The color cube has three dimensions, each with four elements of data (RGBA
2. Use a for-loop to iterate through each color combination of red, green, and blue, simulating a
color gradient.
3. Convert RGB to HSV, as in the hueFromRed function. Even though the color cube exists in RG
color space, it’s easier to isolate and remove color based on hue. Input 0 for green hues to
indicate complete removal; use 1 for other hues to leave those colors intact. To specify green a
a hue value, convert its angle in the hue pie chart to a range of 0 to 1. The green in the sample
image has hue between 0.3 (108 out of 360 degrees) and 0.4 (144 out of 360 degrees). Yo
shade of green may differ, so adjust the range accordingly.
4. The colorCube() filter requires premultiplied alpha values, meaning that the values in the
lookup table have their transparency baked into their stored entries rather than applied when
accessed.
5. Create a colorCube() filter with the cube data.
Note
The framework doesn’t have built-in direct conversion between color spaces, but you can
access the hue of a UIColor created with RGB values. Create a UIColor from the raw RGB
values and then read the hue from it.


## Page 4

Apply the color cube filter to a foreground image by setting its inputImage parameter and then
accessing the outputImage.
The output image contains the foreground with all green pixels made transparent.
The filter passes through each pixel in the input image, looks up its color in the color cube, and
replaces the source color with the color in the color cube at the nearest position.
Chain a sourceOverCompositing() filter to the color cube filter to composite a background
image to the greenscreened output. The transparency in the colorcube-filtered image allows the
composited background image to show through.
The foreground of the source image now appears in front of the background landscape without a
trace of the green screen.
Selectively Focusing on an Image
Focus on a part of an image by applying Gaussian blur and gradient masks.
Remove Green from the Source Image
Composite over a Background Image
See Also
Filter Recipes


## Page 5

Customizing Image Transitions
Transition between images in creative ways using Core Image filters.
Simulating Scratchy Analog Film
Degrade the quality of an image to make it look like dated, analog film.


## Page 6

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


## Page 7

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


## Page 8

The lower gradient should complement the upper gradient, so that their combined coverage
delineates the entire area to blur. Express the starting inputPoint0 y-value at 0.35 of the imag
height and taper to 0.6, where the top gradient began. This leaves a gap in the combined mask
through which the sharp image will show.
To create a mask that dilineates where and how strong a blur to apply, combine the two linear
gradients.
Creating a Mask by Compositing Linear Gradients


## Page 9

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


## Page 10

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


## Page 11

See Also


## Page 12

Applying a Chroma Key Effect
Replace a color in one image with the background from another.
Customizing Image Transitions
Transition between images in creative ways using Core Image filters.
Simulating Scratchy Analog Film
Degrade the quality of an image to make it look like dated, analog film.
Filter Recipes


## Page 13

You can add visual effects to an image transition by chaining together Core Image CIFilter
objects in the category CICategoryTransition. Each filter from this category represents a single
transition effect.
For example, you can combine an effect that dissolves an image and one that pixelates it as a
transition to a second image. This particular transition chain comprises three steps:
1. Create a dissolveTransition() transition filter with time as an input parameter.
2. Create a pixellate() transition filter with time as an input parameter.
3. Initiate the transition by adding a time step to your run loop.
Overview
Core Image / Customizing Image Transitions
Article
Customizing Image Transitions
Transition between images in creative ways using Core Image filters.


## Page 14

Filters in the transition category require your program to load both source and target images in
order to transform the source into the destination.
The key difference of transition filters from their normal filter chain counterparts is the dependenc
on time. After creating a CIFilter from the Transition Filters category, you set the value of the
time parameter to a float between 0.0 and 1.0 to indicate how far along the transition has
progressed.
Write each transition filter to accept time as an input parameter, and reapply the filter at a regular
interval to transform the image from its source state to the target state.
You don’t need to pass time linearly from 0.0 to 1.0. In fact, you can advance the transition at a
variable rate by modulating the time variable with a function, such as simd_smoothstep, which
a smooth ramp function clamped between two values, imbuing the dissolve effect with an ease-in
ease-out feel.
Load Source and Target Images
Create a Time-Dependent Dissolve Transition


## Page 15

Like the dissolve transition, you can write the pixelate transition filter as a time-dependent functio
as well.
As with the dissolve filter, you can modify the speed and acceleration of the transition by changin
the way time varies between 0.0 and 1.0. In this case, unlike the dissolveTransition() filte
the pixellate() filter accepts a scale, which you can vary over a smoothened triangle functio
simd_smoothstep(1, 0, abs(time)).
This function puts the peak of the pixelation at the middle of the transition: the pixels start and en
small, closely approximating the source image, but as the transition reaches its halfway point, the
pixels scale to their largest size, effectively blocking out the moment farthest from source and
target.
Create a Time-Dependent Pixelate Transition
Step Time with a Display Link


## Page 16

In writing the filter functions to accept a time parameter, you parametrized the transition effect
moving from source to target. Now, you must move time forward when you want to perform the
transition.
Adding a CADisplayLink to your run loop gives you a way to refresh an image every time a
screen redraw occurs, so you can execute on a reliably regular time interval. In the case of a
transition, you need only perform the following steps:
1. Create the display link to call an update function.
2. Add to your app’s main run loop to begin the transition. Start time at 0.0 and track time throug
the update function.
3. In the update function, update the transition filters’ inputTime value and refresh the filtered
image. Since this example chains two filters for a simultaneous effect, update both filters.
4. In the update function, remove the link once time has expired.
Note
Adding a Timer may seem like a logical strategy for stepping time, but the display link fires
with greater precision in sync with screen redraws.
Keeping the display link around beyond function scope allows you to remove it when the transition
completes.
To begin the transition effect, add the CADisplayLink to your program’s main run loop, so it ca
execute each time step and redraw the transitioning CIImage.
Create the Display Link to Call an Update Function
Add the Display Link to Begin the Transition


## Page 17

The CADisplayLink should call a time-stepping function on each pass through the run loop.
Inside this function, recompute the filtered image with that frame’s time variable.
As a convenience, the following helper function shows a CIImage in a UIImageView.
The Core Image framework provides many distinct visual effects through its built-in catalog of
filters. You can substitute a different transition effect for the dissolve and pixelation effects.
Write the Transition Update Function
Explore Other Transition Visual Effects


## Page 18

See filters under the Transition Filters collection for other effects to try.
For example, the copyMachineTransition() filter passes a scanning light over the source
image as it transforms into the target image.
The pageCurlWithShadowTransition() filter simulates the turn of a page, peeling the sourc
image toward the right to reveal the target image underneath. You can include a separate image o
the back of the flipped page.


## Page 19

The barsSwipeTransition() slices the source image into vertical bars that sequentially slide
off the page, revealing the target image underneath.
You can apply transitions such as accordion folding, flash photography, disintegration, and watery
rippling. Substitute the dissolve and pixellate filters with others from the same category, and twea
the time or scale parameter to customize the effect to fit your app.
Applying a Chroma Key Effect
Replace a color in one image with the background from another.
Selectively Focusing on an Image
Focus on a part of an image by applying Gaussian blur and gradient masks.
Simulating Scratchy Analog Film
Degrade the quality of an image to make it look like dated, analog film.
See Also
Filter Recipes


## Page 20

The sepiaTone() filter changes the tint of an image to a reddish-brownish hue resembling old
analog photographs. You can enhance the effect by applying random specks and scratches.
Overview
Core Image / Simulating Scratchy Analog Film
Article
Simulating Scratchy Analog Film
Degrade the quality of an image to make it look like dated, analog film.


## Page 21

The following steps leverage built-in Core Image filters to tint and texture an image to look as if it
were analog film:
1. Apply the sepiaTone() filter.
2. Create randomly varying white specks to simulate grain.
3. Create randomly varying dark scratches to simulate scratchy film.
4. Composite the speckle image and scratches onto the sepia-toned image.
Apply the Sepia Tone Filter to the Original Image


## Page 22

Tint the original image by applying the sepiaTone() filter.
You can use the output of the randomGenerator() filter to generate images containing random
noise. Even though the noise pattern isn’t customizable in size, you can extend and crop it to fit th
image.
Note
The image output from randomGenerator() is always the same; even if you reseed your
random number generator, the image output from this filter is always the same 512x512
pattern. However, it’s suitable for giving the appearance of randomness. For truly random
noise generation, see GameplayKit.
The filter takes no inputs.
Next, apply a whitening effect by chaining the noise output to a colorMatrix() filter. This built
in filter multiplies the noise color values individually and applies a bias to each component. For
white grain, apply whitening to the y-component of RGB and no bias.
Simulate Grain by Creating Randomly Varying Specks


## Page 23

The whiteSpecks resulting from this filter have the appearance of spotty grain when viewed as
an image.
Create the grainy image by compositing the whitened noise as input over the sepia-toned source
image using the sourceOverCompositing() filter.
The process for applying random-looking scratches is the same as the technique used in the whit
grain: color the output of the randomGenerator() filter.
To make the speckle resemble scratches, scale the random noise output vertically by applying a
scaling CGAffineTransform.
Previously, you whitened the speckle image by applying the CIColorMatrix filter evenly across
all color components. For the dark scratches, instead focus on only the red component, setting th
other vector inputs to zero. This time, instead of multiplying the green, blue, and alpha channels,
add bias (0, 1, 1, 1).
Simulate Scratch by Scaling Randomly Varying Noise


## Page 24

The resulting scratches are cyan, so grayscale them using the minimumComponent() filter, whi
takes the minimum of the RGB values to produce a grayscale image.
The grayscale filter produces random lines that resemble dark scratches.
Now that the components are set, you can add the scratches to the grainy sepia image produced
earlier. However, unlike the grainy texture, the scratches impact the image multiplicatively. Instead
of the sourceOverCompositing() filter, which composites source over background, use the
multiplyCompositing() filter to compose the scratches multiplicatively. Set the scratched
image as the filter’s input image, and tab the speckle-composited sepia image as the input
background image.
Since the noise images had different dimensions than the source image, crop the composited
result to the original image size to remove excess beyond the original extent.
Composite the Specks and Scratches to the Sepia Image


## Page 25

The cropped image represents the final result: a sepia-toned image with simulated grain and
scratches composited to give it an analog film appearance.
Applying a Chroma Key Effect
Replace a color in one image with the background from another.
Selectively Focusing on an Image
Focus on a part of an image by applying Gaussian blur and gradient masks.
Customizing Image Transitions
Transition between images in creative ways using Core Image filters.
See Also
Filter Recipes


