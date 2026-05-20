# Fourier and Cosine Transforms.pdf

## Page 1

The vDSP real-to-complex fast Fourier transform (FFT) and discrete Fourier transform (DFT)
functions write their output in a special packed format to conserve memory. Use the code sample
below to understand how to format source data for and interpret the results from the vDSP Fourie
transform functions.
The vDSP FFT and DFT functions work with data in split-complex format. Split-complex format
separates the real and imaginary parts of complex numbers into two separate arrays. Given an
array, signal, that contains real values, the following code converts the values to split-complex
format. Use vDSP_ctoz to populate the split collections complexReals and complex
Imaginaries with the real values from signal:
Overview
Convert real values to the split-complex format
Accelerate / Understanding data packing for Fourier transforms
Article
Understanding data packing for Fourier
transforms
Format source data for the vDSP Fourier functions, and interpret the results.


## Page 2

On return, complexReals contains the values [0.0, 2.0, 4.0, 6.0], and complex
Imaginaries contains the values [1.0, 3.0, 5.0, 7.0]. The diagram below illustrates how
vDSP_ctoz converts the real values to the even-odd split configuration:
Use the following function to fill an array with values that represent a composite sine wave:
Create a composite sine wave


## Page 3

The following figure visualizes the values of a 1024-element array that makeCompositeSine
Wave() returns with the frequency-amplitude pairs [(f: 2, a: 1.5), (f: 8, a: 1.0)]:
Use the following code to populate the real signal array with a composite of four sine waves and
create empty arrays for the complex values:
Perform Fourier transform on 1D real data in split-complex
format


## Page 4

Use vDSP_fft_zrip to perform an in-place fast Fourier transform (FFT) on the real values. In th
example, the vDSP_ctoz function uses a DSPSplitComplex structure as an intermediary to
populate the complexReals and complexImaginaries arrays:
Alternatively, use vDSP_DFT_zrop_CreateSetup to create an object that performs a discrete
Fourier transform on the real values:


## Page 5

The result of a forward Fourier transform on n real values is n complex values. The list below
describes how the vDSP library structures the result:
Complex element 0 contains the DC component (equal to the sum of the time domain values) i
its real part and zero in its imaginary part.
Complex elements 1 through n/2 - 1 contain the complex frequency-domain values.
Complex element n/2 contains the Nyquist component (the cosine component coefficient at t
Nyquist frequency) in its real part and zero in its imaginary part.
The remaining complex elements contain the complex conjugates of the complex frequency-
domain values.
vDSP exploits the zeros in the DC and Nyquist elements and the symmetry of the complex
conjugates. The Fourier transform routines represent the frequency-domain data in n/2 complex
values. They achieve this by placing the real Nyquist component in the imaginary part of the DC
element and omitting the complex conjugates:


## Page 6

The following figure illustrates the frequency-domain result from performing a forward transform
on the signal data that contains the four composite sine waves:
The indices of the nonzero elements in the frequency-domain data are the sine wave frequencies
the original time-domain signal: 1 , 5, 10, and 15.
Given an array, interleavedComplex, that contains interleaved complex values, the following
code converts the values to split-complex format. Use vDSP_ctoz to populate the split collectio
complexReals and complexImaginaries with the complex values from interleaved
Complex:
Convert interleaved-complex to the split-complex format


## Page 7

On return, complexReals contains the values [0.0, 2.0, 4.0, 6.0], and complex
Imaginaries contains the values [1.0, 3.0, 5.0, 7.0]. The following diagram illustrates
how vDSP_ctoz(_:_:_:_:_:) converts the interleaved values to the even-odd split
configuration:
The following figure shows a representation of time-domain complex data. The real part and
imaginary part contain distinct composite sine waves:
Perform Fourier transform on 1D complex data


## Page 8

Use vDSP_DFT_zop_CreateSetup to create a DFT object for a complex transform, or call vDS
_fft_zip to perform a complex FFT in place. The following code creates a complex signal and
performs a forward DFT:


## Page 9

On return, complexReals and complexImaginaries contain the following values:
The indices of the nonzero magnitudes indicate the component frequencies 3, 4, 5, and 7.
The following figure shows the layout of the frequency-domain data. The DC and Nyquist
components contain real and imaginary parts. The elements 0 to n/2 -1 contain the positive-
frequency values, and the elements n/2 + 1 to n - 1 contain the negative-frequency values.
vDSP provides routines you can use to compute the FFT of 2D real data such as single-channel
images. The following figure shows the original, spatial-domain representations of grids of dots
with their frequency-domain counterparts:
Perform Fourier transform on 2D real data


