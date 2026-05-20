# Vectors_ Matrices_ and Quaternions.pdf

## Page 1

A vector is comparable to a fixed-length array containing integer or floating-point values. The sim
framework provides support for small vectors, that is, vectors that contain up to eight double-
precision or sixteen single-precision values.
The simd framework includes a wide-range of functions to operate on vectors that includes data
type conversion, logical and bitwise operations, and mathematical operations.
You can use vectors to represent data such as color (with the elements containing values for red,
green, blue, and alpha), or position (with the elements containing values for coordinates in 2D or
3D space).
You can use the simd framework to apply a single instruction to each element in the vector. For
example, consider two vectors, each containing four elements:
You can easily find, for example, the elementwise sum of the two vectors by using the + operator:
The following examples show a few common uses of vectors.
Overview
Calculate Luminance
Accelerate / Working with Vectors
Article
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross
products, and interpolate between values.


## Page 2

You can calculate the luminance of a color by multiplying each of its red, green, and blue color
channels by a certain coefficient, and adding the three products together—creating a grayscale
representation of the color. The following code uses the Rec. 709 luma coefficients for the color-
to-grayscale conversion. Without the simd framework, you could implement this calculation using
the following code:
The simd framework simplifies this code by treating the color and the coefficients as vectors, and
returning the dot product (the sum of the elementwise products) of the vectors:
Calculating the distance between two points using the Pythagorean theorem is a common task in
games and graphics programming. The simd framework provides functions for calculating length
and distance in two, three, and four dimensions.
The length functions, for example, simd_length, return the length of a vector. The following
illustration shows how the length of a vector, A, is calculated as the square root of the sum of the
squares of its two values.
Calculate Length and Distance
Calculate Length


## Page 3

The distance functions, for example, simd_distance, return the distance between two vectors:
Calculate Distance


## Page 4

The following code shows how the length function returns the same value as the distance functio
if one of the vectors contains all zeros:
Because the distance and length functions both calculate the square root of the sum of the
squares of the vectors, they can be computationally expensive. If you don’t need the exact value—
for example, if you’re comparing the relative lengths of two vectors—simd provides functions that
return the square of the distance and the length.
The following code shows how you can determine which of the two vectors defined above is close
to a third vector, target:
The simd framework provides functions for calculating vectors that describe reflections and
refractions in two-, three-, and four-dimensional space. The image below shows:
An incident ray, described by the vector simd_double2(x: 1.5, y: -1), traveling toward
the center of the image.
A normal, described by the vector simd_double2(x: 0, y: 1), that’s perpendicular to the
interface between the two media.
The reflected ray, computed by simd, traveling away from the center of the image.
The refracted ray, computed by simd, traveling away from the center of the image.
Compare Distances
Calculate Reflection and Refraction Vectors


## Page 5

You normalize the vectors (calculate a vector with the same direction as the original, but with a
length of 1) passed to the reflect and refract functions to achieve the correct results. Given the
values above, the following code defines normalized vectors for the incident ray and normal:
You get the reflected vector with simd_reflect:
For the refraction function, you pass an additional parameter (eta) that models the index of
refraction for physical materials:
Normalize Vectors
Calculate Reflection
Calculate Refraction


## Page 6

The normal of a triangle in 3D space is the vector perpendicular to its surface. You can use the
simd framework’s cross product function to calculate the normal of a triangle. This is a common
task in 3D graphics programming and is used when calculating the shading of surfaces.
In the image below, the triangle’s normal is shown as a red line that’s perpendicular to the surface
of the triangle.
The following code defines the three vertices of the triangle:
Your first step in calculating the normal of the triangle is to create two vectors defined by the
difference between the vertices—representing two sides of the triangle:
The simd_cross function returns the vector that’s perpendicular to the two vectors you pass it. 
this example, the returned vector is the normal of the triangle. Because the normal represents a
direction, you can normalize the value to get a unit vector:
Calculate the Normal of a Triangle


## Page 7

Interpolation adds new, intermediate data points between known values. The simd framework
provides functions to linearly and smoothly interpolate between scalar and vector values. Smooth
interpolation is commonly used in animation, and you can, for example, use the functions describ
below to define the timingFunction of a SpriteKit action.
The following illustration shows how linear interpolation creates a straight line between boundary
values (the straight blue line), and how smooth interpolation eases in and out between boundary
values (the curved pink line):
Linear interpolation is provided by the simd_mix function. The first two parameters specify the
range, and the third parameter specifies the normalized (between 0 and 1) position in the range.
The following code shows how to populate an array with 1024 elements. The first element in the
array has a value of -100, and the last element of the array has a value of 100. Intermediate
elements linearly interpolate between the first and last values:
Smooth interpolation is provided by the simd_smoothstep function. This function uses Hermite
interpolation based on the following code:
The first two parameters specify the range, and the third parameter specifies the position in the
range. Unlike the mix function, the position isn’t normalized, but the return value is.
The following code shows how to populate an array with 1024 elements. The first element in the
array has a value of 0, and the last element of the array has a value of 1. Intermediate elements
smoothly interpolate between the first and last values:
Interpolate Between Values
Linearly Interpolate
Smoothly Interpolate


## Page 8

Working with Matrices
Solve simultaneous equations and transform points in space.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
simd
Perform computations on small vectors and matrices.
vForce
Perform transcendental and trigonometric functions on vectors of any length.
See Also
Vectors, Matrices, and Quaternions


## Page 9

A matrix is a 2D array of values arranged in rows and columns. The simd library provides support
for matrices of up to four rows and four columns, containing 16 elements. It uses a column major
naming convention; for example, a simd_double4x2 is a matrix containing four columns and tw
rows.
The simd library provides initializers that include options for creating matrices from either rows or
columns from the appropriately sized vectors. For example, the following code uses two vectors o
four elements to create a 2 x 4 matrix and a 4 x 2 matrix:
Overview
Accelerate / Working with Matrices
Article
Working with Matrices
Solve simultaneous equations and transform points in space.


