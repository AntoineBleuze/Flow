# Image Processing Essentials.pdf

## Page 1

When you work with bitmap images, you typically work with Core Graphics CGImage instances.
The vImage library provides functionality that allows you to work with Core Graphics bitmap
images. Typically, you convert a CGImage instance to a vImage buffer, apply operations to the
vImage buffer, and convert the transformed data to a new CGImage instance.
Conversions between Core Graphics-backed images and vImage buffers require a vImage
_CGImageFormat format structure. The format describes properties such as the color space, th
number of channels and how they’re ordered, and the size, in bits, of the color channels.
Create a vImage_CGImageFormat structure with hard-coded values when you need to perform
operations on image data with properties that your app defines at compile time. For example, the
code below initializes an 8-bit-per-channel ARGB format that’s suitable for working with vImage
.PixelBuffer structures with a vImage.Interleaved8x4 format.
Overview
Initialize an 8-bit Core Graphics image format from hard-
coded values
Accelerate / Converting bitmap data between Core Graphics images and vImage buffers
Article
Converting bitmap data between Core
Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate
images.


## Page 2

The init(cgImage:cgImageFormat:pixelFormat:) initializer creates a pixel buffer from a
CGImage instance and converts the source image data to the format that the vImage_CGImage
Format describes. If you’re working with vImage_Buffer structures, the vImageBuffer_Ini
WithCGImage(_:_:_:_:_:) function performs the same conversion and creates a buffer that
suitable for working with ARGB8888 operations, such as vImageConvolve_ARGB8888(_:_:_
_:_:_:_:_:_:_:_:).
The code below creates a buffer from a CGImage instance named cgImage and prints the values
of the first two pixels. The opaque alpha values (255) are the first value in each pixel as CGImage
AlphaInfo.noneSkipFirst defines.
For all the examples in this article, pass the vImage_CGImageFormat structure to the make
CGImage(cgImageFormat:) method to generate an output image.
On return, result is a four-channel 8-bit-per-channel image with CGImageAlphaInfo.none
SkipLast alpha ordering.


## Page 3

You can use the init(cgImage:cgImageFormat:pixelFormat:) initializer to convert an
image’s color model and bit depth. For example, you can specify a grayscale 32-bit format such a
the example below:
Initialize a 32-bit Core Graphics image format from hard-
coded values


## Page 4

In this case, the initializer uses the Rec. 601 luma coefficients to convert the RGB pixel values
(115, 136, 165) to a single grayscale pixel.
As above, pass the 32-bit format to makeCGImage(cgImageFormat:) to create a single-
channel 32-bit-per-channel image with no alpha information.
On return, result contains a grayscale version of the original image.


## Page 5

The init(cgImage:) initializer creates a new vImage_CGImageFormat structure that
describes a Core Graphics image’s properties.
Initialize a Core Graphics image format from a Core
Graphics image


## Page 6

In this example, the image’s inherent channel ordering is CGImageAlphaInfo.noneSkipLast.
The code below prints the first two pixels and shows that the opaque alpha values (255) are the
last two values in each pixel:
You can pass an empty vImage_CGImageFormat structure to the init(cgImage:cgImage
Format:pixelFormat:) initializer to instruct the initializer to populate the format with an
image’s properties. In this case, the initializer returns nil if the image’s and the pixel buffer’s bit
depths aren’t equal.
On return, the mutable format variable contains the image properties.
Initialize a Core Graphics image format from an image
during pixel buffer initialization


## Page 7

Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.
See Also
Image Processing Essentials


## Page 8

vImage_Buffer structures are the basic data structures that vImage uses for working with
images. They describe an image’s dimensions and contain the pixel data that vImage routines
operate on.
Typically, you’ll initialize a source buffer from an image and initialize and allocate a destination
buffer to receive the result of a vImage operation.
The vImage functions that initialize a buffer’s size and data require an instantiated vImage
_Buffer structure. Typically, you declare a buffer as a variable because these functions mutate
the buffer.
You can initialize a vImage buffer from a CGImage instance that’s acquired from the cgImage
property of an image. In the following example, the image is named Flowers_2.jpg. The
init(cgImage:format:flags:) function initializes a vImage_Buffer structure with the
image data using the format discussed in Converting bitmap data between Core Graphics images
and vImage buffers.
Overview
Initialize a Source Buffer from a Core Graphics Image
Accelerate / Creating and Populating Buffers from Core Graphics Images
Article
Creating and Populating Buffers from Core
Graphics Images
Initialize vImage buffers from Core Graphics images.


