# Playback and Recording.pdf

## Page 1

This document describes Audio Queue Services, a C programming interface in the Audio Toolbox
framework, which is part of Core Audio.
An audio queue is a software object you use for recording or playing audio. An audio queue does
the work of:
Connecting to audio hardware
Managing memory
Employing codecs, as needed, for compressed audio formats
Mediating playback or recording
Audio Queue Services enables you to record and play audio in linear PCM, in compressed formats
(such as Apple Lossless and AAC), and in other formats for which users have installed codecs.
Audio Queue Services also supports scheduled playback and synchronization of multiple audio
queues and synchronization of audio with video.
Note
Audio Queue Services provides features similar to those previously offered by the Sound
Manager and in macOS. It adds additional features such as synchronization. The Sound
Manager is deprecated in OS X v10.5 and does not work with 64-bit applications. Audio Queue
Services is recommended for all new development and as a replacement for the Sound
Manager in existing Mac apps.
Overview
Audio Toolbox / Audio Queue Services
API Collection
Audio Queue Services
Connect to audio hardware and manage the recording or playback process.


## Page 2

func AudioQueueNewOutputWithDispatchQueue(UnsafeMutablePointer<Audio
QueueRef?>, UnsafePointer<AudioStreamBasicDescription>, UInt32, dispatc
_queue_t, AudioQueueOutputCallbackBlock) -> OSStatus
func AudioQueueNewInputWithDispatchQueue(UnsafeMutablePointer<AudioQueu
Ref?>, UnsafePointer<AudioStreamBasicDescription>, UInt32, dispatch
_queue_t, AudioQueueInputCallbackBlock) -> OSStatus
func AudioQueueNewOutput(UnsafePointer<AudioStreamBasicDescription>,
AudioQueueOutputCallback, UnsafeMutableRawPointer?, CFRunLoop?, CFStrin
?, UInt32, UnsafeMutablePointer<AudioQueueRef?>) -> OSStatus
Creates a new playback audio queue object.
func AudioQueueNewInput(UnsafePointer<AudioStreamBasicDescription>,
AudioQueueInputCallback, UnsafeMutableRawPointer?, CFRunLoop?, CFString
?, UInt32, UnsafeMutablePointer<AudioQueueRef?>) -> OSStatus
Creates a new recording audio queue object.
func AudioQueueDispose(AudioQueueRef, Bool) -> OSStatus
Disposes of an audio queue.
typealias AudioQueueRef
Defines an opaque data type that represents an audio queue.
typealias AudioQueueInputCallbackBlock
typealias AudioQueueOutputCallbackBlock
func AudioQueueStart(AudioQueueRef, UnsafePointer<AudioTimeStamp>?) ->
OSStatus
Begins playing or recording audio.
func AudioQueuePrime(AudioQueueRef, UInt32, UnsafeMutablePointer<UInt32
>?) -> OSStatus
Decodes enqueued buffers in preparation for playback.
Topics
Creating and Disposing of Audio Queues
Controlling Audio Queues


## Page 3

func AudioQueueFlush(AudioQueueRef) -> OSStatus
Resets an audio queue’s decoder state.
func AudioQueueStop(AudioQueueRef, Bool) -> OSStatus
Stops playing or recording audio.
func AudioQueuePause(AudioQueueRef) -> OSStatus
Pauses audio playback or recording.
func AudioQueueReset(AudioQueueRef) -> OSStatus
Resets an audio queue.
func AudioQueueAllocateBuffer(AudioQueueRef, UInt32, UnsafeMutable
Pointer<AudioQueueBufferRef?>) -> OSStatus
Asks an audio queue object to allocate an audio queue buffer.
func AudioQueueAllocateBufferWithPacketDescriptions(AudioQueueRef,
UInt32, UInt32, UnsafeMutablePointer<AudioQueueBufferRef?>) -> OSStatus
Asks an audio queue object to allocate an audio queue buffer with space for packet
descriptions.
func AudioQueueFreeBuffer(AudioQueueRef, AudioQueueBufferRef) ->
OSStatus
Asks an audio queue to dispose of an audio queue buffer.
func AudioQueueEnqueueBuffer(AudioQueueRef, AudioQueueBufferRef, UInt32
UnsafePointer<AudioStreamPacketDescription>?) -> OSStatus
Adds a buffer to the buffer queue of a recording or playback audio queue.
func AudioQueueEnqueueBufferWithParameters(AudioQueueRef, AudioQueue
BufferRef, UInt32, UnsafePointer<AudioStreamPacketDescription>?, UInt32
UInt32, UInt32, UnsafePointer<AudioQueueParameterEvent>?, UnsafePointer
AudioTimeStamp>?, UnsafeMutablePointer<AudioTimeStamp>?) -> OSStatus
Adds a buffer to the buffer queue of a playback audio queue object, specifying start time an
other settings.
func AudioQueueProcessingTapNew(AudioQueueRef, AudioQueueProcessingTap
Callback, UnsafeMutableRawPointer?, AudioQueueProcessingTapFlags, Unsaf
Handling Audio Queue Buffers
Tapping the Queue’s Audio


## Page 4

MutablePointer<UInt32>, UnsafeMutablePointer<AudioStreamBasicDescriptio
>, UnsafeMutablePointer<AudioQueueProcessingTapRef?>) -> OSStatus
func AudioQueueProcessingTapGetQueueTime(AudioQueueProcessingTapRef,
UnsafeMutablePointer<Float64>, UnsafeMutablePointer<UInt32>) -> OSStatu
func AudioQueueProcessingTapGetSourceAudio(AudioQueueProcessingTapRef,
UInt32, UnsafeMutablePointer<AudioTimeStamp>, UnsafeMutablePointer<Audi
QueueProcessingTapFlags>, UnsafeMutablePointer<UInt32>, UnsafeMutable
Pointer<AudioBufferList>) -> OSStatus
func AudioQueueProcessingTapDispose(AudioQueueProcessingTapRef) ->
OSStatus
func AudioQueueGetParameter(AudioQueueRef, AudioQueueParameterID, Unsaf
MutablePointer<AudioQueueParameterValue>) -> OSStatus
Gets an audio queue parameter value.
func AudioQueueSetParameter(AudioQueueRef, AudioQueueParameterID, Audio
QueueParameterValue) -> OSStatus
Sets a playback audio queue parameter value.
func AudioQueueGetProperty(AudioQueueRef, AudioQueuePropertyID, Unsafe
MutableRawPointer, UnsafeMutablePointer<UInt32>) -> OSStatus
Gets an audio queue property value.
func AudioQueueSetProperty(AudioQueueRef, AudioQueuePropertyID, Unsafe
RawPointer, UInt32) -> OSStatus
Sets an audio queue property value.
func AudioQueueGetPropertySize(AudioQueueRef, AudioQueuePropertyID,
UnsafeMutablePointer<UInt32>) -> OSStatus
Gets the size of the value of an audio queue property.
func AudioQueueAddPropertyListener(AudioQueueRef, AudioQueuePropertyID,
AudioQueuePropertyListenerProc, UnsafeMutableRawPointer?) -> OSStatus
Adds a property listener callback to an audio queue.
Manipulating Audio Queue Parameters
Manipulating Audio Queue Properties


