# 001_CVOpenGLTexture.pdf

## Page 1

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


## Page 2

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


