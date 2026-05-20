# Math Utilties.pdf

## Page 1

Equatable, Hashable
GLKMatrix3
GLKMatrix4
GLKVector2
GLKVector3
GLKVector4
GLKQuaternion
Relationships
Conforms To
See Also
Math Utilties
GLKit / GLKMatrixStack
Class
GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for
hierarchical transform modeling and similar tasks.
iOS 5.0+
iPadOS 5.0+
macOS 10.8+
tvOS 9.0+


## Page 2

GLKit Math Utilities


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

The GLKVector2 type defines a 2-component floating-point vector as well as many mathematic
operations commonly used to manipulate vectors. Graphics programming uses vectors extensive
to represent positions, colors and other data structures.
The functions that manipulate GLKVector2 structures treat the inputs as immutable, instead
returning a new vector that represent the results of the operation.
func GLKVector2Make(Float, Float) -> GLKVector2
Returns a new two-component vector created from individual component values.
func GLKVector2MakeWithArray(UnsafeMutablePointer<Float>!) -> GLKVector
Returns a new two-component vector created from an array of components.
func GLKVector2Length(GLKVector2) -> Float
Returns the length of a vector.
func GLKVector2Distance(GLKVector2, GLKVector2) -> Float
Returns the distance between two points.
Overview
Topics
Creating Vectors
Retrieving Information About a Vector
GLKit / GLKVector2
API Collection
GLKVector2


## Page 15

func GLKVector2Negate(GLKVector2) -> GLKVector2
Returns a new vector created by negating the component values of another vector.
func GLKVector2Normalize(GLKVector2) -> GLKVector2
Returns a new vector created by normalizing an input vector to a length of 1.0.
func GLKVector2AddScalar(GLKVector2, Float) -> GLKVector2
Returns a new vector created by adding a scalar value to each component of a vector.
func GLKVector2SubtractScalar(GLKVector2, Float) -> GLKVector2
Returns a new vector created by subtracting a scalar value from each component of a vecto
func GLKVector2MultiplyScalar(GLKVector2, Float) -> GLKVector2
Returns a new vector created by multiplying each component of a vector by a scalar value.
func GLKVector2DivideScalar(GLKVector2, Float) -> GLKVector2
Returns a new vector created by dividing each component of a vector by a scalar value.
func GLKVector2Add(GLKVector2, GLKVector2) -> GLKVector2
Returns the sum of two vectors.
func GLKVector2Subtract(GLKVector2, GLKVector2) -> GLKVector2
Returns the difference between two vectors.
func GLKVector2Multiply(GLKVector2, GLKVector2) -> GLKVector2
Returns a new vector created by multiplying one vector by another.
func GLKVector2Divide(GLKVector2, GLKVector2) -> GLKVector2
Returns a new vector created by dividing one vector by another.
func GLKVector2DotProduct(GLKVector2, GLKVector2) -> Float
Returns the dot product of two vectors.
func GLKVector2Lerp(GLKVector2, GLKVector2, Float) -> GLKVector2
Returns a new vector created by linearly interpreting between two vectors.
func GLKVector2Project(GLKVector2, GLKVector2) -> GLKVector2
Returns a new vector created by projecting a vector onto another vector
func GLKVector2Maximum(GLKVector2, GLKVector2) -> GLKVector2
Mathematical Operations Performed on Vectors


## Page 16

