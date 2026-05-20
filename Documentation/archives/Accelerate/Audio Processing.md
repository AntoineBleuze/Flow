# Audio Processing.pdf

## Page 1

This sample code project captures audio from a macOS device’s microphone and uses a
combination of routines from vImage and vDSP to render the audio as an audio spectrogram. Aud
spectrograms visualize audio in 2D using one axis to represent time and the other axis to represe
frequency. Color represents the amplitude of the time-frequency pair.
You can use audio spectrograms for signal analysis. For example, a spectrogram can help identify
audio issues, such as low- or high-frequency noise, or short-impulse noises like clicks and pops
that may not be immediately obvious to the human ear. Spectrograms can also assist in audio
classification using neural networks for tasks such as bird song and speech recognition.
The image below shows the audio spectrogram that this sample created from the Stargate Openin
sound effect in GarageBand. The horizontal axis represents time, and the vertical axis represents
frequency. The sample calculates the color that represents amplitude using a procedurally
generated multidimensional lookup table.
Overview
Accelerate / Visualizing sound as an audio spectrogram
Sample Code
Visualizing sound as an audio spectrogram
Share image data between vDSP and vImage to visualize audio that a device
microphone captures.
Download
macOS 13.0+
Xcode 14.3+


## Page 2

The sample creates an audio spectrogram by performing a discrete cosine transform (DCT) on
audio samples. The DCT computes the frequency components of an audio signal and represents
the audio as a series of amplitudes at the component frequencies. DCTs are related to Fourier
transforms, but use real values rather than complex values. You can learn more about Fourier
transforms at Finding the component frequencies in a composite sine wave.
The spectrogram scrolls horizontally so that the most recent sample renders on the right side of
the device’s screen.
For each sample buffer that AVFoundation provides, the app appends that data to the rawAudio
Data array. At the same time, the app applies a DCT to the first sampleCount elements of raw
AudioData and produces a single-precision frequency-domain representation.
The code appends the newly generated frequency-domain values to frequencyDomainValues
and discards sampleCount elements from the beginning. It is this appending and discarding of
data that generates the scrolling effect.
A vImage pixel buffer, planarImageBuffer, shares data with frequencyDomainValues and
the multidimensional lookup table uses that as a planar source to populate three additional planar
buffers that represent the red, green, and blue channels of the spectrogram image. The sample
app interleaves the red, green, and blue planar buffers to display the RGB spectrogram image.
Before exploring the code, build and run the app to familiarize yourself with the different visual
results it generates from different sounds.
Define the spectrogram size


## Page 3

The sample defines two constants that specify the size of the spectrogram.
sampleCount defines the number of individual samples that pass to the DCT, and the
resolution of the displayed frequencies.
bufferCount controls the number of displayed buffers.
The sample also specifies a hop size that controls the overlap between frames of data and ensure
that the spectrogram doesn’t lose any audio information at the start and end of each sample.
The processData(values:) function processes the first sampleCount samples from raw
AudioData by performing the DCT and appending the frequency-domain representation data to
the array that creates the vImage buffer and, ultimately, the audio spectrogram image.
To avoid recreating working arrays with each iteration, the following code creates reusable buffers
that processData(values:) uses:
The sample calls convertElements(of:to:) to convert 16-bit integer audio samples to single
precision floating-point values.
Process the audio data


## Page 4

To reduce spectral leakage, the sample multiplies the signal by a Hann window and performs the
DCT. The following code generates the window:
To learn more about using windows to reduce spectral leakage, see Reducing spectral leakage wi
windowing.
The following code multiplies the time-domain data by the Hann window and performs the forwar
DCT:
The following code creates a vImage.MultidimensionalLookupTable that the sample uses
to create the pseudocolor rendering. The function returns dark blue for low values, graduates
through red, and returns full-brightness green for 1.0.
Define the pseudocolor multidimensional lookup tables


## Page 5

The following image shows the color that the function returns with inputs from 0.0 through 1.0:


## Page 6

To display the audio spectrogram, the app creates a temporary planar vImage.PixelBuffer
that shares memory with the frequency-domain values.
The following code applies the multidimensional lookup table to the grayscale information in the
temporary buffer to populate three planar buffers that represent the red, green, and blue channel
Because the vImage functions that generate a Core Graphics image from a pixel buffer require an
interleaved buffer, the code interleaves the red, green, and blue buffer into rgbImageBuffer.
In addition to the linear audio spectrogram, the sample app provides a mode to render audio as a
mel spectrogram. The computeMelSpectrogram(values:) function rescales the frequency-
domain buffer from a linear scale to the mel scale.
Prepare the vImage pixel buffers to display the audio
spectrogram
Compute the mel spectrum using linear algebra


