# Signal Processing Essentials.pdf

## Page 1

Many functions in vDSP provide support for specifying a stride (that is, the distance between the
elements that functions read from or write to) for a particular vector. For example, if you want to
access consecutive elements, use a stride of 1 (referred to as a unit stride). If you want to access
every third element, for example to work with the red channel in interleaved RGB data, use a strid
of 3. If you want to access every second element, for example to work with a single audio channe
in interleaved stereo audio data, use a stride of 2.
Typically, you use a unit stride. Use other strides to, for example, operate along a column of a
matrix, where the stride is the number of elements per row.
For most of the functions in vDSP, you obtain the best performance when the stride is 1. Any othe
stride value generally prevents the use of vectorized code, and reduces both performance and
energy efficiency.
The major exception to this limitation is in functions that support the use of interleaved complex
data, such as vDSP_ctoz and vDSP_ztoc. In these cases, use a stride of 2.
The code below calls the vDSP_vadd function to add each element in array a to the correspondin
element in array b, and write the result to array c. Note that the stride used for each array is 1.
Overview
Use a unit stride for the best performance and energy
efficiency
Set the stride for each vector independently
Accelerate / Controlling vDSP operations with stride
Article
Controlling vDSP operations with stride
Operate selectively on the elements of a vector at regular intervals.


## Page 2

In this example, the result is [11.0, 22.0, 33.0, 44.0, 55.0, 66.0, 77.0, 88.0].
A nonunit stride allows you to, for example, access a particular color channel in interleaved RGB
data. If you change strideB to 3, the operation adds the first, fourth, and seventh items in array 
to the first, second, and third items in array a.
Use a nonunit stride on inputs


## Page 3

Note that vDSP operations always read n elements. Therefore, your collections require at least ((
- 1) * stride) + 1 elements.
If you change array c’s stride to 3, the calculation writes the result to its first, fourth, and seventh
items. Using the example of interleaved RGB data discussed in Controlling vDSP operations with
stride, this approach would write the result of an operation to the red channel. The example below
defines the stride for the input array, a, as 2, so the operation uses the first, third, and fifth
elements:
Use a negative stride to access a vector in reverse order, for example, define the stride as −1 whe
convolving with a filter using vDSP_conv).
To use a negative stride, pass the vDSP_vadd function a pointer to the address of the last eleme
in the array. The example below shows the Swift code required to reverse the elements in array a:
Use a nonunit stride on output
Use a negative stride


## Page 4

The result of adding a and b with a stride of -1 for a is [81.0, 72.0, 63.0, 54.0, 45.0,
36.0, 27.0, 18.0]:
With interleaved complex data, vDSP stores alternating real and imaginary components
consecutively. Use a stride of 2 for interleaved complex data, counting the individual component
elements rather than counting complex numbers.
For example, use the code below to copy the contents of a DSPSplitComplex structure to an
array of DSPComplex values:
Controlling vDSP operations with strides


## Page 5

On return, complex contains the pairs [10.0 1.0], [20.0 2.0], [30.0 3.0] ... [80
.0 8.0].
Conversely, use the example below to copy the values of an array of DSPComplex values to a
DSPSplitComplex structure:
Using linear interpolation to construct new data points
Fill the gaps in arrays of numerical data using linear interpolation.
Using vDSP for vector-based arithmetic
Increase the performance of common mathematical tasks with vDSP vector-vector and
vector-scalar operations.
Resampling a signal with decimation
Reduce the sample rate of a signal by specifying a decimation factor and applying a custom
antialiasing filter.
See Also
Signal Processing Essentials


## Page 6

vDSP
Perform basic arithmetic operations and common digital signal processing (DSP) routines on
large vectors.


## Page 7

Linear interpolation is a method of calculating intermediate data between known values by
conceptually drawing a straight line between two adjacent known values. An interpolated value is
any point along that line. You use linear interpolation to, for example, draw graphs or animate
between keyframes. The following figure shows an example interpolated value between two point
vDSP provides the following functions to linearly interpolate between the elements in an array:
The single-precision function linearInterpolate(values:atIndices:) and the double
precision function linearInterpolate(values:atIndices:) that provide a simple
interface for generating interpolated data. These functions wrap vDSP_vgenp and vDSP
_vgenpD, respectively.
Overview
Accelerate / Using linear interpolation to construct new data points
Article
Using linear interpolation to construct new
data points
Fill the gaps in arrays of numerical data using linear interpolation.


