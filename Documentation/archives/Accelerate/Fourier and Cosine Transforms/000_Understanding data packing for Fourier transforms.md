# 000_Understanding data packing for Fourier transforms.pdf

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