## Page 10

The following examples show a few common uses of matrices.
You can use matrices to solve simultaneous equations of the form AX = B; for example, to find x
and y in the following equations:
You first create a 2 x 2 matrix containing the left-side coefficients:
Then create a vector containing the right-side values:
To find the values of x and y, multiply the inverse of the matrix a with the vector b:
The result, x, is a two-element vector containing (x = -2.6, y = 1.8).
Matrices provide a convenient way to transform (translate, rotate, and scale) points in 2D and 3D
space.
The following image shows point A translated to B, rotated to C, and scaled to D:
Solve Simultaneous Equations
Transform Vectors with Matrix Multiplication


## Page 11

By representing 2D coordinates as a three-element vector, you can transform points using matrix
multiplication. Typically, the third component of the vector, z, is set to 1, which indicates that the
vector represents a position in space.
For example, the vector shown as A in the preceding illustration is defined as a simd_float3 wi
the following code:
Transform matrices for 2D coordinates are represented by 3 x 3 matrices.
A translate matrix takes the following form:
1
0
tx
0
1
ty
0
0
1
The simd library provides constants for identity matrices (matrices with ones along the diagonal,
and zeros elsewhere). The 3 x 3 Float identity matrix is matrix_identity_float3x3.
The following function returns a simd_float3x3 matrix using the specified tx and ty translate
values by setting the elements in an identity matrix:
Translate


## Page 12

To apply a translate to the position vector, you multiply the pair together:
The resulting translatedVector has the values (x: 4.0, y: 5.0, z: 1.0), shown as B 
the illustration above.
A rotation matrix around the z-axis (that is, on the xy plane) takes the following form:
cos(angle)
-sin(angle)
0
sin(angle)
cos(angle)
0
0
0
1
The following function returns a simd_float3x3 matrix using the specified rotation angle in
radians:
To apply a rotation to the previously translated vector, you multiply the pair together:
Rotate


## Page 13

The resulting rotatedVector has the values (x: 0.964102, y: 6.33013, z: 1.0),
shown as C in the illustration above.
A scale matrix takes the following form:
xScale
0
0
0
yScale
0
0
0
1
The following function returns a simd_float3x3 matrix using the specified x and y scale values
To apply a scale to the previously rotated vector, you multiply the pair together:
The resulting scaledVector has the values (x: 7.71282, y: 7.91266, z: 1.0), shown
as D in the illustration above.
The three transform matrices can be multiplied together and the product multiplied with the
position vector to get the same result:
Scale


## Page 14

Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
simd
Perform computations on small vectors and matrices.
vForce
Perform transcendental and trigonometric functions on vectors of any length.
See Also
Vectors, Matrices, and Quaternions


## Page 15

Quaternions are defined by a scalar (real) part, and three imaginary parts collectively called the
vector part. Quaternions are often used in graphics programming as a compact representation of
the rotation of an object in three dimensions.
The length of a quaternion is the square root of the sum of the squares of its components. For
example, consider a quaternion specified by the following code:
The length of the quaternion can be calculated manually with sqrt(ix*ix + iy*iy + iz*iz
+ r*r), or more simply accessed through its length property. Quaternions with a length of one
are called unit quaternions and can represent rotations in 3D space. You can easily convert a
nonunit quaternion representing a rotation into a unit quaternion by normalizing its axes. The
following code shows q1, which contains rotations around all three axes with a length greater tha
1, and q2, which contains the same rotation but has a length of 1 and is, therefore, suitable for
applying a rotation to a 3D coordinate:
Overview
Accelerate / Working with Quaternions
Article
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.


## Page 16

Quaternions have some advantages over matrices. For example, they’re smaller: A 3 x 3 matrix of
floats is 48 bytes, and a single-precision quaternion is 16 bytes. They also can offer better
performance: Although a single rotation using a quaternion is a little slower than one using a matr
when combining actions, quaternions can be up to 30% faster.
The following examples show a few common uses of quaternions.
The following illustration shows a point, defined by originVector, rotated over the surface of a
sphere by 60º about the x axis.
To apply this rotation, you define the vector to be rotated and the quaternion that represents the
rotation:
Rotate a Point Around a Sphere


## Page 17

The rotation of the vector by a quaternion is known as an action; to apply the rotation to origin
Vector, you call the act(_:) method:
rotatedVector is now at the position of the blue point in the illustration above.
One of the advantages quaternions have over matrices when representing rotations is that they
simplify interpolation between rotated coordinates.
The following image shows the spherical linear interpolation along the shortest arc between q0 an
q1, and along the longest arc between q1 and q2.
The following code shows how the three points are defined in the preceding image:
Interpolate Between Two Points on a Sphere


## Page 18

The simd_slerp(_:_:_:) function linearly interpolates along the shortest arc between two
quaternions. The following code calls simd_slerp(_:_:_:) with small increments to its t
parameter, adding a line segment at each interpolated value to build the short arc between q0 an
q1 shown in the preceding image:
The simd_slerp_longest(_:_:_:) function linearly interpolates along the longest arc
between two quaternions. The following code calls simd_slerp_longest(_:_:_:) with smal
increments to its t parameter, adding a line segment at each interpolated value to build the long
arc between q1 and q2 shown in the preceding image:
To interpolate between multiple quaternions that define positions on the surface of a sphere, the
simd library provides the simd_spline(_:_:_:_:_:) function.
The following image illustrates a series of quaternions that define positions on the surface of a
sphere, shown as points, and a line that shows the smooth interpolation between them.
Interpolate Between Multiple Points on a Sphere


