# 001_Solving systems using direct methods.pdf

## Page 1

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


## Page 2

The SparseFactor(_:_:) function performs the actual Cholesky factorization, finding L such
that A = LLᵀ.
Objective-C
Create and factorize the matrix
Objective-C
Swift
Swift


## Page 3

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


## Page 4

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


