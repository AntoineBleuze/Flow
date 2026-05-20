# Utilities.pdf

## Page 1

Poor quality audio playback can ruin the immersive experience in your app, making it crucial to
maintain smooth audio playback by eliminating glitches and dropouts. When you encounter an
audio glitch, you hear unintended distortion in the playback — pops, dropouts, and clicks. The
Audio System Trace template includes several instruments that provide information about your
app’s performance and help you troubleshoot audio issues. The Audio Statistics, Audio Server, an
Audio Client tracks are instruments in the Audio System Trace template that provide insights,
errors, and warnings about the Core Audio system, and enable you to improve your appʼs audio
experience.
From Xcode’s Product menu, choose Profile, or press Command-I. After Instruments launches,
select Audio System Trace, then click Choose.
Overview
Launch Audio System Trace
Audio Toolbox / Analyzing audio performance with Instruments
Article
Analyzing audio performance with
Instruments
Ensure a smooth and immersive audio experience in your apps using Audio
System Trace.


## Page 2

The Audio System Trace template includes the following instrument tracks:
Points of Interest
Indicates locations in the trace to which you may want to pay special attention.
System Load
Tracks the performance and current load of the system.
Thread State Trace
Tracks each time the operating system scheduler makes a decision that may impact your app
threads.
Virtual Memory Trace
Tracks virtual memory activity per thread.
System Call Trace
Records system calls and their duration.
Thermal State
Records the device’s thermal state.
Audio Client
Tracks information about the timing of I/O process callbacks in your app.


## Page 3

Audio Statistics
Records engine jitter, which quantifies how late an I/O cycle was relative to its anticipated
deadline and the number of concurrent audio threads.
Audio Server
Tracks engine timestamp and I/O cycle load and related points of interest.
Hangs
Labels intervals by severity, measuring the duration of main thread blockage.
Audio System Trace instruments include tracks to help you isolate where glitches are occurring an
identify the cause of audio performance issues. You can view the audio system performance
captured in an audio system trace in two ways:
You can capture a trace by clicking the Record button in the toolbar. Your app launches Audio
System Trace and starts recording. Within your app, perform the actions that reproduce the
audio performance issue you want to analyze, and then click the Stop button to stop recording
You can open an audio system trace you previously recorded. In Instruments, choose File >
Open, select a trace file, and click Open.
The audio system trace appears in a new window, along with the timeline and detail panes, as
shown in the following screenshot.
Explore the Audio System Trace instruments


## Page 4

Move your pointer along the top of the trace timeline pane to see points of interest along the Aud
Client and Audio Server tracks. To identify audio performance issues, click the points of interest t
view errors and warnings.
To have better granularity for a specific track, use your mouse or trackpad to zoom in to the
corresponding area of the track for more information. Click a point of interest to update the detail


## Page 5

pane for that selected track and view any corresponding detail information.
The Audio Statistics track gives an overview of each engine’s jitter and sample time information to
provide insights into the system’s audio performance. The track displays two graphs: Engine Jitte
and I/O Threads. The Engine Jitter graph quantifies deviations from an expected tick cadence. Th
I/O Threads graph shows the number of concurrent audio threads. The Engine represents a
collection of one or more audio devices bound together.
Click the arrow next to the instrument name to switch between these two graphs.
The table below describes the colors and associated jitter times in the Audio Statistics track.
Analyze audio performance statistics


## Page 6

Color
Jitter time µs (microseconds)
Green
0–30 µs
Orange
31–100 µs
Red
> 100 µs
The Audio Statistics track’s detail pane includes the following menu items:
Engine ID
An identifier for an I/O entity within Audio Server.
Min/Max Sample Time
The shortest and longest sample times recorded for an engine.
Min/Max Host Time
The earliest and latest host timestamps for an engine.
Min/Max Jitter
The range of jitter values recorded for an engine.
Std Dev Jitter
The standard deviation from the mean jitter value during a recording.
Count
The number of events recorded in the run of the instrument tool.
The Audio Server track provides Engine Time Stamp and I/O Cycle Load graphs, and related point
of interest. Engine timestamp refers to the time when the audio engine processes audio, and it ca
help determine where a delay or other problem occurred in the audio processing chain. I/O cycle
load refers to the time the system spends processing an audio buffer relative to the available time
to process that buffer.
If the client doesn’t complete its operation during the allotted cycle time, the system can’t proces
the audio in real-time, leading to dropouts or glitches. If the I/O cycle load is consistently high, it
indicates the audio processing might be too complex or intensive for the current buffer size and
sample rate configuration.
Click the arrow next to the instrument name to switch between the Engine Time Stamp and I/O
Cycle Load graphs.
Identify glitches with the Audio Server track


