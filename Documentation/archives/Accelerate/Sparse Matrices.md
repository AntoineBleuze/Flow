# Sparse Matrices.pdf

## Page 1

In the Accelerate framework, the Sparse Solvers library stores sparse matrices using the
compressed sparse column (CSC) format. CSC stores a matrix as a series of column vectors that
specify the nonzero entries as (row-index, value) pairs and omit the zero entries.
The Sparse Solvers library provides routines to convert matrices from other formats to CSC. For
more information, see Conversion from Other Formats.
The Sparse Solvers library supports unsymmetric and symmetric sparse matrices, each of which
can also be block matrices.
An unsymmetric matrix contains either Double or Float values with no symmetry between its
lower-left and upper-right triangles.
A symmetric matrix is symmetrical along the diagonal from its upper-left to lower-right corners
In other words, a symmetric matrix is equal to its transpose (A=Aᵀ).
A block matrix can be either unsymmetric or symmetric, and consists of sections called blocks
The blocks along the diagonal of a symmetric block matrix must, themselves, be symmetrical.
In this example of an unsymmetric sparse matrix, empty cells represent zeros:
The first step to create a matrix is to define two arrays that store the row indices and correspondi
values.
Overview
Create an unsymmetric matrix
Accelerate / Creating sparse matrices
Article
Creating sparse matrices
Create sparse matrices for factorization and solving systems.


## Page 2

In addition to the (row-index, value) pairs, create a third array that specifies where each
column starts. This array requires an additional, final entry that defines the final column’s length.
In the following example, the zeroth item in the values array starts column 0, the third starts
column 1, and the seventh starts column 2:
The two structural arrays, rowIndices and columnStarts, create a SparseMatrix
Structure instance that describes the matrix’s structure. The initializer requires an attributes
object, and the default parameters of a SparseAttributes_t instance specify an unsymmetric
matrix.
The following code uses the structure and values items to create a SparseMatrix_Doubl
instance:
Objective-C
Objective-C
Objective-C
Swift
Swift
Swift


## Page 3

In this example of a symmetric sparse matrix, empty cells represent zeros:
Because it’s symmetric, the values in the upper triangle of the matrix are redundant, so exclude
them from the data that you pass to the SparseMatrix_Double initializer. The example below
shows the excluded values in gray:
As with the unsymmetric example, the rowIndices array specifies the row in the matrix that
contains the corresponding item in values, and the columnStarts array specifies where each
column starts in the rowIndices array.
In the following example, the attributes parameter specifies that the matrix is symmetric and
the items in the values array derive from the lower triangle:
Objective-C
Create a symmetric matrix
Objective-C
Swift
Swift


## Page 4

Create the SparseMatrix_Double instance using the structure from the code example above
and the values from the lower triangle of the matrix.
You can create block sparse matrices — that is, a matrix that consists of blocks that contain
multiple values — by defining a blockSize greater than 1. The block size is the length of the side
of the square block.
Objective-C
Create a block matrix
Swift


## Page 5

Block matrices can be symmetric or unsymmetric. This example shows an unsymmetric sparse
matrix with a block size of 3:
The following example shows the code to create a sparse matrix with the structure and values
above. The SparseMatrixStructure specifies a block size of 3. The values for each block
concatenate in column-major order.
Objective-C
Swift


## Page 6

When you create a symmetric matrix with a block size greater than 1, the blocks along the matrix’
diagonal must also be symmetric.
Solving systems using direct methods
Use direct methods to solve systems of equations where the coefficient matrix is sparse.
Solving systems using iterative methods
Use iterative methods to solve systems of equations where the coefficient matrix is sparse.
Creating a sparse matrix from coordinate format arrays
Use separate coordinate format arrays to create sparse matrices.
Sparse Solvers
Solve systems of equations where the coefficient matrix is sparse.
See Also
Sparse Matrices


## Page 7

