# 001_GLKMatrix3.pdf

## Page 1

The GLKMatrix3 type defines a 3x3 floating-point matrix as well as many mathematical
operations commonly used to manipulate matrices. A 3x3 matrix is commonly used in graphics
programming to represent scaling or rotation transformations to convert from one coordinate
system to another.
The functions that manipulate GLKMatrix3 structures treat the inputs as immutable, instead
returning a new matrix that represent the results of the operation.
func GLKMatrix3Make(Float, Float, Float, Float, Float, Float, Float,
Float, Float) -> GLKMatrix3
Returns a 3x3 matrix created from individual component values.
func GLKMatrix3MakeAndTranspose(Float, Float, Float, Float, Float, Floa
, Float, Float, Float) -> GLKMatrix3
Returns a 3x3 transposed matrix created from individual component values.
func GLKMatrix3MakeWithArray(UnsafeMutablePointer<Float>!) -> GLKMatrix
Returns a 3x3 matrix created from an array of component values.
func GLKMatrix3MakeWithArrayAndTranspose(UnsafeMutablePointer<Float>!) 
> GLKMatrix3
Returns a 3x3 transposed matrix created from an array of component values.
Overview
Topics
Creating Matrices
GLKit / GLKMatrix3
API Collection
GLKMatrix3


## Page 2

func GLKMatrix3MakeWithColumns(GLKVector3, GLKVector3, GLKVector3) ->
GLKMatrix3
Returns a 3x3 matrix created from three column vectors.
func GLKMatrix3MakeWithRows(GLKVector3, GLKVector3, GLKVector3) ->
GLKMatrix3
Returns a 3x3 matrix created from three row vectors.
func GLKMatrix3MakeRotation(Float, Float, Float, Float) -> GLKMatrix3
Returns a 3x3 matrix that performs a rotation around an arbitrary vector.
func GLKMatrix3MakeXRotation(Float) -> GLKMatrix3
Returns a 3x3 matrix that performs a rotation around the positive x-axis.
func GLKMatrix3MakeYRotation(Float) -> GLKMatrix3
Returns a 3x3 matrix that performs a rotation around the positive y-axis.
func GLKMatrix3MakeZRotation(Float) -> GLKMatrix3
Returns a 3x3 matrix that performs a rotation around the positive z-axis.
func GLKMatrix3MakeWithQuaternion(GLKQuaternion) -> GLKMatrix3
Returns a 3x3 matrix that performs a rotation based on a quaternion.
func GLKMatrix3MakeScale(Float, Float, Float) -> GLKMatrix3
Returns a 3x3 matrix that performs a scaling transformation.
func GLKMatrix3GetMatrix2(GLKMatrix3) -> GLKMatrix2
Returns the upper-left 2x2 section of a 3x3 matrix.
func GLKMatrix3GetColumn(GLKMatrix3, Int32) -> GLKVector3
Retrieves a column from a 3x3 matrix.
func GLKMatrix3GetRow(GLKMatrix3, Int32) -> GLKVector3
Retrieves a row from a 3x3 matrix.
func GLKMatrix3SetColumn(GLKMatrix3, Int32, GLKVector3) -> GLKMatrix3
Returns a new 3x3 matrix with one column replaced by a new vector.
func GLKMatrix3SetRow(GLKMatrix3, Int32, GLKVector3) -> GLKMatrix3
Returns a new 3x3 matrix with one row replaced by a new vector.
Working With Parts of a Matrix


## Page 3

func GLKMatrix3Invert(GLKMatrix3, UnsafeMutablePointer<Bool>!) ->
GLKMatrix3
Returns the inverse of a matrix.
func GLKMatrix3Transpose(GLKMatrix3) -> GLKMatrix3
Returns the transpose of a matrix.
func GLKMatrix3InvertAndTranspose(GLKMatrix3, UnsafeMutablePointer<Bool
>!) -> GLKMatrix3
Returns the inverse transpose of a matrix.
func GLKMatrix3Multiply(GLKMatrix3, GLKMatrix3) -> GLKMatrix3
Returns the product of two matrices.
func GLKMatrix3Rotate(GLKMatrix3, Float, Float, Float, Float) ->
GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a rotation around a vector.
func GLKMatrix3RotateWithVector3(GLKMatrix3, Float, GLKVector3) ->
GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a rotation around a vector.
func GLKMatrix3RotateWithVector4(GLKMatrix3, Float, GLKVector4) ->
GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a rotation around a vector.
func GLKMatrix3RotateX(GLKMatrix3, Float) -> GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a rotation around the x-ax
func GLKMatrix3RotateY(GLKMatrix3, Float) -> GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a rotation around the y-ax
func GLKMatrix3RotateZ(GLKMatrix3, Float) -> GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a rotation around the z-ax
func GLKMatrix3Scale(GLKMatrix3, Float, Float, Float) -> GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a scaling transform.
func GLKMatrix3ScaleWithVector3(GLKMatrix3, GLKVector3) -> GLKMatrix3
Performing Mathematical Operations on Matrices


## Page 4

Returns a new 3x3 matrix created by concatenating a matrix with a scaling transform define
by a vector.
func GLKMatrix3ScaleWithVector4(GLKMatrix3, GLKVector4) -> GLKMatrix3
Returns a new 3x3 matrix created by concatenating a matrix with a scaling transform define
by a vector.
func GLKMatrix3Add(GLKMatrix3, GLKMatrix3) -> GLKMatrix3
Returns a new 3x3 matrix created by performing a component-wise addition of two matrices
func GLKMatrix3Subtract(GLKMatrix3, GLKMatrix3) -> GLKMatrix3
Returns a new 3x3 matrix created by performing a component-wise subtraction of two
matrices.
func GLKMatrix3MultiplyVector3(GLKMatrix3, GLKVector3) -> GLKVector3
Multiplies a 3x3 matrix by a vector.
func GLKMatrix3MultiplyVector3Array(GLKMatrix3, UnsafeMutablePointer<
GLKVector3>, Int)
Multiplies a 3x3 matrix by an array of vectors.
typealias GLKMatrix2
A 2x2 matrix.
typealias GLKMatrix3
A 3x3 matrix stored in column-major order.
let GLKMatrix3Identity: GLKMatrix3
A 3x3 identity matrix.
Performing Mathematical Operations on Vectors
Data Types
Constants
See Also


## Page 5

class GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for hierarchical
transform modeling and similar tasks.
GLKMatrix4
GLKVector2
GLKVector3
GLKVector4
GLKQuaternion
GLKit Math Utilities
Math Utilties