## Page 7

As you view these tracks, pay particular attention to the red points of interest, which help you
isolate where the audio issues occur. Typically, these issues occur when the I/O cycle takes too
long. The points of interest include overloads, clock discontinuity errors, reanchors, and read safe
violations.
An overload occurs if you don’t deliver data on time, leading to issues in real-time audio playback
It’s indicated in red on the graph and has a red point of interest. If you don’t promptly write audio
data to the output buffer, the speakers lack the necessary information for continuous playback an
glitch until they receive the missing data. A clock discontinuity occurs when the clock has failed to
stay in sync or there has been a break in the device’s continuous samples. When detecting a cloc
discontinuity, Core Audio actively attempts to reanchor the device’s clock with the timeline. A read
safety violation tracks how close to a driver’s safety offset a read was.
Switching to the Zero Time Stamp detail pane in the Audio Server track can help you determine if
an operation doesn’t complete within an audio I/O cycle, leading to overloads and glitches.
A ring buffer is a fixed-size data structure where the last element connects to the first. Every time
the audio driver completes a loop of the ring buffer, it generates a new zero timestamp. The
following screenshot shows the Audio Server’s detail pane with zero timestamp information.
The following menu items describe the zero timestamp information in the Audio Server track’s
detail pane shown above:
Sample Time
A running count of the total number of samples the driver has processed in the buffer.
Frame Count
The number of frames processed.
Host Time
The point when the buffer wraps.
Actual Host Ticks per Frame
The number of host ticks per audio frame.
Jitter
View zero timestamp information


## Page 8

The deviation (in microseconds) from the expected timestamp.
The audio stack has a client/server architecture. To analyze audio system performance, you may
want to examine what happens between the server and the client (your app). The Audio Client tra
provides information about the timing of I/O process callbacks for your app. Points of interest sho
issues with your app’s audio performance and correlate to points of interest in the Audio Server
track.
In the screenshot below, overloads are visible in the Audio Server track and are likely to cause
glitches. Client operations might be conducting non–real-time operations that aren’t safe, which
can cause overloads. Blocking on a lock, allocating memory, or performing complex operations th
exceed the allotted audio server time are examples of non–real-time operations that can cause
glitches.
Completing multiple real-time audio threads by a common deadline is important, or glitches can
occur. An audio workgroup consists of real-time threads collaborating across various processes —
such as the audio server, client apps, and plug-ins — to generate audio by a common deadline. Th
system uses audio workgroups to effectively monitor the CPU utilization of real-time threads,
aiming to optimize the trade-off between energy efficiency and system performance.
Tip
Use Audio Workgroups API to optimize your audio threads’ performance, giving the operating
system insight into active real-time threads, including auxiliary ones that other apps and Audio
Unit plug-ins created. For further insights into audio workgroups, see Understanding Audio
Workgroups.
With your app’s track, you can select the detail row where the overload occurs to see the
corresponding backtrace in the inspector pane, as shown in the screenshot below. The backtrace
information can take you to your code that’s causing audio performance issues.
Inspect the Audio Client track
Use real-time operations
Complete multiple audio threads by a common deadline
Analyze backtrace information


## Page 9

When you’ve corrected all glitches appearing in your Audio Client and Audio Server tracks, you se
the Audio Server track with the client audio completed within the time allotted by the server. As
shown below, there are no errors or warnings in the tracks.
Audio Converter Services
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
Audio Codec
Translate audio data from one format to another.
Clock Utilities
Manage time-related information associated with audio playback.
Confirm tracks have no errors or warnings
See Also
Utilities


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

Important
The AudioSession API has been completely deprecated in iOS 7.0. See AVAudioSession
for the Objective-C implementation of these functions.
Audio Session Services lets you specify the intended audio behavior for your iOS app. For exampl
you can specify whether you intend for your app’s audio to silence other apps or to mix with their
audio. You also use this API to specify your app’s behavior when it is interrupted, such as by a
phone call. When the system knows your intentions, it configures the audio hardware in the devic
to satisfy those intentions, as possible.
These functions apply only to iOS. They do not apply to macOS.
Audio Session Property Identifiers
Property identifiers used with Audio Session Services in iOS.
Audio Session Categories
Category identifiers for audio sessions, used as values for the kAudioSessionProperty
_AudioCategory property.
Overview
Topics
Audio Session Support
Audio Toolbox / Audio Session Support
API Collection
Audio Session Support
Describe the properties that you associate with audio sessions and audio routes.


