# Linear Algebra.pdf

## Page 1

The Accelerate framework provides the LAPACK library for numerical linear algebra. A basic
technique of linear algebra is to solve systems of simultaneous equations. For example, the
following shows three equations that contain the unknowns x, y, and z:
You can solve this system by rewriting the simultaneous equations as a matrix equation with the
following form:
This form is an Ax = b form, where A is the coefficient matrix, x is a column vector that contains th
unknown values, and b is a column vector that contains the constant values. The number of
Overview
Accelerate / Solving systems of linear equations with LAPACK
Sample Code
Solving systems of linear equations with
LAPACK
Select the optimal LAPACK routine to solve a system of linear equations.
Download
macOS 13.3+
Xcode 15.0+


## Page 2

elements in x is equal to the number of columns of A, and the number of elements in b is equal to
the number of rows of A.
The process of solving this system computes the values for x, y, and z as -2, 24, and 8,
respectively.
For an example of solving a linear system, see Finding an interpolating polynomial using the
Vandermonde method.
LAPACK includes routines for solving systems of linear equations as Ax = b. This sample code
project includes wrapper functions that simplify calling the LAPACK routines, for example, by
encapsulating multiple-step workflows into a single function call.
Run the sample code app to see the results of each routine solve different example systems.
LAPACK provides different solving routines depending on the properties of the coefficient matrix,
A:
Is the coefficient matrix symmetric? A symmetric matrix is one that’s equal to its transpose, tha
is, a matrix that’s identical when swapping its row and column indices. A symmetric matrix is
necessarily square. The following is an example of a symmetric matrix:
Is the coefficient matrix positive definite? A matrix is positive definite if all of its eigenvalues are
positive. Confirm whether a matrix is positive definite by calling spotrf_(_:_:_:_:_:) to tr
a Cholesky factorization. If the factorization fails and returns a positive value, the matrix isn’t
positive definite. This sample code project includes the function isPositiveDefinite(_:
dimension:) to determine whether a matrix is positive definite.
Determine the properties of the coefficient matrix


## Page 3

Is the coefficient matrix banded? A banded matrix has all of its nonzero entries on its main
diagonal and an arbitrary number of superdiagonals (above the main diagonal) and subdiagona
(below the main diagonal). The following is an example of a nonsymmetric, banded matrix with
two superdiagonals and one subdiagonal:
Is the coefficient matrix tridiagonal? A tridiagonal matrix has all of its nonzero entries on its mai
diagonal, its first superdiagonal, and its first subdiagonal. The following is an example of a
nonsymmetric, tridiagonal matrix:
If the coefficient matrix is sparse, that is, most of the entries in the coefficient matrix are zero,
Accelerate provides the Sparse Solvers library to help solve such systems.
The LAPACK routines in this sample code project are all for real, single-precision matrices. All of
the routines are available in single- and double-precision for real and complex values. The first
character of a routine name defines the type of data the routine works on. For example:
sgels_(_:_:_:_:_:_:_:_:_:_:_:) — single-precision, real values
dgels_(_:_:_:_:_:_:_:_:_:_:_:) — double-precision, real values
cgels_(_:_:_:_:_:_:_:_:_:_:_:) — single-precision, complex values
zgels_(_:_:_:_:_:_:_:_:_:_:_:) — double-precision, complex values
Select LAPACK variants for data types


## Page 4

For complex matrices, the LAPACK routine variant for real symmetric matrices requires Hermitian
matrices. For example, the cptsv_() routine computes the solution to Ax = b for a complex
single-precision, Hermitian, tridiagonal coefficient matrix; and sptsv_() computes the solution f
a real single-precision, symmetric, tridiagonal coefficient matrix.
The routines in this sample code project are suitable for solving full rank systems, that is, they hav
a unique and exact solution.
The LAPACK routines in this article require the matrix data in column-major layout, which means
specifying all the terms in the first column, then all of the terms in the second column, the third
column, and so on. For example, if there are two columns with three row values each, the routine
specifies the three row values for column one, then the three row values for column two, as the
following example illustrates:
The routines return the result as column-major, for example, an array that contains [10.0, 20.
30.0, 100.0, 200.0, 300.0] represents the following matrix:
This sample code project provides Swift wrapper functions to each single-precision LAPACK
solving routine. Select the routine that most closely matches the coefficient matrix for the highest
performance. The following shows the Swift wrapper functions and the underlying LAPACK
routines to solve systems with different coefficient matrices:
Symmetric
Define values in column-major layout
Select the solving routine for the coefficient matrix type


## Page 5

Positive definite
Tridiagonal
Swift wrapper function: symmetric_positiveDefinite_tridiagonal()
Underlying LAPACK routine: sptsv_()
Other banded
Swift wrapper function: symmetric_positiveDefinite_banded()
Underlying LAPACK routine: spbsv_()
General
Swift wrapper function: symmetric_positiveDefinite_general()
Underlying LAPACK routine: sposv_()
Indefinite
General
Swift wrapper function: symmetric_indefinite_general()
Underlying LAPACK routine: ssysv_()
Nonsymmetric
Square
Tridiagonal
Swift wrapper function: nonsymmetric_tridiagonal()
Underlying LAPACK routine: sgtsv_()
Other banded
Swift wrapper function: nonsymmetric_banded()
Underlying LAPACK routine: sgbsv_()
General
Swift wrapper function: nonsymmetric_general()
Underlying LAPACK routine: sgesv_()
Nonsquare
QR factorization
Swift wrapper function: nonsymmetric_nonsquare()
Underlying LAPACK routine: sgels_()


## Page 6

Cholesky factorization
Swift wrapper function: leastSquares_nonsquare()
Underlying LAPACK routines: sposv_() and ssysv_()
A system of linear equations with a nonsquare coefficient matrix is either:
Overdetermined — there are more equations than unknowns, that is, the coefficient matrix has
more rows than columns. In this case, the system may not have a solution.
Underdetermined — there are more unknowns than equations, that is, the coefficient matrix ha
more columns than rows. In this case, the system may have infinitely many solutions.
In these cases, the solution is either not exact (unless the overdetermined system is actually
consistent) or not unique. In the case where LAPACK is unable to solve the system, the Swift
wrapper functions return nil.
The Swift wrapper function nonsymmetric_nonsquare(a:dimension:b:rightHandSide
Count:) wraps the LAPACK routine sgels_(_:_:_:_:_:_:_:_:_:_:_:). This routine takes
one of two approaches, depending on the system:
When the coefficient matrix, A, has more rows than columns (overdetermined), the routine
minimizes the error in Ax - b by solving the least squares problem ‖ b-Ax ‖₂. The following imag
shows the graph of an overdetermined system with two unknowns and three equations.
nonsymmetric_nonsquare(a:dimension:b:rightHandSideCount:) returns [1
.4615387, 0.7692307, -1.1766968], indicating the x in Ax=b equals [1.4615387, 0
.7692307], and the sum of the residuals squared (that is, r0² + r1² + r2² equals -1
.1766968²). Selecting any other point in the triangle of the three intercepts yields a larger sum
of residuals squared.
When the coefficient matrix, A, has more columns than rows (underdetermined), the routine
finds the smallest x that solves the equation min ‖ x ‖₂ such that Ax = b. The following image
shows the graph of y=x+1, which is the set of solutions to the illustrated system. The closest
point on the line to the origin is at x = -0.5, y = 0.5.
The sgels_(_:_:_:_:_:_:_:_:_:_:_:) routine uses QR factorization for overdetermined
systems, and LQ factorization for underdetermined systems.
Solve for a nonsquare matrix using QR factorization


## Page 7

The following is an example of an underdetermined system with a coefficient matrix that’s
nonsquare:
The following code calls nonsymmetric_nonsquare(a:dimension:b:rightHandSide
Count:) to compute the values of x:
Where speed is more important than numerical accuracy, the sample code project provides an
alternative to sgels_(_:_:_:_:_:_:_:_:_:_:_:). The leastSquares_nonsquare(a:
dimension:b:) function exploits the fact that the x in AᵀAx = Aᵀb equals the x in Ax = b. This
technique creates the square coefficient matrix AᵀA and solves with either symmetric_positiv
Definite_general(a:dimension:b:rightHandSideCount:) or symmetric
_indefinite_general(a:dimension:b:rightHandSideCount:).
Solve for a nonsquare matrix using Cholesky factorization