## Page 8

The single-precision function linearInterpolate(elementsOf:using:) and the double
precision function linearInterpolate(elementsOf:using:) that provide fine control
over the interpolation. These functions wrap vDSP_vlint and vDSP_vlintD, respectively.
This article discusses using these functions to draw a continuous line graph based on a set of
discrete data points.
In this example, the code interpolates the data that the values and indices arrays represent.
Each array consists of 10 elements. A pair of corresponding elements in the two arrays defines a
single point in the diagram as follows:
Elements in the values array denote the vertical position.
Elements in the indices array denote the horizontal position.
The following code defines count as the number of elements in the interpolation result:
Create the data
Define the constant that represents the number of
elements


## Page 9

The linearInterpolate(values:atIndices:) function accepts the values and indice
arrays and returns the interpolation result.
On return, result contains the interpolated values. The following graph shows the values in
result as a line between the known values that the values and indices arrays describe:
The linearInterpolate(elementsOf:using:) function requires a control vector array tha
includes fractional parts. The fractional parts define the interpolation between the pair of values i
the values array, starting at the index that the integer part defines.
Use ramp(in:count:) to generate a linear ramp from 0 to the number of elements in values,
minus 1. Note that the ramp(in:count:) function wraps vDSP_vgen.
On return, control contains the following:
Generate a vector by interpolation
Interpolate with fine control


## Page 10

        [0] Float 0.0000
        [1] Float 0.0087
        [2] Float 0.0175
        ...
        [1021] Float 8.9824
        [1022] Float 8.9912
        [1023] Float 9.0000
The following figure shows a visualization of the values in control, with small circles indicating
each integer index:
The following code passes the control values to linearInterpolate(elementsOf:using:)
to calculate the interpolated values:
On return, result contains the interpolated values. The graph below shows the values in resul
as a line between the known values that the values and indices arrays describe:


## Page 11

The result of linearInterpolate(elementsOf:using:) is equal to the result of linear
Interpolate(values:atIndices:).
You can change the way that you generate the control array to alter the interpolated result. For
example, you may want to add smoothing between the segments of a line graph or add easing to
an animation. The following code uses simd_smoothstep(_:_:_:) to smooth the fractional
parts of control near the increments to the integer parts:
The following graph shows a visualization of the values in control, with small circles indicating
each integer index:
Add smoothing to the interpolation result


## Page 12

Using the same call to linearInterpolate(elementsOf:using:) as above, the result, as
shown below, shows a smoother transition between the known values.
Controlling vDSP operations with stride
Operate selectively on the elements of a vector at regular intervals.
Using vDSP for vector-based arithmetic
See Also
Signal Processing Essentials


## Page 13

Increase the performance of common mathematical tasks with vDSP vector-vector and
vector-scalar operations.
Resampling a signal with decimation
Reduce the sample rate of a signal by specifying a decimation factor and applying a custom
antialiasing filter.
vDSP
Perform basic arithmetic operations and common digital signal processing (DSP) routines on
large vectors.


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

vDSP
Perform basic arithmetic operations and common digital signal processing (DSP) routines on
large vectors.


## Page 18

vDSP provides functions for decimating a signal. A decimated signal has a lower sample rate
compared to its original. Decimation can be advantageous when, for example, you are transmittin
a signal, creating a visual representation of a large dataset, or reducing the memory overhead wh
processing data.
In the following pair of images, the original signal on the left contains 1024 samples. After
decimation by a factor of two, the result on the right contains 512 samples.
The following code creates an array and populates it with a composite sine wave:
The following image shows a visualization of the values in inputSignal:
Overview
Create the input signal
Accelerate / Resampling a signal with decimation
Article
Resampling a signal with decimation
Reduce the sample rate of a signal by specifying a decimation factor and applying
a custom antialiasing filter.


## Page 19

vDSP provides the single-precision function downsample(_:decimationFactor:filter:)
and the double-precision function downsample(_:decimationFactor:filter:) to decima
the elements in an array. These function wrap vDSP_desamp and vDSP_desampD, respectively.
The vDSP decimation functions accept a filter that controls how adjacent samples combine. Each
decimated value is the sum of the combined original values multiplied by the corresponding filter
value.
The following code creates a filter that contains [0.5, 0.5]:
The resulting filter averages pairs of adjacent values in the original signal.
For the most complete result, set the filter length to the same value as the decimation factor, whic
indicates how much the original signal is decimated. For example, consider an input signal
containing 18 values.
The following images visualize the original and decimated signals and illustrate the effects of
different antialiasing filters. The graph below visualizes the signal.
Define the antialiasing filter


