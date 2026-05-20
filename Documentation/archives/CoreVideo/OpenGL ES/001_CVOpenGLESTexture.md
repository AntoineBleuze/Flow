# 001_CVOpenGLESTexture.pdf

## Page 1

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


## Page 2

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