## Page 10

Use vDSP_ctoz to convert real spatial-domain values like pixel intensities to complex values. The
real part of each complex value contains the even pixel values, and the imaginary part of each
complex value contains the odd pixel values. The following code defines the width and height of
the matrix of complex values for a 512 x 512 real matrix:
Use vDSP_fft2d_zrip to perform the forward FFT in place. In this example, imageData is an
array that contains realDimension * realDimension real pixel values:


## Page 11

The 2D FFT operates on real data by first transforming each row. This transform generates real
values — the DC and Nyquist component of each row — in the first two elements of each row. The
second pass of the transform computes the FFT for each column. The first two columns contain
real values, and vDSP uses the real transform routines. Subsequent columns contain complex
values, and vDSP uses the complex transform routines:
Because the complex elements n/2 + 1 to n - 1 contain the negative-frequency values, for tas
such as visualizing the frequency-domain representation of 2D real data, you may be able to
discard the bottom n/2 rows.
vDSP provides functions for performing Fourier transforms on 2D complex data, such as two-
channel images. The following image shows the spatial-domain representation of 2D complex dat
with low-frequency data in the red and green channels, and high-frequency data in the blue
channel. The frequency-domain representation shows the magnitude of the complex values:
Use vDSP_fft2d_zip to perform a complex FFT on 2D complex data:
Perform Fourier transform on 2D complex data


## Page 12

On return, complexReals and complexImaginaries contain the frequency-domain
representation of the complex data. Because both the horizontal pass and the vertical pass are
complex FFTs, the right n/2 columns and the bottom n/2 rows contain the negative frequencies:
To provide the best execution performance, vDSP’s Fourier routines don’t scale transform results
The following table summarizes the scaling factor for the vDSP FFT and DFT operations:
1D
2D
Real forward transform
2
2
Real inverse transform
Number of real elements
Number of real elements (rows x
columns)
Scale time- and frequency-domain data


## Page 13

1D
2D
Complex forward
transform
1
1
Complex inverse
transform
Number of complex
elements
Number of complex elements (rows x
columns)
For example, the following code performs a forward transform and an inverse transform on eight
real elements. The code multiplies the frequency-domain data by 1/2, and the time-domain data
by 1/n. The result is identical to the original data:


## Page 14

Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
See Also
Fourier and Cosine Transforms


## Page 15

Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 16

Accelerate’s vDSP module provides functions to perform 1D fast Fourier transforms (FFTs) on
vectors of data, such as audio signals. The example below shows an input signal (left) and its
frequency domain representation (right) after transforming the signal with a forward FFT.
You can inspect the frequency-domain data of a forward FFT to compute the individual sine wave
components of a composite wave. The technique described in this article is applicable to many
digital signal processing applications, for example, finding the dominant frequencies in a dual-ton
multi-frequency (DTMF) signal or removing noise from a signal.
The function below generates a composite sine wave from a supplied array of component
frequencies and amplitudes:
Overview
Synthesize a test signal
Accelerate / Finding the component frequencies in a composite sine wave
Article
Finding the component frequencies in a
composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.


## Page 17

Create an array that contains frequency-amplitude tuples. You define the frequencies as the
number of cycles per n. The highest measurable frequency, known as the Nyquist frequency, is th
element with index n/2, which is 1023 in a zero-based array that contains 2048 elements.
The code below creates the array, signal, that contains four component sine waves:
The image below is a visualization of composite sine waves in signal:
Create the composite signal


## Page 18

Create a setup object that contains a precalculated weights array of complex exponentials require
to perform the FFT operations. The values in the weights array simplify the FFT calculation.
Creating this setup object can be expensive, so do it only once, for example, when starting your
app. After creating the setup object, you can reuse it later.
The code below creates a setup object suitable for performing forward and inverse 1D FFTs on a
signal containing n elements:
You can use this setup object for similarly sized smaller FFTs. However, using a weights array buil
for an FFT that processes a large number of elements can degrade performance for an FFT that
processes a significantly smaller number of elements.
The FFT operates on complex numbers. That is, it operates on numbers that contain a real part an
an imaginary part. Create two arrays — one for the real parts and one for the imaginary parts — fo
Create the FFT setup
Create the source and destination arrays for the forward
FFT


