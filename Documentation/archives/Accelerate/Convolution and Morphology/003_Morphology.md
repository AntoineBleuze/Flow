# 003_Morphology.pdf

## Page 1

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


## Page 2

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


## Page 3

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


