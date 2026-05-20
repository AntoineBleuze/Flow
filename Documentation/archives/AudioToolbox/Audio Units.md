# Audio Units.pdf

## Page 1

Spatial audio makes sound seem like it’s coming from all around you. To generate spatialized aud
from a multichannel audio stream, you use a spatial mixer audio unit (AUSM). The audio streams
can come from the output of a game engine, video player, or audio file.
The sample app shows you how to create an AUSM, and how to configure its channel layout and
stream format. It streams multichannel input from an audio file, and down-mixes it to 2-channel
spatial audio.
The sample uses the pull model to get the input from an in-memory file streamer. The OutputAU
class pulls input from the AudioKernel, which manages the AUSM. The AUSM pulls audio from
AudioFileReader to get input. On macOS, the output unit uses kAudioUnitSubType
_HALOutput to interface with the audio device. On iOS, the interface is configured as kAudio
UnitSubType_RemoteIO.
To begin setup of an AUSM, the sample initializes a mixer with a subtype of kAudioUnitSubTyp
_SpatialMixer.
Overview
Create an audio unit spatial mixer
Audio Toolbox / Generating spatial audio from a multichannel audio stream
Sample Code
Generating spatial audio from a
multichannel audio stream
Convert 8-channel audio to 2-channel spatial audio by using a spatial mixer audio
unit.
Download
iOS 16.0+
iPadOS 16.0+
macOS 13.0+
Xcode 15.4+


## Page 2

After initializing the spatial mixer, the sample calls a convenience function to configure the output
stream format and channel layout for stereo audio.
The sample then configures the input stream format and sets the channel layout to kAudio
ChannelLayoutTag_MPEG_7_1_A for 8-channel audio.
The sample sets the spatialization algorithm to AUSpatializationAlgorithm
.spatializationAlgorithm_UseOutputType for the highest-quality spatial rendering
across different hardware.
The input channels are spatialized around the listener as far-field sources. The channel layout
specifies the relative directions of the individual channels. The azimuth and elevation parameters
Configure for spatial audio


## Page 3

control the audio rotation. The sample configures the source mode to AUSpatialMixerSource
Mode.spatialMixerSourceMode_AmbienceBed. Use AUSpatialMixerSourceMode
.spatialMixerSourceMode_PointSource for an object to render the input signal as a singl
source, except if rendering in-head with AUSpatialMixerPointSourceInHeadMode
.spatialMixerPointSourceInHeadMode_Bypass.
Spatial audio includes dynamic head tracking for apps that enable it. To configure head tracking,
set kAudioUnitProperty_SpatialMixerEnableHeadTracking. For more information
about supported devices, see Listen with spatial audio for AirPods and Beats.
Audio Unit v3 Plug-Ins
Deliver custom audio effects, instruments, and other audio behaviors using an Audio Unit v3
app extension.
Audio Components
Find, load, and configure audio components, such as Audio Units and audio codecs.
Audio Unit v2 (C) API
Configure an Audio Unit and prepare it to render audio.
Audio Unit Properties
Obtain information about the built-in mixers, equalizers, filters, effects, and other Audio Unit
app extensions.
See Also
Audio Units


## Page 4

Audio Unit Voice I/O
Configure system voice processing and respond to speech events.


## Page 5

Migrating Your Audio Unit Host to the AUv3 API
Update your Audio Unit (AU) host app to take advantage of the new features and capabilities
of AUv3.
Hosting Audio Unit Extensions Using the AUv2 API
Update your existing Audio Unit v2 host app to load and use Audio Unit extensions.
Creating an audio unit extension
Build an extension by using an Xcode template.
Creating custom audio effects
Add custom audio-effect processing to apps like Logic Pro X and GarageBand by creating
Audio Unit (AU) plug-ins.
Incorporating Audio Effects and Instruments
Add custom audio processing and MIDI instruments to your app by hosting Audio Unit (AU)
plug-ins.
Debugging Out-of-Process Audio Units on Apple Silicon
Connect to out-of-process audio units using the Xcode debugger.
Topics
Host App
Audio Units
Audio Toolbox / Audio Unit v3 Plug-Ins
API Collection
Audio Unit v3 Plug-Ins
Deliver custom audio effects, instruments, and other audio behaviors using an
Audio Unit v3 app extension.