## Page 9

Typically, in addition to creating a buffer to represent your source image, you create a destination
buffer to receive the result of the vImage operation. In this case, you use the init(width:
height:bitsPerPixel:) function to initialize a buffer of a specified size and the correct
memory allocation for the bit-depth of the image:
After you’re finished with buffers that have have their own memory allocation, it’s important that
you free the memory allocated to them:
Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Initialize and Allocate a Destination Buffer
Free the Buffer Memory
See Also
Image Processing Essentials


## Page 10

Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.


## Page 11

vImage provides a function for creating Core Graphics images from vImage buffers. This function
allows you to display the results of a vImage operation to your user.
You create a Core Graphics image from the buffer, and initialize a UIImage instance from that. Th
createCGImage(format:flags:) function returns a CGImage instance based on the supplie
Core Graphics image format (for more information, see Converting bitmap data between Core
Graphics images and vImage buffers).
The following example shows how to create a Core Graphics image from a vImage buffer:
Overview
Create the Image
See Also
Image Processing Essentials
Accelerate / Creating a Core Graphics Image from a vImage Buffer
Article
Creating a Core Graphics Image from a
vImage Buffer
Create displayable representations of vImage buffers.


## Page 12

Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.


## Page 13

vImage provides fast and accurate high-level functions for image manipulation; for example,
compositing, convolution, and histogram operations. It operates on common image formats
through vImage_Buffer structures. vImage buffers describe the size of an image and the
number of bytes in each row, and point to the image pixel data. Buffers are initialized from Core
Graphics images, Core Video pixel buffers, or raw pixel data. The pixel data a buffer points to can
be used to create a new Core Graphics image or can be copied into a Core Video pixel buffer.
In the simplest workflow, you convert an image to a vImage buffer, apply an operation to the buffe
and convert the buffer back to an image. In this example, the width and height of the result are
one-third of the original:
To learn about initializing the buffers you’ll need to perform a scaling operation, see Converting
bitmap data between Core Graphics images and vImage buffers and Creating and Populating
Buffers from Core Graphics Images. In this example, you’ll need the image format and buffers
discussed in Creating and Populating Buffers from Core Graphics Images. However, you’ll use the
following code to initialize a destination buffer with a height and width that are a quarter of the
source dimensions.
Overview
Initialize an Image Format and vImage Buffers
Accelerate / Building a Basic Image-Processing Workflow
Article
Building a Basic Image-Processing
Workflow
Resize an image with vImage.


## Page 14

If you’re rescaling an image with premultiplied alpha (that is, with a bitmapInfo value with
CGImageAlphaInfo.premultipliedFirst or CGImageAlphaInfo.premultiplied
Last), before you apply the scale operation, see Building a Basic Image-Processing Workflow.
Otherwise, with the source and destination buffers properly initialized, you’re ready to perform th
scaling operation. Because your format contains four 8-bit channels, you use the vImageScale
_ARGB8888(_:_:_:_:) function. This function works equally well on all channel orderings; for
example, RGBA or BGRA.
The kvImageHighQualityResampling flag uses a high-quality Lanczos 5 x 5 resampling filte
If you require faster scaling, pass kvImageNoFlags.
destinationBuffer now contains the scaled version of sourceBuffer. To learn how to
display the scaled result to your user, see Creating a Core Graphics Image from a vImage Buffer.
After you’ve finished with the source and destination buffers, it’s important that you free the
memory allocated to them:
Apply the Scale Operation


## Page 15

