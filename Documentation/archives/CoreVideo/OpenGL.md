# OpenGL.pdf

## Page 1

func CVOpenGLTextureCacheCreate(CFAllocator?, CFDictionary?, CGLContext
Obj, CGLPixelFormatObj, CFDictionary?, UnsafeMutablePointer<CVOpen
GLTextureCache?>) -> CVReturn
Creates a new texture cache.
Deprecated
func CVOpenGLTextureCacheCreateTextureFromImage(CFAllocator?, CVOpen
GLTextureCache, CVImageBuffer, CFDictionary?, UnsafeMutablePointer<
CVOpenGLTexture?>) -> CVReturn
Creates a CVOpenGLTexture object from an existing CVImageBuffer.
Deprecated
func CVOpenGLTextureCacheFlush(CVOpenGLTextureCache, CVOptionFlags)
Performs internal housekeeping/recycling operations on the cache.
Deprecated
func CVOpenGLTextureCacheGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier for a the texture cache.
Deprecated
class CVOpenGLTextureCache
Topics
Functions
Data Types
Core Video / CVOpenGLTextureCache
API Collection
CVOpenGLTextureCache
A cache used to create and manage OpenGL texture objects.


## Page 2

Cache Attributes
Dictionary keys and values for use with the cacheAttributes parameter of CVOpenGLTextur
CacheCreate(_:_:_:_:_:_:)
CVOpenGLTexture
A texture-based image buffer that supplies source image data to OpenGL.
CVOpenGLBuffer
An image buffer used to store image data in video memory.
CVOpenGLBufferPool
A utility object for managing a set of recyclable OpenGL buffer objects.
Constants
See Also
OpenGL


## Page 3

Core Video OpenGL textures are texture-based image buffers used for supplying source image
data to OpenGL.
func CVOpenGLTextureGetName(CVOpenGLTexture) -> GLuint
Returns the texture target name of a CoreVideo OpenGL texture.
Deprecated
func CVOpenGLTextureGetTarget(CVOpenGLTexture) -> GLenum
Returns the texture target (for example, GL_TEXTURE_2D) of an OpenGL texture.
Deprecated
func CVOpenGLTextureGetCleanTexCoords(CVOpenGLTexture, UnsafeMutable
Pointer<GLfloat>, UnsafeMutablePointer<GLfloat>, UnsafeMutablePointer<
GLfloat>, UnsafeMutablePointer<GLfloat>)
Returns the texture coordinates for the part of the image that should be displayed.
Deprecated
func CVOpenGLTextureIsFlipped(CVOpenGLTexture) -> Bool
Determines whether an OpenGL texture is flipped vertically.
Deprecated
Overview
Topics
Inspecting Textures
Core Video / CVOpenGLTexture
API Collection
CVOpenGLTexture
A texture-based image buffer that supplies source image data to OpenGL.


## Page 4

func CVOpenGLTextureGetTypeID() -> CFTypeID
Obtains the Core Foundation ID for the Core Video OpenGL texture type.
Deprecated
typealias CVOpenGLTexture
A reference to an OpenGL texture-based image buffer object.
CVOpenGLTextureCache
A cache used to create and manage OpenGL texture objects.
CVOpenGLBuffer
An image buffer used to store image data in video memory.
CVOpenGLBufferPool
A utility object for managing a set of recyclable OpenGL buffer objects.
Data Types
See Also
OpenGL


## Page 5

func CVOpenGLBufferCreate(CFAllocator?, Int, Int, CFDictionary?, Unsafe
MutablePointer<CVOpenGLBuffer?>) -> CVReturn
Creates a new Core Video OpenGL buffer that can be used for OpenGL rendering purposes
Deprecated
func CVOpenGLBufferAttach(CVOpenGLBuffer, CGLContextObj, GLenum, GLint,
GLint) -> CVReturn
Attaches an OpenGL context to a Core Video OpenGL buffer.
Deprecated
func CVOpenGLBufferGetAttributes(CVOpenGLBuffer) -> Unmanaged<
CFDictionary>?
Obtains the attributes of a Core Video OpenGL buffer.
Deprecated
func CVOpenGLBufferGetTypeID() -> CFTypeID
Obtains the Core Foundation type ID for the OpenGL buffer type.
Deprecated
typealias CVOpenGLBuffer
A reference to a Core Video OpenGL buffer object.
Topics
Functions
Data Types
Core Video / CVOpenGLBuffer
API Collection
CVOpenGLBuffer
An image buffer used to store image data in video memory.


## Page 6

let kCVOpenGLBufferHeight: CFString
The height of the buffer.
Deprecated
let kCVOpenGLBufferInternalFormat: CFString
The OpenGL internal format of this buffer.
Deprecated
let kCVOpenGLBufferMaximumMipmapLevel: CFString
The maximum mipmap level for this buffer.
Deprecated
let kCVOpenGLBufferTarget: CFString
The OpenGL target for this buffer.
Deprecated
let kCVOpenGLBufferWidth: CFString
The width of the buffer.
Deprecated
CVOpenGLTextureCache
A cache used to create and manage OpenGL texture objects.
CVOpenGLTexture
A texture-based image buffer that supplies source image data to OpenGL.
CVOpenGLBufferPool
A utility object for managing a set of recyclable OpenGL buffer objects.
Constants
See Also
OpenGL


## Page 7

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


## Page 8

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


