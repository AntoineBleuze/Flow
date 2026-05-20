# Deprecated.pdf

## Page 1

Inter-App Audio is deprecated in iOS 13 and is unavailable when running iPad apps in macOS.
func AudioOutputUnitPublish(UnsafePointer<AudioComponentDescription>,
CFString, UInt32, AudioUnit) -> OSStatus
Registers an audio output unit for use by other applications.
Deprecated
func AudioOutputUnitGetHostIcon(AudioUnit, Float) -> UIImage?
The host app’s icon.
Deprecated
func AudioComponentGetIcon(AudioComponent, Float) -> UIImage?
The UIImage of the audio component’s icon.
Deprecated
func AudioComponentGetLastActiveTime(AudioComponent) -> CFAbsoluteTime
The time at which the application publishing the component was last active.
Deprecated
func AudioFileReadPackets(AudioFileID, Bool, UnsafeMutablePointer<UInt3
>, UnsafeMutablePointer<AudioStreamPacketDescription>?, Int64, Unsafe
MutablePointer<UInt32>, UnsafeMutableRawPointer?) -> OSStatus
Topics
Inter-App Audio
Functions
Audio Toolbox / Deprecated Symbols
API Collection
Deprecated Symbols
Review unsupported symbols and their replacements.


## Page 2

Reads a fixed duration of audio data from an audio file.
Deprecated
func AudioComponentGetIcon(AudioComponent, Float) -> UIImage?
The UIImage of the audio component’s icon.
Deprecated
func AudioComponentGetLastActiveTime(AudioComponent) -> CFAbsoluteTime
The time at which the application publishing the component was last active.
Deprecated
func AudioHardwareServiceAddPropertyListener(AudioObjectID, Unsafe
Pointer<AudioObjectPropertyAddress>!, AudioObjectPropertyListenerProc!,
UnsafeMutableRawPointer!) -> OSStatus
Registers a HAL audio object property listener callback function to be invoked when a
specified property changes.
Deprecated
func AudioHardwareServiceGetPropertyData(AudioObjectID, UnsafePointer<
AudioObjectPropertyAddress>!, UInt32, UnsafeRawPointer!, UnsafeMutable
Pointer<UInt32>!, UnsafeMutableRawPointer!) -> OSStatus
Gets the value for a specified property.
Deprecated
func AudioHardwareServiceGetPropertyDataSize(AudioObjectID, Unsafe
Pointer<AudioObjectPropertyAddress>!, UInt32, UnsafeRawPointer!, Unsafe
MutablePointer<UInt32>!) -> OSStatus
Gets the payload size for a given property.
Deprecated
func AudioHardwareServiceHasProperty(AudioObjectID, UnsafePointer<Audio
ObjectPropertyAddress>!) -> Bool
Queries a HAL audio object about whether or not it has a specified property.
Deprecated
func AudioHardwareServiceIsPropertySettable(AudioObjectID, UnsafePointe
<AudioObjectPropertyAddress>!, UnsafeMutablePointer<DarwinBoolean>!) ->
OSStatus
Queries a HAL audio object about whether a specified property is settable.
Deprecated


## Page 3

