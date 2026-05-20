# Image Resampling.pdf

## Page 1

Most vImage geometric functions use resampling kernels, which combine data from a target pixe
and other nearby pixels to calculate a value for the destination pixel. Resampling image data
reduces unwanted artifacts, like interference patterns, in the destination image.
This procedure is somewhat similar to that used for convolution. However—in contrast to
convolution—for geometric operations, the resampling kernel itself is resampled during the proce
of pairing kernel values against the sampled pixel data. The kernel is evaluated at both fractional
and integral pixel locations. This has implications for the nature of the kernel—which must be
supplied as a function rather than as a matrix. A resampling kernel function is also called a
resampling filter, or simply a filter.
For almost all geometric operations, vImage supplies a default resampling filter unless you set the
flag kvImageHighQualityResampling, in which case vImage uses a higher-quality filter.
However, the performance of that filter may be slower.
The reflection and high-level rotation functions don’t resample. The shear functions can either us
a default resampling filter or, if you require more control, a custom filter that you provide.
Image shearing
Shear images horizontally and vertically.
Overview
See Also
Related Documentation
Accelerate / Resampling in vImage
Article
Resampling in vImage
Learn how vImage resamples image data during geometric operations.


## Page 2

Reducing artifacts with custom resampling filters
Implement custom linear interpolation to prevent the ringing effects associated with scaling 
image with the default Lanczos algorithm.
Image shearing
Shear images horizontally and vertically.
Image Resampling


## Page 3

Most vImage geometry operations, such as scale and rotate, use a process known as resampling 
prevent image artifacts. vImage resamples with kernels that combine data from a target pixel and
other nearby pixels to calculate a value for the destination pixel.
Because resampling involves evaluating the kernel at fractional pixel locations, the process relies
on a family of kernel matrices for use at different fractional distances through a given pixel. This
sample code app provides a function that generates this family of kernels – unlike operations suc
as convolution and morphology, which apply a single kernel matrix at the center of each pixel.
For most vImage geometric operations, vImage supplies a default resampling filter that is an
implementation of the Lanczos resampling method. However, the Lanczos method can produce
ringing effects near regions of high-frequency signals (that is, regions that contain a lot of pixel
variation, such as the hard edges typical of line art). To correct this, this sample code app
implements a linear interpolation as a custom resampling filter.
This app allows the user to toggle between the default resampling filter (Lanczos) and the custom
resampling filter. The code declares the filter independently of initialization to support that
functionality:
Overview
Declare the resampling filter
Accelerate / Reducing artifacts with custom resampling filters
Sample Code
Reducing artifacts with custom
resampling filters
Implement custom linear interpolation to prevent the ringing effects associated
with scaling an image with the default Lanczos algorithm.
Download
macOS 13.0+
Xcode 14.3+


## Page 4

The following code initializes a default Lanczos resampling filter:
On return, resamplingFilter is an initialized Lanczos resampling filter with the specified scale
factor.
The vImage shear functions accept the resampling filter and perform the scaling. The shear
functions operate in one dimension at a time, so to scale an image in both dimensions, the sample
code calls shear(direction:translate:slope:resamplingFilter:background
Color:destination:) twice. The first call passes vImage.ShearDirection.vertical,
and the second call passes vImage.ShearDirection.horizontal.
Because these functions don’t work in place – that is, they require separate input and output
buffers – the code uses an intermediate buffer to pass data from the vertical shear to the horizon
shear.
Use shear operations to scale an image


## Page 5

On return of the horizontal shear function, destinationBuffer contains the source image,
scaled about its center. The following shows an image of several small dots, magnified 30 times
using the Lanczos resampling filter:
The ringing artifacts appear as faint lines between the magnified dots.
The shear functions that scale an image are both 1D, and therefore the resampling filter function
the sample code project creates is also 1D. The code applies the same filter function for both the
vertical and horizontal passes.
The function generates a set of kernel values based on a set of distances that the pixel being
transformed supplies –- read from inPointer. The system assigns the generated kernel values 
outPointer.
In the following example, the kernel values are inversely proportional to the distance; the further a
pixel is from the transformed pixel, the smaller the corresponding kernel value. After calculating th
kernel values, the values scale (normalize) so that their sum is 1.0. This normalization step
ensures the final image is the same brightness as the original.
Write a linear resampling filter function


