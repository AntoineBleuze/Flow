# Data Processing.pdf

## Page 1

A CVBuffer serves as an abstract base class that defines how to interact with buffers of data. A
buffer object can hold video, audio, or possibly other types of data. All the other buffer types with
the Core Video framework, such as CVImageBuffer and CVPixelBuffer, derive from CVBuffer. Yo
can use the CVBuffer programming interface on any Core Video buffer.
func CVBufferHasAttachment(CVBuffer, CFString) -> Bool
Returns a Boolean value that indicates whether a Core Video buffer contains a specified
attachment.
func CVBufferCopyAttachment(CVBuffer, CFString, UnsafeMutablePointer<
CVAttachmentMode>?) -> CFTypeRef?
Returns a copy of an attachment from a Core Video buffer.
func CVBufferCopyAttachments(CVBuffer, CVAttachmentMode) -> CFDictionar
?
Returns a copy of all attachments from a Core Video buffer.
func CVBufferSetAttachment(CVBuffer, CFString, CFTypeRef, CVAttachment
Mode)
Sets or adds an attachment to a Core Video buffer.
Overview
Topics
Working with attachments
Core Video / CVBuffer
API Collection
CVBuffer
An abstract base class that defines how to interact with data buffers.


## Page 2

func CVBufferSetAttachments(CVBuffer, CFDictionary, CVAttachmentMode)
Sets a dictionary of attachments on a Core Video buffer.
func CVBufferPropagateAttachments(CVBuffer, CVBuffer)
Copies all attachments that Core Video can propagate from one buffer to another.
func CVBufferRemoveAttachment(CVBuffer, CFString)
Removes the attachment you specify from a Core Video buffer.
func CVBufferRemoveAllAttachments(CVBuffer)
Removes all attachments from a Core Video buffer.
func CVBufferGetAttachment(CVBuffer, CFString, UnsafeMutablePointer<
CVAttachmentMode>?) -> Unmanaged<CFTypeRef>?
Retrieves a specific attachment of a Core Video buffer.
Deprecated
func CVBufferGetAttachments(CVBuffer, CVAttachmentMode) -> CFDictionary
Retrieves all attachments of a Core Video buffer.
Deprecated
class CVBuffer
A reference to a Core Video buffer.
enum CVAttachmentMode
The propagation modes of a Core Video buffer attachment.
CVBuffer Attribute Keys
The attributes associated with Core Video buffers.
CVBuffer Attachment Keys
The attachment types for a Core Video buffer.
Data types
Constants
See Also


## Page 3

Core Video Programming Guide
CVImageBuffer
An interface for managing different types of image data.
CVPixelBuffer
An image buffer that holds pixels in main memory.
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.
Related Documentation
Data Processing


## Page 4

Core Video image buffers provides a convenient interface for managing different types of image
data. Pixel buffers and Core Video OpenGL buffers derive from the Core Video image buffer.
func CVImageBufferGetCleanRect(CVImageBuffer) -> CGRect
Returns the source rectangle of a Core Video image buffer that represents the clean apertur
of the buffer in encoded pixels.
func CVImageBufferGetColorSpace(CVImageBuffer) -> Unmanaged<CGColorSpac
>?
Returns the color space of a Core Video image buffer.
func CVImageBufferGetDisplaySize(CVImageBuffer) -> CGSize
Returns the nominal output display size, in square pixels, of a Core Video image buffer.
func CVImageBufferGetEncodedSize(CVImageBuffer) -> CGSize
Returns the full encoded dimensions of a Core Video image buffer.
func CVImageBufferIsFlipped(CVImageBuffer) -> Bool
Returns a Boolean value indicating whether the image is vertically flipped.
Overview
Topics
Inspecting image buffers
Core Video / CVImageBuffer
API Collection
CVImageBuffer
An interface for managing different types of image data.


## Page 5

func CVImageBufferCreateColorSpaceFromAttachments(CFDictionary) ->
Unmanaged<CGColorSpace>?
Attempts to create a Core Graphics color space from the image buffer’s attachments that yo
specify.
typealias CVImageBuffer
A reference to a Core Video image buffer.
func CVColorPrimariesGetIntegerCodePointForString(CFString?) -> Int32
Returns the standard integer code point corresponding to the Core Video color primaries
constant string that you specify.
func CVColorPrimariesGetStringForIntegerCodePoint(Int32) -> Unmanaged<
CFString>?
Returns the Core Video color primaries string corresponding to the standard integer code
point that you specify.
func CVTransferFunctionGetIntegerCodePointForString(CFString?) -> Int32
Returns the standard integer code point corresponding to the Core Video transfer function
string that you specify.
func CVTransferFunctionGetStringForIntegerCodePoint(Int32) -> Unmanaged
CFString>?
Returns the Core Video transfer function string corresponding to the standard integer code
point that you specify.
func CVYCbCrMatrixGetIntegerCodePointForString(CFString?) -> Int32
Returns the standard integer code point corresponding to the Core Video YCbCr matrix strin
that you specify.
func CVYCbCrMatrixGetStringForIntegerCodePoint(Int32) -> Unmanaged<
CFString>?
Returns the Core Video YCbCr matrix string corresponding to the standard integer code poin
that you specify.
Creating color spaces
Data types
Converting between strings and integer code points


## Page 6