## Page 8

The leastSquares_nonsquare(a:dimension:b:) function uses the same problem as
nonsymmetric_nonsquare(a:dimension:b:rightHandSideCount:), but uses Cholesk
factorization when AᵀA is positive definite.
The following is an example of an overdetermined system with a coefficient matrix that’s
nonsquare:
The following code calls leastSquares_nonsquare(a:dimension:b:) to compute the
values of x:
Systems with a symmetric matrix that’s not full rank, rank-deficient matrices, don’t have a single
unique solution. For example, the following two multiplications contain different x matrices, but
yield the same result in b:
In this case, passing matrix A to its most suitable function, symmetric_indefinite
_general(a:dimension:b:rightHandSideCount:), returns an error indicating that the
routine can’t compute the solution.
Solve for a rank-deficient matrix


## Page 9

One option to deal with rank-deficiency is to instead solve a nearby problem of full rank by adding
small epsilon value to the matrix to regularize it. The following code adds such an epsilon to
diagonal elements in matrix A:
On return, x contains the values [0.0, 20.0, 40.0]:
Finding an interpolating polynomial using the Vandermonde method
See Also
Linear Algebra


## Page 10

Use LAPACK to solve a linear system and find an interpolating polynomial to construct new
points between a series of known data points.
Compressing an image using linear algebra
Reduce the storage size of an image using singular value decomposition (SVD).
BLAS
Perform common linear algebra operations with Apple’s implementation of the Basic Linear
Algebra Subprograms (BLAS).


## Page 11

This article demonstrates how you can generate a continuous curve that passes through a small
set of points by computing an interpolating polynomial. A polynomial is the sum of a series of term
constructed from variables, coefficients, and exponents (for example, 6x³ + 7x², where 6 and 7 an
the coefficients, and x is the variable); and an interpolating polynomial fills in the gaps between th
supplied variables and coefficients.
For any number of data points, there is a unique interpolating polynomial of order (that is, the
largest exponent) which is the number of data points minus one. However, for large numbers of
data points, this solution can become numerically unstable.
The image below shows five known points, as white dots, and the values generated by evaluating
the found interpolating polynomial, as a red line:
Overview
Accelerate / Finding an interpolating polynomial using the Vandermonde method
Article
Finding an interpolating polynomial using
the Vandermonde method
Use LAPACK to solve a linear system and find an interpolating polynomial to
construct new points between a series of known data points.


## Page 12

The code in this article determines the polynomial coefficients using a Vandermonde matrix base
on the x-components of the known points. The coefficients are the solution to Ax=b, where A is th
Vandermonde matrix and b is a vector of the y-components of the known points. You’ll use
LAPACK to solve Ax=b. LAPACK is an acronym for Linear Algebra Package and is a standard
software library for numerical linear algebra.
Create an array containing five two-element vectors that describe the known data points between
which the code interpolates.
In a real-world app, you will most likely acquire data points from an external source such as a
meteorological or financial data source. For this example, specify x-components that are evenly
distributed between 0 and 1023, and generate random y-components:
Construct a Vandermonde matrix where the rows are defined by the elements in a source vector
that are successively raised to each integer power up to the source vector’s element count, minus
one. For example, in the case of a five-element source vector, x, the Vandermonde matrix is of the
form:
Generate known data
Create a Vandermonde matrix


## Page 13

The Vandermonde matrix used in this article derives from the x-components of the points you’re
interpolating. For example, given the following points:
The resulting Vandermonde matrix contains the following values:
The following code constructs a Vandermonde matrix from the points array:


## Page 14

The coefficients for the polynomial are the solution to Ax=b, where A is the Vandermonde matrix
and b is the y-components of the known points. For example, using the matrix created in Finding 
interpolating polynomial using the Vandermonde method, the coefficients are the x in the followin
Create the function solveLinearSystem(a:a_rowCount:a_columnCount:b:b_count:)
to encapsulate the LAPACK routines that solve Ax=b. Note that LAPACK overwrites b with the
solution vector, x:
On return, coefficients contains the polynomial coefficients.
Calculate coefficients
Use LAPACK to solve a linear system


## Page 15

Important
This sample uses the LAPACK library under the Accelerate framework that’s in line with
LAPACK version 3.9.1. Specify ACCELERATE_NEW_LAPACK=1 and ACCELERATE_LAPACK
_ILP64=1 as preprocessor macros in Xcode build settings.
Use the LAPACK dgels routine to perform the solve. The dgels name derives from double-
precision, general-matrix, least-squares.


## Page 16

This example calls the dgels function that’s a wrapper around the underlying LAPACK function
dgels_(_:_:_:_:_:_:_:_:_:_:_:). The wrapper provides a more Swift-friendly way of
calling the LAPACK function.


## Page 17

The vDSP evaluatePolynomial(usingCoefficients:withVariables:) function
evaluates a polynomial. For example, the following code evaluates a simple polynomial that
consists of three variables and three coefficients:
On return, result contains [18.0, 39.0, 70.0] by performing the following:
Evaluate the polynomial


## Page 18

Note that the number of elements returned by the polynomial evaluation is the same as the numb
of elements in the variables array.
To create an interpolation result that contains 1024 elements, use ramp(in:count:) to create
the variables:
On return, polynomialResult contains 1024 elements with the indices corresponding to the x-
components, and the values corresponding to the interpolated y-components:
Solving systems of linear equations with LAPACK
Select the optimal LAPACK routine to solve a system of linear equations.
Compressing an image using linear algebra
Reduce the storage size of an image using singular value decomposition (SVD).
BLAS
See Also
Linear Algebra


## Page 19

Perform common linear algebra operations with Apple’s implementation of the Basic Linear
Algebra Subprograms (BLAS).


## Page 20

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


## Page 21

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


## Page 22

The sample defines a Matrix structure that simplifies passing image data to Accelerate’s linear
algebra libraries.


## Page 23

The Matrix type provides an initializer that returns a new matrix that contains a 32-bit grayscale
copy of the pixel values of a vImage buffer. The init(cgImage:) function passes kvImageNo
Allocate to vImageBuffer_InitWithCGImage(_:_:_:_:_:) and uses the matrix’s
memory allocation. This ensures that there are no extra bytes at the end of each row. See “Create
floating point pixels to use with vDSP” in Finding the sharpest image in a sequence of captured
images for more information on row byte padding.


## Page 24

The following code creates a matrix instance from a Core Graphics image:
The Matrix type provides an initializer that returns a new zero-filled matrix.
The following code creates the three matrices that represent the factors:
Create the factor matrices


## Page 25

The sample requires fully populated U and Vᵀ matrices, and defines the JOBU and JOBVT
parameters that it passes to sgesvdx_ as V. In order to specify that sgesvdx_ returns a specifie
number of singular values, the sample defines the RANGE parameter as I.
Before computing the SVD, the sample performs a workspace query to calculate the optimal size 
the workspace that sgesvdx_ requires. The following code specifies LWORK as -1 and passes a
pointer to a single Float to the WORK parameter.
Define the SVD options
Create the workspaces


## Page 26

On return, workspaceDimension contains the optimal size for the workspace.
The following code allocates the memory that the SVD routine uses as the workspace:
To avoid multiple nested calls to withUnsafePointer(to:_:), the sample declares variables
that shadow some of the matrix properties to pass to the SVD routine as UnsafePointer
structures.
The samples creates the iwork integer array with a count of 12 times the minimum dimension of
matrix A.
The sample calls the LAPACK function for a second time to compute the SVD.
Use LAPACK to compute the SVD


## Page 27

On return, the matrices sigma, u, and vt contain the SVD result.
The sgesvdx_ function computes the singular values as a vector. To convert the vector of k
diagonal values to a k * k diagonal matrix, the Matrix type provides an initializer that returns a
new matrix from diagonal values.
Convert the singular values vector to a matrix


## Page 28

The following code creates a k * k diagonal matrix from the SVD sigma values:
The Matrix type provides a static function that wraps cblas_sgemm(_:_:_:_:_:_:_:_:_:_
_:_:_:_:) to multiply two matrices.
The sample uses the matrix multiply function to recreate matrix A from the SVD factors.
Multiply the factors


## Page 29

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


## Page 30