## Page 5

func AudioQueueRemovePropertyListener(AudioQueueRef, AudioQueueProperty
ID, AudioQueuePropertyListenerProc, UnsafeMutableRawPointer?) ->
OSStatus
Removes a property listener callback from an audio queue.
func AudioQueueCreateTimeline(AudioQueueRef, UnsafeMutablePointer<Audio
QueueTimelineRef?>) -> OSStatus
Creates a timeline object for an audio queue.
func AudioQueueDisposeTimeline(AudioQueueRef, AudioQueueTimelineRef) ->
OSStatus
Disposes of an audio queue’s timeline object.
func AudioQueueDeviceGetCurrentTime(AudioQueueRef, UnsafeMutablePointer
AudioTimeStamp>) -> OSStatus
Gets the current time of the audio hardware device associated with an audio queue.
func AudioQueueDeviceGetNearestStartTime(AudioQueueRef, UnsafeMutable
Pointer<AudioTimeStamp>, UInt32) -> OSStatus
Gets the start time, for an audio hardware device, that is closest to a requested start time.
func AudioQueueDeviceTranslateTime(AudioQueueRef, UnsafePointer<Audio
TimeStamp>, UnsafeMutablePointer<AudioTimeStamp>) -> OSStatus
Converts the time for an audio queue’s associated audio hardware device from one time bas
representation to another.
func AudioQueueGetCurrentTime(AudioQueueRef, AudioQueueTimelineRef?,
UnsafeMutablePointer<AudioTimeStamp>?, UnsafeMutablePointer<Darwin
Boolean>?) -> OSStatus
Gets the current audio queue time.
typealias AudioQueueTimelineRef
Defines an opaque data type that represents an audio queue timeline object.
func AudioQueueSetOfflineRenderFormat(AudioQueueRef, UnsafePointer<Audi
StreamBasicDescription>?, UnsafePointer<AudioChannelLayout>?) ->
OSStatus
Sets the rendering mode and audio format for a playback audio queue.
Managing the Timeline
Performing Offline Rendering


## Page 6

func AudioQueueOfflineRender(AudioQueueRef, UnsafePointer<AudioTimeStam
>, AudioQueueBufferRef, UInt32) -> OSStatus
Exports audio to a buffer, instead of to a device, using a playback audio queue.
typealias AudioQueueInputCallback
Called by the system when a recording audio queue has finished filling an audio queue buffe
typealias AudioQueueOutputCallback
Called by the system when an audio queue buffer is available for reuse.
typealias AudioQueuePropertyListenerProc
Called by the system when a specified audio queue property changes value.
struct AudioQueueChannelAssignment
struct AudioQueueProcessingTapFlags
struct AudioQueueBuffer
Defines an audio queue buffer.
typealias AudioQueueBufferRef
A pointer to an audio queue buffer.
struct AudioQueueLevelMeterState
Specifies the current level metering information for one channel of an audio queue.
struct AudioQueueParameterEvent
Specifies an audio queue parameter and associated value.
typealias AudioQueueParameterID
A UInt32 value that uniquely identifies an audio queue parameter.
typealias AudioQueueParameterValue
A Float32 value for an audio queue parameter.
typealias AudioQueueProcessingTapCallback
typealias AudioQueueProcessingTapRef
Callbacks
Data Types