If you’re rescaling an image with premultiplied alpha, you may see artifacts in high-frequency
regions of the image. To avoid this situation, unpremultiply the image data — that is, remove the
premultiplied alpha value from the image data — before the scaling operation, and premultiply the
scaled result.
This code shows the additional operations required, with error handling removed for brevity:
Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Avoid Artifacts by Unpremultiplying
See Also
Image Processing Essentials


## Page 16

Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.


## Page 17

The vImage library provides a suite of functions to apply different geometric transforms to images
The image below shows examples of reflect, scale, rotate, and composite translate-rotate-scale
transforms:
By default, vImage uses the Lanczos-3 algorithm when resampling. If you need the higher-quality
results of the Lanczos-5 algorithm and don’t mind slightly slower performance, pass the kvImag
HighQualityResampling flag to the geometric transform operations.
The vImage geometry operations don’t work in-place, that is, you can’t use the same buffer as th
source and destination.
If you’re applying a geometric transform to an image with premultiplied alpha, you may see artifac
in high-frequency regions of the image. To avoid these artifacts, call vImageUnpremultiply
Data_ARGB8888(_:_:_:) to remove the premultiplied alpha value from the image data before
the operation. After the operation, call vImagePremultiplyData_ARGB8888(_:_:_:) to
premultiply the result.
The vImage reflect functions generate either a vertical or a horizontal reflection of the image. The
image below shows the original buffer contents and the contents after vertical reflection:
Overview
Reflect a vImage buffer
Accelerate / Applying geometric transforms to images
Article
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.


## Page 18

The destination buffer you pass to the vImage reflect functions needs to be the same size as the
source buffer. The code below uses a precondition to ensure that both buffer sizes match:
To learn more about reflection functions, see Image reflection.
The vImage shear functions scale and offset an image in one dimension. These functions accept 
resampling filter that you use for fine control over the resampling algorithm. For more information
on resampling, see Reducing artifacts with custom resampling filters.
Shear a vImage buffer


## Page 19

Control the amount of shear by specifying the shearSlope parameter. The functions define the
shear slope as deltaᵧ/deltaₓ that’s the slope for a linear function y = slope * x. The
verticalShearBuffer(source:destination:byAngleInDegrees:verticalScale:
backgroundColor:) function accepts the shear as an angle in degrees and performs the
transform.


## Page 20

To fit the sheared image in a buffer with the same dimensions as the original image, specify a she
angle that’s the arctangent of the image’s height divided by twice its width.
On return, the destination buffer contains the image below:


## Page 21

To learn more about shearing functions, see Image shearing.
The vImage library provides 90° rotation functions that perform a simple 0°, 90°, 180°, or 270°
rotation of an image around its center. The image below shows a buffer’s contents without any
rotation, rotated 90° counterclockwise, rotated 180°, and rotated 90° clockwise:
Note that the 90° and 270° rotations don’t rotate around the true center of the image when the
parity (that is, whether an integer is even or odd) of the source width and destination height don’t
match. The same is true if the parity of the source height and destination width don’t match.
If the source and destination buffers are different sizes, the 0° and 180° rotations require that the
two heights have the same parity and the two widths have the same parity.
The 90° rotation function crops source pixels that lie outside the destination buffer and fills
destination pixels with the specified background color when source pixels don’t cover them.
The function below applies a multiple of 90° rotation to a buffer and returns the result in a correct
oriented destination buffer:
Rotate a vImage buffer by multiples of 90°


## Page 22

To learn more about rotation functions, see Image rotation.
The vImage library provides rotation functions that rotate an image by any angle around its center
The image below shows a buffer rotated 60° counterclockwise:
Rotate a vImage buffer by an arbitrary angle


## Page 23

The function below rotates a buffer by the specified angle and writes the result to the destination


## Page 24