## Page 7

The mel scale is a scale of pitches that human hearing generally perceives to be equidistant from
each other. As frequency increases, the interval, in hertz, between mel scale values (or simply
mels) increases. The name mel derives from melody and indicates that the scale is based on the
comparison between pitches. The mel spectrogram remaps the values in hertz to the mel scale.
The linear audio spectrogram is ideally suited for use cases where all frequencies have equal
importance, while mel spectrograms are better suited when modeling human hearing perception.
Mel spectrogram data is also suited for use in audio classification.
A mel spectrogram differs from a linearly scaled audio spectrogram in two ways:
A mel spectrogram logarithmically renders frequencies above a certain threshold (the corner
frequency). For example, in the linearly scaled spectrogram, the vertical space between 1000 H
and 2000 Hz is half of the vertical space between 2000 Hz and 4000 Hz. In the mel
spectrogram, the space between those ranges is approximately the same. This scaling is
analogous to human hearing, where it’s easier to distinguish between similar low frequency
sounds than similar high frequency sounds.
A mel spectrogram computes its output by multiplying frequency-domain values by a filter ban
The sample builds the filter bank from a series of overlapping triangular windows at a series of
evenly spaced mels. The number of elements in a single frame in a mel spectrogram is equal to th
number of filters in the filter bank.
The following image shows the linear audio spectrogram and the mel spectrogram of the same
linearly increasing and decreasing tone. The tone starts at 20 Hz, rises to 22,050 Hz, and drops
back to 20 Hz. The image shows that the audio spectrogram represents the objective signal, but
the mel spectrogram mirrors human perception, that is, the curve flattens and indicates reduced
differentiation between high frequencies.
In this case, the mel spectrogram consists of 40 filters, so the spectrogram has a lower vertical
resolution than the linear spectrogram.
The sample creates an array, melFilterBankFrequencies, that contains the indices of
frequencyDomainBuffer that represent the mel scale frequencies. For example, if the Nyquis
frequency is 22,050 Hz and frequencyDomainBuffer contains 1024 elements, a value of 512 
melFilterBankFrequencies represents 11,025 Hz.
The static MelSpectrogram.populateMelFilterBankFrequencies(_:maximum
Frequency:) function populates melFilterBankFrequencies with the logarithmically
increasing indices based on the linearly interpolated increasing mel frequencies in melFilter
BankFrequencies.
Define the mel frequencies


## Page 8