## Page 19

Much like simd_slerp(_:_:_:), simd_spline(_:_:_:_:_:) accepts the two quaternions 
interpolate between, but also requires the surrounding two quaternions. Given an array of
quaternions named rotations, the following code iterates over each element, adding a line
segment at each interpolated value to build the smooth line shown in the preceding image:
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
See Also
Vectors, Matrices, and Quaternions


## Page 20

Working with Matrices
Solve simultaneous equations and transform points in space.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
simd
Perform computations on small vectors and matrices.
vForce
Perform transcendental and trigonometric functions on vectors of any length.


## Page 21

Quaternions are fundamental to graphics programming and are often used as a compact
representation of the rotation of an object in three dimensions. You can rotate a 3D object in spac
by applying unit quaternion actions to each of its vertices. The simd module includes functions to
interpolate between a series of rotational keyframes — defined by unit quaternions — with either
the simd_slerp(_:_:_:) (for linear interpolation) or the simd_spline(_:_:_:_:_:) (for
smooth, spline-based interpolation) functions.
This sample code project defines a cube using eight vertices and transforms it through a series o
rotations. The sample app provides a SwiftUI Toggle control that switches between a series of
discrete spherical linear interpolations (that is, a series of separate arcs between each keyframe)
and a continuous spline (that is, a single, smooth path between each keyframe).
The sample code defines a cube with eight simd_double3 vectors. Each vector specifies the 3D
position of one of the cube’s corners.
Overview
Define a cube by its vertices
Accelerate / Rotating a cube by transforming its vertices
Sample Code
Rotating a cube by transforming its
vertices
Rotate a cube through a series of keyframes using quaternion interpolation to
transition between them.
Download
macOS 13.3+
Xcode 14.3+


## Page 22

The quaternion keyframes act upon the vertex origins and mutate cubeVertices to rotate the
cube.
This sample uses SceneKit to render the cube that vertices in the cubeVertices array define.
You can also use the technique that the sample code uses to rotate geometry in other technologi
such as Metal. The following image shows the cube, defined by the vertices above, rendered in
SceneKit:
As discussed in Working with Quaternions, spline interpolation requires a quaternion before the
current value and a quaternion after the next value to compute the interpolated value. To support
Define the quaternion rotation keyframes


## Page 23

this, the following code defines the series of rotations with additional values at the beginning and
end. The following declaration duplicates the first and last elements.
This sample uses a CVDisplayLink instance to schedule updates to the cube’s vertices and ca
the vertexRotationStep() function every frame.
Animate between keyframes with spherical interpolation


## Page 24

The following variables define the current index in vertexRotations and the time, between 0.
and 1.0, for the current interpolation:
With each display link notification, the vertexRotationStep function increments the vertex
rotation time variable by a small amount.
The simd_slerp(_:_:_:) function returns a quaternion that’s spherically interpolated betwee
the current and next quaternion keyframe at the specified time:
The quaternion acts upon each of the cube’s vertices and rotates the cube around its center:
If the vertex rotation time is greater than or equal to one, the code progresses to the next keyfram
increments the index to the rotations array, and resets the rotation time to zero. When the code h
reached the last usable quaternion in the array of rotations, it ends the animation.


## Page 25

Over time, the cube animates through the series of keyframes. The following image shows the
sharp change in direction as the cube rotates between the keyframes:
The sample code uses the identical code to the spherical interpolation sample for spline
interpolation, apart from one difference: rather than generating the quaternion that acts upon the
vertices with simd_slerp(_:_:_:), it uses the simd_spline(_:_:_:_:_:) function.
Animate between keyframes with spline interpolation


## Page 26

The image below shows that the spline interpolation creates transitions between the quaternion
keyframes that are smoother than the linear spherical interpolation.
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
Working with Matrices
See Also
Vectors, Matrices, and Quaternions


## Page 27

Solve simultaneous equations and transform points in space.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
simd
Perform computations on small vectors and matrices.
vForce
Perform transcendental and trigonometric functions on vectors of any length.


## Page 28

simd provides types and functions for small vector and matrix computations. The types include
integer and floating-point vectors and matrices, and the functions provide basic arithmetic
operations, element-wise mathematical operations, and geometric and linear algebra operations.
simd supports vectors containing up to 16 elements (for single-precision values) or 8 elements (f
double-precision values), and matrices up to 4 x 4 elements in size. Other frameworks, such as
vForce, allow you to work with larger vectors.
typealias simd_bool
A Boolean scalar value.
8-Bit Signed Integer Vectors
Perform operations on vectors that contain signed 8-bit integer elements.
16-Bit Signed Integer Vectors
Perform operations on vectors that contain signed 16-bit integer elements.
32-Bit Signed Integer Vectors
Overview
Topics
Boolean Scalar Data Type
Signed Integer Vectors
Accelerate / simd
API Collection
simd
Perform computations on small vectors and matrices.


## Page 29

Perform operations on vectors that contain signed 32-bit integer elements.
64-Bit Signed Integer Vectors
Perform operations on vectors that contain signed 64-bit integer elements.
8-Bit Unsigned Integer Vectors
Perform operations on vectors that contain unsigned 8-bit integer elements.
16-Bit Unsigned Integer Vectors
Perform operations on vectors that contain unsigned 16-bit integer elements.
32-Bit Unsigned Integer Vectors
Perform operations on vectors that contain unsigned 32-bit integer elements.
64-Bit Unsigned Integer Vectors
Perform operations on vectors that contain unsigned 64-bit integer elements.
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
Half-precision floating-point vectors
Perform operations on vectors that contain half-precision floating-point elements.
Single-precision floating-point vectors
Perform operations on vectors that contain single-precision floating-point elements.
Double-precision floating-point vectors
Perform operations on vectors that contain double-precision floating-point elements.
Working with Matrices
Solve simultaneous equations and transform points in space.
Half-precision floating-point matrices
Perform operations on matrices that contain half-precision floating-point elements.
Unsigned Integer Vectors
Floating-Point Vectors
Matrices