The vImage library provides functions to scale the contents of an image buffer. The scaling can
either be uniform, where the operation preserves the image’s aspect ratio, or nonuniform, where
the operation stretches or condenses the image. The image below shows four scaled versions of
the same photograph, with the second and third image scaled nonuniformly:
The vImage scale functions accept source and destination buffers as parameters and rescale the
source to fill the destination buffer. The function below wraps vImageScale_ARGB8888(_:_:_
_:) to provide a simple interface to the scale operation:
To learn more about scaling functions, see Image scaling.
Use an affine transformation to apply composite transformation, such as a scale and a translate.
A 3-by-3 matrix represents an affine transformation.
Scale a vImage buffer
Apply a simple affine transformation to a vImage buffer


## Page 25

Because the third column is always (0,0,1), the vImage_CGAffineTransform data structur
contains values for only the first two columns.
To perform a scale transformation, set the a and d parameters of the matrix to the required scale.
To perform the translate transformation, set the tx and ty parameters of the matrix to the required
offset.
The scaleAndCenterBuffer(source:destination:to:backgroundColor:) function
accepts a scale parameter and sets that parameter as the a and d parameters of the matrix.


## Page 26

The image below shows the result of applying scaleAndCenterBuffer(_:to:background
Color:) with a scale of 0.25:
To learn more about affine transformation functions, see Applying affine transformations to image
For complex transformations, CGAffineTransform allows you to concatenate a series of
transformations. For example, to rotate and scale an image to fit within its unrotated bounding bo
your code needs to translate, rotate, scale, and translate again.
The rotateAndScaleBuffer(source:destination:byAngleInDegrees:background
Color:) function uses CGAffineTransform to build the matrix required to rotate and scale an
image to fit inside the bounding box of the destination buffer.
Apply a complex affine transformation to a vImage buffer


## Page 27

The image below shows the result of applying rotateAndScaleBuffer(_:byAngleIn
Degrees:backgroundColor:) with an angle of 30°:
The vImage rotate, scale, and affine transform functions use multiple-pass algorithms that save
intermediate pixel values between passes. In some cases, the destination buffer may not be large
enough to store that intermediate data, so the operation requires additional, temporary storage.
Pass nil to the function to have vImage create and manage this temporary storage for you. For
example, the scale function below relies on the operation to manage the temporary buffer:
Optimize performance with temporary buffers


## Page 28

In cases where your code calls the function frequently (for example, when processing video),
create and manage this temporary buffer yourself and reuse it across function calls. Reusing a
buffer avoids vImage allocating the temporary storage with each call. Pass kvImageGetTemp
BufferSize to your geometry function to calculate the size, in bytes, of the temporary buffer, a
use that value to allocate an UnsafeMutableRawPointer structure.
The version of the scaleBuffer() function below shows an example of creating a temporary
buffer:


## Page 29

Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.
See Also
Image Processing Essentials


## Page 30

vImage provides a suite of functions for compositing two source images into one output. Alpha
blending uses the alpha value of each pixel in the top layer to determine the visibility of the bottom
layer.
The figure below shows the alpha composite of an image of a building with a transparent
background over an image of a texture. The transparent part of the building image has an alpha o
zero, indicating the background layer is fully visible.
Overview
Accelerate / Compositing images with alpha blending
Article
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.


## Page 31

Use the vImagePremultipliedAlphaBlend_ARGB8888(_:_:_:_:) function to blend two
images when the top image contains alpha information (for example, when compositing text over 
photograph). The images that you pass to vImagePremultipliedAlphaBlend_ARGB8888(_
_:_:_:) need to have the premultiplied alpha information in the first channel.
The following function performs an alpha composite of two CGImage instances and returns the
result as a CGImage instance:
Perform an alpha composite


## Page 32

Because the blending function vImagePremultipliedAlphaBlend_ARGB8888(_:_:_:_:)
requires that the alpha channel source buffers are first, the code calls convertToARGB(_:alph
Info:) to ensure the correct ordering. The convertToARGB(_:alphaInfo:) function check
the channel ordering from the source image’s alpha information and permutes the channels if the
ordering isn’t alpha-first.
The premultiply(_:alphaInfo:) function uses a CGImage instance’s alpha information to
determine whether an image contains premultiplied alpha. This function ensures that the top laye
that the function passes to the composite operation contains premultiplied pixels.


## Page 33

