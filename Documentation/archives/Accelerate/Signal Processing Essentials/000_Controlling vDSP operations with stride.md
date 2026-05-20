# 000_Controlling vDSP operations with stride.pdf

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