## Page 7

struct AudioUnitConnection
An audio unit source-to-destination connection specification.
struct AudioUnitEvent
struct AudioUnitExternalBuffer
Allows an audio unit host application to tell an audio unit to use a specified buffer for its inpu
callback.
struct AudioUnitFrequencyResponseBin
An audio unit’s audio level at a particular frequency.
struct AudioUnitMeterClipping
Audio clipping that has occurred in a mixer unit.
struct AudioUnitMIDIControlMapping
struct AudioUnitOtherPluginDesc
struct AudioUnitParameter
An adjustable audio unit attribute such as volume, pitch, or filter cutoff frequency.
struct AudioUnitParameterEvent
A scheduled change to an audio unit parameter’s value.
struct AudioUnitParameterHistoryInfo
The suggested update rate and history duration for parameters which have the flag_Plot
History flag set.
struct AudioUnitParameterNameInfo
A short version of the name for an audio unit parameter.
typealias AudioUnitParameterIDName
A type definition for a data type that defines the short version of the name for an audio unit
parameter.
struct AudioUnitParameterInfo
struct AudioUnitParameterOptions
Value options for audio unit parameters.
struct AudioUnitParameterStringFromValue
Structures


## Page 8

A string representation of a parameter’s value.
struct AudioUnitParameterValueFromString
A parameter’s value based on a string representation of the value.
struct AudioUnitParameterValueName
struct AudioUnitParameterValueTranslation
struct AudioUnitPresetMAS_SettingData
struct AudioUnitPresetMAS_Settings
struct AudioUnitProperty
A key-value pair that declares an attribute or behavior for an audio unit.
struct AudioUnitRenderActionFlags
Flags for configuring audio unit rendering.
struct AU3DMixerRenderingFlags
struct AUChannelInfo
The audio input and output channel capabilities for an audio unit.
struct AUDependentParameter
An audio unit parameter whose value can change in response to a change in its parent
metaparameter.
struct AUDistanceAttenuationData
Deprecated
struct AUHostIdentifier
struct AUHostTransportStateFlags
struct AUHostVersionIdentifier
The name and version of an audio unit’s host application.
struct AUInputSamplesInOutputCallbackStruct
The callback function and custom data for providing input-to-output sample mapping for an
audio unit.
struct AUMIDIEvent
A structure that describes a scheduled MIDI event.
struct AUMIDIOutputCallbackStruct
The callback function and custom data for an audio unit that provides MIDI output.


## Page 9

struct AUNumVersion
struct AUParameterAutomationEvent
struct AUParameterEvent
A structure that describes a scheduled parameter event.
struct AUParameterMIDIMapping
struct AUParameterMIDIMappingFlags
struct AUPreset
Used to set factory presets for an audio unit.
struct AUPresetEvent
Describes an audio unit preset.
struct AURecordedParameterEvent
An event recording the changing of a parameter at a particular host time.
struct AURenderCallbackStruct
Used for registering an input callback function with an audio unit.
struct AURenderEvent
A union of the various specific render event types.
struct AURenderEventHeader
The common header for a render event.
struct AUSamplerBankPresetData
struct AUSamplerInstrumentData
struct AUScheduledAudioSliceFlags
struct AUSpatialMixerRenderingFlags
struct AudioQueueProcessingTapFlags
Anonymous
Audio Queue Time Pitch Algorithms
Audio Queue Property IDs
Audio Queue Property IDs
Enumerations


## Page 10

Audio Queue Hardware Codec Policy
typealias AudioQueuePropertyID
Identifiers for audio queue properties.
Audio Queue Parameters
Identifiers for audio queue parameters.
Hardware Codec Policy Keys
Indicates how an audio queue should choose between hardware and software
implementations of a codec.
This table lists result codes defined for Audio Queue Services.
var kAudioQueueErr_InvalidBuffer: OSStatus
The specified audio queue buffer does not belong to the specified audio queue.
var kAudioQueueErr_BufferEmpty: OSStatus
The audio queue buffer is empty (that is, the mAudioDataByteSize field = 0).
var kAudioQueueErr_DisposalPending: OSStatus
The function cannot act on the audio queue because it is being asynchronously disposed of.
var kAudioQueueErr_InvalidProperty: OSStatus
The specified property ID is invalid.
var kAudioQueueErr_InvalidPropertySize: OSStatus
The size of the specified property is invalid.
var kAudioQueueErr_InvalidParameter: OSStatus
The specified parameter ID is invalid.
var kAudioQueueErr_CannotStart: OSStatus
The audio queue has encountered a problem and cannot start.
var kAudioQueueErr_InvalidDevice: OSStatus
The specified audio hardware device could not be located.
var kAudioQueueErr_BufferInQueue: OSStatus
Constants
Result Codes


## Page 11