Direct methods offer high-precision solving with a simple API when compared to iterative method
The code example below uses sparse Cholesky factorization to solve the following equation:
In the equation above, A refers to the four-by-four coefficient matrix and b to the right-hand-side
vector. The code in this article solves the equation Ax = b by finding x.
Note that A is sparse. Some entries (those that are blank) are zero. For small matrices such as thi
there’s little gain in exploiting this structure. However, it’s essential for larger systems that don’t
otherwise fit in memory, even on a large computer.
The code in this article performs a sparse Cholesky factorization, equivalent to calling the LAPAC
function dpotrf_(_:_:_:_:_:) on a dense matrix. The main requirement for sparse Cholesky
factorization is that the matrix is symmetric positive-definite (that is, A=Aᵀ), and all eigenvalues ar
greater than zero. A sufficient, but not necessary, condition is that the matrix is diagonally
dominant (that is, the sum of the absolute values of the off-diagonal entries in each row or colum
is less than the value of the diagonal). This is the case for the above matrix.
Use the code below to define the matrix structure. As Creating sparse matrices explains, because
is symmetric, it stores only half of the data.
Overview
Create the matrix structure
Accelerate / Solving systems using direct methods
Article
Solving systems using direct methods
Use direct methods to solve systems of equations where the coefficient matrix is
sparse.


## Page 8

The SparseFactor(_:_:) function performs the actual Cholesky factorization, finding L such
that A = LLᵀ.
Objective-C
Create and factorize the matrix
Objective-C
Swift
Swift


## Page 9

If the factorization function encounters an error, the code prints an error message and terminates
You may instead want to capture the error by using the optional SparseSymbolicFactor
Options parameter and set the reportError parameter to a user-supplied error-handling
routine. The returned SparseOpaqueFactorization_Double structure reflects the error.
Use the factorization to solve the equation. The right-hand-side and solution vectors are arrays
that you wrap in DenseVector_Double structures. The actual values of x don’t matter because
the function overwrites them.
The solve call takes the factorization A = LLᵀ and solves the system Ax = b as LLᵀx = b by solving
the two triangular systems:
Ly = b
Lᵀx = y
However, you need only to supply the right-hand-side vector and the factorization.
The SparseSolve(_:_:_:) function solves the equation and populates x with the solution.
Solve the equation
Objective-C
Objective-C
Swift
Swift


## Page 10

If the SparseSolve(_:_:_:) function encounters an error, the code prints an error message
and terminates, unless you set reportError on the initial call to SparseFactor(_:_:).
The following code iterates over the solution vector, x, and prints the solution, x = 0.10 0.20 
.30 0.40.
Creating sparse matrices
Create sparse matrices for factorization and solving systems.
Solving systems using iterative methods
Use iterative methods to solve systems of equations where the coefficient matrix is sparse.
Creating a sparse matrix from coordinate format arrays
Use separate coordinate format arrays to create sparse matrices.
Sparse Solvers
Solve systems of equations where the coefficient matrix is sparse.
Objective-C
See Also
Sparse Matrices
Swift


## Page 11

The code in this article solves the following equation by using the iterative method of least square
minimum residual (LSMR) to find the solution.
In the equation above, A refers to the four-by-three matrix, and b to the right-hand-side vector. T
code in this article solves the equation Ax = b by finding x.
Because A is an overdetermined matrix (that is, it has more rows than columns), for most right-
hand-sides there isn’t an exact solution. In this case, you usually find the closest solution that
minimizes the 2-norm of the error. That is, the solution solves the optimization min ‖ Ax -
 b ‖₂. This is known as the least-squares problem.
You could solve this problem through a direct method, such as sparse QR; however, for some
problems, a faster method that provides an adequate solution is the iterative method LSMR. Unlik
direct methods that factorize the matrix A, iterative methods only require the ability to multiply by
the matrix (and its transpose, Aᵀ). They move through a sequence of approximate solutions,
converging to the correct answer. However, these methods run into numerical difficulties more
often than direct methods. Resolving these issues requires expert knowledge, and is sometimes
impossible. The most common method to improve and accelerate convergence is to use a
preconditioner — an operator that approximates A⁻¹. For least-squares problems, using a diagon
matrix with entries equal to the 2-norm of each column is often sufficient and is the method that
this article covers.
Overview
Accelerate / Solving systems using iterative methods
Article
Solving systems using iterative methods
Use iterative methods to solve systems of equations where the coefficient matrix
is sparse.


