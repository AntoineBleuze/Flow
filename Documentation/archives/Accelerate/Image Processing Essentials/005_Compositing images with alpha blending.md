# 005_Compositing images with alpha blending.pdf

## Page 1

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


## Page 2

Use the vImagePremultipliedAlphaBlend_ARGB8888(_:_:_:_:) function to blend two
images when the top image contains alpha information (for example, when compositing text over 
photograph). The images that you pass to vImagePremultipliedAlphaBlend_ARGB8888(_
_:_:_:) need to have the premultiplied alpha information in the first channel.
The following function performs an alpha composite of two CGImage instances and returns the
result as a CGImage instance:
Perform an alpha composite


## Page 3

Because the blending function vImagePremultipliedAlphaBlend_ARGB8888(_:_:_:_:)
requires that the alpha channel source buffers are first, the code calls convertToARGB(_:alph
Info:) to ensure the correct ordering. The convertToARGB(_:alphaInfo:) function check
the channel ordering from the source image’s alpha information and permutes the channels if the
ordering isn’t alpha-first.
The premultiply(_:alphaInfo:) function uses a CGImage instance’s alpha information to
determine whether an image contains premultiplied alpha. This function ensures that the top laye
that the function passes to the composite operation contains premultiplied pixels.


## Page 4

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


## Page 5

Use the vImageOverwriteChannels_ARGB8888(_:_:_:_:_:) function to overwrite an
image’s alpha channel. The following shows an example of setting a radial gradient as the alpha
channel of an image to produce a vignette style blend:
The vImageOverwriteChannels_ARGB8888(_:_:_:_:_:) function requires buffers with
nonpremultiplied alpha.
Perform an alpha composite with an overwritten alpha
channel


## Page 6

The radialComposite(topImage:bottomImage:) function performs an alpha composite o
two CGImage instances with a procedural radial gradient.


## Page 7

The code calls unpremultiply(_:alphaInfo:) to unpremultiply an image if its alpha
information indicates it contains premultiplied pixels.
The radialComposite(topImage:bottomImage:) function calls makeRadial
Gradient(_:) to populate the gradient buffer with a radial gradient. The code generates the
radial gradient by multiplying a height * 1 matrix by a 1 * width matrix. Both factors contain
values that follow a bell-shaped curve.


## Page 8

See Also


## Page 9

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