The audio queue buffer cannot be disposed of when it is enqueued.
var kAudioQueueErr_InvalidRunState: OSStatus
The queue is running but the function can only operate on the queue when it is stopped, or
vice versa.
var kAudioQueueErr_InvalidQueueType: OSStatus
The queue is an input queue but the function can only operate on an output queue, or vice
versa.
var kAudioQueueErr_Permissions: OSStatus
You do not have the required permissions to call the function.
var kAudioQueueErr_InvalidPropertyValue: OSStatus
The property value used is not valid.
var kAudioQueueErr_PrimeTimedOut: OSStatus
During a call to the AudioQueuePrime(_:_:_:) function, the audio queue’s audio
converter failed to convert the requested number of sample frames.
var kAudioQueueErr_CodecNotFound: OSStatus
The requested codec was not found.
var kAudioQueueErr_InvalidCodecAccess: OSStatus
The codec could not be accessed.
var kAudioQueueErr_QueueInvalidated: OSStatus
In iOS, the audio server has exited, causing the audio queue to become invalid.
var kAudioQueueErr_RecordUnderrun: OSStatus
During recording, data was lost because there was no enqueued buffer to store it in.
var kAudioQueueErr_EnqueueDuringReset: OSStatus
During a call to the AudioQueueReset(_:), AudioQueueStop(_:_:), or AudioQueue
Dispose(_:_:) functions, the system does not allow you to enqueue buffers.
var kAudioQueueErr_InvalidOfflineMode: OSStatus
The operation requires the audio queue to be in offline mode but it isn’t, or vice versa.
var kAudioFormatUnsupportedDataFormatError: OSStatus
The playback data format is unsupported (declared in AudioFormat.h).


## Page 12

Audio Services
Play short sounds or trigger a vibration effect on iOS devices with the appropriate hardware.
Music Player
Create and play a sequence of tracks, and manage aspects of playback in response to
standard events.
Anchoring sound to a window or volume
Provide unique app experiences by attaching sounds to windows and volumes in 3D space.
See Also
Playback and Recording


## Page 13

System Sound Services provides a C interface for playing short sounds and for invoking vibration
on iOS devices that support vibration.
You can use System Sound Services to play short (30 seconds or shorter) sounds. The interface
does not provide level, positioning, looping, or timing control, and does not support simultaneous
playback: You can play only one sound at a time. You can use System Sound Services to provide
audible alerts. On some iOS devices, alerts can include vibration.
func AudioServicesCreateSystemSoundID(CFURL, UnsafeMutablePointer<Syste
SoundID>) -> OSStatus
Creates a system sound object.
func AudioServicesDisposeSystemSoundID(SystemSoundID) -> OSStatus
Disposes of a system sound object and associated resources.
typealias SystemSoundID
A system sound object, identified with a sound file you want to play.
System Sounds
Overview
Topics
Creating and Disposing of System Sound Objects
Audio Toolbox / Audio Services
API Collection
Audio Services
Play short sounds or trigger a vibration effect on iOS devices with the appropriate
hardware.


## Page 14

Alert Sound Identifiers
Identifiers for alert sounds and alternatives to sounds, for use with the AudioServicesPla
AlertSound(_:) function.
func AudioServicesPlayAlertSoundWithCompletion(SystemSoundID, (() ->
Void)?)
func AudioServicesPlaySystemSoundWithCompletion(SystemSoundID, (() ->
Void)?)
func AudioServicesPlayAlertSound(SystemSoundID)
Plays a system sound as an alert.
func AudioServicesPlaySystemSound(SystemSoundID)
Plays a system sound object.
func AudioServicesAddSystemSoundCompletion(SystemSoundID, CFRunLoop?,
CFString?, AudioServicesSystemSoundCompletionProc, UnsafeMutableRaw
Pointer?) -> OSStatus
Registers a callback function that is invoked when a specified system sound finishes playing
func AudioServicesRemoveSystemSoundCompletion(SystemSoundID)
Unregisters any completion callback functions that were registered for a specified system
sound.
typealias AudioServicesSystemSoundCompletionProc
A function the system invokes when a system sound finishes playing.
func AudioServicesGetPropertyInfo(AudioServicesPropertyID, UInt32,
UnsafeRawPointer?, UnsafeMutablePointer<UInt32>?, UnsafeMutablePointer<
DarwinBoolean>?) -> OSStatus
Gets information about a System Sound Services property.
func AudioServicesGetProperty(AudioServicesPropertyID, UInt32, UnsafeRa
Pointer?, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer?) ->
OSStatus
Playing Sounds
Adding and Removing System Sound Callbacks
Managing System Sound Services Properties


## Page 15

Gets a specified System Sound Services property value.
func AudioServicesSetProperty(AudioServicesPropertyID, UInt32, UnsafeRa
Pointer?, UInt32, UnsafeRawPointer) -> OSStatus
Sets the value for a specified System Sound Services property.
typealias AudioServicesPropertyID
The data type for a system sound property identifier.
System Sound Services Property Identifiers
Property identifiers used when playing alerts with System Sound Services.
Audio Hardware Services Properties
Property identifiers that apply to HAL audio objects only when accessed via the Audio
Hardware Services.
This table lists the result codes defined for System Sound Services.
Audio Services Errors
var kAudioServicesNoError: OSStatus
No error has occurred.
var kAudioServicesUnsupportedPropertyError: OSStatus
The property is not supported.
var kAudioServicesBadPropertySizeError: OSStatus
The size of the property data was not correct.
var kAudioServicesBadSpecifierSizeError: OSStatus
The size of the specifier data was not correct.
var kAudioServicesSystemSoundUnspecifiedError: OSStatus
An unspecified error has occurred.
var kAudioServicesSystemSoundClientTimedOutError: OSStatus
System sound client message timed out.
Getting Error Codes
See Also


