# 003_GLKVector2.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