## Page 19

the input and output to the FFT operation:
Because each complex value stores two real values, the length of each array is half that of signa
You use DSPSplitComplex structures to pass the separate real and imaginary arrays of the inp
and the output data to the FFT transform function.
The steps below perform the forward FFT:
1. Create a DSPSplitComplex structure to store a copy of signal that’s represented as
complex numbers.
2. Use convert(interleavedComplexVector:toSplitComplexVector:) to convert the
real values in signal to complex numbers. The conversion stores the even values in signal a
the real components in forwardInput, and the odd values in signal as the imaginary
components in forwardInput.
3. Create a DSPSplitComplex structure with pointers to forwardOutputReal and forward
OutputImag to receive the FFT result.
4. Perform the forward FFT.
The code below shows how to perform the forward FFT using the steps described above:
Perform the forward FFT


## Page 20

On return, forwardOutputReal contains the real parts of the forward FFT, and forwardOutpu
Imag contains the imaginary parts of the frequency-domain representation of the original signal.
Use the vDSP_zaspec function to compute the autospectrum of the frequency-domain data in t
forwardOutputReal and forwardOutputImag arrays. The autospectrum is the sum of
squares of the complex and real parts of each complex frequency-domain element. The code
below computes the autospectrum:
Compute component frequencies in the frequency-domain
data


## Page 21

The autospectrum of the forward FFT contains a series of high-magnitude items, rendered as
vertical lines in the graph below:
The autospectrum values correspond to the frequencies and amplitudes you specified in the
frequencies array. The code below scales the amplitudes to consider the autospectrum
calculation and the inverse-transform step. To learn more about scaling time- and frequency-
domain data, see Understanding data packing for Fourier transforms.


## Page 22

Use an inverse FFT to recreate a signal in the time domain, using the frequency-domain data
returned by the forward FFT.
The steps below perform the inverse FFT:
1. Create the source of the inverse FFT, with pointers to forwardOutputReal and forward
OutputImag.
2. Create a DSPSplitComplex structure to receive the FFT result.
3. Perform the inverse FFT.
4. Return an array of real values from the FFT result. Because the forward transform has a scaling
factor of 2 and the inverse transform has a scaling factor of the number of items, divide each
result by 2 * n:
Recreate the original signal


## Page 23

On return, recreatedSignal is approximately equal to signal.
Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
See Also
Fourier and Cosine Transforms


## Page 24

Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 25

In many cases, your code performs Fourier transforms on data that originates as interleaved-
complex values. An interleaved-complex representation stores the real and imaginary parts of
complex values together as collections of DSPComplex or DSPDoubleComplex structures. Man
Fourier-related routines in vDSP accept complex values in a split-complex representation that
stores real and imaginary parts as separate collections.
For example, the following shows a collection of four complex values in a single interleaved
collection:
The following shows the same four complex values as two collections in a split representation:
vDSP routines accept split-complex values either as DSPSplitComplex structures or as two
separate collections.
Overview
Convert interleaved values to split-complex format
Accelerate / Performing Fourier transforms on interleaved-complex data
Article
Performing Fourier transforms on
interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved
DFT routines.


## Page 26

Given an array signal that contains 32 interleaved-complex values, the following code performs
Fourier transform on the values. Use vDSP_ctoz to populate the split collections splitSignal
Real and splitSignalImag with the interleaved values from signal:
Use the vDSP function vDSP_DFT_zop_CreateSetup to create a setup object for complex-to-
complex DFTs. The execute function, vDSP_DFT_Execute, automatically switches to a fast
Fourier transform (FFT) when the specified count supports the FFT algorithm.
Perform a Fourier transform on split data


## Page 27

On return,splitOutputReal and splitOutputImag contain the split format frequency-doma
representation of the values in signal. Use indexOfMaximum(_:) to find the dominant
frequency.
Use vDSP_ztoc to convert the split result to the interleaved format.
On return, dftOutputInterleaved contains the DFT result in the interleaved format.
vDSP provides routines for DFTs directly on interleaved data. Use these functions instead of using
vDSP_ctoz and vDSP_ztoc to convert between interleaved and split formats.
Convert split-complex values to interleaved format
Perform a Fourier transform directly on interleaved data


## Page 28

