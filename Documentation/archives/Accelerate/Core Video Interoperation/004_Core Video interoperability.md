# 004_Core Video interoperability.pdf

## Page 1

The vImage library provides two approaches for working with Core Video pixel buffers:
Use the vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) and vImageBuffe
_CopyToCVPixelBuffer(_:_:_:_:_:_:) to copy and convert data between vImage
buffers and Core Video pixel buffers with a single function call. This approach provides a simpl
API if you need to convert between image formats.
Use the vImageBuffer_InitForCopyFromCVPixelBuffer(_:_:_:_:) and vImage
Buffer_InitForCopyToCVPixelBuffer(_:_:_:_:) functions to create vImage buffers
that reference the data in Core Video pixel buffers. This approach allows you to work directly
with the underlying data if you don’t need to convert between image formats.
Use the vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) and vImageBuffer
_CopyToCVPixelBuffer(_:_:_:_:_:_:) functions to copy and convert data between vIma
and Core Video.
The vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) function allocates new
memory and, after you finish with the buffer, call free() to avoid memory leaks.
The following code shows an example of a CIImageProcessorKernel that reflects an image
vertically. The example calls vImageBuffer_InitWithCVPixelBuffer(_:_:_:_:_:_:) to
initialize the source vImage buffer with a copy of the input CVPixelBuffer instance’s data. The cod
calls vImageBuffer_CopyToCVPixelBuffer(_:_:_:_:_:_:) to copy the destination
vImage buffer’s contents to the output CVPixelBuffer instance.
The code uses a defer statement to deallocate the source and destination vImage buffers after th
image-processing operation completes.
Overview
Copying data between the vImage library and Core Video
Accelerate / Core Video interoperability
API Collection
Core Video interoperability
Pass image data between Core Video and vImage.


## Page 2



## Page 3

Use the vImageBuffer_InitForCopyFromCVPixelBuffer(_:_:_:_:) and vImage
Buffer_InitForCopyToCVPixelBuffer(_:_:_:_:) functions to share data between
vImage and Core Video. Both of these functions require a vImageConverter instance that
defines the vImage buffer’s Core Graphics image format and the CVPixelBuffer instance’s Co
Video format.
Because the vImage functions don’t allocate any additional memory, you don’t need to deallocate
the vImage buffer memory. However, you need to lock and unlock the CVPixelBuffer instance
during the image-processing operation using CVPixelBufferLockBaseAddress(_:_:) and
CVPixelBufferUnlockBaseAddress(_:_:), respectively.
The following code shows an example of a CIImageProcessorKernel that reflects an image
vertically. In this example, the base address of the CVPixelBuffer instances and the data
property of their corresponding vImage buffer point to the same memory. The image data in the
CIImageProcessorInput and CIImageProcessorOutput parameters don’t require
conversion, and the code works directly on the pixel buffers.
The code calls vImageBuffer_InitForCopyFromCVPixelBuffer(_:_:_:_:) with a Core
Video-to-Core-Graphics converter to initialize the source vImage buffer.
Sharing data between the vImage library and Core Video


## Page 4

The code calls vImageBuffer_InitForCopyToCVPixelBuffer(_:_:_:_:) with a Core-
Graphics-to-Core-Video converter to initialize the destination vImage buffer.


## Page 5

Topics
Copying Core Video pixel buffer data to vImage buffers


## Page 6

func vImageBuffer_InitWithCVPixelBuffer(UnsafeMutablePointer<vImage
_Buffer>, UnsafeMutablePointer<vImage_CGImageFormat>, CVPixelBuffer, v
ImageCVImageFormat!, UnsafePointer<CGFloat>!, vImage_Flags) -> vImage
_Error
Initializes a vImage buffer with a copy of the contents of a Core Video pixel buffer.
func vImageBuffer_CopyToCVPixelBuffer(UnsafePointer<vImage_Buffer>,
UnsafePointer<vImage_CGImageFormat>, CVPixelBuffer, vImageCVImageFormat
!, UnsafePointer<CGFloat>!, vImage_Flags) -> vImage_Error
Copies the contents of a vImage buffer to a Core Video pixel buffer.
func vImageBuffer_InitForCopyFromCVPixelBuffer(UnsafeMutablePointer<v
Image_Buffer>, vImageConverter, CVPixelBuffer, vImage_Flags) -> vImage
_Error
Initializes an array of vImage buffers in the order necessary to copy from a Core Video pixel
buffer.
func vImageBuffer_InitForCopyToCVPixelBuffer(UnsafeMutablePointer<vImag
_Buffer>, vImageConverter, CVPixelBuffer, vImage_Flags) -> vImage_Error
Initializes an array of vImage buffers in the order necessary to copy to a Core Video pixel
buffer.
Core Video image format utilities
Create, copy, and query Core Video image format descriptions.
Using vImage pixel buffers to generate video effects
Render real-time video effects with the vImage Pixel Buffer.
Copying and converting data between vImage buffers and Core
Video pixel buffers
Initializing vImage buffers that reference Core Video pixel buffer data
Managing Core Video image formats
See Also
Core Video Interoperation


## Page 7

Integrating vImage pixel buffers into a Core Image workflow
Share image data between Core Video pixel buffers and vImage buffers to integrate vImage
operations into a Core Image workflow.
Applying vImage operations to video sample buffers
Use the vImage convert-any-to-any functionality to perform real-time image processing of
video frames streamed from your device’s camera.
Improving the quality of quantized images with dithering
Apply dithering to simulate colors that are unavailable in reduced bit depths.