Image Buffer Attachment Keys
Keys that describe the attachment types associated with image buffers.
Image Buffer Clean Aperture Keys
Keys that describe the clean aperture of an image buffer.
Image Buffer Pixel Aspect Ratio Keys
Keys that describe the pixel aspect ratio of an image buffer.
Image Buffer Display Dimensions Keys
Keys that describe the display dimensions of an image buffer.
Image Buffer Field Detail Constants
Constants that indicate the field order of interlaced video in an image buffer.
Image Buffer YCbCr Matrix Constants
Constants that indicate the type of conversion matrix Core Video uses when it converts imag
buffer data from the YCbCr color space to the RGB color space.
Image Buffer Color Primaries Constants
Constants that indicate the color primaries gamut for the image buffer.
Image Buffer Transfer Function Constants
Constants that indicate the transfer function for the image buffer.
Image Buffer Chroma Location Constants
Constants that indicate locations for chroma samples in the image buffer.
Image Buffer Chroma Subsampling Constants
Constants that indicate the original format of subsampled data in the image buffer before
conversion to 422/2vuy format.
Image Buffer Display Mask Rectangle Keys
Keys that describe the display dimensions of an image buffer mask.
Constants
See Also


## Page 7

Core Video Programming Guide
CVBuffer
An abstract base class that defines how to interact with data buffers.
CVPixelBuffer
An image buffer that holds pixels in main memory.
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.
Related Documentation
Data Processing


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

CVBuffer
An abstract base class that defines how to interact with data buffers.
CVImageBuffer
An interface for managing different types of image data.
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.
Data Processing


## Page 13

func CVPixelBufferPoolCreate(CFAllocator?, CFDictionary?, CFDictionary?
UnsafeMutablePointer<CVPixelBufferPool?>) -> CVReturn
Creates a pixel buffer pool using the allocator and attributes that you specify.
func CVPixelBufferPoolCreatePixelBuffer(CFAllocator?, CVPixelBufferPool
UnsafeMutablePointer<CVPixelBuffer?>) -> CVReturn
Creates a pixel buffer from a pixel buffer pool, using the allocator that you specify.
func CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocator?,
CVPixelBufferPool, CFDictionary?, UnsafeMutablePointer<CVPixelBuffer?>)
-> CVReturn
Creates a new pixel buffer with auxiliary attributes from the pool.
func CVPixelBufferPoolFlush(CVPixelBufferPool, CVPixelBufferPoolFlush
Flags)
Frees pixel buffers from the pool based on the options that you specify.
func CVPixelBufferPoolGetAttributes(CVPixelBufferPool) -> CFDictionary?
The pool attributes dictionary for a pixel buffer pool.
Topics
Creating pools
Flushing pools
Inspecting pools
Core Video / CVPixelBufferPool
API Collection
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.


## Page 14

func CVPixelBufferPoolGetPixelBufferAttributes(CVPixelBufferPool) ->
CFDictionary?
The attributes of pixel buffers which the system creates using the pool you specify.
func CVPixelBufferPoolGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier of the pixel buffer pool type.
class CVPixelBufferPool
A reference to a pixel buffer pool object.
struct CVPixelBufferPoolFlushFlags
The flags to pass to flush the pool.
let kCVPixelBufferPoolMinimumBufferCountKey: CFString
The minimum number of buffers allowed in the pixel buffer pool.
let kCVPixelBufferPoolMaximumBufferAgeKey: CFString
The key you use to set the maximum allowable age for a buffer in the pixel buffer pool.
let kCVPixelBufferPoolAllocationThresholdKey: CFString
The key you use to set the auxiliary attributes dictionary.
let kCVPixelBufferPoolFreeBufferNotification: CFString
A notification that the system posts if a buffer becomes available after it fails to create a pixe
buffer with auxiliary attributes because it exceeded the threshold you specified.
Core Video Programming Guide
Data types
Constants
Notifications
See Also
Related Documentation


## Page 15

CVBuffer
An abstract base class that defines how to interact with data buffers.
CVImageBuffer
An interface for managing different types of image data.
CVPixelBuffer
An image buffer that holds pixels in main memory.
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.
Data Processing


## Page 16

The Core Video pixel format description API defines functions and types for defining custom pixe
formats. You should only use pixel format descriptions if you need to define a custom pixel format
func CVPixelFormatDescriptionCreateWithPixelFormatType(CFAllocator?,
OSType) -> CFDictionary?
Creates a pixel format description from a given OSType identifier.
func CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType(
CFDictionary, OSType)
Registers a pixel format description with Core Video.
func CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes(
CFAllocator?) -> CFArray?
Returns all the pixel format descriptions known to Core Video.
Overview
Topics
Creating Format Descriptions
Retrieving Format Descriptions
Data Types
Core Video / CVPixelFormatDescription
API Collection
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.


## Page 17

struct CVFillExtendedPixelsCallBackData
A structure for holding information that describes a custom extended pixel fill algorithm.
typealias CVFillExtendedPixelsCallBack
Defines a pointer to a custom extended pixel-fill function, which is called whenever the syste
needs to pad a buffer holding your custom pixel format.
Pixel Format Description Keys
The attributes of a pixel format.
Pixel Format Identifiers
Core Video does not provide support for all of these formats; this list defines only their name
CVBuffer
An abstract base class that defines how to interact with data buffers.
CVImageBuffer
An interface for managing different types of image data.
CVPixelBuffer
An image buffer that holds pixels in main memory.
CVPixelBufferPool
A utility object for managing a recyclable set of pixel buffer objects.
Callbacks
Constants
See Also
Data Processing


