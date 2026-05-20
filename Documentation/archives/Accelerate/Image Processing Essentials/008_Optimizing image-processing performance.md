# 008_Optimizing image-processing performance.pdf

## Page 1

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


## Page 2

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


## Page 3

Create an interleaved 3-channel, 8-bit-per-channel destination buffer and three planar destinatio
buffers:
Use the withTaskGroup(of:returning:body:) function to start a new scope that contains
the three planar scale operations. Note that the 8-bit planar scale(destination:) function
Initialize the destination buffers
Apply the scale operation to the planar buffers


## Page 4

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


## Page 5

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


