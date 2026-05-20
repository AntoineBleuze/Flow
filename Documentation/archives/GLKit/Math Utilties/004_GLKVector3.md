# 004_GLKVector3.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