## Page 6

class AUAudioUnit
A class that defines a host’s interface to an audio unit.
class AUAudioUnitBus
A class that defines an input or output connection point on an audio unit.
class AUAudioUnitBusArray
A class that defines a container for an audio unit’s input or output busses.
class AUAudioUnitPreset
A class that describes an interface for custom parameter settings provided by the audio unit
developer.
class AUAudioUnitV2Bridge
A class that wraps a version 2 audio unit as version 3 audio unit.
func AudioUnitExtensionCopyComponentList(CFString) -> Unmanaged<CFArray
>?
Returns the component registrations for a given audio unit extension.
func AudioUnitExtensionSetComponentList(CFString, CFArray?) -> OSStatus
Allows the implementor of an audio unit extension to dynamically modify the list of compone
registrations for the extension.
protocol AUAudioUnitFactory
An object that creates a version 3 audio unit.
class AUParameter
An object that represents a single audio unit parameter.
class AUParameterGroup
A parameter group object represents a group of related audio unit parameters.
class AUParameterNode
An object that represents a node in an audio unit’s parameter tree.
class AUParameterTree
An object that represents a top-level group node that contains all of an audio unit’s
parameters.
Parameters


## Page 7

Generating spatial audio from a multichannel audio stream
Convert 8-channel audio to 2-channel spatial audio by using a spatial mixer audio unit.
Audio Components
Find, load, and configure audio components, such as Audio Units and audio codecs.
Audio Unit v2 (C) API
Configure an Audio Unit and prepare it to render audio.
Audio Unit Properties
Obtain information about the built-in mixers, equalizers, filters, effects, and other Audio Unit
app extensions.
Audio Unit Voice I/O
Configure system voice processing and respond to speech events.
See Also
Audio Units


## Page 8

Use the Audio Components API to register and discover audio units, codecs, and other loadable
code modules. This API replaces the Component Manager API used prior to macOS 10.6. The
system searches for loadable bundles with a .audiocomp or .component filename extension in
the following locations:
~/Library/Audio/Plug-Ins/Components
/Library/Audio/Plug-Ins/Components
/System/Library/Components
The bundle Info.plist file needs to contain an AudioComponents item whose value is an arr
of dictionaries. For example:
Overview
Audio Toolbox / Audio Components
API Collection
Audio Components
Find, load, and configure audio components, such as Audio Units and audio
codecs.


## Page 9

Topics
Creating an Audio Component Instance


## Page 10

func AudioComponentInstanceNew(AudioComponent, UnsafeMutablePointer<
AudioComponentInstance?>) -> OSStatus
Creates a new instance of an audio component.
func AudioComponentInstantiate(AudioComponent, AudioComponent
InstantiationOptions, (AudioComponentInstance?, OSStatus) -> Void)
func AudioComponentInstanceDispose(AudioComponentInstance) -> OSStatus
Disposes of an audio component instance.
typealias AudioComponent
An audio component.
struct AudioComponentInstantiationOptions
Audio Component Errors
func AudioComponentRegister(UnsafePointer<AudioComponentDescription>,
CFString, UInt32, AudioComponentFactoryFunction) -> AudioComponent
func AudioComponentCount(UnsafePointer<AudioComponentDescription>) ->
UInt32
Returns the number of audio components that match a specified AudioComponent
Description structure.
func AudioComponentFindNext(AudioComponent?, UnsafePointer<Audio
ComponentDescription>) -> AudioComponent?
Finds the next component that matches a specified AudioComponentDescription
structure after a specified audio component.
func AudioComponentInstanceGetComponent(AudioComponentInstance) -> Audi
Component
Retrieves a reference to an audio component from an instance of that audio component.
struct AudioComponentDescription
Identifying information for an audio component.
typealias AudioComponentInstance
A component instance, or object, is an audio unit or audio codec.
struct AudioComponentFlags
typealias AudioComponentFactoryFunction
Creating an Audio Component Dynamically