## Page 12

Use the code below — which Creating sparse matrices covers in detail — to define the unsymmet
matrix A:
Create the matrix
Objective-C
Swift


## Page 13

Define the right-hand-side and solution vectors as arrays that you wrap in DenseVector_Doubl
structures. The sparse solve function uses the initial values of x as an initial guess of the solution
you don’t have a good estimate, initialize all the values to zero.
Use the matrix and vectors to perform the full LSMR iteration and iterate over the results in x.
SparseSolve(_:_:_:_:_:) returns a status which, if equal to SparseIterative
Converged, indicates that the vector, x, contains the solution.
On return, x contains the values 0.10 0.20 0.30.
Solve the equation
Objective-C
Objective-C
Swift
Swift


## Page 14

Creating sparse matrices
Create sparse matrices for factorization and solving systems.
Solving systems using direct methods
Use direct methods to solve systems of equations where the coefficient matrix is sparse.
Creating a sparse matrix from coordinate format arrays
Use separate coordinate format arrays to create sparse matrices.
Sparse Solvers
Solve systems of equations where the coefficient matrix is sparse.
See Also
Sparse Matrices


## Page 15

In some cases — for example, if you’re reading matrix values from a file — you may find it easier to
create sparse matrix objects from coordinate format arrays. This approach requires three separat
arrays: one that contains the column indexes, a second that contains the row indexes, and a third
that contains the matrix values. Each array contains the same number of elements.
The following is an example of a symmetric sparse matrix:
Because this sparse matrix is symmetric, define it with the arrays below that describe its lower
triangle. For example, the value 9.5 is in row 2, column 2.
Overview
Create the sparse matrix
Objective-C
Accelerate / Creating a sparse matrix from coordinate format arrays
Article
Creating a sparse matrix from coordinate
format arrays
Use separate coordinate format arrays to create sparse matrices.
Swift


## Page 16

Use the attributes parameter to specify that the matrix is symmetric and the items in the valu
array derive from the lower triangle.
The following code defines the attributes and creates the sparse matrix instance:
The system ignores the block element and doesn’t include it in the returned matrix if the
coordinates (row[i], column[i]) are invalid, meaning either of the following is true:
They lie outside the ranges 0..<rowCount or 0..<columnCount, respectively.
kind is SparseTriangular or SparseUnitTriangular, and the coordinates lie in the
wrong triangle.
If kind is SparseSymmetric, the system transposes any entries in the wrong triangle and sums
them into the block at (column[i], row[i]), if one is present.
The system sums elements with duplicate coordinates and replaces them with a single entry.
The coordinate-conversion functions support block matrices, that is, those with a blockSize
greater than 1. The described matrix has rowCount * blockSize rows and columnCount *
blockSize columns. For each i in 0..<blockCount, there’s a structurally nonzero block at
block position (row[i], column[i]) with numerical values data[i * blockSize * bloc
Size:(i + 1) * blockSize * blockSize - 1]. The system interprets the block’s values
as the elements of a dense column-major matrix with blockSize rows and columns.
Objective-C
Invalid and duplicate entries
Swift


## Page 17

There are two variants of each converter. The following functions allocate their own workspace
internally and allocate space for the matrices that they return.
SparseConvertFromCoordinate(_:_:_:_:_:_:_:_:) for double-precision, floating-
point values
SparseConvertFromCoordinate(_:_:_:_:_:_:_:_:) for single-precision, floating-po
values
The following functions require preallocated storage for the matrices that they return and a
separate workspace for precise control over allocations:
SparseConvertFromCoordinate(_:_:_:_:_:_:_:_:_:_:) for double-precision,
floating-point values
SparseConvertFromCoordinate(_:_:_:_:_:_:_:_:_:_:) for single-precision,
floating-point values
Creating sparse matrices
Create sparse matrices for factorization and solving systems.
Solving systems using direct methods
Use direct methods to solve systems of equations where the coefficient matrix is sparse.
Solving systems using iterative methods
Use iterative methods to solve systems of equations where the coefficient matrix is sparse.
Sparse Solvers
Solve systems of equations where the coefficient matrix is sparse.
Supply a user-defined workspace
See Also
Sparse Matrices


