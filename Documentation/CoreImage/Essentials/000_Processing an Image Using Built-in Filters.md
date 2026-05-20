# 000_Processing an Image Using Built-in Filters.pdf

## Page 1

You can add effects to images by applying Core Image filters to CIImage objects. Figure 1 shows
three filters chained together to achieve a cumulative effect:
1. Apply the sepia filter to tint an image with a reddish-brown hue.
2. Add the bloom filter to accentuate highlights.
3. Use the Lanczos scale filter to scale an image down.
CIImage processing occurs in a CIContext object. Creating a CIContext is expensive, so
create one during your initial setup and reuse it throughout your app.
Overview
Create a Context
Core Image / Processing an Image Using Built-in Filters
Article
Processing an Image Using Built-in Filters
Apply effects such as sepia tint, highlight strengthening, and scaling to images.


## Page 2

The next step is to load an image to process. This example loads an image from the project bundl
The CIImage object isn’t itself a displayable image, but rather image data. To display it, you mus
convert it to another type, such as UIImage.
A CIFilter represents a single operation or recipe for a particular effect. To process a CIImage
object, pass it through CIFilter objects. You can subclass CIFilter or draw from the existing
library of built-in filters.
Although you can chain filters without separating them into functions, the following example show
how to configure a single CIFilter, the sepiaTone() filter.
To pass the image through the filter, call the sepia filter function.
You can check the intermediate result at any point in the filter chain by converting from CIImage
to a UIImage. You can then assign this UIImage to a UIImageView for display.
Load an Image to Process
Apply Built-In Core Image Filters
Tint Reddish-Brown with the Sepia Filter
Strengthen Highlights with the Bloom Filter


## Page 3

The bloom filter accentuates the highlights of an image. You can apply it as part of a chain withou
factoring it into a separate function, but this example encapsulates its functionality into a function
Like the sepia filter, the intensity of the bloom filter’s effect ranges between 0 and 1, with 1 being
the most intense effect. The bloom filter has an additional radius parameter to determine how
much the glowing regions expand. Experiment with a range to values to fine tune the effect, or
assign the input parameter to a control like a UISlider to allow your users to tweak its values.
Note
The gloom() filter performs the opposite effect.
To display the output, convert the CIImage to a UIImage.
Apply the lanczosScaleTransform() to obtain a high-quality downsampling of the image,
preserving the original image’s aspect ratio through the lanczosScaleTransform() filter’s
parameter aspectRatio. For built-in Core Image filters, calculate the aspect ratio as the image’
width over height.
Like other built-in filters, the lanczosScaleTransform() filter also outputs its result as a
CIImage.
Scale Image Size with the Lanczos Scale Filter


## Page 4

Important
To optimize computation, Core Image doesn’t actually render any intermediate CIImage result
until you force the CIImage to display its content onscreen, as you might do using UIImage
View.
Note
Core Image optimizes filtering by reordering the three chained filters and concatenating them
into a single image processing kernel, saving computation and rendering cycles.
In addition to trying out the built-in filters for a fixed effect, you can combine filters in certain Filte
Recipes to accomplish tasks such as Applying a Chroma Key Effect, Selectively Focusing on an
Image, Customizing Image Transitions, and Simulating Scratchy Analog Film.
class CIContext
The Core Image context class provides an evaluation context for Core Image processing with
Metal, OpenGL, or OpenCL.
class CIImage
A representation of an image to be processed or produced by Core Image filters.
See Also
Essentials