vImage provides functions to perform an alpha composite using a single alpha value. The function
apply the constant alpha value you supply combined with the top image’s existing alpha to the top
layer’s color channels and alpha channels. For each pixel, the constant alpha functions perform th
following operation:
To perform an alpha composite with a constant alpha, replace the call to vImagePremultiplie
AlphaBlend_ARGB8888(_:_:_:_:) in the code listing in Compositing images with alpha
blending with the following code:
The following image shows the result of compositing with vImagePremultipliedConstAlpha
Blend_ARGB8888(_:_:_:_:_:) using a constant alpha with a value of 191. The background o
the building remains transparent, but the parts of the image that were originally opaque now show
some of the lower layer.
Perform an alpha composite with a single alpha value


## Page 34

Use the vImageOverwriteChannels_ARGB8888(_:_:_:_:_:) function to overwrite an
image’s alpha channel. The following shows an example of setting a radial gradient as the alpha
channel of an image to produce a vignette style blend:
The vImageOverwriteChannels_ARGB8888(_:_:_:_:_:) function requires buffers with
nonpremultiplied alpha.
Perform an alpha composite with an overwritten alpha
channel


## Page 35

The radialComposite(topImage:bottomImage:) function performs an alpha composite o
two CGImage instances with a procedural radial gradient.


## Page 36

The code calls unpremultiply(_:alphaInfo:) to unpremultiply an image if its alpha
information indicates it contains premultiplied pixels.
The radialComposite(topImage:bottomImage:) function calls makeRadial
Gradient(_:) to populate the gradient buffer with a radial gradient. The code generates the
radial gradient by multiplying a height * 1 matrix by a 1 * width matrix. Both factors contain
values that follow a bell-shaped curve.


## Page 37

See Also


## Page 38

Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.
Image Processing Essentials


## Page 39

vImage provides a suite of functions for compositing two source images into one output. These
blend mode functions implement different algorithms to determine the output color. For example,
the multiply blend mode sets each output pixel as the product of the two corresponding input
pixels.
The blend mode functions work on 8-bit RGBA source images in a premultiplied format. You can
convert a nonpremultiplied buffer to a premultiplied format by using vImagePremultiplyData
_RGBA8888(_:_:_:).
The blend mode functions accept two vImage_Buffer structures as the bottom and top layers 
the compositing operation. The examples that follow use the image below on the left as the botto
layer and the image below on the right as the top layer.
Overview
Accelerate / Compositing images with vImage blend modes
Article
Compositing images with vImage blend
modes
Combine two images by using blend modes to create a single output.


## Page 40

The top-layer source image consists of four sections:
The top-left quadrant is solid white ([255, 255, 255]).
The top-right quadrant is identical to the corresponding quadrant of the bottom image.
The bottom-left quadrant is solid mid-gray ([127, 127, 127]).
The bottom-right quadrant is solid black ([0, 0, 0]).
Both images are fully opaque.
Use the vImagePremultipliedAlphaBlendLighten_RGBA8888(_:_:_:_:) function to
composite two layers using the lighten blend mode. You can use the lighten blend mode to apply 
overall lightening effect to images.
The lighten blend mode sets each channel of the destination pixel as the lightest value for the
corresponding channel of the two source layers. The image below shows the result of compositin
using the lighten blend mode:
The top-left quadrant in the result is white because no pixels in the bottom layer are brighter than
the corresponding pixels in the top layer.
Composite images using the lighten blend mode


## Page 41

The bottom-left quadrant in the result looks washed out because the operation selects gray pixel
from the top layer over corresponding dark pixels from the bottom layer.
Use the vImagePremultipliedAlphaBlendDarken_RGBA8888(_:_:_:_:) function to
composite two layers using the darken blend mode. You can use the darken blend mode to apply
an overall darkening effect to images.
The darken blend mode sets each channel of the destination pixel as the darkest value for the
corresponding channel of the two source layers. The image below shows the result of compositin
using the darken blend mode:
The bottom-right quadrant in the result is black because no pixels in the bottom layer are darker
than the corresponding pixels in the top layer.
The bottom-left quadrant in the result looks darker than the corresponding quadrant in the bottom
layer. This is because the operation selects gray pixels from the top layer over corresponding ligh
pixels from the bottom layer.
Composite images using the darken blend mode
Composite images using the screen blend mode


