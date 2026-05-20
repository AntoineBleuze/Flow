# OpenGL ES.pdf

## Page 1

Core Video uses OpenGL ES texture caches to cache and manage CVOpenGLESTexture texture
These texture caches provide you with a way to directly read and write buffers with various pixel
formats, such as 420v or BGRA, from GL ES.
The functions in this section operate on Core Video texture caches derived from the CVOpen
GLESTextureCacheRef type.
func CVOpenGLESTextureCacheCreate(CFAllocator?, CFDictionary?,
CVEAGLContext, CFDictionary?, UnsafeMutablePointer<CVOpenGLESTexture
Cache?>) -> CVReturn
Creates a new Core Video texture cache.
Deprecated
func CVOpenGLESTextureCacheCreateTextureFromImage(CFAllocator?, CVOpen
GLESTextureCache, CVImageBuffer, CFDictionary?, GLenum, GLint, GLsizei,
GLsizei, GLenum, GLenum, Int, UnsafeMutablePointer<CVOpenGLESTexture?>)
-> CVReturn
Creates a CVOpenGLESTexture object from an existing CVImageBuffer.
Deprecated
func CVOpenGLESTextureCacheFlush(CVOpenGLESTextureCache, CVOptionFlags)
Overview
Topics
Functions
Core Video / CVOpenGLESTextureCache
API Collection
CVOpenGLESTextureCache
A cache used to create and manage OpenGL ES texture objects.


## Page 2

Performs internal housekeeping/recycling operations on a texture cache.
Deprecated
func CVOpenGLESTextureCacheGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier for a Core Video texture cache.
Deprecated
class CVOpenGLESTextureCache
typealias CVEAGLContext
A type that resolves to an EAGLContext pointer when appropriate.
Cache Attributes
Attributes for the texture cache.
CVOpenGLESTexture
A texture-based image buffer that supplies source image data to OpenGL ES.
Data Types
Constants
See Also
OpenGL ES


## Page 3

Core Video OpenGL ES textures are texture-based image buffers the system uses to supply sourc
image data to OpenGL.
The functions in this section operate on Core Video texture-based image buffers derived from the
CVOpenGLESTextureRef type.
func CVOpenGLESTextureGetTarget(CVOpenGLESTexture) -> GLenum
Returns the texture target for a CVOpenGLESTextureRef.
Deprecated
func CVOpenGLESTextureGetName(CVOpenGLESTexture) -> GLuint
Returns the texture target name for a CVOpenGLESTextureRef.
Deprecated
func CVOpenGLESTextureGetCleanTexCoords(CVOpenGLESTexture, UnsafeMutabl
Pointer<GLfloat>, UnsafeMutablePointer<GLfloat>, UnsafeMutablePointer<
GLfloat>, UnsafeMutablePointer<GLfloat>)
Returns convenient normalized texture coordinates for the part of the image that should be
displayed.
Deprecated
Overview
Topics
Inspecting Textures
Core Video / CVOpenGLESTexture
API Collection
CVOpenGLESTexture
A texture-based image buffer that supplies source image data to OpenGL ES.


## Page 4

func CVOpenGLESTextureIsFlipped(CVOpenGLESTexture) -> Bool
Returns whether the image is flipped vertically or not.
Deprecated
func CVOpenGLESTextureGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier for a Core Video texture-based image buffer.
Deprecated
typealias CVOpenGLESTexture
A reference to a Core Video texture-based image buffer.
CVOpenGLESTextureCache
A cache used to create and manage OpenGL ES texture objects.
Data Types
See Also
OpenGL ES


