# Texture Loading.pdf

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


## Page 4

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The GLKTextureLoader class can load two-dimensional or cubemap textures in most image
formats supported by the Image I/O framework. In iOS, it can also load textures compressed in th
PVRTC format. It can load the data synchronously or asynchronously.
To load textures synchronously, make a context with the desired sharegroup the current context,
and then call one or more of the class methods. The returned texture info object includes details
about the loaded texture.
To load textures asynchronously, your initialization code allocates and initializes a new
GLKTextureLoader object using the sharegroup object that should be the destination for new
textures. Then, to load a texture, your app calls one of the texture loader’s instance methods,
passing in a completion handler block to be called when the texture has been loaded.
The following OpenGL properties are set for a newly created, non-mipmapped texture:
GL_TEXTURE_MIN_FILTER:GL_LINEAR
GL_TEXTURE_MAG_FILTER:GL_LINEAR
Overview
GLKit / GLKTextureLoader Deprecated
Class
GLKTextureLoader Deprecated
A utility class that simplifies loading OpenGL or OpenGL ES texture datas from a
variety of image file formats.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 5

GL_TEXTURE_WRAP_S:GL_CLAMP_TO_EDGE
GL_TEXTURE_WRAP_T:GL_CLAMP_TO_EDGE
The following OpenGL properties are set for a newly created, mipmapped texture:
GL_TEXTURE_MIN_FILTER:GL_LINEAR_MIPMAP_LINEAR
GL_TEXTURE_MAG_FILTER:GL_LINEAR
GL_TEXTURE_WRAP_S:GL_CLAMP_TO_EDGE
GL_TEXTURE_WRAP_T:GL_CLAMP_TO_EDGE
The GLKTextureLoader and GLKTextureInfo classes do not manage the OpenGL texture fo
you. Once the texture is returned to your app, you are responsible for it. This means that after you
app is finished using an OpenGL texture, it must explicitly deallocate it by calling the glDelete
Textures function.
init(sharegroup: EAGLSharegroup)
Initializes a new texture loader object.
init(share: NSOpenGLContext)
Initializes a new texture loader object.
class func texture(withContentsOfFile: String, options: [String :
NSNumber]?) throws -> GLKTextureInfo
Loads a 2D texture image from a file and creates a new texture from the data.
func texture(withContentsOfFile: String, options: [String : NSNumber]?,
queue: dispatch_queue_t?, completionHandler: (GLKTextureInfo?, (any
Error)?) -> Void)
Asynchronously loads a 2D texture image from a file and creates a new texture from the data
class func texture(withContentsOf: URL, options: [String : NSNumber]?)
throws -> GLKTextureInfo
Topics
Initialization
Loading Textures from Files
Loading a Texture From a URL


## Page 6

Loads a 2D texture image from a URL and creates a new texture from the data.
func texture(withContentsOf: URL, options: [String : NSNumber]?, queue:
dispatch_queue_t?, completionHandler: (GLKTextureInfo?, (any Error)?) -
Void)
Asynchronously loads a 2D texture image from a URL and creates a new texture from the da
class func texture(withContentsOf: Data, options: [String : NSNumber]?)
throws -> GLKTextureInfo
Loads a 2D texture image from a memory range and creates a new texture from the data.
func texture(withContentsOf: Data, options: [String : NSNumber]?, queue
dispatch_queue_t?, completionHandler: (GLKTextureInfo?, (any Error)?) -
Void)
Asynchronously loads a 2D texture image from a memory range and creates a new texture
from the data.
class func texture(with: CGImage, options: [String : NSNumber]?) throws
-> GLKTextureInfo
Loads a 2D texture image from a Quartz image and creates a new texture from the data.
func texture(with: CGImage, options: [String : NSNumber]?, queue:
dispatch_queue_t?, completionHandler: (GLKTextureInfo?, (any Error)?) -
Void)
Asynchronously loads a 2D texture image from a Quartz image and creates a new texture fro
the data.
class func cubeMap(withContentsOfFile: String, options: [String :
NSNumber]?) throws -> GLKTextureInfo
Loads a cube map texture image from a single file and creates a new texture from the data.
func cubeMap(withContentsOfFile: String, options: [String : NSNumber]?,
queue: dispatch_queue_t?, completionHandler: (GLKTextureInfo?, (any
Error)?) -> Void)
Asynchronously loads a cube map texture image from a single file and creates a new texture
from the data.
Creating Textures from In-Memory Representations
Creating Textures from CGImages
Loading Cube Maps from Files


## Page 7

class func cubeMap(withContentsOfFiles: [Any], options: [String :
NSNumber]?) throws -> GLKTextureInfo
Loads a cube map texture image from a series of files and creates a new texture from the
data.
func cubeMap(withContentsOfFiles: [Any], options: [String : NSNumber]?,
queue: dispatch_queue_t?, completionHandler: (GLKTextureInfo?, (any
Error)?) -> Void)
Asynchronously loads a cube map texture image from a series of files and creates a new
texture from the data.
class func cubeMap(withContentsOf: URL, options: [String : NSNumber]?)
throws -> GLKTextureInfo
Loads a cube map texture image from a single URL and creates a new texture from the data.
func cubeMap(withContentsOf: URL, options: [String : NSNumber]?, queue:
dispatch_queue_t?, completionHandler: (GLKTextureInfo?, (any Error)?) -
Void)
Asynchronously loads a cube map texture image from a single URL and creates a new textur
from the data.
typealias GLKTextureLoaderCallback
Signature for the block executed after an asynchronous texture loading operation completes
Texture Loading Options
Keys to specify in a textureOperations dictionary.
Texture Error Handling
Strings used when handling error messages returned from a texture loading method.
enum Code
Values to be returned when a texture loader encounters an error.
func texture(withName: String, scaleFactor: CGFloat, bundle: Bundle?,
options: [String : NSNumber]?, queue: dispatch_queue_t?, completion
Handler: (GLKTextureInfo?, (any Error)?) -> Void)
Loading Cube Maps from URLs
Constants
Instance Methods


## Page 8

class func texture(withName: String, scaleFactor: CGFloat, bundle:
Bundle?, options: [String : NSNumber]?) throws -> GLKTextureInfo
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GLKTextureInfo
Information about OpenGL textures created by the GLKTextureLoader class.
Deprecated
Type Methods
Relationships
Inherits From
Conforms To
See Also
Texture Loading