## Page 18

The Sparse Solvers library in the Accelerate framework handles the solution of systems of
equations where the coefficient matrix is sparse. That is, most of the entries in the matrix are zero
The Sparse Solvers library provides a sparse counterpart to the dense factorizations and linear
solvers that LAPACK provides.
Many problems in science and technology require the solution of large systems of simultaneous
equations. When these equations are linear, you usually represent them as the matrix equation Ax
b. Even when the equations are nonlinear, you often solve the problem as a sequence of linear
approximations.
Overview
Accelerate / Sparse Solvers
API Collection
Sparse Solvers
Solve systems of equations where the coefficient matrix is sparse.


## Page 19

Routines from libraries such as BLAS and LAPACK work with matrices that you store as a 2D dens
array of floating-point values. However, the algorithms you use to manipulate matrices and solve
equations normally require O(n_²)_ data and O(n_³)_ operations. As a result, scaling to a large n is
prohibitive.
To avoid the expense of these algorithms, you can leverage the fact that in many real-world
applications, matrices can contain many entries that are zero. Such matrices are called sparse
(conversely, nonsparse matrices are called dense).
These zeros arise naturally in these types of situations:
Sparse data sets
For example, each user buys only a small fraction of the products from a retailer.
Limited connectivity
For example, most people on social networks only connect to a tiny proportion of the entire
user base.
Physical properties
For example, points on structural meshes only connect to locally adjacent points.
By exploiting these zero entries, you can often reduce the storage and computational requiremen
to O(𝜏*n) and O(𝜏*n_²),_ respectively, where 𝜏 is the average number of entries in each column.
Sparse matrices


## Page 20

This reduction makes the solution of large problems (n in the millions or larger) tractable on most
computers.
For example, the sparse benchmark matrix ldoor, which arises from structural modeling, has
952,200 x 952,200 entries with an average of 25 nonzero Double entries per column. The
following table shows the number of floating-point operations (1 Tflop is 10¹² floating-point
operations) and the memory necessary to perform Cholesky factorization on that matrix:
Floating-point operations
Memory
Dense
287,782 Tflop
6800 GB
Sparse
0.0783 Tflop
1.2 GB
The Accelerate framework offers two solution approaches:
Direct methods perform a factorization such as Cholesky (A = LLᵀ) or QR. These methods
provide a fast and accurate opaque solution.
Iterative methods find an approximate solution requiring only repeated multiplication by A or A
Although they require less memory than direct methods, and can be faster for very large
problems, they typically require problem-specific preconditioners to be effective.
The following table summarizes the differences between direct methods and iterative methods:
Direct methods
Iterative methods
Ease of use
Simple
Complex
Accuracy
Machine precision
Square root of machine precision
Speed
Fast for small
problems
Quite fast for larger
problems
Fastest for large problems, but only with a suitable
problem-specific preconditioner
Memory
requirements
High
Low
In contrast to direct methods, iterative methods provide a way for expert users to find approximat
solutions faster using less memory. You can also use iterative methods when forming the explicit
Solution approaches


## Page 21

matrix is prohibitively expensive, but performing matrix-vector multiplications is performant.
However, to achieve these gains, you need to select an appropriate preconditioner (an operator
that approximates the inverse of A) that’s specific to your problem. It’s best to try a direct method
before trying to use iterative methods.
It’s sometimes possible to improve the accuracy of the solution to Ax = b using iterative refinemen
After finding an initial solution, iterative refinement reuses the factorization to find a series of sma
corrections with the aim of reducing the backward error.
The following code shows how to refine the values in the unknowns vector, x, over a fixed number
of iterations:
Iterative refinement


## Page 22

By default, the Sparse Solvers library runs in multithreaded mode. Because multithreaded mode
may sum child nodes and their ancestors in different orders, the solutions that the library provide
may be different — although equally valid — across different runs.
To ensure that results are deterministic, set VECLIB_MAXIMUM_THREADS=1 to specify single-
threaded mode.
Creating sparse matrices
Create sparse matrices for factorization and solving systems.
struct SparseMatrix_Double
A structure that contains a sparse matrix of double-precision, floating-point values.
struct SparseMatrix_Float
A structure that contains a sparse matrix of single-precision, floating-point values.
Conversion from Other Formats
Create sparse matrices from coordinate format arrays and BLAS opaque matrices.
Sparse Solvers and multithreading
Topics
Creating sparse matrices