The following code performs the transform from the Performing Fourier transforms on interleaved
complex data section directly on the interleaved data:
On return, interleavedOutput contains the FFT result in the interleaved format.
Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
See Also
Fourier and Cosine Transforms


## Page 29

Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 30

Discrete Fourier and cosine transforms, which decompose a signal into its component frequencie
and recreate a signal from a component frequency representation, work over vectors of specific
lengths. For example, if you’re analyzing audio data, the data might be represented as pages of
1024 samples. Discrete Fourier and cosine transforms can accurately approximate the componen
frequencies that have an integer number of periods — that is, signals where the start and end
points join to form a continuous waveform.
However, with noninteger period signals, where the endpoints don’t meet, the discontinuities
appear as false frequency components in a forward transform. This smearing of data is called
spectral leakage.
You can use an approach called windowing to reduce spectral leakage when performing transform
over data that includes noninteger period signals. Windowing multiplies a signal by a vector that
represents a smooth curve with boundary values of zero or near zero. This technique ensures tha
the endpoints of a signal meet and reduces the discontinuities.
The code examples in this article synthesize the signal data from a series of sine waves. In a real-
world app, you’ll most likely acquire signal data from a sensor such as a microphone.
Use the synthesizeSignal function to generate a composite sine wave from a supplied array 
component frequencies and amplitudes:
Overview
Synthesize a test signal
Accelerate / Reducing spectral leakage with windowing
Article
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms wit
noninteger period signals.


## Page 31

Using the code below, generate a Fourier series approximation of a square wave that’s built from 
series of sine waves. Each component sine wave has an integer number of periods over the length
of the data.
Use the vDSP fast Fourier transform (FFT), like in the example below, to compute the component
frequencies of signal:
Create a signal with an integer number of periods


## Page 32

To learn more about computing the frequency components of a signal, see Finding the componen
frequencies in a composite sine wave.
The FFT treats the data set as a single period of a continuous signal. The visualization below wrap
the signal around a virtual cylinder to illustrate how the FFT interprets the data. This figure also
shows that the endpoints meet:
The illustration below shows a representation of the original signal in blue, and the imaginary part
of the frequency-domain data in yellow:


## Page 33

Note
The visualizations of the frequency-domain data in this article are transformed to improve
visibility. Each visualization is actually the square root of the absolute value of each element of
imagParts.
The FFT result shows that the signal is composed of 25 sine waves, represented as spikes in the
graph.
Use the code below to define a series of sine waves with noninteger periods:
The visualization below wraps the noninteger-period signal around a virtual cylinder and shows th
endpoint discontinuities:
The image below shows the results of a transform of this data. The results shows additional,
intermediate values that are the result of spectral leakage.
Create a signal with a noninteger number of periods


## Page 34

The code below shows the same noninteger period signal, but in this example, you multiply the
signal by the result of window(ofType:usingSequence:count:isHalfWindow:):
The illustration below shows the windowed signal in blue, with its boundaries tapered toward zero
and the transformed version with reduced spectral leakage in yellow:
Create a windowed signal with a noninteger number of
periods


## Page 35

vDSP provides functions for generating three different windows:
Hann
A great-general purpose window that reduces spectral leakage.
Hamming
Provides better discrimination of component sine waves with close frequencies.
Blackman
Reduces spectral leakage away from the main frequency compared to Hann and Hamming, b
has a wider main peak than Hann.
The image below provides a visual comparison of the different window sequence types:
To understand the different effects of the different windows provided by vDSP, create a signal
that’s composed of a signal sine wave with a noninteger period:
The illustration below shows the sine wave and the frequency-domain result:
Select a window sequence
Create a sine wave with a noninteger period


## Page 36

Spectral leakage is apparent throughout the rendered FFT result.
The illustration below shows the time- and frequency-domain representations of the noninteger
period sine wave with the Hann window applied:
Create a Hamming window by passing vDSP.WindowSequence.hamming to the window(of
Type:usingSequence:count:isHalfWindow:) function. Unlike the Hann window, the
Hamming window doesn’t reach zero at its boundaries.
The figure below shows the result of multiplying the signal by a Hamming window: high values
around the base frequency in the forward FFT are tighter than the Hann-windowed result, but
there’s low-level spectral leakage across the entire forward FFT:
Create a Blackman window by passing vDSP.WindowSequence.blackman to the window(of
Type:usingSequence:count:isHalfWindow:) function.
The illustration below shows the time- and frequency-domain representations of the noninteger
period sine wave with the Blackman window applied:
Reduce the spectral leakage by using a Hann window
Reduce the spectral leakage by using a Hamming window
Reduce the spectral leakage by using a Blackman window


