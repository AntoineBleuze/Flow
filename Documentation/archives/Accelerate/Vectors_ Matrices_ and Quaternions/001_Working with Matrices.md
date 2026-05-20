# 001_Working with Matrices.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