Perform common linear algebra operations with Apple’s implementation of the Basic Linear
Algebra Subprograms (BLAS).


## Page 31

The vecLib framework contains nine C header files (not counting vecLib.h, which merely
includes the others).
This document describes the functions declared in the header files cblas.h and vblas.h, whic
contain the interfaces for Apple’s implementation of the BLAS API.
Note that documentation describing the leading dimension as the first dimension of a matrix refer
to column-major ordering. In row-major ordering, the leading dimension is the second dimension 
a matrix.
Important
Apple provides the BLAS and LAPACK libraries under the Accelerate framework to be in line
with LAPACK 3.9.1. Starting with iOS 26, iPadOS 26, macOS 26, tvOS 26, visionOS 26, and
watchOS 26, the libraries are in line with LAPACK 3.12.0. These new interfaces provide
additional functionality, as well as a new ILP64 interface. To use the new interfaces, define
ACCELERATE_NEW_LAPACK before including the Accelerate or vecLib headers. For ILP64
interfaces, also define ACCELERATE_LAPACK_ILP64. For Swift projects, specify
ACCELERATE_NEW_LAPACK=1 and ACCELERATE_LAPACK_ILP64=1 as preprocessor
macros in Xcode build settings.
Overview
Topics
Accelerate / BLAS
API Collection
BLAS
Perform common linear algebra operations with Apple’s implementation of the
Basic Linear Algebra Subprograms (BLAS).


## Page 32

struct BLAS
An enumeration that acts as a namespace for Swift overlays to BLAS.
func BLASSetThreading(BLAS_THREADING) -> Int32
Sets the BLAS and LAPACK threading model.
func BLASGetThreading() -> BLAS_THREADING
Returns the current BLAS and LAPACK threading model.
struct BLAS_THREADING
Constants that describe the BLAS and LAPACK threading model.
func cblas_icamax(__LAPACK_int, OpaquePointer?, __LAPACK_int) -> _
_LAPACK_int
Returns the index of the element with the largest absolute value in a vector (single-precision
complex).
func cblas_idamax(__LAPACK_int, UnsafePointer<Double>?, __LAPACK_int) -
__LAPACK_int
Returns the index of the element with the largest absolute value in a vector (double-
precision).
func cblas_isamax(__LAPACK_int, UnsafePointer<Float>?, __LAPACK_int) ->
__LAPACK_int
Returns the index of the element with the largest absolute value in a vector (single-precision
func cblas_izamax(__LAPACK_int, OpaquePointer?, __LAPACK_int) -> _
_LAPACK_int
Returns the index of the element with the largest absolute value in a vector (double-precisio
complex).
Matrix and Vector Operations
Perform computations with matrices and vectors.
Pointwise Matrix Operations
Specifying the threading model
General functions
Sparse computation


## Page 33

Create, insert values into, and extract values from a pointwise sparse matrix.
Blockwise Matrix Operations
Create, insert values into, and extract values from a blockwise sparse matrix.
General Sparse Matrix Management Operations
Manage and work with the properties of a sparse matrix.
Sparse Vector Utility Operations
Create and work with sparse vector structures.
typealias BLASParamErrorProc
A BLAS error handler callback type.
Note
The types given here are valid for C or C++ and for either PowerPC or Intel processors. The
typedefs shown are for C++ and PowerPC processors; for other, conditionally compiled
typedefs, see the header files.
struct CBLAS_ORDER
struct CBLAS_TRANSPOSE
struct CBLAS_UPLO
struct CBLAS_DIAG
struct CBLAS_SIDE
var CblasColMajor: CBLAS_ORDER
var CblasConjTrans: CBLAS_TRANSPOSE
var CblasLeft: CBLAS_SIDE
Data types
Constants
Discussion
Variables


## Page 34

var CblasLower: CBLAS_UPLO
var CblasNoTrans: CBLAS_TRANSPOSE
var CblasNonUnit: CBLAS_DIAG
var CblasRight: CBLAS_SIDE
var CblasRowMajor: CBLAS_ORDER
var CblasTrans: CBLAS_TRANSPOSE
var CblasUnit: CBLAS_DIAG
var CblasUpper: CBLAS_UPLO
var AtlasConj: CBLAS_TRANSPOSE
func catlas_caxpby(__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPAC
_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Computes the product of two vectors, scaling each one separately (single-precision comple
func catlas_cset(__LAPACK_int, OpaquePointer, OpaquePointer, __LAPACK
_int)
Modifies a vector (single-precision complex) in place, setting each element to a given value.
func catlas_daxpby(__LAPACK_int, Double, UnsafePointer<Double>?, _
_LAPACK_int, Double, UnsafeMutablePointer<Double>?, __LAPACK_int)
Computes the sum of two vectors, scaling each one separately (double-precision).
func catlas_dset(__LAPACK_int, Double, UnsafeMutablePointer<Double>, _
_LAPACK_int)
Modifies a vector (double-precision) in place, setting each element to a given value.
func catlas_saxpby(__LAPACK_int, Float, UnsafePointer<Float>?, __LAPACK
_int, Float, UnsafeMutablePointer<Float>?, __LAPACK_int)
Computes the sum of two vectors, scaling each one separately (single-precision).
func catlas_sset(__LAPACK_int, Float, UnsafeMutablePointer<Float>, _
_LAPACK_int)
Modifies a vector (single-precision) in place, setting each element to a given value.
func catlas_zaxpby(__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPAC
_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
CATLAS and CBLAS vector functions


## Page 35

Computes the sum of two vectors, scaling each one separately (double-precision complex).
func catlas_zset(__LAPACK_int, OpaquePointer, OpaquePointer, __LAPACK
_int)
Modifies a vector (double-precision complex) in place, setting each element to a given value
func cblas_sdot(__LAPACK_int, UnsafePointer<Float>?, __LAPACK_int,
UnsafePointer<Float>?, __LAPACK_int) -> Float
Computes the dot product of two vectors (single-precision).
func cblas_sdsdot(__LAPACK_int, Float, UnsafePointer<Float>?, __LAPACK
_int, UnsafePointer<Float>?, __LAPACK_int) -> Float
Computes the dot product of two single-precision vectors plus an initial single-precision
value.
func cblas_cdotc_sub(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, OpaquePointer)
Calculates the dot product of the complex conjugate of a single-precision complex vector w
a second single-precision complex vector.
func cblas_cdotu_sub(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, OpaquePointer)
Computes the dot product of two single-precision complex vectors.
func cblas_ddot(__LAPACK_int, UnsafePointer<Double>?, __LAPACK_int,
UnsafePointer<Double>?, __LAPACK_int) -> Double
Computes the dot product of two vectors (double-precision).
func cblas_dsdot(__LAPACK_int, UnsafePointer<Float>?, __LAPACK_int,
UnsafePointer<Float>?, __LAPACK_int) -> Double
Computes the double-precision dot product of a pair of single-precision vectors.
func cblas_zdotc_sub(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, OpaquePointer)
Calculates the dot product of the complex conjugate of a double-precision complex vector
with a second double-precision complex vector.
func cblas_zdotu_sub(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, OpaquePointer)
Computes the dot product of two double-precision complex vectors.
Single-precision float matrix functions


## Page 36

func cblas_sasum(__LAPACK_int, UnsafePointer<Float>?, __LAPACK_int) ->
Float
Computes the sum of the absolute values of elements in a vector (single-precision).
func cblas_saxpy(__LAPACK_int, Float, UnsafePointer<Float>?, __LAPACK
_int, UnsafeMutablePointer<Float>?, __LAPACK_int)
Computes a constant times a vector plus a vector (single-precision).
func cblas_scopy(__LAPACK_int, UnsafePointer<Float>?, __LAPACK_int,
UnsafeMutablePointer<Float>?, __LAPACK_int)
Copies a vector to another vector (single-precision).
func cblas_sgbmv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, __LAPACK_int, __LAPACK_int, Float, UnsafePointer<Float>?, __LAPAC
_int, UnsafePointer<Float>?, __LAPACK_int, Float, UnsafeMutablePointer<
Float>?, __LAPACK_int)
Scales a general band matrix, then multiplies by a vector, then adds a vector (single
precision).
func cblas_sgemm(CBLAS_ORDER, CBLAS_TRANSPOSE, CBLAS_TRANSPOSE, __LAPAC
_int, __LAPACK_int, __LAPACK_int, Float, UnsafePointer<Float>?, __LAPAC
_int, UnsafePointer<Float>?, __LAPACK_int, Float, UnsafeMutablePointer<
Float>?, __LAPACK_int)
Multiplies two matrices (single-precision).
func cblas_sgemv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, Float, UnsafePointer<Float>?, __LAPACK_int, UnsafePointer<Float>?
__LAPACK_int, Float, UnsafeMutablePointer<Float>?, __LAPACK_int)
Multiplies a single-precision matrix by a vector.
func cblas_sger(CBLAS_ORDER, __LAPACK_int, __LAPACK_int, Float, Unsafe
Pointer<Float>?, __LAPACK_int, UnsafePointer<Float>?, __LAPACK_int,
UnsafeMutablePointer<Float>?, __LAPACK_int)
Multiplies vector X by the transpose of vector Y, then adds matrix A (single precison).
func cblas_snrm2(__LAPACK_int, UnsafePointer<Float>?, __LAPACK_int) ->
Float
Computes the L2 norm (Euclidian length) of a vector (single precision).
func cblas_srot(__LAPACK_int, UnsafeMutablePointer<Float>?, __LAPACK_in
, UnsafeMutablePointer<Float>?, __LAPACK_int, Float, Float)
Applies a Givens rotation matrix to a pair of vectors.


## Page 37

func cblas_srotg(UnsafeMutablePointer<Float>, UnsafeMutablePointer<Floa
>, UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float>)
Constructs a Givens rotation matrix.
func cblas_srotm(__LAPACK_int, UnsafeMutablePointer<Float>?, __LAPACK
_int, UnsafeMutablePointer<Float>?, __LAPACK_int, UnsafePointer<Float>)
Applies a modified Givens transformation (single precision).
func cblas_srotmg(UnsafeMutablePointer<Float>, UnsafeMutablePointer<
Float>, UnsafeMutablePointer<Float>, Float, UnsafeMutablePointer<Float>
Generates a modified Givens rotation matrix.
func cblas_ssbmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, __LAPACK_int,
Float, UnsafePointer<Float>?, __LAPACK_int, UnsafePointer<Float>?, _
_LAPACK_int, Float, UnsafeMutablePointer<Float>?, __LAPACK_int)
Scales a symmetric band matrix, then multiplies by a vector, then adds a vector (single-
precision).
func cblas_sscal(__LAPACK_int, Float, UnsafeMutablePointer<Float>?, _
_LAPACK_int)
Multiplies each element of a vector by a constant (single-precision).
func cblas_sspmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Unsafe
Pointer<Float>?, UnsafePointer<Float>?, __LAPACK_int, Float, Unsafe
MutablePointer<Float>?, __LAPACK_int)
Scales a packed symmetric matrix, then multiplies by a vector, then scales and adds another
vector (single precision).
func cblas_sspr(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Unsafe
Pointer<Float>?, __LAPACK_int, UnsafeMutablePointer<Float>?)
Rank one update: adds a packed symmetric matrix to the product of a scaling factor, a vecto
and its transpose (single precision).
func cblas_sspr2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Unsafe
Pointer<Float>?, __LAPACK_int, UnsafePointer<Float>?, __LAPACK_int,
UnsafeMutablePointer<Float>?)
Rank two update of a packed symmetric matrix using two vectors (single precision).
func cblas_sswap(__LAPACK_int, UnsafeMutablePointer<Float>?, __LAPACK
_int, UnsafeMutablePointer<Float>?, __LAPACK_int)
Exchanges the elements of two vectors (single precision).