Returns a new vector whose component value at each position is the largest component valu
at the same position of the two source vectors.
func GLKVector2Minimum(GLKVector2, GLKVector2) -> GLKVector2
Returns a new vector whose component value at each position is the smallest component
value at the same position of the two source vectors.
func GLKVector2AllEqualToScalar(GLKVector2, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are equ
to a scalar value.
func GLKVector2AllEqualToVector2(GLKVector2, GLKVector2) -> Bool
Returns a Boolean value that indicates whether each component of the first vector is equal t
the corresponding component of a second vector.
func GLKVector2AllGreaterThanOrEqualToScalar(GLKVector2, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are
greater than or equal to a scalar value.
func GLKVector2AllGreaterThanOrEqualToVector2(GLKVector2, GLKVector2) -
Bool
Returns a Boolean value that indicates whether each component of the first vector is greater
than or equal to the corresponding component of a second vector.
func GLKVector2AllGreaterThanScalar(GLKVector2, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are
greater than a scalar value.
func GLKVector2AllGreaterThanVector2(GLKVector2, GLKVector2) -> Bool
Returns a Boolean value that indicates whether each component of the first vector is greater
than the corresponding component of a second vector.
typealias GLKVector2
A representation of a 2-component vector.
Comparison Operations
Data Types
See Also


## Page 17

class GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for hierarchical
transform modeling and similar tasks.
GLKMatrix3
GLKMatrix4
GLKVector3
GLKVector4
GLKQuaternion
GLKit Math Utilities
Math Utilties


## Page 18

The GLKVector3 type defines a 3-component floating-point vector as well as many mathematic
operations commonly used to manipulate vectors. Graphics programming uses vectors extensive
to represent positions, normals, colors and other data structures.
The functions that manipulate GLKVector3 structures treat the inputs as immutable, instead
returning a new vector that represent the results of the operation.
func GLKVector3Make(Float, Float, Float) -> GLKVector3
Returns a new three-component vector created from individual component values.
func GLKVector3MakeWithArray(UnsafeMutablePointer<Float>!) -> GLKVector
Returns a new three-component vector created from an array of components.
func GLKVector3Length(GLKVector3) -> Float
Returns the length of a vector.
func GLKVector3Distance(GLKVector3, GLKVector3) -> Float
Returns the distance between two points.
Overview
Topics
Creating Vectors
Retrieving Information About a Vector
GLKit / GLKVector3
API Collection
GLKVector3


## Page 19

func GLKVector3Negate(GLKVector3) -> GLKVector3
Returns a new vector created by negating the component values of another vector.
func GLKVector3Normalize(GLKVector3) -> GLKVector3
Returns a new vector created by normalizing the input vector to a length of 1.0.
func GLKVector3AddScalar(GLKVector3, Float) -> GLKVector3
Returns a new vector created by adding a scalar value to each component of a vector.
func GLKVector3SubtractScalar(GLKVector3, Float) -> GLKVector3
Returns a new vector created by subtracting a scalar value from each component of a vecto
func GLKVector3MultiplyScalar(GLKVector3, Float) -> GLKVector3
Returns a new vector created by multiplying each component of a vector by a scalar value.
func GLKVector3DivideScalar(GLKVector3, Float) -> GLKVector3
Returns a new vector created by dividing each component of a vector by a scalar value.
func GLKVector3Add(GLKVector3, GLKVector3) -> GLKVector3
Returns the sum of two vectors.
func GLKVector3Subtract(GLKVector3, GLKVector3) -> GLKVector3
Returns the difference between two vectors.
func GLKVector3Multiply(GLKVector3, GLKVector3) -> GLKVector3
Returns the product of two vectors.
func GLKVector3Divide(GLKVector3, GLKVector3) -> GLKVector3
Returns a new vector created by dividing one vector by another.
func GLKVector3DotProduct(GLKVector3, GLKVector3) -> Float
Returns the dot product of two vectors.
func GLKVector3CrossProduct(GLKVector3, GLKVector3) -> GLKVector3
Returns the cross product of two vectors.
func GLKVector3Lerp(GLKVector3, GLKVector3, Float) -> GLKVector3
Returns a new vector created by linearly interpreting between two vectors.
func GLKVector3Project(GLKVector3, GLKVector3) -> GLKVector3
Mathematical Operations Performed on Vectors


## Page 20

Returns a new vector created by projecting a vector onto another vector.
func GLKVector3Maximum(GLKVector3, GLKVector3) -> GLKVector3
Returns a new vector whose component value at each position is the largest component valu
at the same position in the source vectors.
func GLKVector3Minimum(GLKVector3, GLKVector3) -> GLKVector3
Returns a new vector whose component value at each position is the smallest component
value at the same position in the source vectors.
func GLKVector3AllEqualToScalar(GLKVector3, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are equ
to a scalar value.
func GLKVector3AllEqualToVector3(GLKVector3, GLKVector3) -> Bool
Returns a Boolean value that indicates whether each component of the first vector is equal t
the corresponding component of a second vector.
func GLKVector3AllGreaterThanOrEqualToScalar(GLKVector3, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are
greater than or equal to a scalar value.
func GLKVector3AllGreaterThanOrEqualToVector3(GLKVector3, GLKVector3) -
Bool
Returns a Boolean value that indicates whether each component of the first vector is greater
than or equal to the corresponding component of a second vector.
func GLKVector3AllGreaterThanScalar(GLKVector3, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are
greater than a scalar value.
func GLKVector3AllGreaterThanVector3(GLKVector3, GLKVector3) -> Bool
Returns a Boolean value that indicates whether each component of the first vector is greater
than the corresponding component of a second vector.
typealias GLKVector3
A representation of a 3-component vector.
Comparison Operations
Data Types


## Page 21

class GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for hierarchical
transform modeling and similar tasks.
GLKMatrix3
GLKMatrix4
GLKVector2
GLKVector4
GLKQuaternion
GLKit Math Utilities
See Also
Math Utilties


## Page 22

The GLKVector4 type defines a 4-component floating-point vector as well as many mathematic
operations commonly used to manipulate vectors. Graphics programming uses vectors extensive
to represent positions, normals, colors and other data structures.
The functions that manipulate GLKVector4 structures treat the inputs as immutable, instead
returning a new vector that represent the results of the operation.
func GLKVector4Make(Float, Float, Float, Float) -> GLKVector4
Returns a new four-component vector created from individual component values.
func GLKVector4MakeWithArray(UnsafeMutablePointer<Float>!) -> GLKVector
Returns a new four-component vector created from an array of components.
func GLKVector4MakeWithVector3(GLKVector3, Float) -> GLKVector4
Returns a new four-component vector created by combining a three-component vector with
scalar value.
func GLKVector4Length(GLKVector4) -> Float
Returns the length of a vector.
Overview
Topics
Creating Vectors
Retrieving Information About a Vector
GLKit / GLKVector4
API Collection
GLKVector4


## Page 23

func GLKVector4Distance(GLKVector4, GLKVector4) -> Float
Returns the distance between two points.
func GLKVector4Negate(GLKVector4) -> GLKVector4
Returns a new vector created by negating the component values of another vector.
func GLKVector4Normalize(GLKVector4) -> GLKVector4
Returns a new vector created by normalizing an input vector to a length of 1.0.
func GLKVector4AddScalar(GLKVector4, Float) -> GLKVector4
Returns a new vector created by adding a scalar value to each component of a vector.
func GLKVector4SubtractScalar(GLKVector4, Float) -> GLKVector4
Returns a new vector created by subtracting a scalar value from each component of a vecto
func GLKVector4MultiplyScalar(GLKVector4, Float) -> GLKVector4
Returns a new vector created by multiplying each component of a vector by a scalar value.
func GLKVector4DivideScalar(GLKVector4, Float) -> GLKVector4
Returns a new vector created by dividing each component of a vector by a scalar value.
func GLKVector4Add(GLKVector4, GLKVector4) -> GLKVector4
Returns the sum of two vectors.
func GLKVector4Subtract(GLKVector4, GLKVector4) -> GLKVector4
Returns the difference between two vectors.
func GLKVector4Multiply(GLKVector4, GLKVector4) -> GLKVector4
Returns the product of two vectors.
func GLKVector4Divide(GLKVector4, GLKVector4) -> GLKVector4
Returns a new vector created by dividing one vector by another.
func GLKVector4DotProduct(GLKVector4, GLKVector4) -> Float
Returns the dot product of two vectors.
func GLKVector4CrossProduct(GLKVector4, GLKVector4) -> GLKVector4
Returns the cross product of two vectors.
func GLKVector4Lerp(GLKVector4, GLKVector4, Float) -> GLKVector4
Returns a new vector created by linearly interpreting between two vectors.
Mathematical Operations Performed on Vectors


## Page 24

func GLKVector4Project(GLKVector4, GLKVector4) -> GLKVector4
Returns a new vector created by projecting a vector onto another vector.
func GLKVector4Maximum(GLKVector4, GLKVector4) -> GLKVector4
Returns a new vector whose component value at each position is the largest component valu
at the same position in the source vectors.
func GLKVector4Minimum(GLKVector4, GLKVector4) -> GLKVector4
Returns a new vector whose component value at each position is the smallest component
value at the same position in the source vectors.
func GLKVector4AllEqualToScalar(GLKVector4, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are equ
to a scalar value.
func GLKVector4AllEqualToVector4(GLKVector4, GLKVector4) -> Bool
Returns a Boolean value that indicates whether each component of the first vector is equal t
the corresponding component of a second vector.
func GLKVector4AllGreaterThanOrEqualToScalar(GLKVector4, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are
greater than or equal to a scalar value.
func GLKVector4AllGreaterThanOrEqualToVector4(GLKVector4, GLKVector4) -
Bool
Returns a Boolean value that indicates whether each component of the first vector is greater
than or equal to the corresponding component of a second vector.
func GLKVector4AllGreaterThanScalar(GLKVector4, Float) -> Bool
Returns a Boolean value that states whether all the components of the source vector are
greater than a scalar value.
func GLKVector4AllGreaterThanVector4(GLKVector4, GLKVector4) -> Bool
Returns a Boolean value that indicates whether each component of the first vector is greater
than the corresponding component of a second vector.
typealias GLKVector4
Comparison Operations
Data Types


## Page 25

A representation of a 4-component vector.
class GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for hierarchical
transform modeling and similar tasks.
GLKMatrix3
GLKMatrix4
GLKVector2
GLKVector3
GLKQuaternion
GLKit Math Utilities
See Also
Math Utilties


## Page 26

The GLKQuaternion type defines a structure that represents a quaternion. A quaternion is
defined by a scalar component s and an XYZ vector v. Quaternions are often used in graphics
programming as a compact representation of a rotation of an object in three dimensions.
The functions that manipulate GLKQuaternion structures treat the inputs as immutable, instead
returning a new quaternion that represent the results of the operation.
func GLKQuaternionMake(Float, Float, Float, Float) -> GLKQuaternion
Returns a quaternion created from its separate components.
func GLKQuaternionMakeWithArray(UnsafeMutablePointer<Float>!) ->
GLKQuaternion
Returns a quaternion created from an array of components.
func GLKQuaternionMakeWithVector3(GLKVector3, Float) -> GLKQuaternion
Returns a quaternion created from a vector and a scalar.
func GLKQuaternionMakeWithAngleAndAxis(Float, Float, Float, Float) ->
GLKQuaternion
Creates a quaternion that represents a rotation around an axis.
func GLKQuaternionMakeWithAngleAndVector3Axis(Float, GLKVector3) ->
GLKQuaternion
Overview
Topics
Creating Quaternions
GLKit / GLKQuaternion
API Collection
GLKQuaternion


## Page 27

Creates a quaternion that represents a rotation around an axis.
func GLKQuaternionMakeWithMatrix3(GLKMatrix3) -> GLKQuaternion
Creates a quaternion from a rotation matrix.
func GLKQuaternionMakeWithMatrix4(GLKMatrix4) -> GLKQuaternion
Creates a quaternion from a rotation matrix.
func GLKQuaternionLength(GLKQuaternion) -> Float
Returns the length of a quaternion.
func GLKQuaternionAxis(GLKQuaternion) -> GLKVector3
Returns the axis of rotation of a quaternion.
func GLKQuaternionAngle(GLKQuaternion) -> Float
Returns the rotation angle of a quaternion.
func GLKQuaternionNormalize(GLKQuaternion) -> GLKQuaternion
Returns a normalized version of a quaternion.
func GLKQuaternionInvert(GLKQuaternion) -> GLKQuaternion
Returns an inverse of a quaternion.
func GLKQuaternionConjugate(GLKQuaternion) -> GLKQuaternion
Returns the conjugate of a quaternion.
func GLKQuaternionAdd(GLKQuaternion, GLKQuaternion) -> GLKQuaternion
Returns the sum of two quaternions.
func GLKQuaternionSubtract(GLKQuaternion, GLKQuaternion) ->
GLKQuaternion
Returns the difference between two quaternions.
func GLKQuaternionMultiply(GLKQuaternion, GLKQuaternion) ->
GLKQuaternion
Returns the product of two quaternions.
Retrieving Information About a Quaternion
Performing Mathematical Operations on Quaternions


## Page 28

func GLKQuaternionSlerp(GLKQuaternion, GLKQuaternion, Float) ->
GLKQuaternion
Returns the spherical linear interpolation of two quaternions.
func GLKQuaternionRotateVector3(GLKQuaternion, GLKVector3) -> GLKVector
Returns a new vector that is calculated by applying a quaternion rotation to a vector.
func GLKQuaternionRotateVector3Array(GLKQuaternion, UnsafeMutablePointe
<GLKVector3>, Int)
Applies a quaternion rotation to an array of vectors.
func GLKQuaternionRotateVector4(GLKQuaternion, GLKVector4) -> GLKVector
Returns a new vector calculated by applying a quaternion rotation to a vector.
func GLKQuaternionRotateVector4Array(GLKQuaternion, UnsafeMutablePointe
<GLKVector4>, Int)
Applies a quaternion rotation to an array of vectors.
typealias GLKQuaternion
A representation of a quaternion.
let GLKQuaternionIdentity: GLKQuaternion
An identity quaternion.
class GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for hierarchical
transform modeling and similar tasks.
Applying Quaternions to Vectors
Data Types
Constants
See Also
Math Utilties


## Page 29

GLKMatrix3
GLKMatrix4
GLKVector2
GLKVector3
GLKVector4
GLKit Math Utilities


## Page 30

Math routines without a specific type associated with them.
func GLKMathDegreesToRadians(Float) -> Float
Converts an angle measured in degrees to radians.
func GLKMathRadiansToDegrees(Float) -> Float
Converts an angle measured in radians to degrees.
func GLKMathProject(GLKVector3, GLKMatrix4, GLKMatrix4, UnsafeMutable
Pointer<Int32>) -> GLKVector3
Projects a point in object space into the window coordinate system.
func GLKMathUnproject(GLKVector3, GLKMatrix4, GLKMatrix4, UnsafeMutable
Pointer<Int32>, UnsafeMutablePointer<Bool>?) -> GLKVector3
Projects a point in view space into object space.
func NSStringFromGLKMatrix2(GLKMatrix2) -> String
Overview
Topics
Converting Angles
Projecting Vectors
Obtaining String Descriptions
GLKit / GLKit Math Utilities
API Collection
GLKit Math Utilities


## Page 31

Returns a string that represents the contents of a matrix.
func NSStringFromGLKMatrix3(GLKMatrix3) -> String
Returns a string that represents the contents of a matrix.
func NSStringFromGLKMatrix4(GLKMatrix4) -> String
Returns a string that represents the contents of a matrix.
func NSStringFromGLKVector2(GLKVector2) -> String
Returns a string that represents the contents of a vector.
func NSStringFromGLKVector3(GLKVector3) -> String
Returns a string that represents the contents of a vector.
func NSStringFromGLKVector4(GLKVector4) -> String
Returns a string that represents the contents of a vector.
func NSStringFromGLKQuaternion(GLKQuaternion) -> String
Returns a string that represents the contents of a quaternion.
class GLKMatrixStack
An opaque type that represents a stack of 4 x 4 matrices, providing support for hierarchical
transform modeling and similar tasks.
GLKMatrix3
GLKMatrix4
GLKVector2
GLKVector3
GLKVector4
GLKQuaternion
See Also
Math Utilties