## Page 16

Audio Queue Services
Connect to audio hardware and manage the recording or playback process.
Music Player
Create and play a sequence of tracks, and manage aspects of playback in response to
standard events.
Anchoring sound to a window or volume
Provide unique app experiences by attaching sounds to windows and volumes in 3D space.
Playback and Recording


## Page 17

func NewMusicPlayer(UnsafeMutablePointer<MusicPlayer?>) -> OSStatus
Creates a new music player.
func DisposeMusicPlayer(MusicPlayer) -> OSStatus
Disposes of a music player.
func MusicPlayerGetBeatsForHostTime(MusicPlayer, UInt64, UnsafeMutable
Pointer<MusicTimeStamp>) -> OSStatus
Gets the beat number associated a specified host time.
func MusicPlayerGetHostTimeForBeats(MusicPlayer, MusicTimeStamp, Unsafe
MutablePointer<UInt64>) -> OSStatus
Gets the host time associated with a specified beat.
func MusicPlayerGetPlayRateScalar(MusicPlayer, UnsafeMutablePointer<
Float64>) -> OSStatus
Gets the playback rate multiplier for a music player.
func MusicPlayerGetSequence(MusicPlayer, UnsafeMutablePointer<Music
Sequence?>) -> OSStatus
Gets the music sequence associated with a music player.
func MusicPlayerGetTime(MusicPlayer, UnsafeMutablePointer<MusicTimeStam
>) -> OSStatus
Topics
Managing a Music Player
Audio Toolbox / Music Player
API Collection
Music Player
Create and play a sequence of tracks, and manage aspects of playback in
response to standard events.


## Page 18

Gets the playback point for a music player, in beats.
func MusicPlayerIsPlaying(MusicPlayer, UnsafeMutablePointer<Darwin
Boolean>) -> OSStatus
Indicates whether or not a music player is playing.
func MusicPlayerPreroll(MusicPlayer) -> OSStatus
Prepares a music player to play.
func MusicPlayerSetPlayRateScalar(MusicPlayer, Float64) -> OSStatus
Sets a playback rate multiplier for a music player.
func MusicPlayerSetSequence(MusicPlayer, MusicSequence?) -> OSStatus
Sets the music sequence for the music player to play.
func MusicPlayerSetTime(MusicPlayer, MusicTimeStamp) -> OSStatus
Sets the playback point for a music player, in beats.
func MusicPlayerStart(MusicPlayer) -> OSStatus
Starts playback of a music player.
func MusicPlayerStop(MusicPlayer) -> OSStatus
Stops playback of a music player.
typealias MusicPlayer
A music player plays a music sequence (of type MusicSequence).
typealias MusicTimeStamp
A timestamp for use by a music sequence.
var kMusicTimeStamp_EndOfTrack: Double
Indicates a time immediately beyond the last music event in a music track. Use this value
when selecting all music events starting at a designated time and extending to, and including
the last event in a track. Also use this value to position an iterator for moving backward
through a track, from the end to the start. See also NewMusicEventIterator(_:_:) and
MusicEventIteratorSeek(_:_:).
func NewMusicEventIterator(MusicTrack, UnsafeMutablePointer<MusicEvent
Iterator?>) -> OSStatus
Creates a new music event iterator.
Iterating Over Music Events


## Page 19

func DisposeMusicEventIterator(MusicEventIterator) -> OSStatus
Disposes of a music event iterator.
func MusicEventIteratorNextEvent(MusicEventIterator) -> OSStatus
Positions a music event iterator at the next event on a music track.
func MusicEventIteratorSeek(MusicEventIterator, MusicTimeStamp) ->
OSStatus
Positions a music event iterator at a specified timestamp, in beats.
func MusicEventIteratorDeleteEvent(MusicEventIterator) -> OSStatus
Deletes the event at a music event iterator’s current position.
func MusicEventIteratorGetEventInfo(MusicEventIterator, UnsafeMutable
Pointer<MusicTimeStamp>, UnsafeMutablePointer<MusicEventType>, Unsafe
MutablePointer<UnsafeRawPointer?>, UnsafeMutablePointer<UInt32>) ->
OSStatus
Gets information about the event at a music event iterator’s current position.
func MusicEventIteratorHasCurrentEvent(MusicEventIterator, UnsafeMutabl
Pointer<DarwinBoolean>) -> OSStatus
Indicates whether or not a music track contains an event at the music event iterator’s curren
position.
func MusicEventIteratorHasNextEvent(MusicEventIterator, UnsafeMutable
Pointer<DarwinBoolean>) -> OSStatus
Indicates whether or not a music track contains an event beyond the music event iterator’s
current position.
func MusicEventIteratorHasPreviousEvent(MusicEventIterator, Unsafe
MutablePointer<DarwinBoolean>) -> OSStatus
Indicates whether or not a music track contains an event before the music event iterator’s
current position.
func MusicEventIteratorPreviousEvent(MusicEventIterator) -> OSStatus
Positions a music event iterator at the previous event on a music track.
func MusicEventIteratorSetEventInfo(MusicEventIterator, MusicEventType,
UnsafeRawPointer) -> OSStatus
Sets information for the event at a music event iterator’s current position.
func MusicEventIteratorSetEventTime(MusicEventIterator, MusicTimeStamp)
-> OSStatus


