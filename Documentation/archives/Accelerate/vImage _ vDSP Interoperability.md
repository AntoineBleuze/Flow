# vImage _ vDSP Interoperability.pdf

## Page 1

This sample code project captures a sequence of photographs and uses a combination of routine
from vImage and vDSP to order the images by their relative sharpness. This technique is useful in
applications such as an image scanner, where your user requires the least blurry captured image.
After applying the routines, the app displays the images in a list, with the sharpest image at the to
Overview
Accelerate / Finding the sharpest image in a sequence of captured images
Sample Code
Finding the sharpest image in a sequence
of captured images
Share image data between vDSP and vImage to compute the sharpest image from
a bracketed photo sequence.
Download
iOS 16.0+
iPadOS 16.0+
Xcode 14.0+


## Page 2

This project uses SwiftUI to build the user interface, AVFoundation to capture a sequence of
images, and a method known as the variance of the Laplacian to determine the sharpness of each
image.
Before exploring the code, try building and running the app, and taking photographs of subjects
such as documents and signs.
Configure the capture session


## Page 3

The 3 x 3 Laplacian kernel that this sample uses reports a lot of noise if applied to a full-resolution
image. To reduce this noise, the sample uses a downscaled image and defines the capture
session’s preset to a size that’s smaller than the camera’s native resolution:
To learn more about configuring a capture session, see Setting Up a Capture Session.
The sample defines the AVCapturePhotoBracketSettings object, which specifies the captu
features and settings, in the BlurDetector.takePhoto() function.
The sharpness detection algorithm in this sample works on a grayscale image. The camera’s
YpCbCr pixel formats, either kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange or 
CVPixelFormatType_420YpCbCr8BiPlanarFullRange, represent the luminance of the
image using one plane and represent color information on separate planes. The code converts the
luminance plane to a grayscale image.
The following code checks that the current device supports one or both of these formats:
The exposureSettings array contains AVCaptureAutoExposureBracketedStillImage
Settings instances and defines the exposure target bias of each as currentExposureTarge
Bias. The maxBracketedCapturePhotoCount property of the AVCapturePhotoOutput
object defines the maximum number of items in the array.
Define the photo settings


## Page 4

The following code uses the array of exposure settings and the first available YpCbCr format type
to define the bracketed settings:
The BlurDetector.takePhoto() function passes the AVCapturePhotoBracketSetting
instance to capture the sequence of images:
For each captured image, AVFoundation calls the photoOutput(_:didFinishProcessing
Photo:error:) method.
The sample uses the pixelBuffer property of the AVCapturePhoto instance that
AVFoundation supplies to acquire the uncompressed CVPixelBuffer that contains the capture
photograph. While the code is accessing the pixel data of the pixel buffer, it calls CVPixelBuffe
LockBaseAddress to lock the base address:
The pixel buffer that AVFoundation vends contains two planes; the plane at index zero contains th
luminance data. Because the sample app runs the sharpness detection code in a background
thread, it calls copyMemory to create a copy of the luminance data:
Acquire the captured image


## Page 5

After the code has copied the luminance data, it unlocks the pixel buffer’s base address and
passes the copied luminance data to the processing function in a background thread:
The following code creates a pixel buffer from data passed to the BlurDetector.process
Image(data:rowBytes:width:height:sequenceCount:expectedCount:
orientation:) function:
On return, sourceBuffer contains a grayscale representation of the captured image.
Initialize grayscale source pixel buffer
Create floating point pixels to use with vDSP


## Page 6

vImage buffers store their image data in row-major format. However, when you pass data betwee
vImage and vDSP, be aware that, in some cases, vImage will add extra bytes at the end of each ro
For example, the following code declares two 8-bit-per-pixel buffers that are 10 pixels wide:
Although the code defines buffers with 10 bytes per row, to maximize performance, vImage
Buffer_Init(_:_:_:_:_:) and init(width:height:pixelFormat:) both initialize a
buffer with 16 bytes per row.
In some cases, this disparity between the row bytes used to hold image data and the buffer’s
actual row bytes may not affect an app’s results. However, the sample app declares a vImage
.PixelBuffer structure with external memory that has no additional padding. This ensures tha
the uninitialized data in the row padding doesn’t affect the blur detection algorithm.


## Page 7

On return, laplacianStorage and laplacianBuffer share the same memory that contains 
32-bit version of the image data in the imageBuffer.
The Laplacian kernel finds edges in the single-precision pixel values:
The vDSP convolve function performs the convolution in place on the laplacianStorage
memory:
After the convolution, edges in the image have high values. The following image shows the result
after convolution using the Laplacian kernel:
The vDSP_normalize function calculates the standard deviation of the pixel values after the
edge detection. The following computed property returns the variance of a single-precision
AccelerateMutableBuffer instance:
Perform the convolution
Calculate the variance


## Page 8

The sample app uses this value as a measure of relative sharpness. Images with more variance
have more detail than those with less variance, and that difference is used to derive the relative
sharpness.
The sample app uses the vImage 90º rotation functions in conjunction with the CGImage object’s
orientation to create Core Graphics images that are suitable for displaying in the app. The stati
BlurDetector.makeImage(fromPlanarBuffer:orientation:) function accepts a plan
buffer (either the grayscale representation of the captured image or the result of the convolution)
and the orientation, and returns a CGImage instance.
For landscape images, meaning images with an orientation of .left or .right, the function
creates a destination buffer with a width equal to the height, and a height equal to the width of th
supplied buffer. For portrait images, meaning images with an orientation of .up or .down, the
function creates a destination buffer with the same dimensions as the supplied buffer.
Create a display image with the correct orientation


## Page 9

The following code populates the destination buffer using either vImageRotate90_Planar8(_
_:_:_:_:) or vImageRotate90_PlanarF(_:_:_:_:_:)


## Page 10

Finally, the function returns a CGImage from the destination buffer:
Visualizing sound as an audio spectrogram
Share image data between vDSP and vImage to visualize audio that a device microphone
captures.
See Also
vImage / vDSP Interoperability


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

The following image shows the color that the function returns with inputs from 0.0 through 1.0:


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

The sample performs a matrix multiply of each frame of frequency-domain data with the filter ban
to produce a frame of mel-scaled values.
The following image shows the matrix multiply. The frame of 1024 frequency-domain values is
multiplied by 16 overlapping triangular windows, returning the 16-element mel-scaled values.
The following code uses cblas_sgemm(_:_:_:_:_:_:_:_:_:_:_:_:_:_:) to perform the
matrix multiply:
Use a matrix multiply to compute the mel spectrogram


## Page 20

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


