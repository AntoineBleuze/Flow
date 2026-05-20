# Reference.pdf

## Page 1

struct GLKTextureLoaderError
GLKit Enumerations
GLKit Constants
GLKit Functions
GLKit Data Types
Topics
Structures
See Also
Reference
GLKit / GLKit Structures
API Collection
GLKit Structures


## Page 2

enum GLKFogMode
A mode that describes how the fog component is calculated for the fragment.
enum GLKLightingType
A constant that describes how lighting is calculated by an effect.
enum GLKTextureEnvMode
The mode used to combine the texture with other color components.
enum GLKTextureInfoAlphaState
Values that describe the alpha information stored in a source image’s pixel data.
enum GLKTextureInfoOrigin
The location of the origin in the original source image.
enum Code
Values to be returned when a texture loader encounters an error.
enum GLKTextureTarget
The kind of texture pointed to by the property.
enum GLKViewDrawableColorFormat
The format of the color renderbuffer.
enum GLKViewDrawableDepthFormat
The format of the depth renderbuffer.
Topics
Enumerations
GLKit / GLKit Enumerations
API Collection
GLKit Enumerations


## Page 3

enum GLKViewDrawableMultisample
The format of the multisampling buffer.
enum GLKViewDrawableStencilFormat
The format of the stencil renderbuffer.
GLKit Structures
GLKit Constants
GLKit Functions
GLKit Data Types
See Also
Reference


## Page 4

let GLKTextureLoaderApplyPremultiplication: String
Whether image data should be premultiplied before being loaded into the sharegroup.
let GLKTextureLoaderErrorDomain: String
The error domain used by GLKit when returning texture loading errors.
Deprecated
let GLKTextureLoaderErrorKey: String
A key used to retrieve an error string from an error object userinfo dictionary.
Deprecated
let GLKTextureLoaderGLErrorKey: String
A key used to retrieve additional information from an error object’s userinfo dictionary.
Deprecated
let GLKTextureLoaderGenerateMipmaps: String
Whether or not to create mipmaps for a texture.
let GLKTextureLoaderGrayscaleAsAlpha: String
Whether or not to treat greyscale image data as alpha information.
let GLKTextureLoaderOriginBottomLeft: String
Whether or not to vertically flip image data to match OpenGL’s coordinate system.
let GLKTextureLoaderSRGB: String
Whether or not to treat texture image data as sRGB data.
Topics
Constants
GLKit / GLKit Constants
API Collection
GLKit Constants


## Page 5

Deprecated
var GLK_SSE3_INTRINSICS: Int32
let kGLKModelErrorDomain: String
Deprecated
let kGLKModelErrorKey: String
Deprecated
GLKit Structures
GLKit Enumerations
GLKit Functions
GLKit Data Types
See Also
Reference


## Page 6

func GLKMatrixStackCreate(CFAllocator?) -> Unmanaged<GLKMatrixStack>?
Allocates and returns a new matrix stack.
func GLKMatrixStackGetMatrix2(GLKMatrixStack) -> GLKMatrix2
Returns the top-left 2x2 corner of the top matrix.
func GLKMatrixStackGetMatrix3(GLKMatrixStack) -> GLKMatrix3
Returns the top-left 3x3 corner of the top matrix.
func GLKMatrixStackGetMatrix3Inverse(GLKMatrixStack) -> GLKMatrix3
Fetches the top-left 3x3 corner of the top matrix and returns its inverse.
func GLKMatrixStackGetMatrix3InverseTranspose(GLKMatrixStack) ->
GLKMatrix3
Fetches the top-left 3x3 corner of the top matrix and returns its inverse transpose.
func GLKMatrixStackGetMatrix4(GLKMatrixStack) -> GLKMatrix4
Returns a copy of the top matrix on the stack.
func GLKMatrixStackGetMatrix4Inverse(GLKMatrixStack) -> GLKMatrix4
Returns the inverse of the top matrix.
func GLKMatrixStackGetMatrix4InverseTranspose(GLKMatrixStack) ->
GLKMatrix4
Returns the inverse transpose of the top matrix.
Topics
Functions
GLKit / GLKit Functions
API Collection
GLKit Functions


## Page 7

func GLKMatrixStackGetTypeID() -> CFTypeID
Returns the Core Foundation type for a matrix stack.
func GLKMatrixStackLoadMatrix4(GLKMatrixStack, GLKMatrix4)
Replaces the contents of the top matrix with a new matrix.
func GLKMatrixStackMultiplyMatrix4(GLKMatrixStack, GLKMatrix4)
Replaces the contents of the top matrix with a matrix calculated by multiplying the contents 
the top matrix by another matrix.
func GLKMatrixStackMultiplyMatrixStack(GLKMatrixStack, GLKMatrixStack)
Replaces the contents of the top matrix with a matrix calculated by multiplying the contents 
the top matrix by the top matrix of another matrix stack.
func GLKMatrixStackPop(GLKMatrixStack)
Removes the topmost entry from the stack.
func GLKMatrixStackPush(GLKMatrixStack)
Push a copy of the topmost matrix onto the top of the stack.
func GLKMatrixStackRotate(GLKMatrixStack, Float, Float, Float, Float)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a rotation around an arbitrary axis.
func GLKMatrixStackRotateWithVector3(GLKMatrixStack, Float, GLKVector3)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a rotation around an arbitrary axis.
func GLKMatrixStackRotateWithVector4(GLKMatrixStack, Float, GLKVector4)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a rotation around an arbitrary axis.
func GLKMatrixStackRotateX(GLKMatrixStack, Float)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a rotation around the positive-x axis.
func GLKMatrixStackRotateY(GLKMatrixStack, Float)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a rotation around the positive-y axis.
func GLKMatrixStackRotateZ(GLKMatrixStack, Float)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a rotation around the positive-z axis.


## Page 8

func GLKMatrixStackScale(GLKMatrixStack, Float, Float, Float)
Replaces the contents of the top matrix with a matrix calculated by scaling the contents of th
top matrix.
func GLKMatrixStackScaleWithVector3(GLKMatrixStack, GLKVector3)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a scaling operation.
func GLKMatrixStackScaleWithVector4(GLKMatrixStack, GLKVector4)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a scaling operation defined by a vector.
func GLKMatrixStackSize(GLKMatrixStack) -> Int32
Returns the number of matrices present on the matrix stack.
func GLKMatrixStackTranslate(GLKMatrixStack, Float, Float, Float)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a translation operation.
func GLKMatrixStackTranslateWithVector3(GLKMatrixStack, GLKVector3)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a translation defined by a vector.
func GLKMatrixStackTranslateWithVector4(GLKMatrixStack, GLKVector4)
Replaces the contents of the top matrix with a matrix calculated by composing the top matri
with a translation defined by a vector.
func GLKVertexAttributeParametersFromModelIO(MDLVertexFormat) ->
GLKVertexAttributeParameters
GLKit Structures
GLKit Enumerations
GLKit Constants
See Also
Reference


## Page 9

GLKit Data Types


## Page 10

typealias GLKTextureLoaderCallback
Signature for the block executed after an asynchronous texture loading operation completes
typealias GLKVertexAttributeParameters
GLKit Structures
GLKit Enumerations
GLKit Constants
GLKit Functions
Topics
Data Types
See Also
Reference
GLKit / GLKit Data Types
API Collection
GLKit Data Types


