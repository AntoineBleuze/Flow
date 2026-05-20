# Convolution and Morphology.pdf

## Page 1

This sample code project uses a variety of convolution techniques to blur an image with custom
kernels and built-in high-speed kernels. Convolution is a common image-processing technique th
changes the value of a pixel according to the values of its surrounding pixels. Many common imag
filters, such as blurring, detecting edges, sharpening, and embossing, derive from convolution.
Kernels form the basis of convolution operations. Kernels are 1D or 2D grids of numbers that
indicate the influence of a pixel’s neighbors on its final value. To calculate the value of each
transformed pixel, add the products of each surrounding pixel value with the corresponding kerne
value. During a convolution operation, the kernel passes over every pixel in the image, repeating
this procedure, and then applies the effect to the entire image.
Overview
Accelerate / Blurring an image
Sample Code
Blurring an image
Filter an image by convolving it with custom and high-speed kernels.
Download
macOS 13.3+
Xcode 14.3+


## Page 2

Kernels don’t need to have the same height and width, and can be 1D (that is, either the height or
the width is 1) or 2D (that is, both the height and the width are greater than 1). When a convolutio
operation transforms a pixel, both dimensions must be odd numbers to center the kernel over the
pixel.
The simplest kernel, known as an identity kernel, contains a single value: 1. The following formula
shows the result when applying the kernel to the central value in a grid of nine values. It multiplies
the pixel by the central value in the convolution kernel, and then multiplies the surrounding pixel
values by 9. The sum of these values is 0.5.
An image remains unchanged when convolving it with an identity kernel.
Run the sample


## Page 3

To convolve an image, select a blur filter from the SwiftUI Picker control.
A box blur kernel returns the average value of the neighboring pixels. In the following example, the
kernel contains nine values and the result is the sum of 1 divided by 9 multiplied by each of the
pixel values:
Note that the sum of the values in the convolution kernel above is 1 — that is, the kernel is
normalized. If the sum of the values is greater than 1, the resulting image is brighter than the
source. If the sum is less than 1, the resulting image is darker than the source.
A more complex blurring kernel varies the influence of pixels according to their distance from the
center of the kernel, and yields a smoother blurring effect. The following kernel (based on a Hann
window) is suitable for use with an integer format (for example, vImage.Interleaved8x4)
convolution:
The example below shows the result of blurring an image using kernel2D:
Blur an image with a 2D kernel


## Page 4

The sample passes kernels as arrays of integers to the integer format convolution filters. To
normalize an integer kernel, the sample passes a divisor to the function that is the sum of the
elements of the kernel.
The following example shows how to use convolve(with:divisor:bias:edgeMode:
destination:) to perform a convolution and populate a destination buffer with the result:
The kernel2D kernel described in the previous section is separable; that is, it’s the outer produc
of a 1D horizontal kernel and a 1D vertical kernel. A separable kernel allows splitting of the 2D
convolution into two 1D passes, resulting in faster processing times. The following formula shows
the two vectors that form kernel2D:
Blur an image with a separable kernel


## Page 5

The separable convolution functions in vImage work on planar buffers. The sample uses the
following code to create planar source and destination buffers, and to convert the interleaved
source image to planar:
To learn more about working with planar buffers, see Optimizing image-processing performance.
The sample declares this 1D kernel with the following code:
Note that the kernel for the separable convolution uses single-precision values. This allows for
increased precision compared to the 2D integer convolution functions.
To apply a blur using a pair of 1D kernels, the sample calls separableConvolve(horizontal
Kernel:verticalKernel:bias:edgeMode:destination:).
The increase in speed from using two 1D kernels instead of a single 2D kernel is significant. For
each pixel, the 2D pass requires M * N multiplications and additions (where M is the number of
rows and N is the number of columns), but each 1D pass only requires M + N multiplications and
additions.
Blur an image with high-speed kernels


## Page 6

vImage provides two high-speed blurring convolutions for 8-bit images: a box filter and a tent filte
These blurs are equivalent to convolving with standard kernels, but the developer doesn’t need to
supply the kernel. These functions are typically faster than performing an equivalent convolution
with custom kernels.
The box filter returns the average pixel value in a rectangular region that surrounds the transform
pixel.
This sample calls boxConvolve(kernelSize:edgeMode:destination:) to apply a box filt
to an image.
Although the box filter is the fastest blur, the following example shows how it suffers from
rectangular artifacts:


