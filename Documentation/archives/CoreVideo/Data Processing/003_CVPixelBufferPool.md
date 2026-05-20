# 003_CVPixelBufferPool.pdf

## Page 1

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


## Page 2

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


## Page 3

CVBuffer
An abstract base class that defines how to interact with data buffers.
CVImageBuffer
An interface for managing different types of image data.
CVPixelBuffer
An image buffer that holds pixels in main memory.
CVPixelFormatDescription
An API that provides functions and types for defining custom pixel formats.
Data Processing


