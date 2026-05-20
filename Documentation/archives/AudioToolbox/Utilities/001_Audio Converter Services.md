# 001_Audio Converter Services.pdf

## Page 1

Audio converter objects convert between various linear PCM audio formats. They can also conver
between linear PCM and compressed formats. Supported transformations include the following:
PCM bit depth
PCM sample rate
PCM floating point to and from PCM integer
PCM interleaved to and from PCM deinterleaved
PCM to and from compressed formats
A single audio converter may perform more than one of the listed transformations.
func AudioConverterNew(UnsafePointer<AudioStreamBasicDescription>,
UnsafePointer<AudioStreamBasicDescription>, UnsafeMutablePointer<Audio
ConverterRef?>) -> OSStatus
Creates a new audio converter object based on specified audio formats.
Overview
Topics
Managing Audio Converter Objects
Audio Toolbox / Audio Converter Services
API Collection
Audio Converter Services
Convert between linear PCM audio formats, and between linear PCM and
compressed formats.


## Page 2

func AudioConverterNewSpecific(UnsafePointer<AudioStreamBasicDescriptio
>, UnsafePointer<AudioStreamBasicDescription>, UInt32, UnsafePointer<
AudioClassDescription>, UnsafeMutablePointer<AudioConverterRef?>) ->
OSStatus
Creates a new audio converter object using a specified codec.
func AudioConverterReset(AudioConverterRef) -> OSStatus
Resets an audio converter object, clearing and flushing its buffers.
func AudioConverterDispose(AudioConverterRef) -> OSStatus
Disposes of an audio converter object.
func AudioConverterGetProperty(AudioConverterRef, AudioConverterPropert
ID, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
Gets an audio converter property value.
func AudioConverterGetPropertyInfo(AudioConverterRef, AudioConverter
PropertyID, UnsafeMutablePointer<UInt32>?, UnsafeMutablePointer<Darwin
Boolean>?) -> OSStatus
Gets information about an audio converter property.
func AudioConverterSetProperty(AudioConverterRef, AudioConverterPropert
ID, UInt32, UnsafeRawPointer) -> OSStatus
Sets the value of an audio converter object property.
Encoding and decoding audio
Convert audio formats to efficiently manage data and quality.
func AudioConverterConvertBuffer(AudioConverterRef, UInt32, UnsafeRaw
Pointer, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) ->
OSStatus
Converts audio data from one linear PCM format to another.
func AudioConverterFillComplexBuffer(AudioConverterRef, AudioConverter
ComplexInputDataProc, UnsafeMutableRawPointer?, UnsafeMutablePointer<
UInt32>, UnsafeMutablePointer<AudioBufferList>, UnsafeMutablePointer<
AudioStreamPacketDescription>?) -> OSStatus
Configuring Audio Converter Properties
Performing Conversions


## Page 3

Converts audio data supplied by a callback function, supporting non-interleaved and
packetized formats.
func AudioConverterConvertComplexBuffer(AudioConverterRef, UInt32,
UnsafePointer<AudioBufferList>, UnsafeMutablePointer<AudioBufferList>) 
> OSStatus
Converts audio data from one linear PCM format to another, where both use the same samp
rate.
typealias AudioConverterComplexInputDataProc
Supplies input data to the AudioConverterFillComplexBuffer(_:_:_:_:_:_:)
function.
typealias AudioConverterInputDataProc
Deprecated. Use AudioConverterFillComplexBuffer(_:_:_:_:_:_:) instead.
struct AudioConverterPrimeInfo
Specifies priming information for an audio converter.
typealias AudioConverterRef
A reference to an audio converter object.
typealias AudioConverterPropertyID
An audio converter property identifier.
Audio Converter Properties
Audio converter properties, used with the AudioConverterGetPropertyInfo(_:_:_:
_:), AudioConverterGetProperty(_:_:_:_:), and AudioConverterSet
Property(_:_:_:_:) functions.
Converter Priming Constants
Constants used with the kAudioConverterPrimeMethod property.
Sample Rate Conversion Quality Identifiers
Specifiers for sample rate conversion quality, used for the kAudioConverterSampleRate
ConverterQuality property.
Callbacks
Data Types
Constants


## Page 4

Sample Rate Conversion Complexity Identifiers
Specifiers for the sample rate conversion algorithm, used for the kAudioConverterSampl
RateConverterComplexity property.
Converter Audio Unit Properties
Properties for the Apple AUConverter audio unit.
Converter Audio Unit Subtypes
Audio data format converter audio unit subtypes for audio units provided by Apple.
Audio Converter Dithering Algorithms
Audio Converter Properties (macOS)
Audio Converter Errors
This table lists result codes defined for Audio Converter Services.
var kAudioConverterErr_FormatNotSupported: OSStatus
var kAudioConverterErr_OperationNotSupported: OSStatus
var kAudioConverterErr_PropertyNotSupported: OSStatus
var kAudioConverterErr_InvalidInputSize: OSStatus
var kAudioConverterErr_InvalidOutputSize: OSStatus
The byte size is not an integer multiple of the frame size.
var kAudioConverterErr_UnspecifiedError: OSStatus
var kAudioConverterErr_BadPropertySizeError: OSStatus
var kAudioConverterErr_RequiresPacketDescriptionsError: OSStatus
var kAudioConverterErr_InputSampleRateOutOfRange: OSStatus
var kAudioConverterErr_OutputSampleRateOutOfRange: OSStatus
var kAudioConverterErr_HardwareInUse: OSStatus
Returned from the AudioConverterFillComplexBuffer(_:_:_:_:_:_:) function if
the underlying hardware codec has become unavailable, probably due to an audio
interruption.
Enumerations
Result Codes


## Page 5

var kAudioConverterErr_NoHardwarePermission: OSStatus
Returned from the AudioConverterNew(_:_:_:) function if the new converter would us
a hardware codec which the application does not have permission to use.
Analyzing audio performance with Instruments
Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Session Support
Describe the properties that you associate with audio sessions and audio routes.
Audio Toolbox Debugging
Obtain the internal state of Core Audio objects during the development and debugging of yo
code.
Workgroup Management
Coordinate the activity of custom real-time audio threads with those of the system and othe
processes.
Audio Codec
Translate audio data from one format to another.
Clock Utilities
Manage time-related information associated with audio playback.
See Also
Utilities


