# 001_Applying biquadratic filters to a music loop.pdf

## Page 1

You can shape the output of an audio signal, such as by boosting or cutting the bass or treble of a
music track, with the single-channel and multichannel biquadratic filters that the vDSP library
provides.
The vDSP library defines a biquadratic filter from a set of five coefficients for each section. This
sample code app calculates those coefficients from a set of properties that it displays as controls
in the user interface. The user interface provides controls to select the filter type (such as low-pa
or high-pass), the center frequency of the filter, and the Q value that controls the width of the
filter’s frequency band.
The sample code app displays the magnitude response of the selected section, the magnitude
response of the entire filter, the frequency-domain representation of the input signal, and the
frequency-domain representation of the filtered, output signal.
Overview
Accelerate / Applying biquadratic filters to a music loop
Sample Code
Applying biquadratic filters to a music loop
Change the frequency response of an audio signal using a cascaded biquadratic
filter.
Download
macOS 13.0+
Xcode 14.3+


## Page 2

Before exploring the code, try building and running the app to familiarize yourself with the effect o
the different parameters on the music loop.
The biquadSectionCount constant defines the number of sections that the biquadratic filter
implements. The sample code app sets this to 3 by default.
The vDSP_biquad_CreateSetup function returns a new biquadratic filter structure that contai
biquadSectionCount sections. The sample code app defines the coefficients to produce a filt
that returns an output that’s identical to the input.
Initialize the biquadratic filter
Define the biquadratic coefficients


## Page 3

Five coefficients define each section of a biquadratic filter. The following formula describes the
underlying math of the biquadratic filter, with z referring to the complex frequency-domain
representation of the signal:
The sample code app includes the BiquadCoefficientCalculator structure that provides t
static BiquadCoefficientCalculator.coefficients(for:sampleRate:) function
This function returns the five coefficients for a filter type, center frequency, Q, and sample rate.
Each filter type uses the same shared values.
A switch statement calculates the coefficients for each filter type case. For example, the followi
code calculates the coefficients for a low-pass filter (that reduces high frequencies):
The vDSP_biquad_SetCoefficientsSingle function sets the coefficients for a section of th
biquadratic filter. The sample code app defines selectedSectionIndex as the index of the
currently selected section, and the BiquadCoefficientCalculator.Section
Coefficients structure provides an array variable that returns [b0, b1, b2, a1, a2].
Set the biquadratic coefficients


## Page 4

The vDSP_biquad function applies the biquadratic filter to a page of input samples and writes th
result to the outputSignal array. The delay array contains the past state for each section of t
biquadratic filter.
On return, outputSignal contains the filtered version of page, and delay contains the final
state data of the filter. The sample code app passes delay to the next call of vDSP_biquad.
Visualizing sound as an audio spectrogram
Share image data between vDSP and vImage to visualize audio that a device microphone
captures.
Equalizing audio with discrete cosine transforms (DCTs)
Change the frequency response of an audio signal by manipulating frequency-domain data.
Biquadratic IIR filters
Apply biquadratic filters to single-channel and multichannel data.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.
Apply the biquadratic filter to the audio sample
See Also
Audio Processing