## Page 16

Audio Session Modes
Mode identifiers for audio sessions, used as values for the kAudioSessionProperty_Mo
property.
Audio Session Category Route Overrides
Specifies whether the default audio route for the PlayAndRecord category should be
overridden.
Audio Session Activation Flags
Flags that provide additional information about your app’s audio intentions upon session
activation or deactivation.
Audio Session Interruption States
Identifiers used with the AudioSessionInterruptionListener callback function in iOS
to indicate that an audio interruption has started or stopped.
typealias AudioSessionInterruptionType
Values that indicate the nature of the interruption that ended.
Audio Route Change Reasons
Identifiers for the various reasons that an audio route can change while your app is running.
Audio Route Description Dictionary Keys
Keys for the kAudioSessionProperty_AudioRouteDescription dictionary.
Audio Route Type Key
The one key for an audio route input or output dictionary.
Audio Input Routes
Strings that identify the various audio input sources for a device.
Audio Output Routes
The various audio output destinations available for an iOS device.
Audio Route Change Dictionary Keys
Keys for obtaining information about an audio hardware route change.
Alternative Audio Route Change Reason Dictionary Key
An alternate key for obtaining information about the reason for an audio route change.
Audio Routes


## Page 17

USB Accessory Audio Source Dictionary Keys
Keys for the dictionaries in the kAudioSessionProperty_InputSources array.
USB Accessory Audio Destination Dictionary Keys
Keys for the dictionaries in the kAudioSessionProperty_OutputDestinations array.
let kAudioSessionInputRoute_BluetoothHFP: CFString!
A microphone that is part of a Bluetooth Hands-Free Profile (HFP) device.
Deprecated
let kAudioSessionInputRoute_BuiltInMic: CFString!
A built-in microphone input.
Deprecated
let kAudioSessionInputRoute_HeadsetMic: CFString!
A microphone that is part of a headset.
Deprecated
let kAudioSessionInputRoute_LineIn: CFString!
A line in input
Deprecated
let kAudioSessionInputRoute_USBAudio: CFString!
A Universal Serial Bus (USB) input, accessed through the device 30-pin connector.
Deprecated
let kAudioSessionOutputRoute_AirPlay: CFString!
An output on an AirPlay device.
Deprecated
let kAudioSessionOutputRoute_BluetoothA2DP: CFString!
Speakers in a Bluetooth A2DP device.
Deprecated
let kAudioSessionOutputRoute_BluetoothHFP: CFString!
Speakers that are part of a Bluetooth Hands-Free Profile (HFP) accessory.
USB Accessories
Constants


## Page 18

Deprecated
let kAudioSessionOutputRoute_BuiltInReceiver: CFString!
The built-in speaker you hold to your ear when on a phone call.
Deprecated
let kAudioSessionOutputRoute_BuiltInSpeaker: CFString!
The primary built-in speaker.
Deprecated
let kAudioSessionOutputRoute_HDMI: CFString!
An output available through the HDMI interface.
Deprecated
let kAudioSessionOutputRoute_Headphones: CFString!
Speakers in headphones or in a headset.
Deprecated
let kAudioSessionOutputRoute_LineOut: CFString!
Analog line-level output.
Deprecated
let kAudioSessionOutputRoute_USBAudio: CFString!
Speaker(s) in a Universal Serial Bus (USB) accessory, accessed through the device 30-pin
connector.
Deprecated
let kAudioSession_AudioRouteChangeKey_CurrentRouteDescription: CFString
Describes the current audio route.
Deprecated
let kAudioSession_AudioRouteChangeKey_PreviousRouteDescription: CFStrin
!
Describes the previous audio route.
Deprecated
let kAudioSession_AudioRouteKey_Inputs: CFString!
An object containing details about audio input used in the current audio route.
Deprecated
let kAudioSession_AudioRouteKey_Outputs: CFString!
An object containing details about the audio output used in the current audio route.


## Page 19