## Page 38

func cblas_ssymm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, __LAPACK_int, _
_LAPACK_int, Float, UnsafePointer<Float>?, __LAPACK_int, UnsafePointer<
Float>?, __LAPACK_int, Float, UnsafeMutablePointer<Float>?, __LAPACK_in
)
Multiplies a matrix by a symmetric matrix (single-precision).
func cblas_ssymv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Unsafe
Pointer<Float>?, __LAPACK_int, UnsafePointer<Float>?, __LAPACK_int,
Float, UnsafeMutablePointer<Float>?, __LAPACK_int)
Scales a symmetric matrix, multiplies by a vector, then scales and adds another vector (sing
precision).
func cblas_ssyr(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Unsafe
Pointer<Float>?, __LAPACK_int, UnsafeMutablePointer<Float>?, __LAPACK
_int)
Rank one update: adds a symmetric matrix to the product of a scaling factor, a vector, and it
transpose (single precision).
func cblas_ssyr2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Unsafe
Pointer<Float>?, __LAPACK_int, UnsafePointer<Float>?, __LAPACK_int,
UnsafeMutablePointer<Float>?, __LAPACK_int)
Rank two update of a symmetric matrix using two vectors (single precision).
func cblas_ssyr2k(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_in
, __LAPACK_int, Float, UnsafePointer<Float>?, __LAPACK_int, Unsafe
Pointer<Float>?, __LAPACK_int, Float, UnsafeMutablePointer<Float>?, _
_LAPACK_int)
Performs a rank-2k update of a symmetric matrix (single precision).
func cblas_ssyrk(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_int
__LAPACK_int, Float, UnsafePointer<Float>?, __LAPACK_int, Float, Unsafe
MutablePointer<Float>?, __LAPACK_int)
Rank-k update—multiplies a symmetric matrix by its transpose and adds a second matrix
(single precision).
func cblas_stbmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, UnsafePointer<Float>?, __LAPACK_int, Unsafe
MutablePointer<Float>?, __LAPACK_int)
Scales a triangular band matrix, then multiplies by a vector (single precision).
func cblas_stbsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, UnsafePointer<Float>?, __LAPACK_int, Unsafe
MutablePointer<Float>?, __LAPACK_int)


## Page 39

Solves a triangular banded system of equations.
func cblas_stpmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Float>?, UnsafeMutablePointer<Float>?, _
_LAPACK_int)
Multiplies a triangular matrix by a vector, then adds a vector (single precision).
func cblas_stpsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Float>?, UnsafeMutablePointer<Float>?, _
_LAPACK_int)
Solves a packed triangular system of equations.
func cblas_strmm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, Float, UnsafePointer<Float>?, _
_LAPACK_int, UnsafeMutablePointer<Float>?, __LAPACK_int)
Scales a triangular matrix and multiplies it by a matrix.
func cblas_strmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Float>?, __LAPACK_int, UnsafeMutablePointer<
Float>?, __LAPACK_int)
Multiplies a triangular matrix by a vector.
func cblas_strsm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, Float, UnsafePointer<Float>?, _
_LAPACK_int, UnsafeMutablePointer<Float>?, __LAPACK_int)
Solves a triangular system of equations with multiple values for the right side.
func cblas_strsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Float>?, __LAPACK_int, UnsafeMutablePointer<
Float>?, __LAPACK_int)
Solves a triangular system of equations with a single value for the right side.
func appleblas_sgeadd(CBLAS_ORDER, CBLAS_TRANSPOSE, CBLAS_TRANSPOSE, _
_LAPACK_int, __LAPACK_int, Float, UnsafePointer<Float>?, __LAPACK_int,
Float, UnsafePointer<Float>?, __LAPACK_int, UnsafeMutablePointer<Float>
__LAPACK_int)
func cblas_caxpy(__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK
_int, OpaquePointer?, __LAPACK_int)
Computes a constant times a vector plus a vector (single-precision complex).
Single-precision complex matrix functions


## Page 40

