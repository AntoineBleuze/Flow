# 002_Working with Quaternions.pdf

## Page 1

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


## Page 2

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


## Page 3

The rotation of the vector by a quaternion is known as an action; to apply the rotation to origin
Vector, you call the act(_:) method:
rotatedVector is now at the position of the blue point in the illustration above.
One of the advantages quaternions have over matrices when representing rotations is that they
simplify interpolation between rotated coordinates.
The following image shows the spherical linear interpolation along the shortest arc between q0 an
q1, and along the longest arc between q1 and q2.
The following code shows how the three points are defined in the preceding image:
Interpolate Between Two Points on a Sphere


## Page 4

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


## Page 5

Much like simd_slerp(_:_:_:), simd_spline(_:_:_:_:_:) accepts the two quaternions 
interpolate between, but also requires the surrounding two quaternions. Given an array of
quaternions named rotations, the following code iterates over each element, adding a line
segment at each interpolated value to build the smooth line shown in the preceding image:
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
See Also
Vectors, Matrices, and Quaternions


## Page 6

Working with Matrices
Solve simultaneous equations and transform points in space.
Rotating a cube by transforming its vertices
Rotate a cube through a series of keyframes using quaternion interpolation to transition
between them.
simd
Perform computations on small vectors and matrices.
vForce
Perform transcendental and trigonometric functions on vectors of any length.


