# 006_Histogram.pdf

## Page 1

func vImageContrastStretch_Planar8(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs contrast stretching on an 8-bit planar buffer.
func vImageContrastStretch_PlanarF(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs contrast stretching on a 32-bit planar buffer.
func vImageContrastStretch_ARGB8888(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs contrast stretching on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageContrastStretch_ARGBFFFF(UnsafePointer<vImage_Buffer>, Unsaf
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs contrast stretching on a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageEndsInContrastStretch_Planar8(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UInt32, UInt32, vImage_Flags) -> vImage
_Error
Performs ends-in contrast stretching on an 8-bit planar buffer.
Topics
Performing contrast stretching
Performing ends-in contrast stretching
Accelerate / Histogram
API Collection
Histogram
Calculate or manipulate an image’s histogram.


## Page 2

func vImageEndsInContrastStretch_PlanarF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, UInt32,
UInt32, Pixel_F, Pixel_F, vImage_Flags) -> vImage_Error
Performs ends-in contrast stretching on a 32-bit planar buffer.
func vImageEndsInContrastStretch_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafePointer<UInt32>, UnsafePointer<
UInt32>, vImage_Flags) -> vImage_Error
Performs ends-in contrast stretching on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageEndsInContrastStretch_ARGBFFFF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UnsafePointer<
UInt32>, UnsafePointer<UInt32>, UInt32, Pixel_F, Pixel_F, vImage_Flags)
-> vImage_Error
Performs ends-in contrast stretching on a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageEqualization_Planar8(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs histogram equalization on an 8-bit planar buffer.
func vImageEqualization_PlanarF(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs histogram equalization on a 32-bit planar buffer.
func vImageEqualization_ARGB8888(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, vImage_Flags) -> vImage_Error
Performs histogram equalization on an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageEqualization_ARGBFFFF(UnsafePointer<vImage_Buffer>, Unsafe
Pointer<vImage_Buffer>, UnsafeMutableRawPointer!, UInt32, Pixel_F, Pixe
_F, vImage_Flags) -> vImage_Error
Performs histogram equalization on a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramCalculation_Planar8(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<vImagePixelCount>, vImage_Flags) -> vImage_Error
Calculates the histogram of an 8-bit planar buffer.
Equalizing a histogram
Calculating a histogram


## Page 3

func vImageHistogramCalculation_PlanarF(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<vImagePixelCount>, UInt32, Pixel_F, Pixel_F, vImag
_Flags) -> vImage_Error
Calculates the histogram of a 32-bit planar buffer.
func vImageHistogramCalculation_ARGB8888(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<UnsafeMutablePointer<vImagePixelCount>?>, vImage
_Flags) -> vImage_Error
Calculates the histogram of an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramCalculation_ARGBFFFF(UnsafePointer<vImage_Buffer>,
UnsafeMutablePointer<UnsafeMutablePointer<vImagePixelCount>?>, UInt32,
Pixel_F, Pixel_F, vImage_Flags) -> vImage_Error
Calculates the histogram of a 32-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramSpecification_Planar8(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafePointer<vImagePixelCount>, vImage
_Flags) -> vImage_Error
Specifies the histogram of an 8-bit planar buffer.
func vImageHistogramSpecification_PlanarF(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UnsafePointer<v
ImagePixelCount>, UInt32, Pixel_F, Pixel_F, vImage_Flags) -> vImage
_Error
Specifies the histogram of a 32-bit planar buffer.
func vImageHistogramSpecification_ARGB8888(UnsafePointer<vImage_Buffer>
UnsafePointer<vImage_Buffer>, UnsafeMutablePointer<UnsafePointer<vImage
PixelCount>?>, vImage_Flags) -> vImage_Error
Specifies the histogram of an 8-bit-per-channel, 4-channel interleaved buffer.
func vImageHistogramSpecification_ARGBFFFF(UnsafePointer<vImage_Buffer>
UnsafePointer<vImage_Buffer>, UnsafeMutableRawPointer!, UnsafeMutable
Pointer<UnsafePointer<vImagePixelCount>?>!, UInt32, Pixel_F, Pixel_F, v
Image_Flags) -> vImage_Error
Specifes the histogram of a 32-bit-per-channel, 4-channel interleaved buffer.
Specifying a histogram
See Also


## Page 4

Adjusting the brightness and contrast of an image
Use a gamma function to apply a linear or exponential curve.
Adjusting saturation and applying tone mapping
Convert an RGB image to discrete luminance and chrominance channels, and apply color an
contrast treatments.
Applying tone curve adjustments to images
Use the vImage library’s polynomial transform to apply tone curve adjustments to images.
Adjusting the hue of an image
Convert an image to L*a*b* color space and apply hue adjustment.
Specifying histograms with vImage
Calculate the histogram of one image, and apply it to a second image.
Enhancing image contrast with histogram manipulation
Enhance and adjust the contrast of an image with histogram equalization and contrast
stretching.
Color and Tone Adjustment