func cblas_ccopy(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Copies a vector to another vector (single-precision complex).
func cblas_cgbmv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, _
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer, OpaquePointer
?, __LAPACK_int)
Scales a general band matrix, then multiplies by a vector, then adds a vector (single-precisio
complex).
func cblas_cgemm(CBLAS_ORDER, CBLAS_TRANSPOSE, CBLAS_TRANSPOSE, __LAPAC
_int, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, _
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer, OpaquePointer
?, __LAPACK_int)
Multiplies two matrices (single-precision complex).
func cblas_cgemv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer?, _
_LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Multiplies a matrix by a vector (single-precision complex).
func cblas_cgerc(CBLAS_ORDER, __LAPACK_int, __LAPACK_int, OpaquePointer
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Multiplies vector X by the conjugate transpose of vector Y, then adds matrix A (single-
precision complex).
func cblas_cgeru(CBLAS_ORDER, __LAPACK_int, __LAPACK_int, OpaquePointer
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Multiplies vector X by the transpose of vector Y, then adds matrix A (single-precision
complex).
func cblas_chbmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, __LAPACK_int,
OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK
_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Scales a Hermitian band matrix, then multiplies by a vector, then adds a vector (single-
precision complex).
func cblas_chemm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, __LAPACK_int, _
_LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer
?, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)


## Page 41

Multiplies two Hermitian matrices (single-precision complex), then adds a third (with scaling
func cblas_chemv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer, OpaquePointer?, __LAPACK_int)
Scales and multiplies a Hermitian matrix by a vector, then adds a second (scaled) vector.
func cblas_cher(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Opaque
Pointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int)
Hermitian rank 1 update: adds the product of a scaling factor, vector X, and the conjugate
transpose of X to matrix A.
func cblas_cher2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Hermitian rank 2 update: adds the product of a scaling factor, vector X, and the conjugate
transpose of vector Y to the product of the conjugate of the scaling factor, vector Y, and the
conjugate transpose of vector X, and adds the result to matrix A.
func cblas_cher2k(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_in
, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, Float, OpaquePointer?, __LAPACK_int)
Performs a rank-2k update of a complex Hermitian matrix (single-precision complex).
func cblas_cherk(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_int
__LAPACK_int, Float, OpaquePointer?, __LAPACK_int, Float, OpaquePointer
?, __LAPACK_int)
Rank-k update—multiplies a Hermitian matrix by its transpose and adds a second matrix
(single precision).
func cblas_chpmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, OpaquePointer?, __LAPACK_int, OpaquePointer, Opaque
Pointer?, __LAPACK_int)
Scales a packed hermitian matrix, multiplies it by a vector, and adds a scaled vector.
func cblas_chpr(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Float, Opaque
Pointer?, __LAPACK_int, OpaquePointer?)
Scales and multiplies a vector times its conjugate transpose, then adds a matrix.
func cblas_chpr2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?)
Multiplies a vector times the conjugate transpose of a second vector and vice-versa, sums t
results, and adds a matrix.


## Page 42

func cblas_crotg(OpaquePointer, OpaquePointer, UnsafeMutablePointer<
Float>, OpaquePointer)
Constructs a complex Givens rotation.
func cblas_cscal(__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK
_int)
Multiplies each element of a vector by a constant (single-precision complex).
func cblas_csrot(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, Float, Float)
Applies a Givens rotation matrix to a pair of complex vectors.
func cblas_csscal(__LAPACK_int, Float, OpaquePointer?, __LAPACK_int)
Multiplies each element of a vector by a constant (single-precision complex).
func cblas_cswap(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Exchanges the elements of two vectors (single-precision complex).
func cblas_csymm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, __LAPACK_int, _
_LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer
?, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Multiplies a matrix by a symmetric matrix (single-precision complex).
func cblas_csyr2k(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_in
, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Performs a rank-2k update of a symmetric matrix (single-precision complex).
func cblas_csyrk(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_int
__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointe
, OpaquePointer?, __LAPACK_int)
Rank-k update—multiplies a symmetric matrix by its transpose and adds a second matrix
(single-precision complex).
func cblas_ctbmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?
__LAPACK_int)
Scales a triangular band matrix, then multiplies by a vector (single-precision compex).
func cblas_ctbsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?
__LAPACK_int)


## Page 43

Solves a triangular banded system of equations.
func cblas_ctpmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, OpaquePointer?, __LAPACK_int)
Multiplies a triangular matrix by a vector, then adds a vector (single-precision complex).
func cblas_ctpsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, OpaquePointer?, __LAPACK_int)
Solves a packed triangular system of equations.
func cblas_ctrmm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, 
_LAPACK_int, OpaquePointer?, __LAPACK_int)
Scales a triangular matrix and multiplies it by a matrix.
func cblas_ctrmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int
Multiplies a triangular matrix by a vector.
func cblas_ctrsm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, 
_LAPACK_int, OpaquePointer?, __LAPACK_int)
Solves a triangular system of equations with multiple values for the right side.
func cblas_ctrsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int
Solves a triangular system of equations with a single value for the right side.
func cblas_scasum(__LAPACK_int, OpaquePointer?, __LAPACK_int) -> Float
Computes the sum of the absolute values of real and imaginary parts of elements in a vector
(single-precision complex).
func cblas_scnrm2(__LAPACK_int, OpaquePointer?, __LAPACK_int) -> Float
Computes the unitary norm of a vector (single-precision complex).
func cblas_dasum(__LAPACK_int, UnsafePointer<Double>?, __LAPACK_int) ->
Double
Computes the sum of the absolute values of elements in a vector (double-precision).
func cblas_daxpy(__LAPACK_int, Double, UnsafePointer<Double>?, __LAPACK
_int, UnsafeMutablePointer<Double>?, __LAPACK_int)
Double-precision float matrix functions


## Page 44

Computes a constant times a vector plus a vector (double-precision).
func cblas_dcopy(__LAPACK_int, UnsafePointer<Double>?, __LAPACK_int,
UnsafeMutablePointer<Double>?, __LAPACK_int)
Copies a vector to another vector (double-precision).
func cblas_dgbmv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, __LAPACK_int, __LAPACK_int, Double, UnsafePointer<Double>?, _
_LAPACK_int, UnsafePointer<Double>?, __LAPACK_int, Double, UnsafeMutabl
Pointer<Double>?, __LAPACK_int)
Scales a general band matrix, then multiplies by a vector, then adds a vector (double
precision).
func cblas_dgemm(CBLAS_ORDER, CBLAS_TRANSPOSE, CBLAS_TRANSPOSE, __LAPAC
_int, __LAPACK_int, __LAPACK_int, Double, UnsafePointer<Double>?, _
_LAPACK_int, UnsafePointer<Double>?, __LAPACK_int, Double, UnsafeMutabl
Pointer<Double>?, __LAPACK_int)
Multiplies two matrices (double-precision).
func cblas_dgemv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, Double, UnsafePointer<Double>?, __LAPACK_int, UnsafePointer<Doubl
>?, __LAPACK_int, Double, UnsafeMutablePointer<Double>?, __LAPACK_int)
Multiplies a matrix by a vector (double precision).
func cblas_dger(CBLAS_ORDER, __LAPACK_int, __LAPACK_int, Double, Unsafe
Pointer<Double>?, __LAPACK_int, UnsafePointer<Double>?, __LAPACK_int,
UnsafeMutablePointer<Double>?, __LAPACK_int)
Multiplies vector X by the transpose of vector Y, then adds matrix A (double precison).
func cblas_dnrm2(__LAPACK_int, UnsafePointer<Double>?, __LAPACK_int) ->
Double
Computes the L2 norm (Euclidian length) of a vector (double precision).
func cblas_drot(__LAPACK_int, UnsafeMutablePointer<Double>?, __LAPACK
_int, UnsafeMutablePointer<Double>?, __LAPACK_int, Double, Double)
Applies a Givens rotation matrix to a pair of vectors.
func cblas_drotg(UnsafeMutablePointer<Double>, UnsafeMutablePointer<
Double>, UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double>)
Constructs a Givens rotation matrix.
func cblas_drotm(__LAPACK_int, UnsafeMutablePointer<Double>?, __LAPACK
_int, UnsafeMutablePointer<Double>?, __LAPACK_int, UnsafePointer<Double
>)


## Page 45