func AudioHardwareServiceRemovePropertyListener(AudioObjectID, Unsafe
Pointer<AudioObjectPropertyAddress>!, AudioObjectPropertyListenerProc!,
UnsafeMutableRawPointer!) -> OSStatus
Unregisters a HAL audio object property listener callback function.
Deprecated
func AudioHardwareServiceSetPropertyData(AudioObjectID, UnsafePointer<
AudioObjectPropertyAddress>!, UInt32, UnsafeRawPointer!, UInt32, Unsafe
RawPointer!) -> OSStatus
Asks a HAL audio object to change the value of a specified property.
Deprecated
func AudioOutputUnitGetHostIcon(AudioUnit, Float) -> UIImage?
The host app’s icon.
Deprecated
func AudioOutputUnitPublish(UnsafePointer<AudioComponentDescription>,
CFString, UInt32, AudioUnit) -> OSStatus
Registers an audio output unit for use by other applications.
Deprecated
func AudioSessionAddPropertyListener(AudioSessionPropertyID, Audio
SessionPropertyListener!, UnsafeMutableRawPointer!) -> OSStatus
Adds a property listener callback function to your application’s audio session object.
Deprecated
func AudioSessionGetProperty(AudioSessionPropertyID, UnsafeMutable
Pointer<UInt32>!, UnsafeMutableRawPointer!) -> OSStatus
Gets the value of a specified audio session property.
Deprecated
func AudioSessionGetPropertySize(AudioSessionPropertyID, UnsafeMutable
Pointer<UInt32>!) -> OSStatus
Gets the size of the value for a specified audio session property.
Deprecated
func AudioSessionInitialize(CFRunLoop!, CFString!, AudioSession
InterruptionListener!, UnsafeMutableRawPointer!) -> OSStatus
Initializes an iOS application’s audio session object.
Deprecated


## Page 4

func AudioSessionRemovePropertyListener(AudioSessionPropertyID) ->
OSStatus
Removes an audio session property listener callback function.
Deprecated
func AudioSessionRemovePropertyListenerWithUserData(AudioSessionPropert
ID, AudioSessionPropertyListener!, UnsafeMutableRawPointer!) -> OSStatu
Removes a property listener callback function from your application’s audio session object.
Deprecated
func AudioSessionSetActive(Bool) -> OSStatus
Actives or deactivates your application’s audio session.
Deprecated
func AudioSessionSetActiveWithFlags(Bool, UInt32) -> OSStatus
Activates or deactivates your application’s audio session; provides flags for use by other aud
sessions.
Deprecated
func AudioSessionSetProperty(AudioSessionPropertyID, UInt32, UnsafeRaw
Pointer!) -> OSStatus
Sets the value of a specified audio session property.
Deprecated
typealias AudioSessionInterruptionListener
Invoked when an audio interruption in iOS begins or ends.
Deprecated
typealias AudioSessionPropertyListener
Invoked when an audio session property changes in iOS.
Deprecated
struct ExtendedControlEvent
typealias MIDIEndpointRef
A MIDI source or destination an entity owns.
Callbacks
Data Types


## Page 5

typealias MagicCookieInfo
A structure holding magic cookie information.
Deprecated
typealias NoteInstanceID
typealias ReadBytesFDF
typealias ReadPacketDataFDF
typealias ReadPacketsFDF
typealias SetPropertyFDF
typealias SetUserDataFDF
typealias WriteBytesFDF
typealias WritePacketsFDF
typealias AudioSessionPropertyID
The data type for an audio session property identifier.
Deprecated
Audio Unit Attenuation Properties
Audio Unit Instrument Errors
Anonymous
Anonymous
Audio Graph Errors
Audio Converter Property ID
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Constants


## Page 6

Music Device Properties
3D Mixer Audio Unit Properties
Properties for the Apple 3D Mixer audio unit.
var kAudioSession_AudioRouteChangeKey_OldRoute: String
var AU_SUPPORT_INTERAPP_AUDIO: Int32
Hardware Codec Capabilities
A constant to determine which hardware codecs can be used.
Deprecated Audio Codec Properties
Deprecated Constants Used With kAudioCodecBitRateFormat
Deprecated Constants Used With kAudioCodecOutputPrecedence
Deprecated Constants Used With kAudioSettings_Hint
Deprecated Audio Session Categories
Deprecated category identifiers for audio sessions. Do not use for new development.
Audio Unit Processing Graph Services
Audio Unit Processing Graph Services provide interfaces for representing a set of audio unit
connections between their inputs and outputs, and callbacks used to provide inputs. It also
enables the embedding of sub (or child) processing graphs within parent graphs to allow for
logical organization of parts of an overall signal chain.
Audio Graphs


