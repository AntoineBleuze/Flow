# 000_Creating sparse matrices.pdf

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