## Page 7

The tent filter returns the weighted average of pixel values in a circular region that surrounds the
pixel that vImage is transforming. Weighted average means that the influence of pixels on the res
decreases the further they are away from the transformed pixel.
The sample calls tentConvolve(kernelSize:edgeMode:destination:) to apply a tent
filter to an image.


## Page 8

The following example shows the result of a tent filter. The result is a smoother blur, at the expens
of being slightly slower to execute than the box filter.
Note that passing the vImage.EdgeMode.truncateKernel flag to the high-speed kernels ca
significantly impact their performance. This flag is only necessary when vImage needs to restrict
calculations to the portion of the kernel overlapping the image.
vImage can apply multiple kernels in a single convolution. The convolve(with:divisor:bia
edgeMode:destination:) function makes it possible to specify four separate kernels — one f
each channel in the image.
When using multiple kernels to apply image filters, vImage can operate on the red, green, blue, an
alpha channels individually. For example, it can use multiple-kernel convolutions to resample the
color channels of an image differently to compensate for the positioning of RGB phosphors on the
screen. Because each of the four kernels can operate on a single channel, the vImage multiple-
kernel convolution functions are available only to the interleaved image formats, vImage
.Planar8x4 and vImage.PlanarFx4.
The four kernels for the convolution filters need to be the same size, but can accept padding with
zeros to simulate smaller kernels. vImage is able to optimize individual passes, effectively croppin
the zero padding.
The following code creates an array of four kernels, each containing a central circle of 1s of
decreasing size:
Blur an image with multiple kernels


## Page 9

For example, with a kernel length of 17, the first three kernels from the code above contain the
following values:
The convolve(with:divisor:bias:edgeMode:destination:) performs the convolution
The example below shows the result of the multiple-kernel convolution. Note the color-fringing
effect from applying different kernels to the different color channels.
Adding a bokeh effect to images
Simulate a bokeh effect by applying dilation.
Convolution
Apply a convolution kernel to an image.
See Also
Convolution and Morphology


## Page 10

Morphology
Dilate and erode images.


## Page 11

This sample app creates a bokeh effect, where parts of an image that are out of focus adopt the
shape of the lens’s aperture. The app dynamically generates a polygon-shaped kernel — also
known as a structuring element — and applies a morphology operation to an image based on that
kernel. The following sample shows a photograph after the app has applied dilation with a
triangular kernel:
Overview
Accelerate / Adding a bokeh effect to images
Sample Code
Adding a bokeh effect to images
Simulate a bokeh effect by applying dilation.
Download
macOS 13.3+
Xcode 14.0+


## Page 12

Kernels are 1D or 2D matrices of values that the morphology operation subtracts from a
corresponding pixel value in the image. The final value of each transformed pixel is either the
lightest result (for dilation) or darkest result (for erosion) of each subtraction.
The following formula shows how a dilation operation calculates the value for the pixel at the cent
of the grid. The operation subtracts each of the nine kernel values from the image’s correspondin
pixel and returns the maximum value.
The MorphologyTransformer.makeBokehStructuringElement(ofRadius:atAngle:
withSides:) method returns a vImage.StructuringElement structure. Within that
structure, the diaphragmBladeCount variable defines the number of sides. For example, to
create a hexagon-shaped bokeh effect, the sample app calls the MorphologyTransformer
.makeBokehStructuringElement(ofRadius:atAngle:withSides:) method with the
number of sides set to 6.
Generate the structuring element


## Page 13

On return, bokeh contains the following values:
To optimize the dilation operations, the sample app calls the planar morphology function, apply
Morphology(operation:destination:), concurrently on the three planar pixel buffers tha
represent the individual red, green, and blue channels.
Apply the dilation


## Page 14

To learn more about improving your app’s performance by converting image buffer formats from
interleaved to planar, see Optimizing image-processing performance.
The following code calls the three functions inside a withtaskgroup(of:returning:
isolation:body:) closure:
On return, the destination buffer contains the dilation result:


## Page 15

Blurring an image
Filter an image by convolving it with custom and high-speed kernels.
Convolution
Apply a convolution kernel to an image.
Morphology
Dilate and erode images.
See Also
Convolution and Morphology


