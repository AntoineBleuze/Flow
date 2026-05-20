# 002_Solving systems using iterative methods.pdf

## Page 1

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


## Page 2

Use the code below — which Creating sparse matrices covers in detail — to define the unsymmet
matrix A:
Create the matrix
Objective-C
Swift


## Page 3

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


## Page 4

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