## Page 42

Use the vImagePremultipliedAlphaBlendScreen_RGBA8888(_:_:_:_:) function to
composite two layers using the screen blend mode. You can use the screen blend mode to lighten
images without affecting the darkest areas.
The screen blend mode sets the destination pixel as the inverted product of the inverted
corresponding source pixels. The image below shows the result of compositing using the screen
blend mode:
The bottom-right quadrant in the result is identical to the corresponding quadrant in the bottom
layer because the operation multiplies each bottom-layer pixel value by 1.0. For example, if the
source pixel value is 0.5, the destination pixel value is 0.5.
The top-right quadrant in the result is brighter than the corresponding quadrant in the bottom lay
In this quadrant, the top-layer and bottom-layer pixel values are identical. For example, if the
source pixel value is 0.5, the destination pixel value is 0.75.
Composite images using the multiply blend mode


## Page 43

Use the vImagePremultipliedAlphaBlendMultiply_RGBA8888(_:_:_:_:) function to
composite two layers using the multiply blend mode. You can the use multiply blend mode to
darken images without affecting the lightest areas.
The multiply blend mode sets the destination pixel as the product of the corresponding source
pixels. The image below shows the result of compositing using the multiply blend mode:
The bottom-right quadrant in the result is black because the operation multiplies each bottom-
layer pixel value by 0.0 from the top layer.
The top-left quadrant in the result is identical to the corresponding quadrant in the bottom layer
because the operation multiplies each bottom-layer pixel value by 1.0.
The top-right quadrant in the result is darker than the corresponding quadrant in the bottom layer
In this quadrant, the top-layer and bottom-layer pixel values are identical. For example, if the
source pixel value is 0.5, the destination pixel value is 0.25.
See Also
Related Documentation


## Page 44

Alpha compositing
Composite images together.
Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.
Image Processing Essentials


## Page 45

You can apply vImage operations, such as blurs and color transforms, to specified rectangular
areas in an image, commonly referred to as regions of interest (ROI). Limiting the effect of an
operation is useful when, for example, you want to overlay user interface elements on top of a
blurred part of an image to make them stand out.
The following image is an example of the effects possible when you use the techniques in this
article. The image shows a single photograph with a portrait-format ROI that the code has
desaturated and a landscape-format ROI that the code has blurred.
Overview
Accelerate / Applying vImage operations to regions of interest
Article
Applying vImage operations to regions of
interest
Limit the effect of vImage operations to rectangular regions of interest.


## Page 46

If you’re developing apps with Xcode 14.0 or later, the vImage.PixelBuffer structure provide
the withUnsafeRegionOfInterest(_:_:) function, which simplifies applying operations to
ROIs. The following code creates the image above:
Applying operations to an ROI of a pixel buffer


## Page 47

On return, the destination vImage.PixelBuffer contains the final image.
This article implements the remaining code in this article as extensions to the vImage_Buffer
structure. The two function calls below created the image above:
For vImage routines that can operate in-place (that is, the operation mutates the source buffer’s
contents), create a mutating function that applies that routine to an ROI. The following code is the
function header for a desaturation function based around vImageMatrixMultiply
_ARGB8888(_:_:_:_:_:_:_:):
The function checks that the supplied ROI is within the bounds of the buffer.
Apply an in-place operation to an ROI


## Page 48

The following code calculates the first pixel in the source buffer for the ROI:
The start value defines the offset to the data pointer for a second vImage_Buffer structure
that references the source buffer’s data with a size that equals the ROI.
On return, desaturationBuffer contains a reference to the data in the source buffer that the
supplied ROI defines. Calling vImageMatrixMultiply_ARGB8888(_:_:_:_:_:_:_:) with
desaturationBuffer as both the source and the destination performs the matrix multiplicatio
on the pixels in the ROI:


