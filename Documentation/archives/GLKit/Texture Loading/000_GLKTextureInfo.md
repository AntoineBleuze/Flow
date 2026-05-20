# 000_GLKTextureInfo.pdf

## Page 1

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
When your app loads textures using the GLKTextureLoader class, the texture loader returns
information about the textures using GLKTextureInfo objects. Your app never creates
GLKTextureInfo objects directly.
var name: GLuint
The OpenGL context’s name for the texture.
var target: GLenum
The OpenGL binding target for the texture.
Overview
Topics
Reading Texture Information
GLKit / GLKTextureInfo Deprecated
Class
GLKTextureInfo Deprecated
Information about OpenGL textures created by the GLKTextureLoader class.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 2

var height: GLuint
The height of the loaded texture.
var width: GLuint
The width of the loaded texture.
var textureOrigin: GLKTextureInfoOrigin
The location of the origin in the loaded texture.
var alphaState: GLKTextureInfoAlphaState
The state of the alpha component in the loaded texture.
var containsMipmaps: Bool
A Boolean value that states whether the loaded texture contains mip maps.
enum GLKTextureInfoAlphaState
Values that describe the alpha information stored in a source image’s pixel data.
enum GLKTextureInfoOrigin
The location of the origin in the original source image.
var arrayLength: GLuint
var depth: GLuint
var mimapLevelCount: GLuint
NSObject
CVarArg
Constants
Instance Properties
Relationships
Inherits From
Conforms To


## Page 3

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class GLKTextureLoader
A utility class that simplifies loading OpenGL or OpenGL ES texture datas from a variety of
image file formats.
Deprecated
See Also
Texture Loading