Deprecated
let kAudioSession_AudioRouteKey_Type: CFString!
Audio routes input or output dictionary.
Deprecated
let kAudioSession_InputSourceKey_Description: CFString!
Audio input source description.
Deprecated
let kAudioSession_InputSourceKey_ID: CFString!
An audio input source.
Deprecated
let kAudioSession_OutputDestinationKey_Description: CFString!
The audio output destination.
Deprecated
let kAudioSession_OutputDestinationKey_ID: CFString!
The output destination.
Deprecated
let kAudioSession_RouteChangeKey_Reason: CFString!
The reason for the audio route change.
Deprecated
Audio Session Interruption Types
Audio Session Errors
Analyzing audio performance with Instruments
Enumerations
Result Codes
See Also
Utilities


## Page 20

Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Converter Services
Convert between linear PCM audio formats, and between linear PCM and compressed
formats.
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


## Page 21

The AudioToolbox.h header file provides auxiliary functions for obtaining the internal state of a
Core Audio object. Use these functions during development and debugging.
func CAShow(UnsafeMutableRawPointer)
Prints the internal state of an object to stdio.
func CAShowFile(UnsafeMutableRawPointer, UnsafeMutablePointer<FILE>)
Prints the internal state of an object to a file.
func CopyNameFromSoundBank(CFURL, UnsafeMutablePointer<Unmanaged<
CFString>?>) -> OSStatus
Copies the name of a sound bank from a sound bank file at a specified URL.
func CopyInstrumentInfoFromSoundBank(CFURL, UnsafeMutablePointer<
Unmanaged<CFArray>?>) -> OSStatus
var kInstrumentInfoKey_LSB: String
Overview
Topics
Audio Toolbox Debugging Functions
Instrument Functions
Audio Toolbox / Audio Toolbox Debugging
API Collection
Audio Toolbox Debugging
Obtain the internal state of Core Audio objects during the development and
debugging of your code.


## Page 22

var kInstrumentInfoKey_MSB: String
var kInstrumentInfoKey_Name: String
var kInstrumentInfoKey_Program: String
var AUDIO_TOOLBOX_VERSION: Int32
Analyzing audio performance with Instruments
Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Converter Services
Convert between linear PCM audio formats, and between linear PCM and compressed
formats.
Audio Session Support
Describe the properties that you associate with audio sessions and audio routes.
Workgroup Management
Coordinate the activity of custom real-time audio threads with those of the system and othe
processes.
Audio Codec
Translate audio data from one format to another.
Clock Utilities
Manage time-related information associated with audio playback.
Constants
See Also
Utilities


## Page 23

Real-time audio rendering often requires coordination between the threads of an app, the system
and the threads of any active Audio Unit plug-ins. Workgroups provide the mechanism to
coordinate the efforts of these different processes, and ensure that they execute on the same
schedule. In an Audio Unit, use a render context observer to retrieve the workgroup that the host
app uses for real-time audio rendering. In an app, fetch the workgroup for a Core Audio device
directly from the device or from your AUAudioUnit object.
If your app has real-time rendering threads that operate on their own deadlines, create your own
workgroup using the AudioWorkIntervalCreate function. Use your custom workgroup to set
and update the rendering schedule for your threads.
Understanding Audio Workgroups
Learn how to optimize real-time rendering performance with the Audio Workgroups API.
Adding Parallel Real-Time Threads to Audio Workgroups
Optimize the performance of real-time audio threads that run in sync with the I/O thread by
adding them to the audio device workgroup.
Adding Asynchronous Real-Time Threads to Audio Workgroups
Overview
Topics
Essentials
Audio Toolbox / Workgroup Management
API Collection
Workgroup Management
Coordinate the activity of custom real-time audio threads with those of the system
and other processes.


## Page 24

Optimize system performance by adding real-time audio threads that run asynchronously to
the I/O thread to custom audio workgroups.
Adding Audio Unit Auxiliary Real-Time Threads to Audio Workgroups
If your Audio Unit plug-in creates auxiliary real-time rendering threads, add them to the host
app’s audio workgroup so the system can schedule them appropriately.
var kAudioDevicePropertyIOThreadOSWorkgroup: AudioObjectPropertySelecto
The device’s workgroup object, which you use to coordinate your threads with the threads o
the device.
Analyzing audio performance with Instruments
Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Converter Services
Convert between linear PCM audio formats, and between linear PCM and compressed
formats.
Audio Session Support
Describe the properties that you associate with audio sessions and audio routes.
Audio Toolbox Debugging
Obtain the internal state of Core Audio objects during the development and debugging of yo
code.
Audio Codec
Translate audio data from one format to another.
Clock Utilities
Manage time-related information associated with audio playback.
Device Workgroup
See Also
Utilities