## Page 11

func AudioComponentInstanceCanDo(AudioComponentInstance, Int16) -> Bool
Determines if an audio component instance implements a particular function.
func AudioComponentGetDescription(AudioComponent, UnsafeMutablePointer<
AudioComponentDescription>) -> OSStatus
Gets the class description, as an AudioComponentDescription structure, of an audio
component.
func AudioComponentCopyName(AudioComponent, UnsafeMutablePointer<
Unmanaged<CFString>?>) -> OSStatus
Returns the generic name of an audio component.
func AudioComponentGetVersion(AudioComponent, UnsafeMutablePointer<
UInt32>) -> OSStatus
Gets the version of an audio component in hexadecimal form as 0xMMMMmmDD (major, minor,
dot).
func AudioComponentCopyIcon(AudioComponent) -> UIImage?
func AudioComponentCopyConfigurationInfo(AudioComponent, UnsafeMutable
Pointer<Unmanaged<CFDictionary>?>) -> OSStatus
struct AudioComponentPlugInInterface
typealias AudioComponentMethod
func AudioComponentValidate(AudioComponent, CFDictionary?, UnsafeMutabl
Pointer<AudioComponentValidationResult>) -> OSStatus
var kAudioComponentValidationParameter_LoadOutOfProcess: String
enum AudioComponentValidationResult
var kAudioComponentConfigurationInfo_ValidationResult: String
let kAudioComponentInstanceInvalidationNotification: CFString
let kAudioComponentRegistrationsChangedNotification: CFString
Getting Information About a Component
Validating an Audio Component
Constants


## Page 12

var kAudioComponentValidationParameter_ForceValidation: String
var kAudioComponentValidationParameter_TimeOut: String
Generating spatial audio from a multichannel audio stream
Convert 8-channel audio to 2-channel spatial audio by using a spatial mixer audio unit.
Audio Unit v3 Plug-Ins
Deliver custom audio effects, instruments, and other audio behaviors using an Audio Unit v3
app extension.
Audio Unit v2 (C) API
Configure an Audio Unit and prepare it to render audio.
Audio Unit Properties
Obtain information about the built-in mixers, equalizers, filters, effects, and other Audio Unit
app extensions.
Audio Unit Voice I/O
Configure system voice processing and respond to speech events.
See Also
Audio Units


## Page 13

func AudioUnitInitialize(AudioUnit) -> OSStatus
Initializes an audio unit
func AudioUnitUninitialize(AudioUnit) -> OSStatus
Uninitializes an audio unit.
func AudioUnitProcess(AudioUnit, UnsafeMutablePointer<AudioUnitRender
ActionFlags>?, UnsafePointer<AudioTimeStamp>, UInt32, UnsafeMutable
Pointer<AudioBufferList>) -> OSStatus
func AudioUnitProcessMultiple(AudioUnit, UnsafeMutablePointer<AudioUnit
RenderActionFlags>?, UnsafePointer<AudioTimeStamp>, UInt32, UInt32,
UnsafeMutablePointer<UnsafePointer<AudioBufferList>>, UInt32, Unsafe
MutablePointer<UnsafeMutablePointer<AudioBufferList>>) -> OSStatus
func AudioUnitReset(AudioUnit, AudioUnitScope, AudioUnitElement) ->
OSStatus
Resets an audio unit’s render state.
typealias AudioUnit
The data type for a plug-in component that provides audio processing or audio data
generation.
Topics
Initializing the Audio Unit
Starting and Stopping Output
Audio Toolbox / Audio Unit v2 (C) API
API Collection
Audio Unit v2 (C) API
Configure an Audio Unit and prepare it to render audio.


## Page 14