## Page 20

A filter that contains a single value [1.0] combined with a decimation factor of 2 will sample only
the even values of the original signal. The decimation functions return a result that misses the
second 50 at position 13, as shown below.
However, a filter with two values, [0.5, 0.5] considers all values in the original signal, as
illustrated below.
The downsample(_:decimationFactor:filter:) function performs the decimation.
Perform the Decimation


## Page 21

On return, outputSignal contains the result.
Controlling vDSP operations with stride
Operate selectively on the elements of a vector at regular intervals.
Using linear interpolation to construct new data points
Fill the gaps in arrays of numerical data using linear interpolation.
Using vDSP for vector-based arithmetic
Increase the performance of common mathematical tasks with vDSP vector-vector and
vector-scalar operations.
vDSP
Perform basic arithmetic operations and common digital signal processing (DSP) routines on
large vectors.
See Also
Signal Processing Essentials


## Page 22



## Page 23

The vDSP library contains a collection of highly optimized functions for DSP, type conversion, and
general purpose arithmetic on large collections. The library includes DSP operations such as
convolution and correlation, Fourier transformation, and biquadratic filtering. For arithmetic on
large collections, vDSP includes functions such as multiply-add and reduction functions including
sum, mean, and maximum.
The following sequence of images illustrates an example of the vDSP library’s capabilities. The v
DSP_vtmerg function combines two waveforms to produce a vector to create a smooth transitio
between two signals.
Note
Unless otherwise mentioned, vDSP functions with the same input and output sizes (in bytes)
work in-place.
Overview
Accelerate / vDSP
API Collection
vDSP
Perform basic arithmetic operations and common digital signal processing (DSP)
routines on large vectors.


## Page 24

The majority of vDSP operations are single-threaded and run on a single core. However, the
following functions may be multithreaded depending on the size of the data they’re operating on:
vDSP_mmul
vDSP_mmulD
vDSP_zmma
vDSP_zmmaD
vDSP_zmms
vDSP_zmmsD
vDSP_zmmul
vDSP_zmmulD
vDSP_zmsm
vDSP_zmsmD
Controlling vDSP operations with stride
Operate selectively on the elements of a vector at regular intervals.
Using vDSP for vector-based arithmetic
Increase the performance of common mathematical tasks with vDSP vector-vector and
vector-scalar operations.
enum vDSP
An enumeration that acts as a namespace for Swift overlays to vDSP.
vDSP Protocols
Protocols that support Swift implementations of vDSP operations.
Vector generation
Topics
Fundamentals
Swift overlay
Vector generation, filling, and clearing


## Page 25

Populate vectors with ramps, values from lookup tables, interpolated values, and window
functions.
Vector clear and fill functions
Populate vectors with zeros or a scalar value.
Vector extrema calculation
Calculate the minimum and maximum values in a vector.
Vector average calculation
Calculate the average value in a vector.
Vector summation
Sum the values in a vector.
Vector distance and Pythagorean computation
Calculate distance and hypotenuse of vectors.
Dot product calculation
Calculate the scalar product of two vectors.
Perform basic arithmetic operations on vectors that contain real and complex values.
Arithmetic operations
Perform operations on large vectors.
Vector-scalar real arithmetic functions
Perform element-wise operations on combinations of vectors of real values and scalar value
Vector-vector real arithmetic functions
Perform element-wise operations on vectors of real values.
Vector reduction
Vector geometry functions
Element-wise vector arithmetic
Vector-scalar arithmetic
Vector-vector arithmetic


## Page 26

Complex basic arithmetic
Perform elementwise operations on vectors of complex values.
Integer arithmetic
Perform elementwise operations on vectors of integer values.
Linear averaging functions
Calculate the element-wise linear average of two vectors.
Polynomial evaluation
Evaluate polynomials using coefficients and independent variables that you supply.
Compression and gathering functions
Compress vectors based on the nonzero elements in a gating vector, or gather vectors base
on a separate vector that contains indices.
Copying, element swapping, and merging functions
Copy, swap, and merge the elements of two vectors.
Reversing and sorting functions
Perform in-place reverse and sort operations on a vector.
Linear interpolation functions
Compute the linear average between two vectors or between the neighboring elements in on
vector.
Quadratic interpolation functions
Compute the quadratic interpolation between the neighboring elements in a vector.
Biquadratic IIR filters
Apply biquadratic filters to single-channel and multichannel data.
Single-channel biquadratic filters
Filter a single-channel signal with a cascade of biquadratic sections.
Vector operations
Vector interpolation
Vector filtering