Applies a modified Givens transformation (single precision).
func cblas_drotmg(UnsafeMutablePointer<Double>, UnsafeMutablePointer<
Double>, UnsafeMutablePointer<Double>, Double, UnsafeMutablePointer<
Double>)
Generates a modified Givens rotation matrix.
func cblas_dsbmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, __LAPACK_int,
Double, UnsafePointer<Double>?, __LAPACK_int, UnsafePointer<Double>?, _
_LAPACK_int, Double, UnsafeMutablePointer<Double>?, __LAPACK_int)
Scales a symmetric band matrix, then multiplies by a vector, then adds a vector (double
precision).
func cblas_dscal(__LAPACK_int, Double, UnsafeMutablePointer<Double>?, _
_LAPACK_int)
Multiplies each element of a vector by a constant (double-precision).
func cblas_dspmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Unsafe
Pointer<Double>?, UnsafePointer<Double>?, __LAPACK_int, Double, Unsafe
MutablePointer<Double>?, __LAPACK_int)
Scales a packed symmetric matrix, then multiplies by a vector, then scales and adds another
vector (double precision).
func cblas_dspr(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Unsafe
Pointer<Double>?, __LAPACK_int, UnsafeMutablePointer<Double>?)
Rank one update: adds a packed symmetric matrix to the product of a scaling factor, a vecto
and its transpose (double precision).
func cblas_dspr2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Unsafe
Pointer<Double>?, __LAPACK_int, UnsafePointer<Double>?, __LAPACK_int,
UnsafeMutablePointer<Double>?)
Rank two update of a packed symmetric matrix using two vectors (single precision).
func cblas_dswap(__LAPACK_int, UnsafeMutablePointer<Double>?, __LAPACK
_int, UnsafeMutablePointer<Double>?, __LAPACK_int)
Exchanges the elements of two vectors (double precision).
func cblas_dsymm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, __LAPACK_int, _
_LAPACK_int, Double, UnsafePointer<Double>?, __LAPACK_int, UnsafePointe
<Double>?, __LAPACK_int, Double, UnsafeMutablePointer<Double>?, __LAPAC
_int)
Multiplies a matrix by a symmetric matrix (double-precision).


## Page 46

func cblas_dsymv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Unsafe
Pointer<Double>?, __LAPACK_int, UnsafePointer<Double>?, __LAPACK_int,
Double, UnsafeMutablePointer<Double>?, __LAPACK_int)
Scales a symmetric matrix, multiplies by a vector, then scales and adds another vector (sing
precision).
func cblas_dsyr(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Unsafe
Pointer<Double>?, __LAPACK_int, UnsafeMutablePointer<Double>?, __LAPACK
_int)
Rank one update: adds a symmetric matrix to the product of a scaling factor, a vector, and it
transpose (double precision).
func cblas_dsyr2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Unsafe
Pointer<Double>?, __LAPACK_int, UnsafePointer<Double>?, __LAPACK_int,
UnsafeMutablePointer<Double>?, __LAPACK_int)
Rank two update of a symmetric matrix using two vectors (single precision).
func cblas_dsyr2k(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_in
, __LAPACK_int, Double, UnsafePointer<Double>?, __LAPACK_int, Unsafe
Pointer<Double>?, __LAPACK_int, Double, UnsafeMutablePointer<Double>?, 
_LAPACK_int)
Performs a rank-2k update of a symmetric matrix (double precision).
func cblas_dsyrk(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_int
__LAPACK_int, Double, UnsafePointer<Double>?, __LAPACK_int, Double,
UnsafeMutablePointer<Double>?, __LAPACK_int)
Rank-k update—multiplies a symmetric matrix by its transpose and adds a second matrix
(double precision).
func cblas_dtbmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, UnsafePointer<Double>?, __LAPACK_int, Unsafe
MutablePointer<Double>?, __LAPACK_int)
Scales a triangular band matrix, then multiplies by a vector (double precision).
func cblas_dtbsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, UnsafePointer<Double>?, __LAPACK_int, Unsafe
MutablePointer<Double>?, __LAPACK_int)
Solves a triangular banded system of equations.
func cblas_dtpmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Double>?, UnsafeMutablePointer<Double>?, _
_LAPACK_int)
Multiplies a triangular matrix by a vector, then adds a vector (double precision).


## Page 47

func cblas_dtpsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Double>?, UnsafeMutablePointer<Double>?, _
_LAPACK_int)
Solves a packed triangular system of equations.
func cblas_dtrmm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, Double, UnsafePointer<Double>?,
__LAPACK_int, UnsafeMutablePointer<Double>?, __LAPACK_int)
Scales a triangular matrix and multiplies it by a matrix.
func cblas_dtrmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Double>?, __LAPACK_int, UnsafeMutablePointer
Double>?, __LAPACK_int)
Multiplies a triangular matrix by a vector.
func cblas_dtrsm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, Double, UnsafePointer<Double>?,
__LAPACK_int, UnsafeMutablePointer<Double>?, __LAPACK_int)
Solves a triangular system of equations with multiple values for the right side.
func cblas_dtrsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, UnsafePointer<Double>?, __LAPACK_int, UnsafeMutablePointer
Double>?, __LAPACK_int)
Solves a triangular system of equations with a single value for the right side.
func appleblas_dgeadd(CBLAS_ORDER, CBLAS_TRANSPOSE, CBLAS_TRANSPOSE, _
_LAPACK_int, __LAPACK_int, Double, UnsafePointer<Double>?, __LAPACK_int
Double, UnsafePointer<Double>?, __LAPACK_int, UnsafeMutablePointer<
Double>, __LAPACK_int)
func cblas_dzasum(__LAPACK_int, OpaquePointer?, __LAPACK_int) -> Double
Computes the sum of the absolute values of real and imaginary parts of elements in a vector
(single-precision complex).
func cblas_dznrm2(__LAPACK_int, OpaquePointer?, __LAPACK_int) -> Double
Computes the unitary norm of a vector (double-precision complex).
func cblas_zaxpy(__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK
_int, OpaquePointer?, __LAPACK_int)
Computes a constant times a vector plus a vector (double-precision complex).
Double-precision complex matrix functions


## Page 48

