# 002_Performing Fourier transforms on interleaved-complex data.pdf

## Page 1

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


## Page 2

Given an array signal that contains 32 interleaved-complex values, the following code performs
Fourier transform on the values. Use vDSP_ctoz to populate the split collections splitSignal
Real and splitSignalImag with the interleaved values from signal:
Use the vDSP function vDSP_DFT_zop_CreateSetup to create a setup object for complex-to-
complex DFTs. The execute function, vDSP_DFT_Execute, automatically switches to a fast
Fourier transform (FFT) when the specified count supports the FFT algorithm.
Perform a Fourier transform on split data


## Page 3

On return,splitOutputReal and splitOutputImag contain the split format frequency-doma
representation of the values in signal. Use indexOfMaximum(_:) to find the dominant
frequency.
Use vDSP_ztoc to convert the split result to the interleaved format.
On return, dftOutputInterleaved contains the DFT result in the interleaved format.
vDSP provides routines for DFTs directly on interleaved data. Use these functions instead of using
vDSP_ctoz and vDSP_ztoc to convert between interleaved and split formats.
Convert split-complex values to interleaved format
Perform a Fourier transform directly on interleaved data


## Page 4

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


## Page 5

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