## Page 20

Sets the timestamp for the event at a music event iterator’s current position.
typealias MusicEventIterator
A music event iterator sequentially handles events on a music track.
typealias MusicEventType
MIDI and other music event types, used by music event iterator functions.
struct ExtendedNoteOnEvent
Describes a note-on event with extended parameters.
struct ExtendedTempoEvent
Describes a music track tempo in beats-per-minute.
struct MusicEventUserData
Describes a user-defined event.
struct ParameterEvent
Describes an audio unit parameter automation event.
struct MusicDeviceNoteParams
struct MusicDeviceStdNoteParams
struct NoteParamsControlValue
func NewMusicSequence(UnsafeMutablePointer<MusicSequence?>) -> OSStatus
Creates a new empty music sequence.
func DisposeMusicSequence(MusicSequence) -> OSStatus
Disposes of a music sequence.
func MusicSequenceBarBeatTimeToBeats(MusicSequence, UnsafePointer<CABar
BeatTime>, UnsafeMutablePointer<MusicTimeStamp>) -> OSStatus
Formats a music sequence’s bar-beat time to its beat time.
func MusicSequenceBeatsToBarBeatTime(MusicSequence, MusicTimeStamp,
UInt32, UnsafeMutablePointer<CABarBeatTime>) -> OSStatus
Formats a music sequence’s beat time to its bar-beat time.
func MusicSequenceDisposeTrack(MusicSequence, MusicTrack) -> OSStatus
Removes a music track from a music sequence, and disposes of the track.
Managing Music Sequences


## Page 21