## Page 37

Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.
See Also
Fourier and Cosine Transforms


## Page 38

Accelerate’s vDSP module provides functions to perform discrete and fast Fourier transforms
(FFTs) on 1D vectors and 2D matrices containing complex numbers. If you want to perform a simi
transform on a vector of real numbers, vDSP includes discrete cosine transforms (DCTs).
FFTs and DCTs decompose a signal into its frequency components (known as the frequency-
domain representation of the signal), and the inverse transform rebuilds a signal into its time-
domain representation from the frequency components.
By zeroing low-magnitude data, such as noise, from the frequency-domain data, you can
reconstruct a signal, leaving only its dominant frequencies. The meaningful signals that you’re
trying to isolate tend to have their energy packed at a few frequencies. Noise, however, has its
energy more uniformly spread across the frequency spectrum (that’s what makes it noise). If you
zero out low-magnitude frequency components, you can eliminate much of the noise from the
spectrum.
The noisySignal array contains the noisy signal from which the sample app extracts the
underlying signal. The underlying signal is a series of cosine waves that’s stored as 1024 samples
in an array of single-precision values.
The static SignalExtractor.generateSignal(noiseAmount:sampleCount:)
function generates a sample at each data point.
Overview
Generate the test signal
Accelerate / Signal extraction from noise
Sample Code
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 14.3+


## Page 39

When the noiseAmount parameter is zero, the values that this code generates return a signal lik
the one in the image below:
Adding noise to the signal makes it unrecognizable.


## Page 40

The sample app creates setup objects that contain all the information required to perform the
forward and inverse DCT operations. Because creating these setup objects can be expensive, the
sample app creates the DCT setup objects once and reuses them.
The forward transform is a type II DCT.
The inverse transform is a type III DCT.
The transform(_:) function performs the DCT. This function requires a source array that
contains the source signal and a destination array that the function overwrites with the frequency
domain data.
Prepare the DCT setups
Perform the DCT


## Page 41

The following visualization of the frequency-domain data shows the component cosine parts. The
cos(phase * 1) * 1.0 component is on the left, and cos(phase * 16) * 1.0 is on the
right:
The frequency-domain visualization of the noisy signal shows the dominant frequencies with the
noise spread evenly throughout the frequency range. The sample zeroes the low-magnitude data
to generate the noise-free signal.


## Page 42

Remove the noise from the signal by zeroing all values in the frequency-domain data that are belo
a specified threshold.
The threshold(_:to:with:result:) function sets all values in the frequency-domain array
that fall below the threshold to zero.
The inverse DCT generates a new signal using the cleaned-up frequency-domain data:
Apply a threshold to the frequency-domain data
Recreate the signal


## Page 43

The sample app scales the inverse DCT so that it matches the magnitude of the original signal. Th
scaling factor for the forward transform is 2, and the scaling factor for the inverse transform is the
number of samples (in this case, 1024). The divide(_:_:) function divides the inverse DCT
result by count / 2 to return a signal with the correct magnitude.
For more information on scaling factors for the vDSP FFT and DFT operations, see Understanding
data packing for Fourier transforms.
Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
See Also
Fourier and Cosine Transforms


## Page 44

Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 45

vDSP provides functions for performing fast Fourier transforms (FFTs) on multiple signals with a
single function call. Transforming multiple signals is suited to processing stereo audio data or dat
that’s aquired from multiple sources.
The examples in this article use the following function to create an array with values that represen
a composite sine wave:
Overview
Create a Composite Sine Wave
Accelerate / Performing Fourier Transforms on Multiple Signals
Article
Performing Fourier Transforms on Multiple
Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to
transform multiple signals with a single function call.


## Page 46

The vDSP multiple-signal FFT functions accept multiple signals concatenated together. The
following code creates a single 1024 element array from four separate composite sine waves:
Perform FFT on Multiple Real Signals


## Page 47

The following image is a visualization of the values in signal:
The vDSP FFT and DFT functions work with data in split-complex format. Split-complex format
stores the real and imaginary parts of complex numbers in the corresponding elements of two
separate arrays.
Use the vDSP_ctoz function to convert the real values in the signal array to split-complex forma
The vDSP_ctoz function transforms the real values so that the real array contains even elements
and the imaginary array contains odd elements.