## Page 6

For example, if the system passes the following pixel positions to inPointer:
The values in the kernelValues array are:
Dividing each of the values in kernelValues by its sum returns the normalized kernel values tha
the code assigns to the resampling function’s outPointer:
The values that the resampling function generates form a 1D convolution kernel that the shear
functions use in a similar way to the 1D convolution described in Blurring an image. However, unlik
the kernels used for convolution, the resampling kernel is suitable for use with fractional pixel
positions.
The resampling function, the scale factor, and the kernel width combine to determine the memory
that the resampling function requires. The sample code uses the vImageGetResamplingFilt
Allocate the resampling filter function memory


## Page 7

Size(_:_:_:_:) function to calculate the size in bytes, and the allocate(byteCount:
alignment:) function to allocate the necessary memory.
On return, resamplingFilter is a ResamplingFilter structure, allocated with the correct
amount of uninitialized memory.
The sample code calls vImageNewResamplingFilterForFunctionUsingBuffer(_:_:_:
_:_:_:) to create the resampling filter and populate resamplingFilter.
Scaling using a custom resampling filter is the same process as using the default Lanczos
resampling:
Create a linear resampling filter


## Page 8

The following shows the same image that the Lanczos example uses, also maginifed 30 times.
Linear resampling eliminates the ringing artifacts.
After the sample app is finished working with the resampling filter, it’s important that it frees the
allocated memory. This process will vary depending on whether the code has used the default or 
custom filter. The following code frees the memory for the default:
The following code frees the memory for custom resampling filters:
Free the resampling filter memory


## Page 9

Resampling in vImage
Learn how vImage resamples image data during geometric operations.
Image shearing
Shear images horizontally and vertically.
See Also
Image Resampling


## Page 10

Single-precision horizontal shearing
Apply single-precision horizontal shearing to images.
Double-precision horizontal shearing
Apply double-precision horizontal shearing to images.
Single-precision vertical shearing
Apply single-precision vertical shearing to images.
Double-precision vertical shearing
Apply double-precision vertical shearing to images.
func vImageNewResamplingFilter(Float, vImage_Flags) -> ResamplingFilter
Creates a resampling filter object that corresponds to the default kernel supplied by the
vImage framework.
Topics
Shearing an image horizontally
Shearing an image vertically
Resampling filters
Accelerate / Image shearing
API Collection
Image shearing
Shear images horizontally and vertically.


## Page 11

func vImageNewResamplingFilterForFunctionUsingBuffer(ResamplingFilter,
Float, ((UnsafePointer<Float>?, UnsafeMutablePointer<Float>?, UInt,
UnsafeMutableRawPointer?) -> Void)!, Float, UnsafeMutableRawPointer!, v
Image_Flags) -> vImage_Error
Creates a resampling filter object that encapsulates a resampling kernel function that you
provide.
func vImageGetResamplingFilterExtent(ResamplingFilter, vImage_Flags) ->
vImagePixelCount
Returns the maximum sampling radius for a resampling filter.
func vImageGetResamplingFilterSize(Float, ((UnsafePointer<Float>?,
UnsafeMutablePointer<Float>?, UInt, UnsafeMutableRawPointer?) -> Void)!
Float, vImage_Flags) -> Int
Returns the minimum size, in bytes, for the buffer needed by the new resampling filter
function.
func vImageDestroyResamplingFilter(ResamplingFilter!)
Disposes of a resampling filter object.
Resampling in vImage
Learn how vImage resamples image data during geometric operations.
Reducing artifacts with custom resampling filters
Implement custom linear interpolation to prevent the ringing effects associated with scaling 
image with the default Lanczos algorithm.
See Also
Image Resampling


