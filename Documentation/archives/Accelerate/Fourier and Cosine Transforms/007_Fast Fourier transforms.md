# 007_Fast Fourier transforms.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


