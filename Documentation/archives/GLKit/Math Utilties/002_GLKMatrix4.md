# 002_GLKMatrix4.pdf

## Page 1

The GLKMatrix4 type defines a 4x4 floating-point matrix as well as many mathematical
operations commonly used to manipulate matrices. 3D graphics programming uses matrices
extensively as a convenient way to represent a graphical transformation between different
coordinate systems. These transformations include translation, scaling, rotation and projection;
through matrix multiplication, multiple transformations can be concatenated into a single
transformation matrix.
The functions that manipulate GLKMatrix4 structures treat the inputs as immutable, instead
returning a new matrix that represent the results of the operation.
func GLKMatrix4Make(Float, Float, Float, Float, Float, Float, Float,
Float, Float, Float, Float, Float, Float, Float, Float, Float) ->
GLKMatrix4
Returns a 4x4 matrix created from individual component values.
func GLKMatrix4MakeAndTranspose(Float, Float, Float, Float, Float, Floa
, Float, Float, Float, Float, Float, Float, Float, Float, Float, Float)
-> GLKMatrix4
Returns a 4x4 transposed matrix created from individual component values.
func GLKMatrix4MakeWithArray(UnsafeMutablePointer<Float>!) -> GLKMatrix
Returns a 4x4 matrix created from an array of component values.
Overview
Topics
Creating Matrices
GLKit / GLKMatrix4
API Collection
GLKMatrix4


## Page 2

func GLKMatrix4MakeWithArrayAndTranspose(UnsafeMutablePointer<Float>!) 
> GLKMatrix4
Returns a 4x4 transposed matrix created from an array of component values.
func GLKMatrix4MakeWithColumns(GLKVector4, GLKVector4, GLKVector4,
GLKVector4) -> GLKMatrix4
Returns a 4x4 matrix created from four column vectors.
func GLKMatrix4MakeWithRows(GLKVector4, GLKVector4, GLKVector4,
GLKVector4) -> GLKMatrix4
Returns a 4x4 matrix created from four row vectors.
func GLKMatrix4MakeRotation(Float, Float, Float, Float) -> GLKMatrix4
Returns a 4x4 matrix that performs a rotation around an arbitrary vector.
func GLKMatrix4MakeXRotation(Float) -> GLKMatrix4
Returns a 4x4 matrix that performs a rotation around the positive x-axis.
func GLKMatrix4MakeYRotation(Float) -> GLKMatrix4
Returns a 4x4 matrix that performs a rotation around the positive y-axis.
func GLKMatrix4MakeZRotation(Float) -> GLKMatrix4
Returns a 4x4 matrix that performs a rotation around the positive z-axis.
func GLKMatrix4MakeWithQuaternion(GLKQuaternion) -> GLKMatrix4
Returns a 4x4 matrix that performs a rotation based on a quaternion.
func GLKMatrix4MakeScale(Float, Float, Float) -> GLKMatrix4
Returns a 4x4 matrix that performs a scaling transformation.
func GLKMatrix4MakeTranslation(Float, Float, Float) -> GLKMatrix4
Returns a 4x4 matrix that performs a translation.
func GLKMatrix4MakeLookAt(Float, Float, Float, Float, Float, Float,
Float, Float, Float) -> GLKMatrix4
Returns a 4x4 matrix that transforms world coordinates to eye coordinates.
func GLKMatrix4MakeOrtho(Float, Float, Float, Float, Float, Float) ->
GLKMatrix4
Returns a 4x4 orthographic projection matrix.
func GLKMatrix4MakePerspective(Float, Float, Float, Float) -> GLKMatrix
Returns a 4x4 perspective projection matrix.


## Page 3

func GLKMatrix4MakeFrustum(Float, Float, Float, Float, Float, Float) ->
GLKMatrix4
Returns a 4x4 perspective projection matrix.
func GLKMatrix4GetMatrix2(GLKMatrix4) -> GLKMatrix2
Returns the upper-left 2x2 section of a 4x4 matrix.
func GLKMatrix4GetMatrix3(GLKMatrix4) -> GLKMatrix3
Returns the upper-left 3x3 section of a 4x4 matrix.
func GLKMatrix4GetColumn(GLKMatrix4, Int32) -> GLKVector4
Retrieves a column from a 4x4 matrix.
func GLKMatrix4GetRow(GLKMatrix4, Int32) -> GLKVector4
Retrieves a row from a 4x4 matrix.
func GLKMatrix4SetColumn(GLKMatrix4, Int32, GLKVector4) -> GLKMatrix4
Returns a new 4x4 matrix with one column replaced by a new vector.
func GLKMatrix4SetRow(GLKMatrix4, Int32, GLKVector4) -> GLKMatrix4
Returns a new 4x4 matrix with one row replaced by a new vector.
func GLKMatrix4Invert(GLKMatrix4, UnsafeMutablePointer<Bool>?) ->
GLKMatrix4
Returns the inverse of a matrix.
func GLKMatrix4Transpose(GLKMatrix4) -> GLKMatrix4
Returns the transpose of a matrix.
func GLKMatrix4InvertAndTranspose(GLKMatrix4, UnsafeMutablePointer<Bool
>?) -> GLKMatrix4
Returns the inverse transpose of a matrix.
func GLKMatrix4Multiply(GLKMatrix4, GLKMatrix4) -> GLKMatrix4
Returns the product of two matrices.
func GLKMatrix4Rotate(GLKMatrix4, Float, Float, Float, Float) ->
GLKMatrix4
Working With Parts of a Matrix
Performing Mathematical Operations on Matrices