## Page 30

Single-precision floating-point matrices
Perform operations on matrices that contain single-precision floating-point elements.
Double-precision floating-point matrices
Perform operations on matrices that contain double-precision floating-point elements.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
struct simd_quatf
A single-precision quaternion.
struct simd_quatd
A double-precision quaternion.
var SIMD_COMPILER_HAS_REQUIRED_FEATURES: Int32
var SIMD_LIBRARY_VERSION: Int32
simd Macros
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
Quaternions
Constants
Macros
See Also
Vectors, Matrices, and Quaternions


## Page 31

Working with Matrices
Solve simultaneous equations and transform points in space.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
vForce
Perform transcendental and trigonometric functions on vectors of any length.


## Page 32

The vForce library provides a range of trigonometric and transcendental functions that work over
large collections of single- and double-precision values. The collections can be of any length, and
vForce supplies vectorized functions for the current architecture.
The functions declared in the vForce library have the customary mathematical names, but with th
prefix vv, for example, vvsqrtf(_:_:_:). Each mathematical function is available in two
variants: one for single-precision data and one for double-precision data. The single-precision
forms have the suffix f, whereas the double-precision forms have no suffix. For example,
vvcosf(_:_:_:) is the single-precision cosine function, and vvcos(_:_:_:) is the double-
precision variant.
All of the vForce library functions follow a common format:
The return type is void.
The first parameter points to an array to hold the results. The only exceptions are
vvsincosf(_:_:_:_:) and vvsincos(_:_:_:_:), which have two result arrays that the
first two parameters point to.
One or more parameters point to operand arrays that are the same length as the result array.
The last parameter is the array length.
Note
Unless otherwise mentioned, vForce functions work in-place. That is, the input may exactly
equal the output.
Overview
Using vForce
Accelerate / vForce
API Collection
vForce
Perform transcendental and trigonometric functions on vectors of any length.


## Page 33

The vForce library provides a high-performance alternative to for loops and map(_:) when
applying operations on arrays of floating-point values.
For example, given an arbitrarily sized array, x, that contains single-precision values, the following
code uses map(_:) to create a second array, y. On return, y contains the square root of each
array element.
The equivalent functionality implemented in vForce runs significantly faster:
enum vForce
An enumeration that acts as a namespace for Swift overlays to vForce.
static func ceil<U>(U) -> [Double]
Returns the ceiling of each element in a vector of double-precision values.
static func ceil<U>(U) -> [Float]
Returns the ceiling of each element in a vector of single-precision values.
Topics
Swift Overlay
Array-Oriented Arithmetic and Auxiliary Functions


## Page 34

static func ceil<U, V>(U, result: inout V)
Calculates the ceiling of each element in a vector of double-precision values.
static func ceil<U, V>(U, result: inout V)
Calculates the ceiling of each element in a vector of single-precision values.
static func copysign<U, V>(magnitudes: U, signs: V) -> [Double]
Returns each single-precision element in the magnitudes vector, setting its sign to the
corresponding elements in the signs vector.
static func copysign<U, V>(magnitudes: U, signs: V) -> [Float]
Returns each single-precision element in the magnitudes vector, setting its sign to the
corresponding elements in the signs vector.
static func copysign<T, U, V>(magnitudes: T, signs: U, result: inout V)
Calculates each double-precision element in the magnitudes vector, setting its sign to the
corresponding elements in the signs vector.
static func copysign<T, U, V>(magnitudes: T, signs: U, result: inout V)
Calculates each single-precision element in the magnitudes vector, setting its sign to the
corresponding elements in the signs vector.
static func floor<U>(U) -> [Double]
Returns the floor of each element in a vector of double-precision values.
static func floor<U>(U) -> [Float]
Returns the floor of each element in a vector of single-precision values.
static func floor<U, V>(U, result: inout V)
Calculates the floor of each element in a vector of double-precision values.
static func floor<U, V>(U, result: inout V)
Calculates the floor of each element in a vector of single-precision values.
static func nearestInteger<U>(U) -> [Double]
Returns the nearest integer to each element in a vector of double-precision values.
static func nearestInteger<U>(U) -> [Float]
Returns the nearest integer to each element in a vector of single-precision values.
static func nearestInteger<U, V>(U, result: inout V)
Calculates the nearest integer to each element in a vector of double-precision values.


## Page 35

static func nearestInteger<U, V>(U, result: inout V)
Calculates the nearest integer to each element in a vector of double-precision values.
static func reciprocal<U>(U) -> [Double]
Returns the reciprocal of each element in a vector of double-precision values.
static func reciprocal<U>(U) -> [Float]
Returns the reciprocal of each element in a vector of single-precision values.
static func reciprocal<U, V>(U, result: inout V)
Calculates the reciprocal of each element in a vector of double-precision values.
static func reciprocal<U, V>(U, result: inout V)
Calculates the reciprocal of each element in a vector of single-precision values.
static func remainder<U, V>(dividends: U, divisors: V) -> [Double]
Returns the remainder of the double-precision elements in dividends divided by the
elements in divisors, using truncating division.
static func remainder<U, V>(dividends: U, divisors: V) -> [Float]
Returns the remainder of the single-precision elements in dividends divided by the
elements in divisors, using truncating division.
static func remainder<T, U, V>(dividends: T, divisors: U, result: inout
V)
Calculates the remainder of the double-precision elements in dividends divided by the
elements in divisors, using truncating division.
static func remainder<T, U, V>(dividends: T, divisors: U, result: inout
V)
Calculates the remainder of the single-precision elements in dividends divided by the
elements in divisors, using truncating division.
static func rsqrt<U>(U) -> [Double]
Returns the reciprocal square root of each element in a vector of double-precision values.
static func rsqrt<U>(U) -> [Float]
Returns the reciprocal square root of each element in a vector of single-precision values.
static func rsqrt<U, V>(U, result: inout V)
Calculates the reciprocal square root of each element in a vector of double-precision values
static func rsqrt<U, V>(U, result: inout V)


