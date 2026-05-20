# 001_Finding the component frequencies in a composite sine wave.pdf

## Page 1

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


## Page 2

Create an array that contains frequency-amplitude tuples. You define the frequencies as the
number of cycles per n. The highest measurable frequency, known as the Nyquist frequency, is th
element with index n/2, which is 1023 in a zero-based array that contains 2048 elements.
The code below creates the array, signal, that contains four component sine waves:
The image below is a visualization of composite sine waves in signal:
Create the composite signal


## Page 3

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


## Page 4

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


## Page 5

On return, forwardOutputReal contains the real parts of the forward FFT, and forwardOutpu
Imag contains the imaginary parts of the frequency-domain representation of the original signal.
Use the vDSP_zaspec function to compute the autospectrum of the frequency-domain data in t
forwardOutputReal and forwardOutputImag arrays. The autospectrum is the sum of
squares of the complex and real parts of each complex frequency-domain element. The code
below computes the autospectrum:
Compute component frequencies in the frequency-domain
data


## Page 6

The autospectrum of the forward FFT contains a series of high-magnitude items, rendered as
vertical lines in the graph below:
The autospectrum values correspond to the frequencies and amplitudes you specified in the
frequencies array. The code below scales the amplitudes to consider the autospectrum
calculation and the inverse-transform step. To learn more about scaling time- and frequency-
domain data, see Understanding data packing for Fourier transforms.


## Page 7

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


## Page 8

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


## Page 9

Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


