# 000_Solving systems of linear equations with LAPACK.pdf

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