## Page 36

Calculates the reciprocal square root of each element in a vector of single-precision values.
static func sqrt<U>(U) -> [Double]
Returns the square root of each element in a vector of double-precision values.
static func sqrt<U>(U) -> [Float]
Returns the square root each element in a vector of single-precision values.
static func sqrt<U, V>(U, result: inout V)
Calculates the square root of each element in a vector of double-precision values.
static func sqrt<U, V>(U, result: inout V)
Calculates the square root of each element in a vector of single-precision values.
static func trunc<U>(U) -> [Double]
Returns the integer truncation of each element in a vector of double-precision values.
static func trunc<U>(U) -> [Float]
Returns the integer truncation of each element in a vector of single-precision values.
static func trunc<U, V>(U, result: inout V)
Calculates the integer truncation of each element in a vector of double-precision values.
static func trunc<U, V>(U, result: inout V)
Calculates the integer truncation of each element in a vector of single-precision values.
static func truncatingRemainder<U, V>(dividends: U, divisors: V) -> [
Double]
Returns the remainder of the double-precision elements in dividends divided by the
elements in divisors, using truncating division.
static func truncatingRemainder<U, V>(dividends: U, divisors: V) -> [
Float]
Returns the remainder of the single-precision elements in dividends divided by the
elements in divisors, using truncating division.
static func truncatingRemainder<T, U, V>(dividends: T, divisors: U,
result: inout V)
Calculates the remainder of the double-precision elements in dividends divided by the
elements in divisors, using truncating division.
static func truncatingRemainder<T, U, V>(dividends: T, divisors: U,
result: inout V)


## Page 37