## Page 49

To learn more about using matrix multiplication to convert color images to grayscale, see
Converting color images to grayscale.
The following shows the result of desaturating an ROI:
For vImage routines that don’t operate in-place, create a non-mutating function that applies that
routine to an ROI and returns a new vImage_Buffer structure that contains the result.
The following code is the function header for a blurring function that applies vImageTent
Convolve_ARGB8888(_:_:_:_:_:_:_:_:_:):
The function performs the same check as Applying vImage operations to regions of interest on th
ROI size:
Apply an out-of-place operation to an ROI


## Page 50

vImage_Buffer.blurred_ARGB8888(regionOfInterest:blurRadius:) returns a buffe
that’s the same size as the source. The function copies all source pixels that are outside of the RO
to the destination. The following code creates the buffer that the function returns, and copies the
source pixels into the new buffer:
The out-of-place function uses the same approach as Applying vImage operations to regions of
interest, calculate the start of the ROI. The destination buffer for the blur operation references the
copied pixels in destination:
Finally, the vImageTentConvolve_ARGB8888(_:_:_:_:_:_:_:_:_:) function applies the
blur to the source and writes the result to blurDestination.


## Page 51

The following shows the result of blurring an ROI:


## Page 52

Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
See Also
Image Processing Essentials


## Page 53

Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.


## Page 54

The vImage library operates on image data with two memory layouts:
Interleaved stores each pixel’s color data consecutively in a single buffer. For example, the data
that describes a 4-channel image (red, green, blue, and alpha) would be stored as
RGBARGBARGBA…
Planar stores each color channel in separate buffers. For example, a 4-channel image would be
stored as four individual buffers containing red, green, blue, and alpha data.
Because many vImage functions operate on a single color channel at a time — by converting an
interleaved buffer to planar buffers — you can often improve your app’s performance by doing thi
conversion manually. However, most vImage functions are available in both the interleaved and
planar variants, so before you do the conversion, try both to see which works better in your conte
In some cases, you may not want to apply a vImage operation to all four channels of an image. Fo
example, you may know beforehand that the alpha channel is irrelevant in the images that you’re
dealing with, or perhaps all of your images are grayscale and you need to operate on only one
Overview
Accelerate / Optimizing image-processing performance
Article
Optimizing image-processing
performance
Improve your app’s performance by converting image buffer formats from
interleaved to planar.


## Page 55

channel. Using planar formats makes it possible to isolate and work with only the channels you
need.
Typically, your source imagery is in interleaved format, and your default option will be to use the
interleaved variant of a vImage function. For example, the following code scales a Core Graphics
image to one tenth of its original size. Note that the 4-channel, 8-bit-per-channel interleaved pixe
buffer scale(destination:) function calls vImageScale_ARGB8888(_:_:_:_:).
You can use ContinuousClock to measure the execution time.
The pixel buffer init(cgImage:cgImageFormat:pixelFormat:) initializer and the vImage
buffer vImageBuffer_InitWithCGImage(_:_:_:_:_:) function both populate a buffer
based on the properties of a vImage_CGImageFormat structure.
For example, the following code creates an interleaved 3-channel, 8-bit-per-channel vImage
.PixelBuffer structure from the source Core Graphics image. The code calls
deinterleave(destination:) to deinterleave the image data and populate the individual re
green, and blue planar pixel buffers.
Review interleaved performance
Convert an interleaved source buffer to planar buffers


## Page 56

Create an interleaved 3-channel, 8-bit-per-channel destination buffer and three planar destinatio
buffers:
Use the withTaskGroup(of:returning:body:) function to start a new scope that contains
the three planar scale operations. Note that the 8-bit planar scale(destination:) function
Initialize the destination buffers
Apply the scale operation to the planar buffers


## Page 57

calls vImageScale_Planar8(_:_:_:_:).
In the code below, the interleave(destination:) function interleaves the three planar
buffers and populates the interleaved destination buffer with the scaled image:
The following code calls makeCGImage(cgImageFormat:) to create a Core Graphics image
from the result of the scale operation:
Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
See Also
Image Processing Essentials


