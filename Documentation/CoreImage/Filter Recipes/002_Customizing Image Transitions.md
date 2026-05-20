# 002_Customizing Image Transitions.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

The CADisplayLink should call a time-stepping function on each pass through the run loop.
Inside this function, recompute the filtered image with that frame’s time variable.
As a convenience, the following helper function shows a CIImage in a UIImageView.
The Core Image framework provides many distinct visual effects through its built-in catalog of
filters. You can substitute a different transition effect for the dissolve and pixelation effects.
Write the Transition Update Function
Explore Other Transition Visual Effects


## Page 6

See filters under the Transition Filters collection for other effects to try.
For example, the copyMachineTransition() filter passes a scanning light over the source
image as it transforms into the target image.
The pageCurlWithShadowTransition() filter simulates the turn of a page, peeling the sourc
image toward the right to reveal the target image underneath. You can include a separate image o
the back of the flipped page.


## Page 7

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