## Page 27

Multichannel biquadratic filters
Filter a multichannel signal with a cascade of biquadratic sections.
Finite impulse response filters
Perform finite impulse response filtering with decimation and antialiasing on vectors of real o
complex values.
Recursive filters
Perform two-pole two-zero recursive filtering on a vector.
Conversion to decibel equivalents
Convert vectors that contain power or amplitude data to decibels.
Type conversion
Perform element-wise floating-point to integer and integer to floating-point conversion.
Complex vector conversion
Perform element-wise split-complex to interleaved and interleaved to split-complex
conversion.
Polar-rectangular conversion
Convert each element of a vector between radius-angle and Cartesian pairs.
Absolute and negation functions
Compute the absolute or negated value of each element in a vector.
Integration functions
Compute the running sum, Simpson, or trapezoidal integration of a vector.
Clipping, limit, and threshold operations
Apply clipping, limit, or threshold rules to the elements in a vector.
Normalization functions
Compute the mean and standard deviation of a vector and calculate new elements to have a
zero mean and a unit standard deviation.
Phase computation functions
Calculate the element-wise phase values, in radians, of a complex vector.
Vector conversion functions
Single-vector arithmetic functions


## Page 28

Complex conjugation functions
Calculate the complex conjugate of the elements in a vector.
Vector squaring functions
Compute the square, signed square, or squared magnitude of the elements in a vector.
Fractional part extraction
Truncate the elements of a vector to a fraction.
Zero crossing search
Count and find the zero crossings in a vector.
Sliding-window reduction functions
Calculate maximum values and sums of values in a sliding window.
Autospectrum computation
Compute the element-wise sum of the squares of the real and imaginary parts of a complex
vector.
Cross-spectrum computation
Compute the element-wise product of a vector and the conjugate of a second vector.
Coherence function computation
Compute the coherence of two vectors.
Vector-to-vector minima and maxima
Compute the element-wise minimum or maximum values or magnitudes in a vector.
Extrema finding functions
Extract the values from a vector that fall outside a range.
Multiplication
Multiply vectors that contain real or complex values.
Single-vector sliding-window operations
Vector-to-vector spectra and coherence computation
Vector-to-vector extrema functions
Matrix operations


## Page 29

Transposition
Tranpose vectors that contain real values.
Matrix and submatrix copying functions
Copy the contents of a submatrix to another submatrix.
1D correlation and convolution
Use correlation to compare and convolution to combine vectors of real or complex data.
2D convolution
Perform convolution operations on matrices of real data.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.
typealias vDSP_Length
An unsigned-integer value that represents the size of vectors and the indices of elements in
vectors.
typealias vDSP_Stride
An integer value that represents the differences between indices of elements, including the
lengths of strides.
struct DSPComplex
A structure that represents a single-precision complex value.
typealias COMPLEX_SPLIT
Vector and matrix correlation and convolution
Vector and matrix Fourier transforms
Data types


## Page 30

struct DSPDoubleComplex
A structure that represents a double-precision complex value.
typealias DOUBLE_COMPLEX_SPLIT
struct DSPSplitComplex
A structure that represents a single-precision complex vector with the real and imaginary
parts stored in separate arrays.
struct DSPDoubleSplitComplex
A structure that represents a double-precision complex vector with the real and imaginary
parts stored in separate arrays.
struct VectorizableDouble
A structure that represents a double-precision real value for biquadratic filtering and discrete
Fourier transforms.
struct VectorizableFloat
A structure that represents a single-precision real value for biquadratic filtering and discrete
Fourier transforms.
vDSP Compile-Time Version Information
The version of vDSP at compile time.
Controlling vDSP operations with stride
Operate selectively on the elements of a vector at regular intervals.
Using linear interpolation to construct new data points
Fill the gaps in arrays of numerical data using linear interpolation.
Using vDSP for vector-based arithmetic
Increase the performance of common mathematical tasks with vDSP vector-vector and
vector-scalar operations.
Constants
See Also
Signal Processing Essentials


## Page 31

Resampling a signal with decimation
Reduce the sample rate of a signal by specifying a decimation factor and applying a custom
antialiasing filter.


