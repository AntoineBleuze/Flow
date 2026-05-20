# 003_CVOpenGLBufferPool.pdf

## Page 1

func CVOpenGLBufferPoolCreate(CFAllocator?, CFDictionary?, CFDictionary
?, UnsafeMutablePointer<CVOpenGLBufferPool?>) -> CVReturn
Creates a new OpenGL buffer pool.
Deprecated
func CVOpenGLBufferPoolCreateOpenGLBuffer(CFAllocator?, CVOpenGLBuffer
Pool, UnsafeMutablePointer<CVOpenGLBuffer?>) -> CVReturn
Creates a new OpenGL buffer from an OpenGL buffer pool.
Deprecated
func CVOpenGLBufferPoolGetAttributes(CVOpenGLBufferPool) -> Unmanaged<
CFDictionary>?
Returns the pool attributes dictionary for an Open GL buffer pool.
Deprecated
func CVOpenGLBufferPoolGetOpenGLBufferAttributes(CVOpenGLBufferPool) ->
Unmanaged<CFDictionary>?
Returns the attributes of OpenGL buffers that will be created from a buffer pool.
Deprecated
func CVOpenGLBufferPoolGetTypeID() -> CFTypeID
Obtains the Core Foundation ID for the OpenGL buffer pool type.
Deprecated
Topics
Functions
Core Video / CVOpenGLBufferPool
API Collection
CVOpenGLBufferPool
A utility object for managing a set of recyclable OpenGL buffer objects.


## Page 2

class CVOpenGLBufferPool
A reference to an OpenGL buffer pool object.
let kCVOpenGLBufferPoolMaximumBufferAgeKey: CFString
The maximum time that unused buffers should be kept before they are deallocated (type
CFAbsoluteTime).
Deprecated
let kCVOpenGLBufferPoolMinimumBufferCountKey: CFString
The minimum number of buffers to be kept in the pool (type CFNumber).
Deprecated
Core Video Programming Guide
CVOpenGLTextureCache
A cache used to create and manage OpenGL texture objects.
CVOpenGLTexture
A texture-based image buffer that supplies source image data to OpenGL.
CVOpenGLBuffer
An image buffer used to store image data in video memory.
Data Types
Constants
See Also
Related Documentation
OpenGL


