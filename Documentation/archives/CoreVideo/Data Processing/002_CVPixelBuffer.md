# 002_CVPixelBuffer.pdf

## Page 1

A Core Video pixel buffer is an image buffer that holds pixels in main memory. Applications
generating frames, compressing or decompressing video, or using Core Image can all make use o
Core Video pixel buffers.
func CVPixelBufferCreate(CFAllocator?, Int, Int, OSType, CFDictionary?,
UnsafeMutablePointer<CVPixelBuffer?>) -> CVReturn
Creates a single pixel buffer for a given size and pixel format.
func CVPixelBufferCreateWithBytes(CFAllocator?, Int, Int, OSType, Unsaf
MutableRawPointer, Int, CVPixelBufferReleaseBytesCallback?, Unsafe
MutableRawPointer?, CFDictionary?, UnsafeMutablePointer<CVPixelBuffer?>
-> CVReturn
Creates a pixel buffer for a given size and pixel format containing data specified by a memor
location.
Overview
Topics
Creating pixel buffers
Core Video / CVPixelBuffer
API Collection
CVPixelBuffer
An image buffer that holds pixels in main memory.


## Page 2

func CVPixelBufferCreateWithPlanarBytes(CFAllocator?, Int, Int, OSType,
UnsafeMutableRawPointer?, Int, Int, UnsafeMutablePointer<UnsafeMutable
RawPointer?>, UnsafeMutablePointer<Int>, UnsafeMutablePointer<Int>,
UnsafeMutablePointer<Int>, CVPixelBufferReleasePlanarBytesCallback?,
UnsafeMutableRawPointer?, CFDictionary?, UnsafeMutablePointer<CVPixel
Buffer?>) -> CVReturn
Creates a single pixel buffer in planar format for a given size and pixel format containing data
specified by a memory location.
func CVPixelBufferCreateWithIOSurface(CFAllocator?, IOSurfaceRef,
CFDictionary?, UnsafeMutablePointer<Unmanaged<CVPixelBuffer>?>) ->
CVReturn
Creates a single pixel buffer for the IO surface that you specify.
func CVPixelBufferGetBaseAddress(CVPixelBuffer) -> UnsafeMutableRaw
Pointer?
Returns the base address of the pixel buffer.
func CVPixelBufferGetBaseAddressOfPlane(CVPixelBuffer, Int) -> Unsafe
MutableRawPointer?
Returns the base address of the plane at the specified plane index.
func CVPixelBufferGetBytesPerRow(CVPixelBuffer) -> Int
Returns the number of bytes per row of the pixel buffer.
func CVPixelBufferGetBytesPerRowOfPlane(CVPixelBuffer, Int) -> Int
Returns the number of bytes per row for a plane at the specified index in the pixel buffer.
func CVPixelBufferGetHeight(CVPixelBuffer) -> Int
Returns the height of the pixel buffer.
func CVPixelBufferGetHeightOfPlane(CVPixelBuffer, Int) -> Int
Returns the height of the plane at planeIndex in the pixel buffer.
func CVPixelBufferGetWidth(CVPixelBuffer) -> Int
Returns the width of the pixel buffer.
func CVPixelBufferGetWidthOfPlane(CVPixelBuffer, Int) -> Int
Returns the width of the plane at a given index in the pixel buffer.
func CVPixelBufferIsPlanar(CVPixelBuffer) -> Bool
Inspecting Pixel Buffers


## Page 3

Determines whether the pixel buffer is planar.
func CVPixelBufferGetPlaneCount(CVPixelBuffer) -> Int
Returns number of planes of the pixel buffer.
func CVPixelBufferGetDataSize(CVPixelBuffer) -> Int
Returns the data size for contiguous planes of the pixel buffer.
func CVPixelBufferGetPixelFormatType(CVPixelBuffer) -> OSType
Returns the pixel format type of the pixel buffer.
func CVPixelBufferGetExtendedPixels(CVPixelBuffer, UnsafeMutablePointer
Int>?, UnsafeMutablePointer<Int>?, UnsafeMutablePointer<Int>?, Unsafe
MutablePointer<Int>?)
Returns the amount of extended pixel padding in the pixel buffer.
func CVPixelBufferGetIOSurface(CVPixelBuffer?) -> Unmanaged<IOSurfaceRe
>?
Returns the IOSurface backing the pixel buffer, or NULL if it is not backed by an IOSurface.
func CVPixelBufferCreateResolvedAttributesDictionary(CFAllocator?,
CFArray?, UnsafeMutablePointer<CFDictionary?>) -> CVReturn
Resolves an array of CFDictionary objects describing various pixel buffer attributes into a
single dictionary.
func CVPixelBufferGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the pixel buffer type.
func CVPixelBufferFillExtendedPixels(CVPixelBuffer) -> CVReturn
Fills the extended pixels of the pixel buffer.
func CVPixelBufferLockBaseAddress(CVPixelBuffer, CVPixelBufferLockFlags
-> CVReturn
Locks the base address of the pixel buffer.
func CVPixelBufferUnlockBaseAddress(CVPixelBuffer, CVPixelBufferLock
Flags) -> CVReturn
Unlocks the base address of the pixel buffer.
Modifying Pixel Buffers
Data Types


## Page 4

typealias CVPixelBuffer
A reference to a Core Video pixel buffer object.
struct CVPixelBufferLockFlags
The flags to pass to CVPixelBufferLockBaseAddress(_:_:) and CVPixelBuffer
UnlockBaseAddress(_:_:).
struct CVPlanarComponentInfo
A structure for describing planar components.
struct CVPlanarPixelBufferInfo
A structure for describing planar buffers.
struct CVPlanarPixelBufferInfo_YCbCrPlanar
A structure for describing YCbCr planar buffers.
struct CVPlanarPixelBufferInfo_YCbCrBiPlanar
A structure for describing YCbCr biplanar buffers.
typealias CVPixelBufferReleaseBytesCallback
A type that defines a release callback function.
typealias CVPixelBufferReleasePlanarBytesCallback
Defines a pointer to a pixel buffer release callback function, which is called when a pixel buff
created by CVPixelBufferCreateWithPlanarBytes(_:_:_:_:_:_:_:_:_:_:_:_:
_:_:_:) is released.
Pixel Buffer Attribute Keys
The attributes associated with a pixel buffer.
Core Video Programming Guide
Callbacks
Constants
See Also
Related Documentation


## Page 5

CVBuffer
An abstract base class that defines how to interact with data buffers.
CVImageBuffer
An interface for managing different types of image data.
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.
Data Processing