func MusicSequenceFileCreate(MusicSequence, CFURL, MusicSequenceFileTyp
ID, MusicSequenceFileFlags, Int16) -> OSStatus
Creates a MIDI file from the events in a music sequence.
func MusicSequenceFileCreateData(MusicSequence, MusicSequenceFileTypeID
MusicSequenceFileFlags, Int16, UnsafeMutablePointer<Unmanaged<CFData>?>
-> OSStatus
Creates a data object containing the events from a music sequence.
func MusicSequenceFileLoad(MusicSequence, CFURL, MusicSequenceFileTypeI
, MusicSequenceLoadFlags) -> OSStatus
Loads data into a music sequence from a URL reference.
func MusicSequenceFileLoadData(MusicSequence, CFData, MusicSequenceFile
TypeID, MusicSequenceLoadFlags) -> OSStatus
Load data into a music sequence from a data reference.
func MusicSequenceGetAUGraph(MusicSequence, UnsafeMutablePointer<AUGrap
?>) -> OSStatus
Gets the audio processing graph associated with a music sequence.
func MusicSequenceGetBeatsForSeconds(MusicSequence, Float64, Unsafe
MutablePointer<MusicTimeStamp>) -> OSStatus
Calculates the number of beats that correspond to a number of seconds.
func MusicSequenceGetIndTrack(MusicSequence, UInt32, UnsafeMutable
Pointer<MusicTrack?>) -> OSStatus
Gets the music track at the specified track index.
func MusicSequenceGetInfoDictionary(MusicSequence) -> CFDictionary
Returns a dictionary containing music sequence information.
func MusicSequenceGetSMPTEResolution(Int16, UnsafeMutablePointer<Int8>,
UnsafeMutablePointer<UInt8>)
func MusicSequenceGetSecondsForBeats(MusicSequence, MusicTimeStamp,
UnsafeMutablePointer<Float64>) -> OSStatus
Calculates the number of seconds that correspond to a number of beats.
func MusicSequenceGetSequenceType(MusicSequence, UnsafeMutablePointer<
MusicSequenceType>) -> OSStatus
Gets the sequence type for a music sequence.


## Page 22

func MusicSequenceGetTempoTrack(MusicSequence, UnsafeMutablePointer<
MusicTrack?>) -> OSStatus
Gets the tempo track for a music sequence.
func MusicSequenceGetTrackCount(MusicSequence, UnsafeMutablePointer<
UInt32>) -> OSStatus
Gets the number of music tracks owned by a music sequence.
func MusicSequenceGetTrackIndex(MusicSequence, MusicTrack, UnsafeMutabl
Pointer<UInt32>) -> OSStatus
Gets the index number for a specified music track.
func MusicSequenceNewTrack(MusicSequence, UnsafeMutablePointer<Music
Track?>) -> OSStatus
Add a new, empty music track to a music sequence.
func MusicSequenceReverse(MusicSequence) -> OSStatus
Reverses the MIDI and tempo events in a music sequence, so the start becomes the end.
func MusicSequenceSetAUGraph(MusicSequence, AUGraph?) -> OSStatus
Associates an audio processing graph with a music sequence.
func MusicSequenceSetMIDIEndpoint(MusicSequence, MIDIEndpointRef) ->
OSStatus
Associates a specified MIDI endpoint with all music tracks in a music sequence.
func MusicSequenceSetSMPTEResolution(Int8, UInt8) -> Int16
func MusicSequenceSetSequenceType(MusicSequence, MusicSequenceType) ->
OSStatus
Sets the sequence type for a music sequence.
func MusicSequenceSetUserCallback(MusicSequence, MusicSequenceUser
Callback?, UnsafeMutableRawPointer?) -> OSStatus
Registers a user callback function with a music sequence.
typealias MusicSequence
A music sequence.
typealias MusicSequenceUserCallback
struct MusicSequenceFileFlags
Flags that configure the behavior of the MusicSequenceFileCreate(_:_:_:_:_:) and
MusicSequenceFileCreateData(_:_:_:_:_:) functions.


## Page 23

struct MusicSequenceLoadFlags
Flags used to configure the behavior of the MusicSequenceFileLoad(_:_:_:_:) and
MusicSequenceFileLoadData(_:_:_:_:) functions.
func MusicTrackClear(MusicTrack, MusicTimeStamp, MusicTimeStamp) ->
OSStatus
Removes a specified range of music track events.
func MusicTrackCopyInsert(MusicTrack, MusicTimeStamp, MusicTimeStamp,
MusicTrack, MusicTimeStamp) -> OSStatus
Copies a range of events from one music track and inserts them into another music track.
func MusicTrackCut(MusicTrack, MusicTimeStamp, MusicTimeStamp) ->
OSStatus
Removes a specified range of music track events, and shifts later events toward the start of
the track to fill in the gap.
func MusicTrackGetDestMIDIEndpoint(MusicTrack, UnsafeMutablePointer<
MIDIEndpointRef>) -> OSStatus
Gets the MIDI endpoint that is the event target for a music track.
func MusicTrackGetDestNode(MusicTrack, UnsafeMutablePointer<AUNode>) ->
OSStatus
Gets the audio unit node that is the event target for a music track.
func MusicTrackGetProperty(MusicTrack, UInt32, UnsafeMutableRawPointer,
UnsafeMutablePointer<UInt32>) -> OSStatus
Gets a music track property value.
func MusicTrackGetSequence(MusicTrack, UnsafeMutablePointer<Music
Sequence?>) -> OSStatus
Gets the music sequence that the music track is a member of.
func MusicTrackMerge(MusicTrack, MusicTimeStamp, MusicTimeStamp, Music
Track, MusicTimeStamp) -> OSStatus
Copies a range of events from one music track and merges them into another music track.
func MusicTrackMoveEvents(MusicTrack, MusicTimeStamp, MusicTimeStamp,
MusicTimeStamp) -> OSStatus
Shifts music track events forward or backward in time, in terms of beats.
Managing Music Tracks


## Page 24

func MusicTrackNewAUPresetEvent(MusicTrack, MusicTimeStamp, Unsafe
Pointer<AUPresetEvent>) -> OSStatus
Adds an event of type AUPresetEvent to a music track.
func MusicTrackNewExtendedNoteEvent(MusicTrack, MusicTimeStamp, Unsafe
Pointer<ExtendedNoteOnEvent>) -> OSStatus
Adds an event of type ExtendedNoteOnEvent to a music track.
func MusicTrackNewExtendedTempoEvent(MusicTrack, MusicTimeStamp, Float6
) -> OSStatus
Adds a tempo to a music track.
func MusicTrackNewMIDIChannelEvent(MusicTrack, MusicTimeStamp, Unsafe
Pointer<MIDIChannelMessage>) -> OSStatus
Adds an event of type MIDIChannelMessage to a music track.
func MusicTrackNewMIDINoteEvent(MusicTrack, MusicTimeStamp, Unsafe
Pointer<MIDINoteMessage>) -> OSStatus
Adds an event of type MIDINoteMessage to a music track.
func MusicTrackNewMIDIRawDataEvent(MusicTrack, MusicTimeStamp, Unsafe
Pointer<MIDIRawData>) -> OSStatus
Adds an event of type MIDIRawData to a music track.
func MusicTrackNewMetaEvent(MusicTrack, MusicTimeStamp, UnsafePointer<
MIDIMetaEvent>) -> OSStatus
Adds an event of type MIDIMetaEvent to a music track.
func MusicTrackNewParameterEvent(MusicTrack, MusicTimeStamp, Unsafe
Pointer<ParameterEvent>) -> OSStatus
Adds an event of type ParameterEvent to a music track.
func MusicTrackNewUserEvent(MusicTrack, MusicTimeStamp, UnsafePointer<
MusicEventUserData>) -> OSStatus
Adds an event of type MusicEventUserData to a music track.
func MusicTrackSetDestMIDIEndpoint(MusicTrack, MIDIEndpointRef) ->
OSStatus
Sets the music track’s event target to a MIDI endpoint.
func MusicTrackSetDestNode(MusicTrack, AUNode) -> OSStatus
Sets the music track’s event target to an audio unit node.


## Page 25

func MusicTrackSetProperty(MusicTrack, UInt32, UnsafeMutableRawPointer,
UInt32) -> OSStatus
Sets a music track property value.
typealias MusicTrack
A music track consists of a series of music events, each timestamped using units of beats.
struct MusicTrackLoopInfo
Supports control of the looping behavior of a music track.
struct MIDIChannelMessage
Describes a MIDI channel message.
struct MIDIMetaEvent
Describes a MIDI metaevent such as lyric text, time signature, and so on.
struct MIDINoteMessage
Describes a MIDI note.
struct MIDIRawData
Describes a MIDI system-exclusive (SysEx) message.
func MusicDeviceMIDIEvent(MusicDeviceComponent, UInt32, UInt32, UInt32,
UInt32) -> OSStatus
func MusicDeviceMIDIEventList(MusicDeviceComponent, UInt32, Unsafe
Pointer<MIDIEventList>) -> OSStatus
func MusicDeviceStartNote(MusicDeviceComponent, MusicDeviceInstrumentID
MusicDeviceGroupID, UnsafeMutablePointer<NoteInstanceID>, UInt32, Unsaf
Pointer<MusicDeviceNoteParams>) -> OSStatus
func MusicDeviceStopNote(MusicDeviceComponent, MusicDeviceGroupID, Note
InstanceID, UInt32) -> OSStatus
func MusicDeviceSysEx(MusicDeviceComponent, UnsafePointer<UInt8>, UInt3
) -> OSStatus
typealias MusicDeviceComponent
typealias MusicDeviceGroupID
typealias MusicDeviceInstrumentID
Interacting with Music Devices


## Page 26

typealias MusicDeviceMIDIEventProc
typealias MusicDeviceStartNoteProc
typealias MusicDeviceStopNoteProc
typealias MusicDeviceSysExProc
Music Instrument Audio Unit Subtypes
Music Track Properties
Properties for music tracks.
struct MusicSequenceFileFlags
Flags that configure the behavior of the MusicSequenceFileCreate(_:_:_:_:_:) and
MusicSequenceFileCreateData(_:_:_:_:_:) functions.
enum MusicSequenceFileTypeID
The various types of files that can be parsed by a music sequence.
struct MusicSequenceLoadFlags
Flags used to configure the behavior of the MusicSequenceFileLoad(_:_:_:_:) and
MusicSequenceFileLoadData(_:_:_:_:) functions.
enum MusicSequenceType
The various types of music sequences.
Music Extended Control Event Type
Music Player Errors
Music Event Types
Music Note Events
Music Device Selectors
Music Device Properties
Music Device Sample Frame Mask
Music Device Unit Properties
Instrument Types
Music Device Generic Properties
Enumerations


## Page 27

Music Effect and Instrument Unit Properties
DLS Music Device Properties
DLS Music Device Parameters
Audio Queue Services
Connect to audio hardware and manage the recording or playback process.
Audio Services
Play short sounds or trigger a vibration effect on iOS devices with the appropriate hardware.
Anchoring sound to a window or volume
Provide unique app experiences by attaching sounds to windows and volumes in 3D space.
See Also
Playback and Recording


## Page 28

Many audio playback APIs have a property to configure their 3D spatial rendering using the
SpatialAudioExperience type HeadTrackedSpatialAudio. This article shows how to tak
advantage of HeadTrackedSpatialAudio to place each sound at the center of its intended
UIScene in your multiwindow or multivolume application.
Placing a sound on a specific UIScene requires knowledge of the target scene’s persistent
Identifier. In a SwiftUI application, that means adding both a UIApplicationDelegate an
UISceneDelegate to your SwiftUI App:
Overview
Get the scene’s identifier
Audio Toolbox / Anchoring sound to a window or volume
Article
Anchoring sound to a window or volume
Provide unique app experiences by attaching sounds to windows and volumes in
3D space.


## Page 29

The following code makes the identifier for each UIScene accessible from any SwiftUI View usin
your UISceneDelegate as an EnvironmentObject:


## Page 30

With a UIScene identifier in-hand, configure each sound using a HeadTrackedSpatialAudio
structure.
Anchor the sound to the scene


## Page 31

Besides just AVAudioPlayer, you can also use SpatialAudioExperience types with the
other playback APIs listed below.
Configure the spatial audio experience of your system and alert sounds using:
AudioServicesPlaySystemSound(_:spatialExperience:)
AudioServicesPlayAlertSound(_:spatialExperience:)
Configure the spatial audio experience of audio-only playback APIs using the intendedSpatial
Experience property on:
AVAudioPlayer
AVAudioOutputNode
AUAudioUnit
CHHapticEngine
Setting a scene identifier on playback APIs that have video content isn’t always necessary as thei
sound automatically anchors to its visual counterpart. However, if there is no video or if you prefe
something besides the automatic behavior, configure the spatial audio experience of these
playback APIs using the intendedSpatialAudioExperience property on:
AVPlayer
AVSampleBufferRenderSynchronizer
Audio Queue Services
Connect to audio hardware and manage the recording or playback process.
Audio Services
Spatialize system and alert sounds
Spatialize audio-only playback APIs
Spatialize audio playback APIs that also have video
See Also
Playback and Recording


## Page 32

Play short sounds or trigger a vibration effect on iOS devices with the appropriate hardware.
Music Player
Create and play a sequence of tracks, and manage aspects of playback in response to
standard events.