## Page 4

Returns a new 4x4 matrix created by concatenating a matrix with a rotation around a vector.
func GLKMatrix4RotateWithVector3(GLKMatrix4, Float, GLKVector3) ->
GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a rotation around a vector.
func GLKMatrix4RotateWithVector4(GLKMatrix4, Float, GLKVector4) ->
GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a rotation around a vector.
func GLKMatrix4RotateX(GLKMatrix4, Float) -> GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a rotation around the x-ax
func GLKMatrix4RotateY(GLKMatrix4, Float) -> GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a rotation around the y-ax
func GLKMatrix4RotateZ(GLKMatrix4, Float) -> GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a rotation around the z-ax
func GLKMatrix4Scale(GLKMatrix4, Float, Float, Float) -> GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a scaling transform.
func GLKMatrix4ScaleWithVector3(GLKMatrix4, GLKVector3) -> GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a scaling transform define
by a vector.
func GLKMatrix4ScaleWithVector4(GLKMatrix4, GLKVector4) -> GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a scaling transform define
by a vector.
func GLKMatrix4Translate(GLKMatrix4, Float, Float, Float) -> GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a translation transform.
func GLKMatrix4TranslateWithVector3(GLKMatrix4, GLKVector3) ->
GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a translation transform
defined by a vector.
func GLKMatrix4TranslateWithVector4(GLKMatrix4, GLKVector4) ->
GLKMatrix4
Returns a new 4x4 matrix created by concatenating a matrix with a translation transform
defined by a vector.
func GLKMatrix4Add(GLKMatrix4, GLKMatrix4) -> GLKMatrix4


## Page 5

Returns a new 4x4 matrix created by performing a component-wise addition of two matrices
func GLKMatrix4Subtract(GLKMatrix4, GLKMatrix4) -> GLKMatrix4
Returns a new 4x4 matrix created by performing a component-wise subtraction of two
matrices.
func GLKMatrix4MultiplyVector3(GLKMatrix4, GLKVector3) -> GLKVector3
Multiplies a 4x4 matrix by a 3-component vector.
func GLKMatrix4MultiplyVector3Array(GLKMatrix4, UnsafeMutablePointer<
GLKVector3>, Int)
Multiplies a 4x4 matrix by an array of 3-component vectors.
func GLKMatrix4MultiplyVector3WithTranslation(GLKMatrix4, GLKVector3) -
GLKVector3
Multiplies a 4x4 matrix by a 3-component vector, applying translation.
func GLKMatrix4MultiplyVector3ArrayWithTranslation(GLKMatrix4, Unsafe
MutablePointer<GLKVector3>, Int)
Multiplies a 4x4 matrix by an array of 3-component vectors, applying translation.
func GLKMatrix4MultiplyVector4(GLKMatrix4, GLKVector4) -> GLKVector4
Multiplies a 4x4 matrix by a 4-component vector.
func GLKMatrix4MultiplyVector4Array(GLKMatrix4, UnsafeMutablePointer<
GLKVector4>, Int)
Multiplies a 4x4 matrix by an array of 4-component vectors.
func GLKMatrix4MultiplyAndProjectVector3(GLKMatrix4, GLKVector3) ->
GLKVector3
Multiplies a 4x4 matrix by a position vector to create a vector in homogenous coordinates,
then projects the result to a 3-component vector.
func GLKMatrix4MultiplyAndProjectVector3Array(GLKMatrix4, UnsafeMutable
Pointer<GLKVector3>, Int)
Multiplies a 4x4 matrix by an array of 3-component vectors. Each result is projected back to
3-component vector.
Performing Mathematical Operations on Vectors
Data Types


## Page 6

typealias GLKMatrix4
A 4x4 matrix.
let GLKMatrix4Identity: GLKMatrix4
A 4x4 identity matrix.
class GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for hierarchical
transform modeling and similar tasks.
GLKMatrix3
GLKVector2
GLKVector3
GLKVector4
GLKQuaternion
GLKit Math Utilities
Constants
See Also
Math Utilties