## Page 23

struct DenseMatrix_Double
A structure that contains a dense matrix of double-precision, floating-point values.
struct DenseMatrix_Float
A structure that contains a dense matrix of single-precision, floating-point values.
struct DenseVector_Double
A structure that contains a dense vector of double-precision, floating-point values.
struct DenseVector_Float
A structure that contains a dense vector of single-precision, floating-point values.
struct SparseMatrix_Complex_Double
A type representing a sparse complex matrix.
struct SparseMatrix_Complex_Float
A type representing a sparse complex matrix.
struct SparseAttributesComplex_t
A type representing the attributes of a matrix.
struct SparseMatrixStructureComplex
A type representing the sparsity structure of a sparse complex matrix.
struct DenseMatrix_Complex_Double
Contains a dense rowCount x columnCount matrix of complex double values stored in
column-major order.
struct DenseMatrix_Complex_Float
Contains a dense rowCount x columnCount matrix of complex float values stored in
column-major order.
struct DenseVector_Complex_Double
Contains a dense vector of double complex values.
Creating dense matrices and dense vectors
Creating sparse complex matrices
Creating dense complex matrices and dense complex vectors


## Page 24

struct DenseVector_Complex_Float
Contains a dense vector of float complex values.
Solving systems using direct methods
Use direct methods to solve systems of equations where the coefficient matrix is sparse.
struct SparseOpaqueFactorization_Double
A structure that represents the factorization of a matrix of double-precision, floating-point
values.
struct SparseOpaqueFactorization_Float
A structure that represents the factorization of a matrix of single-precision, floating-point
values.
struct SparseOpaqueFactorization_Complex_Double
A semi-opaque type representing a matrix factorization in complex double.
struct SparseOpaqueFactorization_Complex_Float
A semi-opaque type representing a matrix factorization in complex float.
Sparse Matrix Factor Functions
Compute the factorization of a matrix.
Sparse Direct Solving Functions (Matrix RHS)
Solve a system with a right-hand-side dense matrix using a factored sparse coefficient matr
Sparse Direct Solving Functions (Vector RHS)
Solve a system with a right-hand-side dense vector using a factored sparse coefficient matr
Sparse Symbolic Factorization Functions
Calculate the symbolic factorization of a matrix, and solve systems using precalculated
symbolic factorizations.
Sparse Refactor Functions
Recompute a factorization using the numerical data from a matrix.
Subfactor Functions
Extract and work with subfactors.
Solving systems with direct sparse methods
Solving systems with iterative sparse methods


## Page 25

Solving systems using iterative methods
Use iterative methods to solve systems of equations where the coefficient matrix is sparse.
Sparse Iterative Solving Functions (Matrix RHS)
Solve a system with a right-hand-side dense matrix using iterative methods.
Sparse Iterative Solving Functions (Vector RHS)
Solve a system with a right-hand-side dense vector using iterative methods.
Sparse Iterate Functions
Perform a single iteration of the specified iterative method.
Sparse Iterative Methods
Select a suitable iterative method to solve a system.
Preconditioners
Create preconditioners for iterative solves.
Sparse Matrix and Dense Matrix Multiplication
Multiply sparse and dense matrices.
Sparse Matrix and Dense Vector Multiplication
Multiply sparse matrices and dense vectors.
Transposition
Transpose matrices, factorizations, and subfactors.
Memory Management
Retain and release sparse objects.
Creating sparse matrices
Multiplying and transposing sparse matrices
Retaining and releasing resources
See Also
Sparse Matrices


## Page 26

Create sparse matrices for factorization and solving systems.
Solving systems using direct methods
Use direct methods to solve systems of equations where the coefficient matrix is sparse.
Solving systems using iterative methods
Use iterative methods to solve systems of equations where the coefficient matrix is sparse.
Creating a sparse matrix from coordinate format arrays
Use separate coordinate format arrays to create sparse matrices.


