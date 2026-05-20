# 002_Compressing an image using linear algebra.pdf

## Page 1

This sample code project decomposes an image into three factors using singular value
decomposition (SVD). The sample compresses an image by computing the products of the factor
submatrices. The image below shows two photographs. The first is the original image, and the
second is the same image after the sample applies 10:1 compression:
Any m x n matrix, A, has an SVD factorization that decomposes it into three factors:
Overview
Accelerate / Compressing an image using linear algebra
Sample Code
Compressing an image using linear
algebra
Reduce the storage size of an image using singular value decomposition (SVD).
Download
macOS 13.3+
Xcode 14.0+


## Page 2

The m x m matrix U that contains the left singular vectors of matrix A
The m x n diagonal matrix Σ that contains the singular values of matrix A, arranged in
descending order
The n x n transposed matrix V that contains the right singular vectors of matrix A
The sample uses the Linear Algebra Package (LAPACK) function sgesvdx_ to compute the SVD.
The figure below shows the SVD of a 5 x 3 matrix:
When matrix A contains image information, the magnitude of the singular values correlate to the
visual significance of features in the image.
The sample reduces the storage size of the original image by returning the product of submatrice
of U, Σ, and Vᵀ. The sizes of the submatrices derive from the index of the first low singular value.
The code in this sample defines that value as k.
For example, if the diagonal elements of Σ are [2000, 1000, 24] and you define k as 2, the ap
keeps [2000, 1000] and discards 24. The following figure shows the matrix multiply function f
this example, where the first two singular values contain significant values:
Create a matrix from the source image


## Page 3

The sample defines a Matrix structure that simplifies passing image data to Accelerate’s linear
algebra libraries.


## Page 4

The Matrix type provides an initializer that returns a new matrix that contains a 32-bit grayscale
copy of the pixel values of a vImage buffer. The init(cgImage:) function passes kvImageNo
Allocate to vImageBuffer_InitWithCGImage(_:_:_:_:_:) and uses the matrix’s
memory allocation. This ensures that there are no extra bytes at the end of each row. See “Create
floating point pixels to use with vDSP” in Finding the sharpest image in a sequence of captured
images for more information on row byte padding.


## Page 5

The following code creates a matrix instance from a Core Graphics image:
The Matrix type provides an initializer that returns a new zero-filled matrix.
The following code creates the three matrices that represent the factors:
Create the factor matrices


## Page 6

The sample requires fully populated U and Vᵀ matrices, and defines the JOBU and JOBVT
parameters that it passes to sgesvdx_ as V. In order to specify that sgesvdx_ returns a specifie
number of singular values, the sample defines the RANGE parameter as I.
Before computing the SVD, the sample performs a workspace query to calculate the optimal size 
the workspace that sgesvdx_ requires. The following code specifies LWORK as -1 and passes a
pointer to a single Float to the WORK parameter.
Define the SVD options
Create the workspaces


## Page 7

On return, workspaceDimension contains the optimal size for the workspace.
The following code allocates the memory that the SVD routine uses as the workspace:
To avoid multiple nested calls to withUnsafePointer(to:_:), the sample declares variables
that shadow some of the matrix properties to pass to the SVD routine as UnsafePointer
structures.
The samples creates the iwork integer array with a count of 12 times the minimum dimension of
matrix A.
The sample calls the LAPACK function for a second time to compute the SVD.
Use LAPACK to compute the SVD


## Page 8

On return, the matrices sigma, u, and vt contain the SVD result.
The sgesvdx_ function computes the singular values as a vector. To convert the vector of k
diagonal values to a k * k diagonal matrix, the Matrix type provides an initializer that returns a
new matrix from diagonal values.
Convert the singular values vector to a matrix


## Page 9

The following code creates a k * k diagonal matrix from the SVD sigma values:
The Matrix type provides a static function that wraps cblas_sgemm(_:_:_:_:_:_:_:_:_:_
_:_:_:_:) to multiply two matrices.
The sample uses the matrix multiply function to recreate matrix A from the SVD factors.
Multiply the factors


## Page 10

The cgImage computed property returns a CGImage instance from a matrix’s data. The compute
property creates a temporary vImage buffer that shares its data with the matrix and uses the sam
planar 32-bit vImage_CGImageFormat that the init(cgImage:) initializer uses to convert a
Core Graphics image to a matrix.
Solving systems of linear equations with LAPACK
Select the optimal LAPACK routine to solve a system of linear equations.
Finding an interpolating polynomial using the Vandermonde method
Use LAPACK to solve a linear system and find an interpolating polynomial to construct new
points between a series of known data points.
BLAS
Create a Core Graphics image from the product of the
factors
See Also
Linear Algebra


## Page 11

Perform common linear algebra operations with Apple’s implementation of the Basic Linear
Algebra Subprograms (BLAS).