func AudioOutputUnitStart(AudioUnit) -> OSStatus
Starts an I/O audio unit, which in turn starts the audio unit processing graph that it is
connected to.
func AudioOutputUnitStop(AudioUnit) -> OSStatus
Stops an I/O audio unit, which in turn stops the audio unit processing graph that it is
connected to.
typealias AudioOutputUnitStartProc
typealias AudioOutputUnitStopProc
func AudioUnitRender(AudioUnit, UnsafeMutablePointer<AudioUnitRender
ActionFlags>?, UnsafePointer<AudioTimeStamp>, UInt32, UInt32, Unsafe
MutablePointer<AudioBufferList>) -> OSStatus
Initiates a rendering cycle for an audio unit.
func AudioUnitAddRenderNotify(AudioUnit, AURenderCallback, UnsafeMutabl
RawPointer?) -> OSStatus
Registers a callback to receive audio unit render notifications.
func AudioUnitRemoveRenderNotify(AudioUnit, AURenderCallback, Unsafe
MutableRawPointer?) -> OSStatus
Unregisters a previously-registered render listener callback function.
typealias AURenderCallback
Called by the system when an audio unit requires input samples, or before and after a rende
operation.
struct AudioUnitRenderActionFlags
Flags for configuring audio unit rendering.
func AudioUnitGetProperty(AudioUnit, AudioUnitPropertyID, AudioUnitScop
, AudioUnitElement, UnsafeMutableRawPointer, UnsafeMutablePointer<UInt3
>) -> OSStatus
Gets the value of an audio unit property.
func AudioUnitSetProperty(AudioUnit, AudioUnitPropertyID, AudioUnitScop
, AudioUnitElement, UnsafeRawPointer?, UInt32) -> OSStatus
Rendering the Audio
Configuring Audio Unit Properties


## Page 15

