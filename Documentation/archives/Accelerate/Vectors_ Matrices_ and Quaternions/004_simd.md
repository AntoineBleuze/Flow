# 004_simd.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

Working with Matrices
Solve simultaneous equations and transform points in space.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
vForce
Perform transcendental and trigonometric functions on vectors of any length.