func cblas_zcopy(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Copies a vector to another vector (double-precision complex).
func cblas_zdrot(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, Double, Double)
Applies a Givens rotation matrix to a pair of complex vectors.
func cblas_zdscal(__LAPACK_int, Double, OpaquePointer?, __LAPACK_int)
Multiplies each element of a vector by a constant (double-precision complex).
func cblas_zgbmv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, _
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer, OpaquePointer
?, __LAPACK_int)
Scales a general band matrix, then multiplies by a vector, then adds a vector (double-
precision complex).
func cblas_zgemm(CBLAS_ORDER, CBLAS_TRANSPOSE, CBLAS_TRANSPOSE, __LAPAC
_int, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, _
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer, OpaquePointer
?, __LAPACK_int)
Multiplies two matrices (double-precision complex).
func cblas_zgemv(CBLAS_ORDER, CBLAS_TRANSPOSE, __LAPACK_int, __LAPACK
_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer?, _
_LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Multiplies a matrix by a vector (double-precision complex).
func cblas_zgerc(CBLAS_ORDER, __LAPACK_int, __LAPACK_int, OpaquePointer
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Multiplies vector X by the conjugate transpose of vector Y, then adds matrix A (double-
precision complex).
func cblas_zgeru(CBLAS_ORDER, __LAPACK_int, __LAPACK_int, OpaquePointer
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Multiplies vector X by the transpose of vector Y, then adds matrix A (double-precision
complex).


## Page 49

func cblas_zhbmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, __LAPACK_int,
OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK
_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Scales a Hermitian band matrix, then multiplies by a vector, then adds a vector (double-
precision complex).
func cblas_zhemm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, __LAPACK_int, _
_LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer
?, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Multiplies two Hermitian matrices (double-precision complex).
func cblas_zhemv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer, OpaquePointer?, __LAPACK_int)
Scales and multiplies a Hermitian matrix by a vector, then adds a second (scaled) vector.
func cblas_zher(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Opaque
Pointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int)
Adds the product of a scaling factor, vector X, and the conjugate transpose of X to matrix A.
func cblas_zher2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Hermitian rank 2 update: adds the product of a scaling factor, vector X, and the conjugate
transpose of vector Y to the product of the conjugate of the scaling factor, vector Y, and the
conjugate transpose of vector X, and adds the result to matrix A.
func cblas_zher2k(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_in
, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, Double, OpaquePointer?, __LAPACK_int)
Performs a rank-2k update of a complex Hermitian matrix (double-precision complex).
func cblas_zherk(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_int
__LAPACK_int, Double, OpaquePointer?, __LAPACK_int, Double, Opaque
Pointer?, __LAPACK_int)
Rank-k update—multiplies a Hermitian matrix by its transpose and adds a second matrix
(single precision).
func cblas_zhpmv(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, OpaquePointer?, __LAPACK_int, OpaquePointer, Opaque
Pointer?, __LAPACK_int)
Scales a packed hermitian matrix, multiplies it by a vector, and adds a scaled vector.


## Page 50

func cblas_zhpr(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, Double, Opaque
Pointer?, __LAPACK_int, OpaquePointer?)
Scales and multiplies a vector times its conjugate transpose, then adds a matrix.
func cblas_zhpr2(CBLAS_ORDER, CBLAS_UPLO, __LAPACK_int, OpaquePointer,
OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?)
Multiplies a vector times the conjugate transpose of a second vector and vice-versa, sums t
results, and adds a matrix.
func cblas_zrotg(OpaquePointer, OpaquePointer, UnsafeMutablePointer<
Double>, OpaquePointer)
Constructs a complex Givens rotation.
func cblas_zscal(__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK
_int)
Multiplies each element of a vector by a constant (double-precision complex).
func cblas_zswap(__LAPACK_int, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int)
Exchanges the elements of two vectors (double-precision complex).
func cblas_zsymm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, __LAPACK_int, _
_LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointer
?, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Multiplies a matrix by a symmetric matrix (double-precision complex).
func cblas_zsyr2k(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_in
, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, Opaque
Pointer?, __LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int)
Performs a rank-2k update of a symmetric matrix (double-precision complex).
func cblas_zsyrk(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, __LAPACK_int
__LAPACK_int, OpaquePointer, OpaquePointer?, __LAPACK_int, OpaquePointe
, OpaquePointer?, __LAPACK_int)
Rank-k update—multiplies a symmetric matrix by its transpose and adds a second matrix
(double-precision complex).
func cblas_ztbmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?
__LAPACK_int)
Scales a triangular band matrix, then multiplies by a vector (double-precision complex).


## Page 51

func cblas_ztbsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, __LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?
__LAPACK_int)
Solves a triangular banded system of equations.
func cblas_ztpmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, OpaquePointer?, __LAPACK_int)
Multiplies a triangular matrix by a vector, then adds a vector (double-precision compex).
func cblas_ztpsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, OpaquePointer?, __LAPACK_int)
Solves a packed triangular system of equations.
func cblas_ztrmm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, 
_LAPACK_int, OpaquePointer?, __LAPACK_int)
Scales a triangular matrix and multiplies it by a matrix.
func cblas_ztrmv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int
Multiplies a triangular matrix by a vector.
func cblas_ztrsm(CBLAS_ORDER, CBLAS_SIDE, CBLAS_UPLO, CBLAS_TRANSPOSE,
CBLAS_DIAG, __LAPACK_int, __LAPACK_int, OpaquePointer, OpaquePointer?, 
_LAPACK_int, OpaquePointer?, __LAPACK_int)
Solves a triangular system of equations with multiple values for the right side.
func cblas_ztrsv(CBLAS_ORDER, CBLAS_UPLO, CBLAS_TRANSPOSE, CBLAS_DIAG, 
_LAPACK_int, OpaquePointer?, __LAPACK_int, OpaquePointer?, __LAPACK_int
Solves a triangular system of equations with a single value for the right side.
LAPACK/BLAS Functions
An updated BLAS interface supporting ILP64 is available.
func cgedmd_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<
CChar>, UnsafePointer<CChar>, UnsafePointer<__LAPACK_int>, UnsafePointe
<__LAPACK_int>, UnsafePointer<__LAPACK_int>, OpaquePointer?, Unsafe
Pointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Float>, UnsafeMutablePointer
__LAPACK_int>, OpaquePointer?, OpaquePointer?, UnsafeMutablePointer<_
_LAPACK_int>, UnsafeMutablePointer<Float>?, OpaquePointer?, Unsafe
LAPACK functions


## Page 52

Pointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>,
OpaquePointer?, UnsafePointer<__LAPACK_int>, OpaquePointer?, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<Float>?, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>?, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>)
func cgedmdq_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer
CChar>, UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<CChar
>, UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, Unsafe
Pointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>,
OpaquePointer?, UnsafePointer<__LAPACK_int>, OpaquePointer?, Unsafe
Pointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafePointer<Float
>, UnsafeMutablePointer<__LAPACK_int>, OpaquePointer?, OpaquePointer?,
UnsafeMutablePointer<__LAPACK_int>, UnsafeMutablePointer<Float>?, Opaqu
Pointer?, UnsafePointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<_
_LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>, OpaquePointe
?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Float>, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>?, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>)
func cgeqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<Float>, UnsafeMutablePointer<Float>, OpaquePointer?, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>, UnsafeMutabl
Pointer<Float>, UnsafeMutablePointer<Float>, UnsafeMutablePointer<_
_LAPACK_int>?, OpaquePointer?, OpaquePointer, UnsafePointer<__LAPACK_in
>, UnsafeMutablePointer<Float>?, UnsafeMutablePointer<__LAPACK_int>?,
UnsafeMutablePointer<__LAPACK_int>)
func claqp2rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Float>, UnsafePointer<Float>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Float>, OpaquePointer?,
UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>, Unsafe
MutablePointer<Float>, UnsafeMutablePointer<Float>, UnsafeMutablePointe
<__LAPACK_int>?, OpaquePointer?, UnsafeMutablePointer<Float>?, Unsafe
MutablePointer<Float>?, OpaquePointer, UnsafeMutablePointer<__LAPACK_in
>)
func claqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Float>, UnsafePointer<Float>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Float>, OpaquePointer?,
UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_bool>, Unsaf
MutablePointer<__LAPACK_int>, UnsafeMutablePointer<Float>, UnsafeMutabl


## Page 53

Pointer<Float>, UnsafeMutablePointer<__LAPACK_int>?, OpaquePointer?,
UnsafeMutablePointer<Float>?, UnsafeMutablePointer<Float>?, Opaque
Pointer?, OpaquePointer?, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>?, UnsafeMutablePointer<__LAPACK_int>)
func crscl_(UnsafePointer<__LAPACK_int>, OpaquePointer, OpaquePointer?,
UnsafePointer<__LAPACK_int>)
func dgedmd_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<
CChar>, UnsafePointer<CChar>, UnsafePointer<__LAPACK_int>, UnsafePointe
<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Doubl
>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Double>?, Unsafe
Pointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafePointer<Doubl
>, UnsafeMutablePointer<__LAPACK_int>, UnsafeMutablePointer<Double>?,
UnsafeMutablePointer<Double>?, UnsafeMutablePointer<Double>?, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<Double>?, UnsafeMutable
Pointer<Double>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<
Double>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Double>?,
UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Double>, UnsafePointe
<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>?, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>)
func dgedmdq_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer
CChar>, UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<CChar
>, UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<Double>?, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<Double>?, UnsafePointer<__LAPACK_int
>, UnsafeMutablePointer<Double>?, UnsafePointer<__LAPACK_int>, Unsafe
Pointer<__LAPACK_int>, UnsafePointer<Double>, UnsafeMutablePointer<_
_LAPACK_int>, UnsafeMutablePointer<Double>?, UnsafeMutablePointer<Doubl
>?, UnsafeMutablePointer<Double>?, UnsafePointer<__LAPACK_int>, Unsafe
MutablePointer<Double>?, UnsafeMutablePointer<Double>?, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<Double>?, UnsafePointer<__LAPACK_int
>, UnsafeMutablePointer<Double>?, UnsafePointer<__LAPACK_int>, Unsafe
MutablePointer<Double>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>?, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>)
func dgeqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<Double>, UnsafeMutablePointer<Double>, UnsafeMutablePointer<
Double>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_in
>, UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double>, Unsafe
MutablePointer<__LAPACK_int>?, UnsafeMutablePointer<Double>?, Unsafe


## Page 54