Sets the value of an audio unit property.
func AudioUnitGetPropertyInfo(AudioUnit, AudioUnitPropertyID, AudioUnit
Scope, AudioUnitElement, UnsafeMutablePointer<UInt32>?, UnsafeMutable
Pointer<DarwinBoolean>?) -> OSStatus
Gets information about an audio unit property.
func AudioUnitAddPropertyListener(AudioUnit, AudioUnitPropertyID, Audio
UnitPropertyListenerProc, UnsafeMutableRawPointer?) -> OSStatus
Registers a callback to receive audio unit property change notifications.
func AudioUnitRemovePropertyListenerWithUserData(AudioUnit, AudioUnit
PropertyID, AudioUnitPropertyListenerProc, UnsafeMutableRawPointer?) ->
OSStatus
Unregisters a previously-registered property listener callback function.
func AUEventListenerCreateWithDispatchQueue(UnsafeMutablePointer<AUEven
ListenerRef?>, Float32, Float32, dispatch_queue_t, AUEventListenerBlock
-> OSStatus
func AUEventListenerCreate(AUEventListenerProc, UnsafeMutableRawPointer
?, CFRunLoop?, CFString?, Float32, Float32, UnsafeMutablePointer<AUEven
ListenerRef?>) -> OSStatus
func AUListenerDispose(AUParameterListenerRef) -> OSStatus
func AUEventListenerNotify(AUEventListenerRef?, UnsafeMutableRawPointer
?, UnsafePointer<AudioUnitEvent>) -> OSStatus
func AUEventListenerAddEventType(AUEventListenerRef, UnsafeMutableRaw
Pointer?, UnsafePointer<AudioUnitEvent>) -> OSStatus
func AUEventListenerRemoveEventType(AUEventListenerRef, UnsafeMutableRa
Pointer?, UnsafePointer<AudioUnitEvent>) -> OSStatus
func AUListenerAddParameter(AUParameterListenerRef, UnsafeMutableRaw
Pointer?, UnsafePointer<AudioUnitParameter>) -> OSStatus
func AUListenerRemoveParameter(AUParameterListenerRef, UnsafeMutableRaw
Pointer?, UnsafePointer<AudioUnitParameter>) -> OSStatus
typealias AUEventListenerBlock
Responding to Events
Getting and Setting Parameters


## Page 16

func AudioUnitGetParameter(AudioUnit, AudioUnitParameterID, AudioUnit
Scope, AudioUnitElement, UnsafeMutablePointer<AudioUnitParameterValue>)
-> OSStatus
Gets the value of an audio unit parameter.
func AudioUnitScheduleParameters(AudioUnit, UnsafePointer<AudioUnit
ParameterEvent>, UInt32) -> OSStatus
Schedules changes to the value of an audio unit parameter.
func AudioUnitSetParameter(AudioUnit, AudioUnitParameterID, AudioUnit
Scope, AudioUnitElement, AudioUnitParameterValue, UInt32) -> OSStatus
Sets the value of an audio unit parameter.
func AUListenerCreateWithDispatchQueue(UnsafeMutablePointer<AUParameter
ListenerRef?>, Float32, dispatch_queue_t, AUParameterListenerBlock) ->
OSStatus
func AUListenerCreate(AUParameterListenerProc, UnsafeMutableRawPointer,
CFRunLoop?, CFString?, Float32, UnsafeMutablePointer<AUParameterListene
Ref?>) -> OSStatus
func AUParameterListenerNotify(AUParameterListenerRef?, UnsafeMutableRa
Pointer?, UnsafePointer<AudioUnitParameter>) -> OSStatus
func AUParameterFormatValue(Float64, UnsafePointer<AudioUnitParameter>,
UnsafeMutablePointer<CChar>, UInt32) -> UnsafeMutablePointer<CChar>
func AUParameterSet(AUParameterListenerRef?, UnsafeMutableRawPointer?,
UnsafePointer<AudioUnitParameter>, AudioUnitParameterValue, UInt32) ->
OSStatus
func AUParameterValueFromLinear(Float32, UnsafePointer<AudioUnit
Parameter>) -> AudioUnitParameterValue
func AUParameterValueToLinear(AudioUnitParameterValue, UnsafePointer<
AudioUnitParameter>) -> Float32
typealias AUParameterListenerBlock
typealias AUParameterListenerProc
typealias AUParameterListenerRef
typealias AUImplementorDisplayNameWithLengthCallback
Monitoring Parameter Changes


## Page 17

A block called to obtain a parameter node’s display name, possibly truncated to a desired
length.
typealias AUImplementorStringFromValueCallback
A block called to convert a parameter value to a string representation.
typealias AUImplementorValueFromStringCallback
A block called to convert a string to a parameter value.
typealias HostCallback_GetBeatAndTempo
When called by the system, provides beat and tempo information to an audio unit from a hos
application.
typealias HostCallback_GetMusicalTimeLocation
When called by the system, provides musical timing information to an audio unit from a host
application.
typealias HostCallback_GetTransportState
When called by the system, provides audio transport state and timeline information to an
audio unit from a host application.
typealias HostCallback_GetTransportState2
typealias AUInputSamplesInOutputCallback
Called by the system when an audio unit has provided a buffer of output samples.
typealias AUMIDIOutputCallback
When called by a host application, gets MIDI data from an audio unit.
var kAudioUnitConfigurationInfo_BusCountWritable: String
var kAudioUnitConfigurationInfo_ChannelConfigurations: String
var kAudioUnitConfigurationInfo_HasCustomView: String
var kAudioUnitConfigurationInfo_IconURL: String
var kAudioUnitConfigurationInfo_InitialInputs: String
var kAudioUnitConfigurationInfo_InitialOutputs: String
var kAudioUnitConfigurationInfo_SupportedChannelLayoutTags: String
Getting Information from the Host
Getting the Configuration Information


## Page 18

struct AudioUnitCocoaViewInfo
The name and number of custom Cocoa views for an audio unit.
func GetAudioUnitParameterDisplayType(AudioUnitParameterOptions) ->
AudioUnitParameterOptions
func SetAudioUnitParameterDisplayType(AudioUnitParameterOptions, Audio
UnitParameterOptions) -> AudioUnitParameterOptions
struct ScheduledAudioFileRegion
struct ScheduledAudioSlice
typealias ScheduledAudioFileRegionCompletionProc
typealias ScheduledAudioSliceCompletionProc
typealias MIDIChannelNumber
MIDI Channel, 0~15 (channels 1 through 16, respectively).
typealias AUAudioObjectID
typealias AUMIDICIProfileChangedBlock
typealias AUAudioChannelCount
A number of audio channels.
typealias AUAudioFrameCount
A number of audio sample frames.
typealias AUAudioUnitStatus
A result code returned from an audio unit’s render function.
typealias AUEventListenerProc
typealias AUEventListenerRef
typealias AUEventSampleTime
Expresses time as a sample count.
typealias AUImplementorValueObserver
Configuring the Audio Unit UI
Audio Unit Types


## Page 19

A block called to notify the audio unit implementation of changes to a parameter value.
typealias AUImplementorValueProvider
A block called to fetch a parameter’s current value from the audio unit implementation.
typealias AUInputHandler
A block to notify the host of an I/O unit that an input is available.
typealias AUNodeConnection
typealias AUParameterAddress
A numeric identifier for an audio unit parameter.
typealias AUParameterAutomationObserver
typealias AUParameterObserver
A block called after the value of a parameter changes.
typealias AUParameterObserverToken
A token representing an installed parameter observer block.
typealias AUParameterRecordingObserver
A block called to record parameter changes as automation events.
typealias AURenderBlock
A block to render the audio unit.
typealias AURenderObserver
A block called when an audio unit renders audio.
typealias AURenderPullInputBlock
A block to supply audio input to a render block.
typealias AUScheduleParameterBlock
A block to schedule parameter changes.
typealias AUValue
A value of an audio unit parameter.
typealias AudioUnitAddPropertyListenerProc
typealias AudioUnitAddRenderNotifyProc
typealias AudioUnitComplexRenderProc
typealias AudioUnitElement


## Page 20

The data type for an audio unit element identifier.
typealias AudioUnitGetParameterProc
typealias AudioUnitGetPropertyInfoProc
typealias AudioUnitGetPropertyProc
typealias AudioUnitInitializeProc
typealias AudioUnitParameterID
The data type for an audio unit parameter identifier.
struct AudioUnitParameterNameInfo
A short version of the name for an audio unit parameter.
typealias AudioUnitParameterIDName
A type definition for a data type that defines the short version of the name for an audio unit
parameter.
typealias AudioUnitParameterValue
The data type for an audio unit parameter value.
typealias AudioUnitProcessMultipleProc
typealias AudioUnitProcessProc
typealias AudioUnitPropertyID
The data type for audio unit property keys.
typealias AudioUnitPropertyListenerProc
Called by the system when the value of a specified audio unit property has changed.
typealias AudioUnitRemoteControlEventListener
typealias AudioUnitRemovePropertyListenerProc
typealias AudioUnitRemovePropertyListenerWithUserDataProc
typealias AudioUnitRemoveRenderNotifyProc
typealias AudioUnitRenderProc
typealias AudioUnitResetProc
typealias AudioUnitScheduleParametersProc
typealias AudioUnitScope
The data type for audio unit scope identifiers.


## Page 21

typealias AudioUnitSetParameterProc
typealias AudioUnitSetPropertyProc
typealias AudioUnitUninitializeProc
Audio Unit Types
The defined types of audio processing plug-ins known as audio units.
Inter-App Audio Unit Types
Audio Unit Manufacturer Identifier
The Apple audio unit manufacturer code.
Audio Unit Output Subtypes
I/O Audio Unit Subtypes
Converter Audio Unit Subtypes
Audio data format converter audio unit subtypes for audio units provided by Apple.
Reserved Audio Unit Clump Identifier
Reserved for system use.
Offline Audio Unit Properties
Properties for audio units that perform offline processing—that is, processing in a
nonplayback, nonrealtime mode.
MIDI Audio Unit Parameters
Parameters for instrument units.
General Audio Unit Function Selectors
General audio unit component selectors that correspond to functions in the audio unit API.
Generator Audio Unit Subtypes
Audio units that serve as sound sources.
Input/Output Audio Unit Subtypes
Input/output audio unit subtypes for audio units provided by Apple.
Audio Unit Panner Subtypes
Audio Unit Player Subtypes
Enumerations


## Page 22

Audio Unit Pitch Subtypes
enum AudioUnitEventType
struct AudioUnitParameterOptions
Value options for audio unit parameters.
enum AudioUnitParameterUnit
The unit-of-measure for an audio unit parameter.
enum AudioUnitRemoteControlEvent
Audio Unit Sample Rate Converter Complexity
Quality levels for the audio sample-rate conversion algorithm.
Audio Unit Scopes
Programmatic roles and contexts for audio unit properties.
Audio Unit SRC Algorithms
Audio Unit Full Name Parameter
Audio Unit Parameter Flags
Audio Unit Filter Parameters
Audio Unit Generic Properties
Audio Unit Parameter Flags
Audio Unit Scheduled Sound Player Properties
Audio Unit Offline Preflight Flags
Audio Unit Migration Properties
Audio Unit File Player Properties
Audio Unit Parameter Listener
Audio Unit Errors
enum AUAudioUnitBusType
AUEventSampleTime
Expresses time as a sample count.
struct AUHostTransportStateFlags
enum AUParameterAutomationEventType


## Page 23

enum AUParameterEventType
Audio unit parameter event types.
enum AURenderEventType
struct AUScheduledAudioSliceFlags
struct AUParameterMIDIMappingFlags
Generating spatial audio from a multichannel audio stream
Convert 8-channel audio to 2-channel spatial audio by using a spatial mixer audio unit.
Audio Unit v3 Plug-Ins
Deliver custom audio effects, instruments, and other audio behaviors using an Audio Unit v3
app extension.
Audio Components
Find, load, and configure audio components, such as Audio Units and audio codecs.
Audio Unit Properties
Obtain information about the built-in mixers, equalizers, filters, effects, and other Audio Unit
app extensions.
Audio Unit Voice I/O
Configure system voice processing and respond to speech events.
See Also
Audio Units


## Page 24

Other Plug-In Formats
RenderQuality
Render quality settings for audio units.
General Audio Unit Properties
Properties that apply to any audio unit.
struct HostCallbackInfo
The time- and transport-related callback functions for an audio unit.
Audio Unit Mixer Subtypes
enum AUSpatialMixerAttenuationCurve
struct AUSpatialMixerRenderingFlags
AUSpatialMixer Parameters
Panner Audio Unit Parameters
AUMatrixMixer Parameters
AUMultiChannelMixer Parameters
Topics
General
Mixers
Audio Toolbox / Audio Unit Properties
API Collection
Audio Unit Properties
Obtain information about the built-in mixers, equalizers, filters, effects, and other
Audio Unit app extensions.


## Page 25

Parameters for the Multichannel Mixer unit.
Spatial Mixer Property IDs
Stereo Mixer Unit Parameters
Mixer Audio Unit Properties
Properties for Apple mixer audio units.
Mixer Audio Unit Subtypes
Audio mixing audio unit subtypes for audio units provided by Apple.
enum AUSpatialMixerOutputType
enum AUSpatialMixerPointSourceInHeadMode
enum AUSpatialMixerSourceMode
3D Mixer Unit Parameters
Parameters for the 3D Mixer unit.
enum AU3DMixerAttenuationCurve
struct AU3DMixerRenderingFlags
struct MixerDistanceParams
Parametric EQ Unit Parameters
Parameters for the Parametric EQ unit.
Audio Unit Graphic EQ Parameter ID
Peak Limiter Unit Parameters
Parameters for the Peak Limiter unit.
Dynamics Processor Unit Parameters
Parameters for the Dynamics Processor unit.
Frequency Response Constants
The maximum number of frequency response bin structures for the AudioUnitProperty
_FrequencyResponse property.
enum AUSpatializationAlgorithm
Equalizers


## Page 26

Audio Unit Filter Subtypes
Bandpass Unit Parameters
Parameters for the Bandpass unit.
AUHipass Parameters
Parameters for the Highpass unit.
AULowpass Parameters
Parameters for the Lowpass unit.
AULowShelf Parameters
Parameters for the Low Shelf Filter unit.
AUHighShelfFilter Parameters
Parameters for the High Shelf Filter unit.
AUNBandEQ Filter Types
Values for the filter type parameter of the Multitype EQ (NBandEQ) unit.
AUNBandEQ Property IDs
AUNBandEQ Parameters
Effect Audio Unit Subtypes
Effect (digital signal processing) audio unit subtypes for audio units provided by Apple.
AUMatrixReverb Parameters
AUDistortion Parameters
Reverb Parameters
Additional reverb parameters.
Reverb Unit Parameters
Parameters for the Reverb unit.
enum AUReverbRoomType
Varispeed Unit Parameters
Filters
Effects


## Page 27

Parameters for the Varispeed unit.
AUDelay Parameters
AUMultibandCompressor Parameters
AUDeferredRenderer Properties
AUSampleDelay Parameters
AUNewTimePitch Parameters
AUTimePitch, AUTimePitch (offline), and AUPitch Unit Parameters
I/O Audio Unit Properties
Properties for Apple I/O audio units (sometimes called output units).
Inter-App Output Unit Property IDs
Inter-App Audio Unit Property IDs
Output Unit Parameters
AUNetReceive Properties
AUNetSend Properties
AUNetSend Parameters
AUNetReceive Parameters
AUNetSendPresetFormat Properties
Net Status Audio Unit Parameters
I/O Audio Unit Function Selectors
Audio unit component selectors, specific to I/O audio units, that correspond to functions in t
audio unit API.
struct AudioOutputUnitMIDICallbacks
struct AudioOutputUnitStartAtTimeParams
A timestamp for scheduled starting of an I/O audio unit.
AURandom Parameters
Input/Output
Generators


## Page 28

AUSampler Parameters
AUSampler Property IDs
AUSampler Properties
AURogerBeep Parameters
AUMIDISynth Properties
AURoundTripAACParam Parameters
Generating spatial audio from a multichannel audio stream
Convert 8-channel audio to 2-channel spatial audio by using a spatial mixer audio unit.
Audio Unit v3 Plug-Ins
Deliver custom audio effects, instruments, and other audio behaviors using an Audio Unit v3
app extension.
Audio Components
Find, load, and configure audio components, such as Audio Units and audio codecs.
Audio Unit v2 (C) API
Configure an Audio Unit and prepare it to render audio.
Audio Unit Voice I/O
Configure system voice processing and respond to speech events.
See Also
Audio Units


## Page 29

var kAUVoiceIOProperty_MutedSpeechActivityEventListener: AudioUnit
PropertyID
A property to register a listener that the system calls when it detects speech while the user
has the microphone muted.
typealias AUVoiceIOMutedSpeechActivityEventListener
A block that the system calls to indicate speech activity while the user has the microphone
muted.
enum AUVoiceIOSpeechActivityEvent
Constants that indicate the state of muted speech.
var kAUVoiceIOProperty_BypassVoiceProcessing: AudioUnitPropertyID
A property that bypasses all processing for microphone uplink done by the voice processing
unit.
var kAUVoiceIOProperty_VoiceProcessingEnableAGC: AudioUnitPropertyID
A property to enable automatic gain control on the processed microphone uplink.
var kAUVoiceIOProperty_MuteOutput: AudioUnitPropertyID
A property to mute the output of the processed microphone uplink.
Topics
Observing muted speech
Configuring voice processing
Audio Toolbox / Audio Unit Voice I/O
API Collection
Audio Unit Voice I/O
Configure system voice processing and respond to speech events.


## Page 30

struct AUVoiceIOOtherAudioDuckingConfiguration
A structure that you use to configure ducking of other non-voice audio in a voice chat.
var kAUVoiceIOErr_UnexpectedNumberOfInputChannels: OSStatus
An error that indicates that the audio unit encountered an unexpected number of input
channels during initialization.
Generating spatial audio from a multichannel audio stream
Convert 8-channel audio to 2-channel spatial audio by using a spatial mixer audio unit.
Audio Unit v3 Plug-Ins
Deliver custom audio effects, instruments, and other audio behaviors using an Audio Unit v3
app extension.
Audio Components
Find, load, and configure audio components, such as Audio Units and audio codecs.
Audio Unit v2 (C) API
Configure an Audio Unit and prepare it to render audio.
Audio Unit Properties
Obtain information about the built-in mixers, equalizers, filters, effects, and other Audio Unit
app extensions.
Configuring ducking of other audio
Inspecting errors
See Also
Audio Units