## Page 48

The vDSP_fftm_zrip function performs the FFT. Create a DSPSplitComplex structure that
acts as a mediatory between the real and imaginary arrays and the FFT function. The third
parameter to vDSP_fftm_zrip (the stride between the individual signals) is measured in compl
elements.
On return, complexReals and complexImaginaries contain the frequency-domain
representation of the four real signals. Call squareMagnitudes(_:result:) to compute the
energy at each frequency.


## Page 49

Use the magnitudes information to calculate the component frequencies of each of the four
signals. The offset of each nonzero magnitude represents the frequency, and the value represent
the energy.
A complex signal contains two real signals, one in the real parts and one in the imaginary parts. Th
following code creates two 1024-element arrays that contain the real and imaginary parts of four
256-element complex signals:
Perform FFT on Multiple Complex Signals


## Page 50

The following image is a visualization of the values in realSignal as a solid line and the values i
imaginarySignal as a dashed line:


## Page 51

The vDSP_fftm_zip function performs the FFT in-place on the real and imaginary arrays.
On return, realSignal and imaginarySignal contain the frequency-domain representation o
the four complex signals. Call squareMagnitudes(_:result:) to compute the energy at eac
frequency.


## Page 52

Use the magnitudes information to calculate the component frequencies of each of the four
signals. The offset of each nonzero magnitude represents the frequency, and the value represent
the energy.
See Also


## Page 53

Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.
Fourier and Cosine Transforms


## Page 54

Accelerate’s vDSP module provides functions to perform 2D fast Fourier transforms (FFTs) on
matrices of data, such as images. You can exploit the amplitude peaks in the frequency domain o
periodic patterns, such as halftone screens, to reduce or remove such artifacts from images. The
example below shows an image with halftone artifacts (left) and the same image with the halftone
artifacts reduced (right):
Overview
Accelerate / Halftone descreening with 2D fast Fourier transform
Sample Code
Halftone descreening with 2D fast Fourier
transform
Reduce or remove periodic artifacts from images.
Download
macOS 13.0+
Xcode 14.0+


## Page 55

The sample app reduces halftone artifacts from a source image by first performing forward FFTs o
the image and a halftone screen sample. The following image shows the positive frequencies of th
halftone sample’s frequency-domain representation. For more information on performing Fourier
transforms on 2D data, see Understanding data packing for Fourier transforms.


## Page 56

The descreening operation zeroes frequency-domain values in the source image that correspond
to the bright peaks in the halftone sample’s frequency-domain values.
The vImage vImageBuffer_InitWithCGImage(_:_:_:_:_:) function converts the source
Core Graphics image to an array of single-precision values. The sample app creates its own
backing storage, pixelsStorage, rather than using vImageBuffer_Init(_:_:_:_:_:) to
ensure that the vImage buffer doesn’t contain any additional padding bytes.
Convert the image data to a split-complex vector


## Page 57

The vDSP_ctoz function converts the interleaved pixel values to split-complex format. The
function copies odd-numbered pixels to the real parts and the even-numbered pixels to the
imaginary parts of each complex value.
The sample app creates an FFT setup object that contains all the information required to perform
the forward and inverse 2D FFT operations. Creating this setup object can be expensive, so the
sample only performs this initialization once.
The following code creates a setup object suitable for performing forward and inverse 2D FFTs on
1024 x 1024 pixel image:
Rather than allocating and deallocating memory with each call to the descreening code, the samp
app declares several SplitComplex structures and an array that the descreening operation use
Create the FFT setup object
Prepare arrays for transformed image data


## Page 58

The transform(input:output:direction:) function performs a forward 2D FFT on the
image data, and creates the frequency-domain representation of the image.
The following code performs the FFT on the source image and the halftone sample data. After the
code completes the forward FFT of the halftone sample, the squareMagnitudes(_:result:)
function computes the magnitudes of the complex values representing the halftone sample:
The sample app reduces the halftone screen artifacts by manipulating the magnitude of the
frequency-domain data for the halftone sample.
The threshold(_:to:with:) function sets all magnitude values that are over the threshold to
-1, and all magnitude values that are less than or equal to the threshold to 1:
Perform forward 2D FFTs on the image data
Zero the peaks in the halftone sample magnitude


## Page 59

