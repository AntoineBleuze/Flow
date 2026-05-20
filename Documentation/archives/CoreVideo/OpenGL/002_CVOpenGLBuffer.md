# 002_CVOpenGLBuffer.pdf

## Page 1

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


## Page 2

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


