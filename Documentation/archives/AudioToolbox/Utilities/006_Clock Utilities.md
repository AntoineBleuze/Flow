# 006_Clock Utilities.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


