# 006_GLKQuaternion.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

GLKMatrix3
GLKMatrix4
GLKVector2
GLKVector3
GLKVector4
GLKit Math Utilities