The clip(_:to:result:) function clips the values in the halftoneSampleAmplitude,
setting all of the high-magnitude values to 0.0, and all of the low-magnitude values to 1.0.
The app multiplies the frequency-domain data of the source image by the values in halftone
SampleAmplitude, thus removing or reducing the halftone screen.
The transform(input:output:direction:) function performs an inverse FFT on the
frequency-domain image data to generate the descreened spatial-domain image.
Finally, the app creates a displayable image from the spatial-domain representation of the treated
source image.
Descreen the source image
Perform an inverse 2D FFT on the frequency domain data
Generate an image from the split-complex vector


## Page 60

Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
See Also
Fourier and Cosine Transforms


## Page 61

Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 62

Tip
Where possible, use discrete Fourier transforms (DFTs) instead of fast Fourier transforms
(FFTs). DFTs provide a convenient API that offers greater flexibility over the number of
elements the routines transform. vDSP’s DFT routines switch to FFT wherever possible.
For more information about DFTs, see Discrete Fourier transforms.
Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Overview
Topics
Essentials
Accelerate / Fast Fourier transforms
API Collection
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to
the frequency domain, and vice versa.


## Page 63

Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
class FFT
A 1D single- and double-precision fast Fourier transform.
class FFT2D
A 2D single- and double-precision fast Fourier transform.
enum FourierTransformDirection
Fast Fourier transform directions.
enum Radix
Fast Fourier transform radices.
typealias FFTSetup
An opaque type that contains setup information for a single-precision FFT transform.
typealias FFTSetupD
An opaque type that contains setup information for a double-precision FFT transform.
typealias FFTRadix
The radix of the FFT decomposition.
In-Place Functions for 1D Real FFT
Perform fast Fourier transforms in place on 1D real data.
Out-of-Place Functions for 1D Real FFT
Perform fast Fourier transforms out of place on 1D real data.
In-Place Functions for 1D Multiple-Signal Real FFT
Perform fast Fourier transforms in place on multiple-signal 1D real data.
Objects that Simplify FFTs
FFT Setup
Functions for 1D Real FFT
Functions for 1D Multiple-Signal Real FFT


## Page 64

Out-of-Place Functions for 1D Multiple-Signal Real FFT
Perform fast Fourier transforms out of place on multiple-signal 1D real data.
In-Place Functions for 1D Complex FFT
Perform fast Fourier transforms in place on 1D complex data.
Out-of-Place Functions for 1D Complex FFT
Perform fast Fourier transforms out of place on 1D complex data.
In-Place Functions for 1D Multiple-Signal Complex FFT
Perform fast Fourier transforms in place on multiple-signal 1D complex data.
Out-of-Place Functions for 1D Multiple-Signal Complex FFT
Perform fast Fourier transforms out of place on multiple-signal 1D complex data.
In-Place Functions for 2D Real FFT
Perform fast Fourier transforms in place on 2D real data.
Out-of-Place Functions for 2D Real FFT
Perform fast Fourier transforms out of place on 2D real data.
In-Place Functions for 2D Complex FFT
Perform fast Fourier transforms in place on 2D complex data.
Out-of-Place Functions for 2D Complex FFT
Perform fast Fourier transforms out of place on 2D complex data.
typealias FFTDirection
Constants that specify whether to perform a forward or inverse FFT.
Functions for 1D Complex FFT
Functions for 1D Multiple-Signal Complex FFT
Functions for 2D Real FFT
Functions for 2D Complex FFT
Constants


## Page 65

var FFT_FORWARD: Int
Forward FFT.
var FFT_INVERSE: Int
Inverse FFT.
var FFT_RADIX2: Int
var FFT_RADIX3: Int
var FFT_RADIX5: Int
var kFFTDirection_Forward: Int
var kFFTDirection_Inverse: Int
var kFFTRadix2: Int
var kFFTRadix3: Int
var kFFTRadix5: Int
Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
See Also
Fourier and Cosine Transforms


## Page 66

Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 67

class DiscreteFourierTransform
An object that provides forward and inverse discrete Fourier transforms on single- or double
precision collections of interleaved or split-complex data.
enum DFTTransformType
Discrete Fourier transform types.
class DFT
A single- and double-precision discrete Fourier transform.
Deprecated
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
func vDSP_DFT_Interleaved_CreateSetup(vDSP_DFT_Interleaved_Setup?, vDSP
_Length, vDSP_DFT_Direction, vDSP_DFT_RealtoComplex) -> vDSP_DFT
_Interleaved_Setup?
Returns a setup structure that contains precalculated data for forward and inverse, single-
precision interleaved discrete Fourier transform (DFT) functions.
Topics
Objects that simplify discrete Fourier transforms
Interleaved discrete Fourier transform functions
Accelerate / Discrete Fourier transforms
API Collection
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequenc
domain, and vice versa.


