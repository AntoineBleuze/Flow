# 002_Equalizing audio with discrete cosine transforms _DCTs_.pdf

## Page 1

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


## Page 2

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


## Page 3

The SignalGenerator.start() function starts the signal generator.
On return, the signal generator repeatedly calls the getSignal() function and renders the
returned data as audio. Each call returns a page of length sampleCount from samples.
The sample can render the audio unaltered by returning page.
To learn more about using AVAudioEngine to render audio, see Building a Signal Generator.
The sample app builds the envelope array — that controls which parts of the drum loop’s spectru
it zeroes — from variables that define the start and end frequencies, and a value that specifies
either band pass or band stop.
Define the DCT-based equalization filter


## Page 4

The following image visualizes the effect of audio equalization that blocks most of the spectrum
except low frequencies. The solid, blue line represents the frequency-domain audio data, and the
dashed red line represents the values in the band-stop filter.
The following code creates setup objects that contain all the information required to perform the
forward and inverse DCT operations. Creating these setup objects can be expensive, so the samp
only does this once.
The forward transform is a type II DCT.
The inverse transform is a type III DCT.
Prepare the DCT setups


## Page 5

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


## Page 6

Share image data between vDSP and vImage to visualize audio that a device microphone
captures.
Applying biquadratic filters to a music loop
Change the frequency response of an audio signal using a cascaded biquadratic filter.
Biquadratic IIR filters
Apply biquadratic filters to single-channel and multichannel data.
Discrete Cosine transforms
Transform vectors of temporal and spatial domain real values to the frequency domain, and
vice versa.


