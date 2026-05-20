# 000_CVOpenGLTextureCache.pdf

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


