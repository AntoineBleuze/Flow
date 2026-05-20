# 007_Applying vImage operations to regions of interest.pdf

## Page 1

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


## Page 2

If you’re developing apps with Xcode 14.0 or later, the vImage.PixelBuffer structure provide
the withUnsafeRegionOfInterest(_:_:) function, which simplifies applying operations to
ROIs. The following code creates the image above:
Applying operations to an ROI of a pixel buffer


## Page 3

On return, the destination vImage.PixelBuffer contains the final image.
This article implements the remaining code in this article as extensions to the vImage_Buffer
structure. The two function calls below created the image above:
For vImage routines that can operate in-place (that is, the operation mutates the source buffer’s
contents), create a mutating function that applies that routine to an ROI. The following code is the
function header for a desaturation function based around vImageMatrixMultiply
_ARGB8888(_:_:_:_:_:_:_:):
The function checks that the supplied ROI is within the bounds of the buffer.
Apply an in-place operation to an ROI


## Page 4

The following code calculates the first pixel in the source buffer for the ROI:
The start value defines the offset to the data pointer for a second vImage_Buffer structure
that references the source buffer’s data with a size that equals the ROI.
On return, desaturationBuffer contains a reference to the data in the source buffer that the
supplied ROI defines. Calling vImageMatrixMultiply_ARGB8888(_:_:_:_:_:_:_:) with
desaturationBuffer as both the source and the destination performs the matrix multiplicatio
on the pixels in the ROI:


## Page 5

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


## Page 6

vImage_Buffer.blurred_ARGB8888(regionOfInterest:blurRadius:) returns a buffe
that’s the same size as the source. The function copies all source pixels that are outside of the RO
to the destination. The following code creates the buffer that the function returns, and copies the
source pixels into the new buffer:
The out-of-place function uses the same approach as Applying vImage operations to regions of
interest, calculate the start of the ROI. The destination buffer for the blur operation references the
copied pixels in destination:
Finally, the vImageTentConvolve_ARGB8888(_:_:_:_:_:_:_:_:_:) function applies the
blur to the source and writes the result to blurDestination.


## Page 7

The following shows the result of blurring an ROI:


## Page 8

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


## Page 9

Compositing images with vImage blend modes
Combine two images by using blend modes to create a single output.
Optimizing image-processing performance
Improve your app’s performance by converting image buffer formats from interleaved to
planar.
vImage
Manipulate large images using the CPU’s vector processor.


