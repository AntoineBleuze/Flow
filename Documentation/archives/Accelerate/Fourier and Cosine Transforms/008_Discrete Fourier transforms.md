# 008_Discrete Fourier transforms.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