## Page 16

Convolution is a common image-processing technique that changes the value of a pixel according
to the values of its surrounding pixels. Many common image filters, such as blurring, detecting
edges, sharpening, and embossing, derive from convolution.
Kernels form the basis of convolution operations. Kernels are arrays or matrices of weights that
indicate the influence of a pixel’s neighbors on its final value. To calculate the value of each
transformed pixel, a convolution operation adds the products of each surrounding pixel value with
the corresponding kernel value. During a convolution operation, the kernel passes over every pixe
in the image, repeating this procedure, and then applies the effect to the entire image.
func vImageConvolveFloatKernel_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCoun
, vImagePixelCount, UnsafePointer<Float>!, UInt32, UInt32, Float, Unsaf
Pointer<UInt8>!, vImage_Flags) -> vImage_Error
Convolves an 8-bit-per-channel, 4-channel interleaved image using 32-bit weights.
Overview
Topics
Convolving an 8-bit image with 32-bit weights
Convolving with separable filter kernels
Accelerate / Convolution
API Collection
Convolution
Apply a convolution kernel to an image.


## Page 17

func vImageSepConvolve_Planar8(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UnsafePointer<Float>!,
UInt32, Float, Pixel_16U, vImage_Flags) -> vImage_Error
Convolves an 8-bit planar image by separate horizontal and vertical separable kernels.
func vImageSepConvolve_Planar16U(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UnsafePointer<Float>!,
UInt32, Float, Pixel_16U, vImage_Flags) -> vImage_Error
Convolves an unsigned 16-bit planar image by separate horizontal and vertical separable
kernels.
func vImageSepConvolve_Planar16F(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UnsafePointer<Float>!,
UInt32, Float, Pixel_16F, vImage_Flags) -> vImage_Error
Convolves a floating-point 16-bit planar image by separate horizontal and vertical separable
kernels.
func vImageSepConvolve_PlanarF(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UnsafePointer<Float>!,
UInt32, Float, Pixel_F, vImage_Flags) -> vImage_Error
Convolves a floating-point 32-bit planar image by separate horizontal and vertical separable
kernels.
func vImageSepConvolve_Planar8to16U(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UnsafePointer<Float>!,
UInt32, Float, Float, Pixel_8, vImage_Flags) -> vImage_Error
Convolves an 8-bit planar image by separate horizontal and vertical separable kernels, and
writes the result to an unsigned 16-bit planar destination.
func vImageSepConvolve_ARGB8888(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UnsafePointer<Float>!,
UInt32, Float, UnsafePointer<UInt8>!, vImage_Flags) -> vImage_Error
Convolves an 8-bit-per-channel, 4-channel interleaved image by separate horizontal and
vertical separable kernels.
Convolving without bias


## Page 18

func vImageConvolve_Planar8(UnsafePointer<vImage_Buffer>, UnsafePointer
vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, UnsafePointer<Int16>!, UInt32, UInt32, Int32, Pixel_8, vImage
_Flags) -> vImage_Error
Convolves an 8-bit planar image by a 2D kernel and divides the pixel values by a divisor.
func vImageConvolve_Planar16F(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UInt32, Pixel_16F, v
Image_Flags) -> vImage_Error
Convolves a floating-point 16-bit planar image by a 2D kernel.
func vImageConvolve_PlanarF(UnsafePointer<vImage_Buffer>, UnsafePointer
vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, UnsafePointer<Float>!, UInt32, UInt32, Pixel_F, vImage_Flags) ->
vImage_Error
Convolves a floating-point 32-bit planar image by a 2D kernel.
func vImageConvolve_ARGB8888(UnsafePointer<vImage_Buffer>, UnsafePointe
<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixe
Count, UnsafePointer<Int16>!, UInt32, UInt32, Int32, UnsafePointer<UInt
>!, vImage_Flags) -> vImage_Error
Convolves an 8-bit-per-channel, 4-channel interleaved image by a 2D kernel and divides the
pixel values by a divisor.
func vImageConvolve_ARGB16F(UnsafePointer<vImage_Buffer>, UnsafePointer
vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, UnsafePointer<Float>!, UInt32, UInt32, UnsafePointer<UInt16>!, v
Image_Flags) -> vImage_Error
Convolves a floating-point 16-bit-per-channel, 4-channel interleaved image by a 2D kernel,
then divides the pixel values by a divisor.
func vImageConvolve_ARGBFFFF(UnsafePointer<vImage_Buffer>, UnsafePointe
<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixe
Count, UnsafePointer<Float>!, UInt32, UInt32, UnsafePointer<Float>!, v
Image_Flags) -> vImage_Error
Convolves a floating-point 32-bit-per-channel, 4-channel interleaved image by a 2D kernel,
then divides the pixel values by a divisor.
Convolving with bias


