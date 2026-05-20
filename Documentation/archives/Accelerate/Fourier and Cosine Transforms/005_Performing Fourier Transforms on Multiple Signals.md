# 005_Performing Fourier Transforms on Multiple Signals.pdf

## Page 1

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


## Page 2

The vDSP multiple-signal FFT functions accept multiple signals concatenated together. The
following code creates a single 1024 element array from four separate composite sine waves:
Perform FFT on Multiple Real Signals


## Page 3

The following image is a visualization of the values in signal:
The vDSP FFT and DFT functions work with data in split-complex format. Split-complex format
stores the real and imaginary parts of complex numbers in the corresponding elements of two
separate arrays.
Use the vDSP_ctoz function to convert the real values in the signal array to split-complex forma
The vDSP_ctoz function transforms the real values so that the real array contains even elements
and the imaginary array contains odd elements.


## Page 4

The vDSP_fftm_zrip function performs the FFT. Create a DSPSplitComplex structure that
acts as a mediatory between the real and imaginary arrays and the FFT function. The third
parameter to vDSP_fftm_zrip (the stride between the individual signals) is measured in compl
elements.
On return, complexReals and complexImaginaries contain the frequency-domain
representation of the four real signals. Call squareMagnitudes(_:result:) to compute the
energy at each frequency.


## Page 5

Use the magnitudes information to calculate the component frequencies of each of the four
signals. The offset of each nonzero magnitude represents the frequency, and the value represent
the energy.
A complex signal contains two real signals, one in the real parts and one in the imaginary parts. Th
following code creates two 1024-element arrays that contain the real and imaginary parts of four
256-element complex signals:
Perform FFT on Multiple Complex Signals


## Page 6

The following image is a visualization of the values in realSignal as a solid line and the values i
imaginarySignal as a dashed line:


## Page 7

The vDSP_fftm_zip function performs the FFT in-place on the real and imaginary arrays.
On return, realSignal and imaginarySignal contain the frequency-domain representation o
the four complex signals. Call squareMagnitudes(_:result:) to compute the energy at eac
frequency.


## Page 8

Use the magnitudes information to calculate the component frequencies of each of the four
signals. The offset of each nonzero magnitude represents the frequency, and the value represent
the energy.
See Also


## Page 9

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