## Page 58

Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
vImage
Manipulate large images using the CPU’s vector processor.


## Page 59

vImage is a high-performance image processing framework. It includes functions for image
manipulation—convolutions, geometric transformations, histogram operations, morphological
transformations, and alpha compositing—as well as utility functions for format conversions and
other operations.
vImage optimizes image processing by using the CPU’s vector processor. If a vector processor is
not available, vImage uses the next best available option. This framework allows you to reap the
benefits of vector processors without the need to write vectorized code.
vImage is particularly suited for:
Efficiently processing large images
Real-time video processing software
Scientific applications that require high-accuracy numerical calculations
Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Overview
Topics
First Steps
Accelerate / vImage
API Collection
vImage
Manipulate large images using the CPU’s vector processor.


## Page 60

Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
enum vImage
An enumeration that acts as a namespace for Swift overlays to vImage.
Using vImage pixel buffers to generate video effects
Render real-time video effects with the vImage Pixel Buffer.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Adjusting the brightness and contrast of an image
Use a gamma function to apply a linear or exponential curve.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Sharing texture data between the Model I/O framework and the vImage library
Use Model I/O and vImage to composite a photograph over a computer-generated sky.
Calculating the dominant colors in an image
Swift Overlay
vImage Pixel Buffers


## Page 61

Find the main colors in an image by implementing k-means clustering using the Accelerate
framework.
struct PixelBuffer
An image buffer that stores an image’s pixel data, dimensions, bit depth, and number of
channels.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage buffers
Use buffers to pass image data to and from vImage operations.
Core Graphics interoperability
Pass image data between the Core Graphics framework and the vImage library.
Integrating vImage pixel buffers into a Core Image workflow
Share image data between Core Video pixel buffers and vImage buffers to integrate vImage
operations into a Core Image workflow.
Applying vImage operations to video sample buffers
Use the vImage convert-any-to-any functionality to perform real-time image processing of
video frames streamed from your device’s camera.
Converting luminance and chrominance planes to an ARGB image
Create a displayable ARGB image using the luminance and chrominance information from yo
device’s camera.
Improving the quality of quantized images with dithering
Apply dithering to simulate colors that are unavailable in reduced bit depths.
Core Video interoperability
Pass image data between Core Video and vImage.
vImage Buffers
Core Graphics Interoperability
Core Video Interoperability


## Page 62

Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Blurring an image
Filter an image by convolving it with custom and high-speed kernels.
Adding a bokeh effect to images
Simulate a bokeh effect by applying dilation.
Converting color images to grayscale
Convert an RGB image to grayscale using matrix multiplication.
Building a basic image conversion workflow
Learn the fundamentals of the convert-any-to-any function by converting a CMYK image to 
RGB image.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Reducing artifacts with custom resampling filters
Implement custom linear interpolation to prevent the ringing effects associated with scaling 
image with the default Lanczos algorithm.
Finding the sharpest image in a sequence of captured images
Share image data between vDSP and vImage to compute the sharpest image from a
bracketed photo sequence.
vImage Operations
Apply image manipulation operations to vImage buffers.
Data Types and Constants
Look up type aliases, data types, and constants the vImage library uses.
vImage Operations
Data Types and Constants


## Page 63

vImage Macros
Converting bitmap data between Core Graphics images and vImage buffers
Pass image data between Core Graphics and vImage to create and manipulate images.
Creating and Populating Buffers from Core Graphics Images
Initialize vImage buffers from Core Graphics images.
Creating a Core Graphics Image from a vImage Buffer
Create displayable representations of vImage buffers.
Building a Basic Image-Processing Workflow
Resize an image with vImage.
Applying geometric transforms to images
Reflect, shear, rotate, and scale image buffers using vImage.
Compositing images with alpha blending
Combine two images by using alpha blending to create a single output.
Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Applying vImage operations to regions of interest
Limit the effect of vImage operations to rectangular regions of interest.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
Macros
See Also
Image Processing Essentials


