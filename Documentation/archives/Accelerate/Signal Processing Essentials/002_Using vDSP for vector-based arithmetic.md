# 002_Using vDSP for vector-based arithmetic.pdf

## Page 1

vDSP provides a suite of general-purpose, high-performance arithmetic functions that are
alternatives to for loops and map when applying operations on collections of floating-point value
For example, the code below multiplies the element-wise sum of two arrays by a scalar value:
The vDSP version of the same operation runs significantly faster.
Overview
Accelerate / Using vDSP for vector-based arithmetic
Article
Using vDSP for vector-based arithmetic
Increase the performance of common mathematical tasks with vDSP vector-vect
and vector-scalar operations.


## Page 2

Many vDSP functions have a variant that returns the result.
The following table summarizes the basic arithmetic functions available in vDSP. All functions are
available in single- and double-precision variants.
In the Operation column, a subscript (for example, a[i]) indicates a vector, and no subscript (for
example, a) indicates a scalar value.
Operation
Function
c[i] = a[i] + b
add(_:_:)
c[i] = a[i] + b[i]
add(_:_:)
c[i] = a[i] - b[i]
subtract(_:_:)
c[i] = a[i] * b
multiply(_:_:)
c[i] = a[i] * b[i]
multiply(_:_:)
c[i] = a[i] / b
divide(_:_:)
c[i] = a / b[i]
divide(_:_:)
o0[i] = i1[i] + i0[i]
o1[i] = i1[i] - i0[i]
addSubtract(_:_:addResult:subtract
Result:)
c[i] = a[i] / b[i]
divide(_:_:)
d[i] = (a[i] + b[i]) * c
multiply(addition:_:)
Available arithmetic functions


## Page 3

Operation
Function
d[i] = (a[i] + b[i]) * c[i]
multiply(addition:_:)
d[i] = (a[i] - b[i]) * c
multiply(subtraction:_:)
d[i] = (a[i] - b[i]) * c[i]
multiply(subtraction:_:)
d[i] = (a[i] * b[i]) + c
add(multiplication:_:)
d[i] = (a[i] * b) + c[i]
add(multiplication:_:)
d[i] = (a[i] * b[i]) + c[i]
add(multiplication:_:)
d[i] = (a[i] * b[i]) - c[i]
subtract(multiplication:_:)
e[i] = (a[i] * b) + (c[i] * d)
add(multiplication:multiplication:)
e[i] = (a[i] + b[i]) * (c[i] +
d[i])
multiply(addition:addition:)
e[i] = (a[i] * b[i]) - (c[i] *
d[i])
subtract(multiplication:
multiplication:)
e[i] = (a[i] - b[i]) * (c[i] -
d[i])
multiply(subtraction:subtraction:)
e[i] = (a[i] + b[i]) * (c[i] -
d[i])
multiply(addition:subtraction:)
Controlling vDSP operations with stride
Operate selectively on the elements of a vector at regular intervals.
Using linear interpolation to construct new data points
Fill the gaps in arrays of numerical data using linear interpolation.
Resampling a signal with decimation
Reduce the sample rate of a signal by specifying a decimation factor and applying a custom
antialiasing filter.
See Also
Signal Processing Essentials


## Page 4

vDSP
Perform basic arithmetic operations and common digital signal processing (DSP) routines on
large vectors.