## Page 19

func vImageConvolveWithBias_Planar8(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Int16>!, UInt32, UInt32, Int32, Int32,
Pixel_8, vImage_Flags) -> vImage_Error
Convolves an 8-bit planar image by a 2D kernel and adds a bias.
func vImageConvolveWithBias_Planar16F(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCoun
, vImagePixelCount, UnsafePointer<Float>!, UInt32, UInt32, Float, Pixel
_16F, vImage_Flags) -> vImage_Error
Convolves a floating-point 16-bit planar image by a 2D kernel and adds a bias.
func vImageConvolveWithBias_PlanarF(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UInt32, Float, Pixel_F,
vImage_Flags) -> vImage_Error
Convolves a floating-point 32-bit planar image by a 2D kernel and adds a bias.
func vImageConvolveWithBias_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCoun
, vImagePixelCount, UnsafePointer<Int16>!, UInt32, UInt32, Int32, Int32
UnsafePointer<UInt8>!, vImage_Flags) -> vImage_Error
Convolves an 8-bit-per-channel, 4-channel interleaved image by a 2D kernel and adds a bia
func vImageConvolveWithBias_ARGB16F(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UnsafePointer<Float>!, UInt32, UInt32, Float, Unsafe
Pointer<UInt16>!, vImage_Flags) -> vImage_Error
Convolves a floating-point 16-bit-per-channel, 4-channel interleaved image by a 2D kernel
and adds a bias.
func vImageConvolveWithBias_ARGBFFFF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCoun
, vImagePixelCount, UnsafePointer<Float>!, UInt32, UInt32, Float, Unsaf
Pointer<Float>!, vImage_Flags) -> vImage_Error
Convolves a floating-point 32-bit-per-channel, 4-channel interleaved image by a 2D kernel
and adds a bias.
Convolving with multiple kernels


## Page 20

func vImageConvolveMultiKernel_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCoun
, vImagePixelCount, UnsafeMutablePointer<UnsafePointer<Int16>?>!, UInt3
, UInt32, UnsafePointer<Int32>!, UnsafePointer<Int32>!, UnsafePointer<
UInt8>!, vImage_Flags) -> vImage_Error
Convolves each channel of an 8-bit-per-channel, 4-channel interleaved image by one of the
four 2D kernels.
func vImageConvolveMultiKernel_ARGBFFFF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCoun
, vImagePixelCount, UnsafeMutablePointer<UnsafePointer<Float>?>, UInt32
UInt32, UnsafePointer<Float>, UnsafePointer<Float>, vImage_Flags) -> v
Image_Error
Convolves each channel of a floating-point 32-bit-per-channel, 4-channel interleaved image
by one of the four 2D kernels.
func vImageBoxConvolve_Planar8(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UInt32, UInt32, Pixel_8, vImage_Flags) -> vImage_Error
Applies a box filter to an 8-bit planar source image.
func vImageBoxConvolve_ARGB8888(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UInt32, UInt32, UnsafePointer<UInt8>!, vImage_Flags) -
vImage_Error
Applies a box filter to an 8-bit-per-channel, 4-channel interleaved source image.
func vImageTentConvolve_Planar8(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UInt32, UInt32, Pixel_8, vImage_Flags) -> vImage_Error
Applies a tent filter to an 8-bit planar source image.
func vImageTentConvolve_ARGB8888(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, v
ImagePixelCount, UInt32, UInt32, UnsafePointer<UInt8>!, vImage_Flags) -
vImage_Error
Applies a tent filter to an 8-bit-per-channel, 4-channel interleaved source image.
Convolving with high-speed box and tent filters
Deconvolving


## Page 21

