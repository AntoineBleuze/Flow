# 003_Resampling a signal with decimation.pdf

## Page 1

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


## Page 2

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


## Page 3

A filter that contains a single value [1.0] combined with a decimation factor of 2 will sample only
the even values of the original signal. The decimation functions return a result that misses the
second 50 at position 13, as shown below.
However, a filter with two values, [0.5, 0.5] considers all values in the original signal, as
illustrated below.
The downsample(_:decimationFactor:filter:) function performs the decimation.
Perform the Decimation


## Page 4

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


## Page 5



