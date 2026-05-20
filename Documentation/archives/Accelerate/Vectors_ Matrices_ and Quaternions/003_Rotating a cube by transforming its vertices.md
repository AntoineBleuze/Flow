# 003_Rotating a cube by transforming its vertices.pdf

## Page 1

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


## Page 2

The quaternion keyframes act upon the vertex origins and mutate cubeVertices to rotate the
cube.
This sample uses SceneKit to render the cube that vertices in the cubeVertices array define.
You can also use the technique that the sample code uses to rotate geometry in other technologi
such as Metal. The following image shows the cube, defined by the vertices above, rendered in
SceneKit:
As discussed in Working with Quaternions, spline interpolation requires a quaternion before the
current value and a quaternion after the next value to compute the interpolated value. To support
Define the quaternion rotation keyframes


## Page 3

this, the following code defines the series of rotations with additional values at the beginning and
end. The following declaration duplicates the first and last elements.
This sample uses a CVDisplayLink instance to schedule updates to the cube’s vertices and ca
the vertexRotationStep() function every frame.
Animate between keyframes with spherical interpolation


## Page 4

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


## Page 5

Over time, the cube animates through the series of keyframes. The following image shows the
sharp change in direction as the cube rotates between the keyframes:
The sample code uses the identical code to the spherical interpolation sample for spline
interpolation, apart from one difference: rather than generating the quaternion that acts upon the
vertices with simd_slerp(_:_:_:), it uses the simd_spline(_:_:_:_:_:) function.
Animate between keyframes with spline interpolation


## Page 6

The image below shows that the spline interpolation creates transitions between the quaternion
keyframes that are smoother than the linear spherical interpolation.
Working with Vectors
Use vectors to calculate geometric values, calculate dot products and cross products, and
interpolate between values.
Working with Matrices
See Also
Vectors, Matrices, and Quaternions


## Page 7

Solve simultaneous equations and transform points in space.
Working with Quaternions
Rotate points around the surface of a sphere, and interpolate between them.
simd
Perform computations on small vectors and matrices.
vForce
Perform transcendental and trigonometric functions on vectors of any length.