func vImageRichardsonLucyDeConvolve_Planar8(UnsafePointer<vImage_Buffer
>, UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixel
Count, vImagePixelCount, UnsafePointer<Int16>!, UnsafePointer<Int16>!,
UInt32, UInt32, UInt32, UInt32, Int32, Int32, Pixel_8, UInt32, vImage
_Flags) -> vImage_Error
Deconvolves an 8-bit planar image.
func vImageRichardsonLucyDeConvolve_PlanarF(UnsafePointer<vImage_Buffer
>, UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixel
Count, vImagePixelCount, UnsafePointer<Float>!, UnsafePointer<Float>!,
UInt32, UInt32, UInt32, UInt32, Pixel_F, UInt32, vImage_Flags) -> vImag
_Error
Deconvolves a floating-point 32-bit planar image.
func vImageRichardsonLucyDeConvolve_ARGB8888(UnsafePointer<vImage_Buffe
>, UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixel
Count, vImagePixelCount, UnsafePointer<Int16>!, UnsafePointer<Int16>!,
UInt32, UInt32, UInt32, UInt32, Int32, Int32, UnsafePointer<UInt8>!,
UInt32, vImage_Flags) -> vImage_Error
Deconvolves an 8-bit-per-channel, 4-channel interleaved image.
func vImageRichardsonLucyDeConvolve_ARGBFFFF(UnsafePointer<vImage_Buffe
>, UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, vImagePixel
Count, vImagePixelCount, UnsafePointer<Float>!, UnsafePointer<Float>!,
UInt32, UInt32, UInt32, UInt32, UnsafePointer<Float>!, UInt32, vImage
_Flags) -> vImage_Error
Deconvolves a floating-point 32-bit-per-channel, 4-channel interleaved image.
Blurring an image
Filter an image by convolving it with custom and high-speed kernels.
Adding a bokeh effect to images
Simulate a bokeh effect by applying dilation.
Morphology
See Also
Convolution and Morphology


## Page 22

Dilate and erode images.


## Page 23

func vImageDilate_Planar8(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<UInt8>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Dilates an 8-bit planar buffer.
func vImageDilate_PlanarF(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<Float>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Dilates a 32-bit planar buffer.
func vImageDilate_ARGB8888(UnsafePointer<vImage_Buffer>, UnsafePointer<
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<UInt8>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Dilates an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageDilate_ARGBFFFF(UnsafePointer<vImage_Buffer>, UnsafePointer<
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<Float>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Dilates a 32-bit-per-channel, 4-channel interleaved buffer.
Topics
Dilating an object
Eroding an object
Accelerate / Morphology
API Collection
Morphology
Dilate and erode images.


## Page 24

func vImageErode_Planar8(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<UInt8>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Erodes an 8-bit planar buffer.
func vImageErode_PlanarF(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<Float>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Erodes a 32-bit planar buffer.
func vImageErode_ARGB8888(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<UInt8>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Erodes an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageErode_ARGBFFFF(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, vImagePixelCount, vImagePixelCount, UnsafePointer<Float>
vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Error
Erodes a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageMax_Planar8(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Maximizes an 8-bit planar buffer.
func vImageMax_PlanarF(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Maximizes a 32-bit planar buffer.
func vImageMax_ARGB8888(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Maximizes an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageMax_ARGBFFFF(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Maximizes a 32-bit-per-channel, 4-channel interleaved buffer.
Maximizing an object


## Page 25

func vImageMin_Planar8(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Minimizes an 8-bit planar buffer.
func vImageMin_PlanarF(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Minimizes a 32-bit planar buffer.
func vImageMin_ARGB8888(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Minimizes an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageMin_ARGBFFFF(UnsafePointer<vImage_Buffer>, UnsafePointer<v
Image_Buffer>, UnsafeMutableRawPointer!, vImagePixelCount, vImagePixel
Count, vImagePixelCount, vImagePixelCount, vImage_Flags) -> vImage_Erro
Minimizes an 8-bit-per-channel, 4-channel interleaved buffer.
Blurring an image
Filter an image by convolving it with custom and high-speed kernels.
Adding a bokeh effect to images
Simulate a bokeh effect by applying dilation.
Convolution
Apply a convolution kernel to an image.
Minimizing an object
See Also
Convolution and Morphology