The following line chart shows 16 generated mel frequencies as squares and the corresponding
frequencies in hertz as circles:
The sample creates the filter bank matrix with filterBankCount rows and sampleCount
columns. Each row contains a triangular window that starts at the previous frequency, peaks at th
current frequency, and ends at the next frequency. For example, the following graphic illustrates
the values for a filter bank that contains 16 values:
The static MelSpectrogram.populateFilterBank(_:melFilterBankFrequencies
function populates the filterBank array. The function uses vDSP_vgen to generate the attack
and decay phases of each triangle.
Create the filter bank


## Page 9

The sample performs a matrix multiply of each frame of frequency-domain data with the filter ban
to produce a frame of mel-scaled values.
The following image shows the matrix multiply. The frame of 1024 frequency-domain values is
multiplied by 16 overlapping triangular windows, returning the 16-element mel-scaled values.
The following code uses cblas_sgemm(_:_:_:_:_:_:_:_:_:_:_:_:_:_:) to perform the
matrix multiply:
Use a matrix multiply to compute the mel spectrogram


## Page 10

On return, the sample adds the result of the matrix multiply in sgemmResult to the melSpectru
Values that contain bufferCount * filterBankCount elements.
Applying biquadratic filters to a music loop
Change the frequency response of an audio signal using a cascaded biquadratic filter.
Equalizing audio with discrete cosine transforms (DCTs)
Change the frequency response of an audio signal by manipulating frequency-domain data.
Biquadratic IIR filters
Apply biquadratic filters to single-channel and multichannel data.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.
See Also
Audio Processing


## Page 11

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


## Page 12

Before exploring the code, try building and running the app to familiarize yourself with the effect o
the different parameters on the music loop.
The biquadSectionCount constant defines the number of sections that the biquadratic filter
implements. The sample code app sets this to 3 by default.
The vDSP_biquad_CreateSetup function returns a new biquadratic filter structure that contai
biquadSectionCount sections. The sample code app defines the coefficients to produce a filt
that returns an output that’s identical to the input.
Initialize the biquadratic filter
Define the biquadratic coefficients


## Page 13

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


## Page 14

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


## Page 15

You can use vDSP functions to shape the output of an audio signal; for example, boosting or
cutting the bass or treble of a music track.
This sample app plays a drum loop and allows the user to eliminate frequencies that are either
inside or outside a range that two Slider controls define.
By performing a forward DCT on the drum loop data and zeroing out parts of the audio spectrum,
the sample app applies a band-pass or band-stop filter to the audio.
When you first launch the app, the drum loop plays with a band-pass filter that eliminates very low
and very high frequencies. The user interface displays the frequency-domain representation of th
equalized drum loop and the shape of the envelope that defines the frequency response.
Overview
Accelerate / Equalizing audio with discrete cosine transforms (DCTs)
Sample Code
Equalizing audio with discrete cosine
transforms (DCTs)
Change the frequency response of an audio signal by manipulating frequency-
domain data.
Download
macOS 13.0+
Xcode 14.0+


## Page 16

Before exploring the code, try building and running the app to familiarize yourself with the effect o
the different equalizations on the drum loop.
vDSP also provides biquadratic filters that offer an alternative approach for equalizing audio. To
learn more about biquadratic filters, see Applying biquadratic filters to a music loop.
This sample includes an audio resource, Rhythm.aif, that contains a drum loop. The getAudio
Samples(forResource:withExtension:) function generates an array of single-precision
values from the drum loop.
The samples array contains single-precision values that represent the entire content of Rhythm
.aif. To learn more about the AVFoundation classes that generate the samples, see AVAsset
Reader and AVAssetReaderTrackOutput.
The DrumLoopProvider class conforms to the SignalProvider protocol and vends an array
of single-precision values that represent audio data. The AudioEqualizationApp application
file creates an instance of SignalGenerator and specifies an instance of DrumLoopProvider
as the signal provider. It also specifies the naturalTimeScale of the audio asset as the sample
rate.
Generate the audio samples
Configure audio playback


## Page 17

The SignalGenerator.start() function starts the signal generator.
On return, the signal generator repeatedly calls the getSignal() function and renders the
returned data as audio. Each call returns a page of length sampleCount from samples.
The sample can render the audio unaltered by returning page.
To learn more about using AVAudioEngine to render audio, see Building a Signal Generator.
The sample app builds the envelope array — that controls which parts of the drum loop’s spectru
it zeroes — from variables that define the start and end frequencies, and a value that specifies
either band pass or band stop.
Define the DCT-based equalization filter


## Page 18

The following image visualizes the effect of audio equalization that blocks most of the spectrum
except low frequencies. The solid, blue line represents the frequency-domain audio data, and the
dashed red line represents the values in the band-stop filter.
The following code creates setup objects that contain all the information required to perform the
forward and inverse DCT operations. Creating these setup objects can be expensive, so the samp
only does this once.
The forward transform is a type II DCT.
The inverse transform is a type III DCT.
Prepare the DCT setups


## Page 19

To equalize the audio using a DCT-based filter, the sample app applies a forward DCT transform t
the time-domain signal data. It then multiplies the frequency-domain data by the envelope values
and applies an inverse transform to the multiplied data.
To ensure the volume of the equalized audio matches the original audio, the sample app scales th
result. The scaling factor for the forward transform is 2, and the scaling factor for the inverse
transform is the number of samples (in this case, 1024). The divide(_:_:) function divides th
inverse DCT result by sampleCount / 2, and returns the result of the divide operation.
The app passes the result of the divide operation to the signal generator, and your device plays th
DCT-based filtered drum loop.
For more information on scaling factors for the vDSP FFT and DFT operations, see Understanding
data packing for Fourier transforms.
Visualizing sound as an audio spectrogram
Equalize the audio with DCT
See Also
Audio Processing


## Page 20

Share image data between vDSP and vImage to visualize audio that a device microphone
captures.
Applying biquadratic filters to a music loop
Change the frequency response of an audio signal using a cascaded biquadratic filter.
Biquadratic IIR filters
Apply biquadratic filters to single-channel and multichannel data.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 21

Equalizing audio with discrete cosine transforms (DCTs)
Change the frequency response of an audio signal by manipulating frequency-domain data.
struct Biquad
A single- or double-precision biquadratic filter.
Visualizing sound as an audio spectrogram
Share image data between vDSP and vImage to visualize audio that a device microphone
captures.
Applying biquadratic filters to a music loop
Change the frequency response of an audio signal using a cascaded biquadratic filter.
Equalizing audio with discrete cosine transforms (DCTs)
Change the frequency response of an audio signal by manipulating frequency-domain data.
Discrete Cosine transforms
Topics
Biquadratic IIR Filters
See Also
Audio Processing
Accelerate / Biquadratic IIR filters
API Collection
Biquadratic IIR filters
Apply biquadratic filters to single-channel and multichannel data.


## Page 22

Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


## Page 23

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


## Page 24

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