## Page 25

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


## Page 26

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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

func CAClockNew(UInt32, UnsafeMutablePointer<CAClockRef?>) -> OSStatus
func CAClockDispose(CAClockRef) -> OSStatus
typealias CAClockRef
func CAClockStart(CAClockRef) -> OSStatus
func CAClockStop(CAClockRef) -> OSStatus
func CAClockArm(CAClockRef) -> OSStatus
func CAClockDisarm(CAClockRef) -> OSStatus
func CAClockAddListener(CAClockRef, CAClockListenerProc, UnsafeMutable
RawPointer) -> OSStatus
func CAClockRemoveListener(CAClockRef, CAClockListenerProc, Unsafe
MutableRawPointer) -> OSStatus
typealias CAClockListenerProc
enum CAClockMessage
Topics
Creating a Clock
Starting and Stopping the Clock
Adding and Removing Listeners
Audio Toolbox / Clock Utilities
API Collection
Clock Utilities
Manage time-related information associated with audio playback.


## Page 31

func CAClockGetCurrentTime(CAClockRef, CAClockTimeFormat, UnsafeMutable
Pointer<CAClockTime>) -> OSStatus
func CAClockSetCurrentTime(CAClockRef, UnsafePointer<CAClockTime>) ->
OSStatus
func CAClockGetStartTime(CAClockRef, CAClockTimeFormat, UnsafeMutable
Pointer<CAClockTime>) -> OSStatus
struct CAClockTime
enum CAClockTimeFormat
typealias CAClockSamples
func CAClockGetCurrentTempo(CAClockRef, UnsafeMutablePointer<CAClock
Tempo>, UnsafeMutablePointer<CAClockTime>?) -> OSStatus
func CAClockSetCurrentTempo(CAClockRef, CAClockTempo, UnsafePointer<
CAClockTime>?) -> OSStatus
func CAClockGetPlayRate(CAClockRef, UnsafeMutablePointer<Float64>) ->
OSStatus
func CAClockSetPlayRate(CAClockRef, Float64) -> OSStatus
typealias CAClockTempo
struct CATempoMapEntry
func CAClockGetProperty(CAClockRef, CAClockPropertyID, UnsafeMutable
Pointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
func CAClockGetPropertyInfo(CAClockRef, CAClockPropertyID, UnsafeMutabl
Pointer<UInt32>?, UnsafeMutablePointer<DarwinBoolean>?) -> OSStatus
func CAClockSetProperty(CAClockRef, CAClockPropertyID, UInt32, UnsafeRa
Pointer) -> OSStatus
enum CAClockPropertyID
Accessing the Current Time
Accessing Tempo Information
Accessing Clock Properties


## Page 32

enum CAClockSyncMode
func CAClockParseMIDI(CAClockRef, UnsafePointer<MIDIPacketList>) ->
OSStatus
func CAClockBarBeatTimeToBeats(CAClockRef, UnsafePointer<CABarBeatTime>
UnsafeMutablePointer<CAClockBeats>) -> OSStatus
func CAClockBeatsToBarBeatTime(CAClockRef, CAClockBeats, UInt16, Unsafe
MutablePointer<CABarBeatTime>) -> OSStatus
func CAClockSMPTETimeToSeconds(CAClockRef, UnsafePointer<SMPTETime>,
UnsafeMutablePointer<CAClockSeconds>) -> OSStatus
func CAClockSecondsToSMPTETime(CAClockRef, CAClockSeconds, UInt16,
UnsafeMutablePointer<SMPTETime>) -> OSStatus
func CAClockTranslateTime(CAClockRef, UnsafePointer<CAClockTime>,
CAClockTimeFormat, UnsafeMutablePointer<CAClockTime>) -> OSStatus
enum CAClockTimebase
typealias CAClockSeconds
typealias CAClockBeats
typealias CAClockSMPTEFormat
struct CABarBeatTime
struct CAMeterTrackEntry
Clock Errors
Parsing MIDI Data
Converting Time Values
Getting Clock-Related Errors
See Also
Utilities


## Page 33

Analyzing audio performance with Instruments
Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Converter Services
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
Audio Codec
Translate audio data from one format to another.