## Page 68

func vDSP_DFT_Interleaved_CreateSetupD(vDSP_DFT_Interleaved_SetupD?, v
DSP_Length, vDSP_DFT_Direction, vDSP_DFT_RealtoComplex) -> vDSP_DFT
_Interleaved_SetupD?
Returns a setup structure that contains precalculated data for forward and inverse, double-
precision interleaved discrete Fourier transform (DFT) functions.
func vDSP_DFT_Interleaved_Execute(vDSP_DFT_Interleaved_Setup, Unsafe
Pointer<DSPComplex>, UnsafeMutablePointer<DSPComplex>)
Calculates the single-precision discrete Fourier transform (DFT) for a vector of interleaved
complex values.
func vDSP_DFT_Interleaved_ExecuteD(vDSP_DFT_Interleaved_SetupD, Unsafe
Pointer<DSPDoubleComplex>, UnsafeMutablePointer<DSPDoubleComplex>)
Calculates the double-precision discrete Fourier transform (DFT) for a vector of interleaved
complex values.
func vDSP_DFT_Interleaved_DestroySetup(vDSP_DFT_Interleaved_Setup?)
Releases a single-precision discrete Fourier transform (DFT) setup structure.
func vDSP_DFT_Interleaved_DestroySetupD(vDSP_DFT_Interleaved_SetupD?)
Releases a double-precision discrete Fourier transform (DFT) setup structure.
typealias vDSP_DFT_Interleaved_Setup
An opaque type that contains setup information for an interleaved single-precision discrete
Fourier transform (DFT).
typealias vDSP_DFT_Interleaved_SetupD
An opaque type that contains setup information for an interleaved double-precision discrete
Fourier transform (DFT).
typealias vDSP_DFT_Setup
An opaque type that contains setup information for a single-precision discrete Fourier
transform (DFT).
typealias vDSP_DFT_SetupD
An opaque type that contains setup information for a double-precision discrete Fourier
transform (DFT).
Data types
Constants


## Page 69

enum vDSP_DFT_Direction
An enumeration that specifies whether to perform a forward or inverse DFT.
enum vDSP_DFT_RealtoComplex
Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Cosine transforms
Enumerations
See Also
Fourier and Cosine Transforms


## Page 70

Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 71

Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Equalizing audio with discrete cosine transforms (DCTs)
Change the frequency response of an audio signal by manipulating frequency-domain data.
class DCT
A single-precision discrete cosine transform.
enum DCTTransformType
An enumeration that describes the discrete cosine transform types.
The functions in the Discrete Cosine Transforms (DCT) family calculate a discrete cosine transfor
of a specified length on a vector.
enum vDSP_DCT_Type
Constants that indicate the type for a discrete cosine transform.
Topics
First Steps
Objects that Simplify Discrete Cosine Transforms
Discrete Cosine Transforms
Accelerate / Discrete Cosine transforms
API Collection
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency
domain, and vice versa.


## Page 72

Understanding data packing for Fourier transforms
Format source data for the vDSP Fourier functions, and interpret the results.
Finding the component frequencies in a composite sine wave
Use 1D fast Fourier transform to compute the frequency components of a signal.
Performing Fourier transforms on interleaved-complex data
Optimize discrete Fourier transform (DFT) performance with the vDSP interleaved DFT
routines.
Reducing spectral leakage with windowing
Multiply signal data by window sequence values when performing transforms with nonintege
period signals.
Signal extraction from noise
Use Accelerate’s discrete cosine transform to remove noise from a signal.
Performing Fourier Transforms on Multiple Signals
Use Accelerate’s multiple-signal fast Fourier transform (FFT) functions to transform multiple
signals with a single function call.
Halftone descreening with 2D fast Fourier transform
Reduce or remove periodic artifacts from images.
Fast Fourier transforms
Transform vectors and matrices of temporal and spatial domain complex values to the
frequency domain, and vice versa.
Discrete Fourier transforms
Transform vectors of temporal and spatial domain complex values to the frequency domain,
and vice versa.
See Also
Fourier and Cosine Transforms


