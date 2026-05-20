# 005_Audio Codec.pdf

## Page 1

func AudioCodecInitialize(AudioCodec, UnsafePointer<AudioStreamBasic
Description>?, UnsafePointer<AudioStreamBasicDescription>?, UnsafeRaw
Pointer?, UInt32) -> OSStatus
Sets up the specified codec to perform a data format translation.
func AudioCodecReset(AudioCodec) -> OSStatus
Flushes all the audio data in the codec and clears the input buffer.
func AudioCodecUninitialize(AudioCodec) -> OSStatus
Moves the codec from the initialized state back to the uninitialized state.
func AudioCodecAppendInputBufferList(AudioCodec, UnsafePointer<Audio
BufferList>, UnsafeMutablePointer<UInt32>, UnsafePointer<AudioStream
PacketDescription>?, UnsafeMutablePointer<UInt32>) -> OSStatus
func AudioCodecProduceOutputBufferList(AudioCodec, UnsafeMutablePointer
AudioBufferList>, UnsafeMutablePointer<UInt32>, UnsafeMutablePointer<
AudioStreamPacketDescription>?, UnsafeMutablePointer<UInt32>) ->
OSStatus
Topics
Initializing an Audio Codec
Configuring Buffers
Accessing the Data
Audio Toolbox / Audio Codec
API Collection
Audio Codec
Translate audio data from one format to another.


## Page 2

func AudioCodecAppendInputData(AudioCodec, UnsafeRawPointer, Unsafe
MutablePointer<UInt32>, UnsafeMutablePointer<UInt32>, UnsafePointer<
AudioStreamPacketDescription>?) -> OSStatus
Appends audio data to the codec’s input buffer.
func AudioCodecProduceOutputPackets(AudioCodec, UnsafeMutableRawPointer
UnsafeMutablePointer<UInt32>, UnsafeMutablePointer<UInt32>, Unsafe
MutablePointer<AudioStreamPacketDescription>?, UnsafeMutablePointer<
UInt32>) -> OSStatus
Retrieves output data from a codec.
func AudioCodecGetProperty(AudioCodec, AudioCodecPropertyID, Unsafe
MutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
Retrieves the value of a codec property.
func AudioCodecGetPropertyInfo(AudioCodec, AudioCodecPropertyID, Unsafe
MutablePointer<UInt32>?, UnsafeMutablePointer<DarwinBoolean>?) ->
OSStatus
Retrieves information about a codec property.
func AudioCodecSetProperty(AudioCodec, AudioCodecPropertyID, UInt32,
UnsafeRawPointer) -> OSStatus
Sets the value of a codec property.
struct AudioCodecMagicCookieInfo
A structure holding magic cookie information needed by some codecs.
struct AudioCodecPrimeInfo
A structure specifying the number of leading and trailing empty frames to be inserted.
typealias AudioCodec
An instance of a Component Manager component.
typealias AudioCodecAppendInputBufferListProc
typealias AudioCodecAppendInputDataProc
typealias AudioCodecGetPropertyInfoProc
typealias AudioCodecGetPropertyProc
Accessing Codec Properties
Codec Types


## Page 3

typealias AudioCodecInitializeProc
typealias AudioCodecProduceOutputBufferListProc
typealias AudioCodecProduceOutputPacketsProc
typealias AudioCodecPropertyID
An integer identifying an audio codec property.
typealias AudioCodecResetProc
typealias AudioCodecSetPropertyProc
typealias AudioCodecUninitializeProc
struct AudioSettingsFlags
var kAudioSettings_AvailableValues: String
var kAudioSettings_CurrentValue: String
var kAudioSettings_Hint: String
var kAudioSettings_LimitedValues: String
var kAudioSettings_Parameters: String
var kAudioSettings_SettingKey: String
var kAudioSettings_SettingName: String
var kAudioSettings_Summary: String
var kAudioSettings_TopLevelKey: String
var kAudioSettings_Unit: String
var kAudioSettings_ValueType: String
var kAudioSettings_Version: String
Output Status Constants
Status values returned from the AudioCodecProduceOutputPackets(_:_:_:_:_:_:
function.
Program Target Levels
Audio Settings
Enumerations


## Page 4

Dynamic Range Control Modes
Bit Rate Control Mode Constants
Bit rate control modes to be used with kAudioCodecPropertyBitRateControlMode.
Global Codec Properties
These read-only properties disclose the capabilities of the codec and remain the same for a
instances of the codec.
Instance Codec Properties
Properties that can be set or read on an instance of the audio codec.
Audio Codec Priming Method Constants
Values used with kAudioCodecPropertyPrimeMethod.
Audio Codec Quality Constants
Sound quality settings to be used with the property kAudioCodecPropertyQuality
Setting.
Audio Codec Routine Selectors
Selectors used by the Component Manager to call routines implemented by the codec and
exposed to developers through the Audio Codec Services API. These selectors are for use b
codec developers; if you are calling Audio Codec Services functions, you don’t need to use
these constants.
Audio Codec Delays
Audio Codec Delay Modes
Audio Codec Properties
Audio Codec Errors
Analyzing audio performance with Instruments
Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Converter Services
See Also
Utilities


## Page 5

Convert between linear PCM audio formats, and between linear PCM and compressed
formats.
Audio Session Support
Describe the properties that you associate with audio sessions and audio routes.
Audio Toolbox Debugging
Obtain the internal state of Core Audio objects during the development and debugging of yo
code.
Workgroup Management
Coordinate the activity of custom real-time audio threads with those of the system and othe
processes.
Clock Utilities
Manage time-related information associated with audio playback.


