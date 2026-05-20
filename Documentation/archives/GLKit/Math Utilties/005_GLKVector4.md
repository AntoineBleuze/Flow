# 005_GLKVector4.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