MutablePointer<Double>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>?, UnsafeMutablePointer<__LAPACK_int>)
func dlaqp2rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Double>, UnsafePointer<Double>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Double>, UnsafeMutablePointe
<Double>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK
_int>, UnsafeMutablePointer<Double>, UnsafeMutablePointer<Double>,
UnsafeMutablePointer<__LAPACK_int>?, UnsafeMutablePointer<Double>?,
UnsafeMutablePointer<Double>?, UnsafeMutablePointer<Double>?, Unsafe
MutablePointer<Double>, UnsafeMutablePointer<__LAPACK_int>)
func dlaqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Double>, UnsafePointer<Double>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Double>, UnsafeMutablePointe
<Double>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK
_bool>, UnsafeMutablePointer<__LAPACK_int>, UnsafeMutablePointer<Double
>, UnsafeMutablePointer<Double>, UnsafeMutablePointer<__LAPACK_int>?,
UnsafeMutablePointer<Double>?, UnsafeMutablePointer<Double>?, Unsafe
MutablePointer<Double>?, UnsafeMutablePointer<Double>?, UnsafeMutable
Pointer<Double>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<_
_LAPACK_int>?, UnsafeMutablePointer<__LAPACK_int>)
func sgedmd_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<
CChar>, UnsafePointer<CChar>, UnsafePointer<__LAPACK_int>, UnsafePointe
<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Float
>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Float>?, Unsafe
Pointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafePointer<Float
>, UnsafeMutablePointer<__LAPACK_int>, UnsafeMutablePointer<Float>?,
UnsafeMutablePointer<Float>?, UnsafeMutablePointer<Float>?, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<Float>?, UnsafeMutable
Pointer<Float>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Floa
>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Float>?, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<Float>, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>?, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>)
func sgedmdq_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer
CChar>, UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<CChar
>, UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<Float>?, UnsafePointer<_
_LAPACK_int>, UnsafeMutablePointer<Float>?, UnsafePointer<__LAPACK_int>
UnsafeMutablePointer<Float>?, UnsafePointer<__LAPACK_int>, UnsafePointe


## Page 55

<__LAPACK_int>, UnsafePointer<Float>, UnsafeMutablePointer<__LAPACK_int
>, UnsafeMutablePointer<Float>?, UnsafeMutablePointer<Float>?, Unsafe
MutablePointer<Float>?, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<Float>?, UnsafeMutablePointer<Float>?, UnsafePointer<__LAPACK
_int>, UnsafeMutablePointer<Float>?, UnsafePointer<__LAPACK_int>, Unsaf
MutablePointer<Float>?, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<Float>, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<_
_LAPACK_int>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<_
_LAPACK_int>)
func sgeqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<Float>, UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float
>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>,
UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float>, UnsafeMutable
Pointer<__LAPACK_int>?, UnsafeMutablePointer<Float>?, UnsafeMutable
Pointer<Float>, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<_
_LAPACK_int>?, UnsafeMutablePointer<__LAPACK_int>)
func slaqp2rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Float>, UnsafePointer<Float>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Float>, UnsafeMutablePointer
Float>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int
>, UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float>, Unsafe
MutablePointer<__LAPACK_int>?, UnsafeMutablePointer<Float>?, Unsafe
MutablePointer<Float>?, UnsafeMutablePointer<Float>?, UnsafeMutable
Pointer<Float>, UnsafeMutablePointer<__LAPACK_int>)
func sgeqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<Float>, UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float
>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>,
UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float>, UnsafeMutable
Pointer<__LAPACK_int>?, UnsafeMutablePointer<Float>?, UnsafeMutable
Pointer<Float>, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<_
_LAPACK_int>?, UnsafeMutablePointer<__LAPACK_int>)
func slaqp2rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Float>, UnsafePointer<Float>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Float>, UnsafeMutablePointer
Float>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int
>, UnsafeMutablePointer<Float>, UnsafeMutablePointer<Float>, Unsafe
MutablePointer<__LAPACK_int>?, UnsafeMutablePointer<Float>?, Unsafe


## Page 56

MutablePointer<Float>?, UnsafeMutablePointer<Float>?, UnsafeMutable
Pointer<Float>, UnsafeMutablePointer<__LAPACK_int>)
func slaqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Float>, UnsafePointer<Float>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Float>, UnsafeMutablePointer
Float>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_boo
>, UnsafeMutablePointer<__LAPACK_int>, UnsafeMutablePointer<Float>,
UnsafeMutablePointer<Float>, UnsafeMutablePointer<__LAPACK_int>?, Unsaf
MutablePointer<Float>?, UnsafeMutablePointer<Float>?, UnsafeMutable
Pointer<Float>?, UnsafeMutablePointer<Float>?, UnsafeMutablePointer<
Float>?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int
>?, UnsafeMutablePointer<__LAPACK_int>)
func zgedmd_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<
CChar>, UnsafePointer<CChar>, UnsafePointer<__LAPACK_int>, UnsafePointe
<__LAPACK_int>, UnsafePointer<__LAPACK_int>, OpaquePointer?, Unsafe
Pointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Double>, UnsafeMutablePointe
<__LAPACK_int>, OpaquePointer?, OpaquePointer?, UnsafePointer<__LAPACK
_int>, UnsafeMutablePointer<Double>?, OpaquePointer?, UnsafePointer<_
_LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>, OpaquePointe
?, UnsafePointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK
_int>, UnsafeMutablePointer<Double>?, UnsafePointer<__LAPACK_int>,
UnsafeMutablePointer<__LAPACK_int>?, UnsafePointer<__LAPACK_int>, Unsaf
MutablePointer<__LAPACK_int>)
func zgedmdq_(UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer
CChar>, UnsafePointer<CChar>, UnsafePointer<CChar>, UnsafePointer<CChar
>, UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, Unsafe
Pointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>,
OpaquePointer?, UnsafePointer<__LAPACK_int>, OpaquePointer?, Unsafe
Pointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafePointer<Doubl
>, UnsafeMutablePointer<__LAPACK_int>, OpaquePointer?, OpaquePointer?,
UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Double>?, Opaque
Pointer?, UnsafePointer<__LAPACK_int>, OpaquePointer?, UnsafePointer<_
_LAPACK_int>, OpaquePointer?, UnsafePointer<__LAPACK_int>, OpaquePointe
?, UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<Double>, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>?, Unsafe
Pointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>)
func zgeqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<Double>, UnsafeMutablePointer<Double>, OpaquePointer?, Unsafe


## Page 57

Pointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>, UnsafeMutabl
Pointer<Double>, UnsafeMutablePointer<Double>, UnsafeMutablePointer<_
_LAPACK_int>?, OpaquePointer?, OpaquePointer, UnsafePointer<__LAPACK_in
>, UnsafeMutablePointer<Double>?, UnsafeMutablePointer<__LAPACK_int>?,
UnsafeMutablePointer<__LAPACK_int>)
func zlaqp2rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Double>, UnsafePointer<Double>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Double>, OpaquePointer?,
UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_int>, Unsafe
MutablePointer<Double>, UnsafeMutablePointer<Double>, UnsafeMutable
Pointer<__LAPACK_int>?, OpaquePointer?, UnsafeMutablePointer<Double>?,
UnsafeMutablePointer<Double>?, OpaquePointer, UnsafeMutablePointer<_
_LAPACK_int>)
func zlaqp3rk_(UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>
UnsafePointer<__LAPACK_int>, UnsafePointer<__LAPACK_int>, UnsafeMutable
Pointer<__LAPACK_int>, UnsafePointer<Double>, UnsafePointer<Double>,
UnsafePointer<__LAPACK_int>, UnsafePointer<Double>, OpaquePointer?,
UnsafePointer<__LAPACK_int>, UnsafeMutablePointer<__LAPACK_bool>, Unsaf
MutablePointer<__LAPACK_int>, UnsafeMutablePointer<Double>, Unsafe
MutablePointer<Double>, UnsafeMutablePointer<__LAPACK_int>?, Opaque
Pointer?, UnsafeMutablePointer<Double>?, UnsafeMutablePointer<Double>?,
OpaquePointer?, OpaquePointer?, UnsafePointer<__LAPACK_int>, Unsafe
MutablePointer<__LAPACK_int>?, UnsafeMutablePointer<__LAPACK_int>)
func zrscl_(UnsafePointer<__LAPACK_int>, OpaquePointer, OpaquePointer?,
UnsafePointer<__LAPACK_int>)
typealias sparse_matrix_double_complex
typealias sparse_matrix_float_complex
typealias vFloatPacked
Solving systems of linear equations with LAPACK
Select the optimal LAPACK routine to solve a system of linear equations.
See Also
Linear Algebra


## Page 58

Finding an interpolating polynomial using the Vandermonde method
Use LAPACK to solve a linear system and find an interpolating polynomial to construct new
points between a series of known data points.
Compressing an image using linear algebra
Reduce the storage size of an image using singular value decomposition (SVD).


