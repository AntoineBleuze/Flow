# 003_Building a Basic Image-Processing Workflow.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