Calculates the remainder of the single-precision elements in dividends divided by the
elements in divisors, using truncating division.
func vvceil(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the ceiling of each element in an array of double-precision values.
func vvceilf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the ceiling of each element in an array of single-precision values.
func vvfloor(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the floor of each element in an array of double-precision values.
func vvfloorf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the floor of each element in an array of single-precision values.
func vvcopysign(UnsafeMutablePointer<Double>, UnsafePointer<Double>,
UnsafePointer<Double>, UnsafePointer<Int32>)
Copies an array, setting the sign of each element based on a second array of double-precisi
values.
func vvcopysignf(UnsafeMutablePointer<Float>, UnsafePointer<Float>,
UnsafePointer<Float>, UnsafePointer<Int32>)
Copies an array, setting the sign of each element based on a second array of single-precisio
values.
func vvdiv(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Double>, UnsafePointer<Int32>)
Divides each element in an array by the corresponding value in a second array of double-
precision values.
func vvdivf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Float>, UnsafePointer<Int32>)
Divides each element in an array by the corresponding value in a second array of single-
precision values.
func vvfabs(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the absolute value for each element in an array of double-precision values.


## Page 38

func vvfabsf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the absolute value for each element in an array of single-precision values.
func vvfmod(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Double>, UnsafePointer<Int32>)
Calculates the modulus after dividing each element in an array by the corresponding elemen
in a second array of double-precision values.
func vvfmodf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Float>, UnsafePointer<Int32>)
Calculates the modulus after dividing each element in an array by the corresponding elemen
in a second array of single-precision values.
func vvremainder(UnsafeMutablePointer<Double>, UnsafePointer<Double>,
UnsafePointer<Double>, UnsafePointer<Int32>)
Calculates the remainder after dividing each element in an array by the corresponding
element in a second array of double-precision values.
func vvremainderf(UnsafeMutablePointer<Float>, UnsafePointer<Float>,
UnsafePointer<Float>, UnsafePointer<Int32>)
Calculates the remainder after dividing each element in an array by the corresponding
element in a second array of single-precision values.
func vvint(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the integer truncation for each element in an array of double-precision values.
func vvintf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the integer truncation for each element in an array of single-precision values.
func vvnint(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the nearest integer for each element in an array of double-precision values.
func vvnintf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the nearest integer for each element in an array of single-precision values.
func vvrsqrt(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the reciprocal square root of each element in an array of double-precision values


## Page 39

func vvrsqrtf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the reciprocal square root of each element in an array of single-precision values.
func vvsqrt(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the square root of each element in an array of double-precision values.
func vvsqrtf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the square root of each element in an array of single-precision values.
func vvrec(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the reciprocal of each element in an array of double-precision values.
func vvrecf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the reciprocal of each element in an array of single-precision values.
func vvnextafter(UnsafeMutablePointer<Double>, UnsafePointer<Double>,
UnsafePointer<Double>, UnsafePointer<Int32>)
Calculates the next machine-representable value for each element in an array of double-
precision values.
func vvnextafterf(UnsafeMutablePointer<Float>, UnsafePointer<Float>,
UnsafePointer<Float>, UnsafePointer<Int32>)
Calculates the next machine-representable value for each element in an array of single-
precision values.
static func exp<U>(U) -> [Double]
Returns the e, raised to the power of each element in a vector of double-precision values.
static func exp<U>(U) -> [Float]
Returns the e, raised to the power of each element in a vector of single-precision values.
static func exp<U, V>(U, result: inout V)
Calculates the e, raised to the power of each element in a vector of double-precision values.
static func exp<U, V>(U, result: inout V)
Calculates the e, raised to the power of each element in a vector of single-precision values.
Array-Oriented Exponential and Logarithmic Functions


## Page 40

static func exp2<U>(U) -> [Double]
Returns the 2, raised to the power of each element in a vector of double-precision values.
static func exp2<U>(U) -> [Float]
Returns the 2, raised to the power of each element in a vector of single-precision values.
static func exp2<U, V>(U, result: inout V)
Calculates the 2, raised to the power of each element in a vector of double-precision values.
static func exp2<U, V>(U, result: inout V)
Calculates the 2, raised to the power of each element in a vector of single-precision values.
static func expm1<U>(U) -> [Double]
Returns the eˣ-1 for each element in a vector of double-precision values.
static func expm1<U>(U) -> [Float]
Returns the eˣ-1 for each element in a vector of single-precision values.
static func expm1<U, V>(U, result: inout V)
Calculates the eˣ-1 for each element in a vector of double-precision values.
static func expm1<U, V>(U, result: inout V)
Calculates the eˣ-1 for each element in a vector of single-precision values.
static func log10<U>(U) -> [Double]
Returns the base 10 logarithm of each element in a vector of double-precision values.
static func log<U>(U) -> [Double]
Returns the natural logarithm for each element in a vector of double-precision values.
static func log<U>(U) -> [Float]
Returns the natural logarithm for each element in a vector of single-precision values.
static func log<U, V>(U, result: inout V)
Calculates the natural logarithm for each element in a vector of double-precision values.
static func log<U, V>(U, result: inout V)
Calculates the natural logarithm for each element in a vector of single-precision values.
static func log1p<U>(U) -> [Double]
Returns log(1+x) for each element in a vector of double-precision values.
static func log1p<U>(U) -> [Float]


## Page 41

Returns log(1+x) for each element in a vector of single-precision values.
static func log1p<U, V>(U, result: inout V)
Calculates log(1+x) for each element in a vector of double-precision values.
static func log1p<U, V>(U, result: inout V)
Calculates log(1+x) for each element in a vector of single-precision values.
static func log10<U>(U) -> [Float]
Returns the base 10 logarithm of each element in a vector of single-precision values.
static func log10<U, V>(U, result: inout V)
Calculates the base 10 logarithm of each element in a vector of double-precision values.
static func log10<U, V>(U, result: inout V)
Calculates the base 10 logarithm of each element in a vector of single-precision values.
static func log2<U>(U) -> [Double]
Returns the base 2 logarithm of each element in a vector of double-precision values.
static func log2<U>(U) -> [Float]
Returns the base 2 logarithm of each element in a vector of single-precision values.
static func log2<U, V>(U, result: inout V)
Calculates the base 2 logarithm of each element in a vector of double-precision values.
static func log2<U, V>(U, result: inout V)
Calculates the base 2 logarithm of each element in a vector of single-precision values.
static func logb<U>(U) -> [Double]
Returns the unbiased exponent of each element in a vector of double-precision values.
static func logb<U>(U) -> [Float]
Returns the unbiased exponent of each element in a vector of double-precision values.
static func logb<U, V>(U, result: inout V)
Calculates the unbiased exponent of each element in a vector of double-precision values.
static func logb<U, V>(U, result: inout V)
Calculates the unbiased exponent of each element in a vector of single-precision values.
func vvexp(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates e raised to the power of each element in an array of double-precision values.


## Page 42

func vvexpf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates e raised to the power of each element in an array of single-precision values.
func vvexp2(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates 2 raised to the power of each element in an array of double-precision values.
func vvexp2f(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates 2 raised to the power of each element in an array of single-precision values.
func vvexpm1(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates eˣ-1 for each element in an array of double-precision values.
func vvexpm1f(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates eˣ-1 for each element in an array of single-precision values.
func vvlog(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the natural logarithm for each element in an array of double-precision values.
func vvlogf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the natural logarithm for each element in an array of single-precision values.
func vvlog1p(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates log(1+x) for each element in an array of double-precision values.
func vvlog1pf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates log(1+x) for each element in an array of single-precision values.
func vvlog2(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the base 2 logarithm of each element in an array of double-precision values.
func vvlog2f(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the base 2 logarithm of each element in an array of single-precision values.


## Page 43

func vvlog10(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the base 10 logarithm of each element in an array of double-precision values.
func vvlog10f(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the base 10 logarithm of each element in an array of single-precision values.
func vvlogb(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the unbiased exponent of each element in an array of double-precision values.
func vvlogbf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the unbiased exponent of each element in an array of single-precision values.
static func pow<U, V>(bases: U, exponents: V) -> [Double]
Returns each double-precision element in the bases vector, raised to the power of the
corresponding element in the exponents vector.
static func pow<U, V>(bases: U, exponents: V) -> [Float]
Returns each single-precision element in the bases vector, raised to the power of the
corresponding element in the exponents vector.
static func pow<T, U, V>(bases: T, exponents: U, result: inout V)
Calculates each double-precision element in the bases vector, raised to the power of the
corresponding element in the exponents vector.
static func pow<T, U, V>(bases: T, exponents: U, result: inout V)
Calculates each single-precision element in the bases vector, raised to the power of the
corresponding element in the exponents vector.
func vvpow(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Double>, UnsafePointer<Int32>)
Raises each element in an array to the power of the corresponding element in a second array
of double-precision values.
func vvpowf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Float>, UnsafePointer<Int32>)
Raises each element in an array to the power of the corresponding element in a second array
of single-precision values.
Array-Oriented Power Functions


## Page 44

static func acos<U>(U) -> [Double]
Returns the arccosine of each element in a vector of double-precision values.
static func acos<U>(U) -> [Float]
Returns the arccosine of each element in a vector of single-precision values.
static func acos<U, V>(U, result: inout V)
Calculates the arccosine of each element in a vector of double-precision values.
static func acos<U, V>(U, result: inout V)
Calculates the arccosine of each element in a vector of single-precision values.
static func asin<U>(U) -> [Double]
Returns the arcsine of each element in a vector of double-precision values.
static func asin<U>(U) -> [Float]
Returns the arcsine of each element in a vector of single-precision values.
static func asin<U, V>(U, result: inout V)
Calculates the arcsine of each element in a vector of double-precision values.
static func asin<U, V>(U, result: inout V)
Calculates the arcsine of each element in a vector of single-precision values.
static func atan<U>(U) -> [Double]
Returns the arctangent of each element in a vector of double-precision values.
static func atan<U>(U) -> [Float]
Returns the arctangent of each element in a vector of single-precision values.
static func atan<U, V>(U, result: inout V)
Calculates the arctangent of each element in a vector of double-precision values.
static func atan<U, V>(U, result: inout V)
Calculates the arctangent of each element in a vector of single-precision values.
static func atan2<U, V>(x: U, y: V) -> [Double]
Returns the arctangent of each pair of elements in two vectors of double-precision values.
static func atan2<U, V>(x: U, y: V) -> [Float]
Array-Oriented Trigonometric Functions


## Page 45

Returns the arctangent of each pair of elements in two vectors of single-precision values.
static func atan2<T, U, V>(x: T, y: U, result: inout V)
Calculates the arctangent of each pair of elements in two vectors of double-precision values
static func atan2<T, U, V>(x: T, y: U, result: inout V)
Calculates the arctangent of each pair of elements in two vectors of single-precision values.
static func cos<U>(U) -> [Double]
Returns the cosine of each element in a vector of double-precision values.
static func cos<U>(U) -> [Float]
Returns the cosine of each element in a vector of single-precision values.
static func cos<U, V>(U, result: inout V)
Calculates the cosine of each element in a vector of double-precision values.
static func cos<U, V>(U, result: inout V)
Calculates the cosine of each element in a vector of single-precision values.
static func cosPi<U>(U) -> [Double]
Returns the cosine of pi, multiplied by each element in a vector of double-precision values.
static func cosPi<U>(U) -> [Float]
Returns the cosine of pi, multiplied by each element in a vector of single-precision values.
static func cosPi<U, V>(U, result: inout V)
Calculates the cosine of pi, multiplied by each element in a vector of double-precision values
static func cosPi<U, V>(U, result: inout V)
Calculates the cosine of pi, multiplied by each element in a vector of single-precision values
static func sin<U>(U) -> [Double]
Returns the sine of each element in a vector of double-precision values.
static func sin<U>(U) -> [Float]
Returns the sine of each element in a vector of single-precision values.
static func sin<U, V>(U, result: inout V)
Calculates the sine of each element in a vector of double-precision values.
static func sin<U, V>(U, result: inout V)
Calculates the sine of each element in a vector of single-precision values.


## Page 46

static func sinPi<U>(U) -> [Double]
Returns the sine of pi, multiplied by each element in a vector of double-precision values.
static func sinPi<U>(U) -> [Float]
Returns the sine of pi, multiplied by each element in a vector of single-precision values.
static func sinPi<U, V>(U, result: inout V)
Calculates the sine of pi, multiplied by each element in a vector of double-precision values.
static func sinPi<U, V>(U, result: inout V)
Calculates the sine of pi, multiplied by each element in a vector of single-precision values.
static func sincos<T, U, V>(T, sinResult: inout U, cosResult: inout V)
Calculates the sine and cosine of each element in a vector of double-precision values.
static func sincos<T, U, V>(T, sinResult: inout U, cosResult: inout V)
Calculates the sine and cosine of each element in a vector of double-precision values.
static func tan<U>(U) -> [Double]
Returns the tangent of each element in a vector of double-precision values.
static func tan<U>(U) -> [Float]
Returns the tangent of each element in a vector of single-precision values.
static func tan<U, V>(U, result: inout V)
Calculates the tangent of each element in a vector of double-precision values.
static func tan<U, V>(U, result: inout V)
Calculates the tangent of each element in a vector of single-precision values.
static func tanPi<U>(U) -> [Double]
Returns the tangent of pi, multiplied by each element in a vector of double-precision values.
static func tanPi<U>(U) -> [Float]
Returns the tangent of pi, multiplied by each element in a vector of single-precision values.
static func tanPi<U, V>(U, result: inout V)
Calculates the tangent of pi, multiplied by each element in a vector of double-precision
values.
static func tanPi<U, V>(U, result: inout V)
Calculates the tangent of pi, multiplied by each element in a vector of single-precision value


## Page 47

func vvsin(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the sine of each element in an array of double-precision values.
func vvsinf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the sine of each element in an array of single-precision values.
func vvsinpi(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the sine of pi multiplied by each element in an array of double-precision values.
func vvsinpif(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the sine of pi multiplied by each element in an array of single-precision values.
func vvcos(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the cosine of each element in an array of double-precision values.
func vvcosf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the cosine of each element in an array of single-precision values.
func vvcospi(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the cosine of pi multiplied by each element in an array of double-precision values
func vvcospif(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the cosine of pi multiplied by each element in an array of single-precision values.
func vvcosisin(OpaquePointer, UnsafePointer<Double>, UnsafePointer<Int3
>)
Calculates the cosine and sine of each element in an array of double-precision values.
func vvcosisinf(OpaquePointer, UnsafePointer<Float>, UnsafePointer<Int3
>)
Calculates the cosine and sine of each element in an array of single-precision values.
func vvsincos(UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double
>, UnsafePointer<Double>, UnsafePointer<Int32>)
Calculates the cosine and sine of each element in an array of double-precision values.


## Page 48

func vvsincosf(UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float>
UnsafePointer<Float>, UnsafePointer<Int32>)
Calculates the cosine and sine of each element in an array of single-precision values.
func vvtan(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the tangent of each element in an array of double-precision values.
func vvtanf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the tangent of each element in an array of single-precision values.
func vvtanpi(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the tangent of pi multiplied by each element in an array of double-precision value
func vvtanpif(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the tangent of pi multiplied by each element in an array of single-precision values
func vvasin(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the arcsine of each element in an array of double-precision values.
func vvasinf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the arcsine of each element in an array of single-precision values.
func vvacos(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the arccosine of each element in an array of double-precision values.
func vvacosf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the arccosine of each element in an array of single-precision values.
func vvatan(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the arctangent of each element in an array of double-precision values.
func vvatanf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the arctangent of each element in an array of single-precision values.


## Page 49

func vvatan2(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Double>, UnsafePointer<Int32>)
Calculates the arctangent of each pair of elements in two arrays of double-precision values.
func vvatan2f(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Float>, UnsafePointer<Int32>)
Calculates the arctangent of each pair of elements in two arrays of single-precision values.
static func acosh<U>(U) -> [Double]
Returns the inverse hyperbolic cosine of each element in a vector of double-precision values
static func acosh<U>(U) -> [Float]
Returns the inverse hyperbolic cosine of each element in a vector of single-precision values.
static func acosh<U, V>(U, result: inout V)
Calculates the inverse hyperbolic cosine of each element in a vector of double-precision
values.
static func acosh<U, V>(U, result: inout V)
Calculates the inverse hyperbolic cosine of each element in a vector of single-precision
values.
static func asinh<U>(U) -> [Double]
Returns the inverse hyperbolic sine of each element in a vector of double-precision values.
static func asinh<U>(U) -> [Float]
Returns the inverse hyperbolic sine of each element in a vector of single-precision values.
static func asinh<U, V>(U, result: inout V)
Calculates the inverse hyperbolic sine of each element in a vector of double-precision values
static func asinh<U, V>(U, result: inout V)
Calculates the inverse hyperbolic sine of each element in a vector of single-precision values
static func atanh<U>(U) -> [Double]
Returns the inverse hyperbolic tangent of each element in a vector of double-precision value
static func atanh<U>(U) -> [Float]
Returns the inverse hyperbolic tangent of each element in a vector of single-precision values
static func atanh<U, V>(U, result: inout V)
Array-Oriented Hyperbolic Functions


## Page 50

Calculates the inverse hyperbolic tangent of each element in a vector of double-precision
values.
static func atanh<U, V>(U, result: inout V)
Calculates the inverse hyperbolic tangent of each element in a vector of single-precision
values.
static func cosh<U>(U) -> [Double]
Returns the hyperbolic cosine of each element in a vector of double-precision values.
static func cosh<U>(U) -> [Float]
Returns the hyperbolic cosine of each element in a vector of single-precision values.
static func cosh<U, V>(U, result: inout V)
Calculates the hyperbolic cosine of each element in a vector of double-precision values.
static func cosh<U, V>(U, result: inout V)
Calculates the hyperbolic cosine of each element in a vector of single-precision values.
static func sinh<U>(U) -> [Double]
Returns the hyperbolic sine of each element in a vector of double-precision values.
static func sinh<U>(U) -> [Float]
Returns the hyperbolic sine of each element in a vector of single-precision values.
static func sinh<U, V>(U, result: inout V)
Calculates the hyperbolic sine of each element in a vector of double-precision values.
static func sinh<U, V>(U, result: inout V)
Calculates the hyperbolic sine of each element in a vector of single-precision values.
static func tanh<U>(U) -> [Double]
Returns the hyperbolic tangent of each element in a vector of double-precision values.
static func tanh<U>(U) -> [Float]
Returns the hyperbolic tangent of each element in a vector of single-precision values.
static func tanh<U, V>(U, result: inout V)
Calculates the hyperbolic tangent of each element in a vector of double-precision values.
static func tanh<U, V>(U, result: inout V)
Calculates the hyperbolic tangent of each element in a vector of single-precision values.


## Page 51

func vvsinh(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the hyperbolic sine of each element in an array of double-precision values.
func vvsinhf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the hyperbolic sine of each element in an array of single-precision values.
func vvcosh(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the hyperbolic cosine of each element in an array of double-precision values.
func vvcoshf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the hyperbolic cosine of each element in an array of single-precision values.
func vvtanh(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsafe
Pointer<Int32>)
Calculates the hyperbolic tangent of each element in an array of double-precision values.
func vvtanhf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the hyperbolic tangent of each element in an array of single-precision values.
func vvasinh(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the inverse hyperbolic sine of each element in an array of double-precision values
func vvasinhf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the inverse hyperbolic sine of each element in an array of single-precision values
func vvacosh(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the inverse hyperbolic cosine of each element in an array of double-precision
values.
func vvacoshf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the inverse hyperbolic cosine of each element in an array of single-precision
values.


## Page 52

func vvatanh(UnsafeMutablePointer<Double>, UnsafePointer<Double>, Unsaf
Pointer<Int32>)
Calculates the inverse hyperbolic tangent of each element in an array of double-precision
values.
func vvatanhf(UnsafeMutablePointer<Float>, UnsafePointer<Float>, Unsafe
Pointer<Int32>)
Calculates the inverse hyperbolic tangent of each element in an array of single-precision
values.
typealias COMPLEX
typealias DOUBLE_COMPLEX
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
Working with Matrices
Solve simultaneous equations and transform points in space.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
simd
Perform computations on small vectors and matrices.
Data Types
See Also
Vectors, Matrices, and Quaternions


