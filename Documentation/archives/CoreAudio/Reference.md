# Reference.pdf

## Page 1

struct AudioHardwareIOProcStreamUsage
This structure describes which streams a given AudioDeviceIOProc will use. It is used in
conjunction with kAudioDevicePropertyIOProcStreamUsage.
struct AudioObjectPropertyAddress
An AudioObjectPropertyAddress collects the three parts that identify a specific property
together in a struct for easy transmission.
struct AudioStreamRangedDescription
This structure allows a specific sample rate range to be associated with an
AudioStreamBasicDescription that specifies its sample rate as kAudioStreamAnyRate.
struct UnsafeMutableAudioBufferListPointer
A wrapper for a pointer to an AudioBufferList.
Core Audio Data Types
Core Audio Functions
Core Audio Constants
Topics
Structures
See Also
Reference
Core Audio / Core Audio Structures
API Collection
Core Audio Structures


## Page 2

Core Audio Enumerations


## Page 3

typealias AudioClassID
typealias AudioDeviceID
typealias AudioDeviceIOBlock
typealias AudioDeviceIOProc
typealias AudioDeviceIOProcID
typealias AudioDevicePropertyID
typealias AudioDevicePropertyListenerProc
typealias AudioHardwarePropertyID
typealias AudioHardwarePropertyListenerProc
typealias AudioObjectID
typealias AudioObjectPropertyElement
typealias AudioObjectPropertyListenerBlock
typealias AudioObjectPropertyListenerProc
typealias AudioObjectPropertyScope
typealias AudioObjectPropertySelector
typealias AudioStreamID
Topics
Data Types
Core Audio / Core Audio Data Types
API Collection
Core Audio Data Types


## Page 4

typealias AudioStreamPropertyListenerProc
Core Audio Structures
Core Audio Functions
Core Audio Constants
Core Audio Enumerations
See Also
Reference


## Page 5

func AudioConvertHostTimeToNanos(UInt64) -> UInt64
func AudioConvertNanosToHostTime(UInt64) -> UInt64
func AudioDeviceCreateIOProcID(AudioObjectID, AudioDeviceIOProc, Unsafe
MutableRawPointer?, UnsafeMutablePointer<AudioDeviceIOProcID?>) ->
OSStatus
func AudioDeviceCreateIOProcIDWithBlock(UnsafeMutablePointer<AudioDevic
IOProcID?>, AudioObjectID, dispatch_queue_t?, AudioDeviceIOBlock) ->
OSStatus
func AudioDeviceDestroyIOProcID(AudioObjectID, AudioDeviceIOProcID) ->
OSStatus
func AudioDeviceGetCurrentTime(AudioObjectID, UnsafeMutablePointer<Audi
TimeStamp>) -> OSStatus
func AudioDeviceGetNearestStartTime(AudioObjectID, UnsafeMutablePointer
AudioTimeStamp>, UInt32) -> OSStatus
func AudioDeviceStart(AudioObjectID, AudioDeviceIOProcID?) -> OSStatus
func AudioDeviceStartAtTime(AudioObjectID, AudioDeviceIOProcID?, Unsafe
MutablePointer<AudioTimeStamp>, UInt32) -> OSStatus
func AudioDeviceStop(AudioObjectID, AudioDeviceIOProcID?) -> OSStatus
func AudioDeviceTranslateTime(AudioObjectID, UnsafePointer<AudioTime
Stamp>, UnsafeMutablePointer<AudioTimeStamp>) -> OSStatus
Topics
Functions
Core Audio / Core Audio Functions
API Collection
Core Audio Functions


## Page 6

func AudioGetCurrentHostTime() -> UInt64
func AudioGetHostClockFrequency() -> Float64
func AudioGetHostClockMinimumTimeDelta() -> UInt32
func AudioHardwareCreateAggregateDevice(CFDictionary, UnsafeMutable
Pointer<AudioObjectID>) -> OSStatus
func AudioHardwareDestroyAggregateDevice(AudioObjectID) -> OSStatus
func AudioHardwareUnload() -> OSStatus
func AudioObjectAddPropertyListener(AudioObjectID, UnsafePointer<Audio
ObjectPropertyAddress>, AudioObjectPropertyListenerProc, UnsafeMutable
RawPointer?) -> OSStatus
func AudioObjectAddPropertyListenerBlock(AudioObjectID, UnsafePointer<
AudioObjectPropertyAddress>, dispatch_queue_t?, AudioObjectProperty
ListenerBlock) -> OSStatus
func AudioObjectGetPropertyData(AudioObjectID, UnsafePointer<AudioObjec
PropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<UInt3
>, UnsafeMutableRawPointer) -> OSStatus
func AudioObjectGetPropertyDataSize(AudioObjectID, UnsafePointer<Audio
ObjectPropertyAddress>, UInt32, UnsafeRawPointer?, UnsafeMutablePointer
UInt32>) -> OSStatus
func AudioObjectHasProperty(AudioObjectID, UnsafePointer<AudioObject
PropertyAddress>) -> Bool
func AudioObjectIsPropertySettable(AudioObjectID, UnsafePointer<Audio
ObjectPropertyAddress>, UnsafeMutablePointer<DarwinBoolean>) -> OSStatu
func AudioObjectRemovePropertyListener(AudioObjectID, UnsafePointer<
AudioObjectPropertyAddress>, AudioObjectPropertyListenerProc, Unsafe
MutableRawPointer?) -> OSStatus
func AudioObjectRemovePropertyListenerBlock(AudioObjectID, UnsafePointe
<AudioObjectPropertyAddress>, dispatch_queue_t?, AudioObjectProperty
ListenerBlock) -> OSStatus
func AudioObjectSetPropertyData(AudioObjectID, UnsafePointer<AudioObjec
PropertyAddress>, UInt32, UnsafeRawPointer?, UInt32, UnsafeRawPointer) 
> OSStatus
func AudioObjectShow(AudioObjectID)


## Page 7

func AudioHardwareCreateProcessTap(CATapDescription!, UnsafeMutable
Pointer<AudioObjectID>!) -> OSStatus
func AudioHardwareDestroyProcessTap(AudioObjectID) -> OSStatus
func PropertyAddress(AudioObjectPropertySelector, scope: AudioObject
PropertyScope, element: AudioObjectPropertyElement) -> AudioObject
PropertyAddress
A helper constructor for the AudioObjectPropertyAddress struct.
Core Audio Structures
Core Audio Data Types
Core Audio Constants
Core Audio Enumerations
See Also
Reference


## Page 8

var kAudioAggregateDeviceClockDeviceKey: String
var kAudioAggregateDeviceIsPrivateKey: String
var kAudioAggregateDeviceIsStackedKey: String
var kAudioAggregateDeviceMainSubDeviceKey: String
var kAudioAggregateDeviceMasterSubDeviceKey: String
var kAudioAggregateDeviceNameKey: String
var kAudioAggregateDevicePropertyMainSubDevice: AudioObjectProperty
Selector
var kAudioAggregateDevicePropertySubTapList: AudioObjectPropertySelecto
var kAudioAggregateDevicePropertyTapList: AudioObjectPropertySelector
var kAudioAggregateDeviceSubDeviceListKey: String
var kAudioAggregateDeviceTapAutoStartKey: String
var kAudioAggregateDeviceTapListKey: String
var kAudioAggregateDeviceUIDKey: String
var kAudioDevicePropertyIOThreadOSWorkgroup: AudioObjectPropertySelecto
The device’s workgroup object, which you use to coordinate your threads with the threads o
the device.
var kAudioDevicePropertyProcessMute: AudioObjectPropertySelector
Topics
Constants
Core Audio / Core Audio Constants
API Collection
Core Audio Constants


## Page 9

var kAudioDevicePropertyVoiceActivityDetectionEnable: AudioObject
PropertySelector
var kAudioDevicePropertyVoiceActivityDetectionState: AudioObjectPropert
Selector
var kAudioDeviceTransportTypeContinuityCapture: UInt32
Deprecated
var kAudioDeviceTransportTypeContinuityCaptureWired: UInt32
var kAudioDeviceTransportTypeContinuityCaptureWireless: UInt32
var kAudioEndPointDeviceEndPointListKey: String
var kAudioEndPointDeviceIsPrivateKey: String
var kAudioEndPointDeviceMainEndPointKey: String
var kAudioEndPointDeviceMasterEndPointKey: String
var kAudioEndPointDeviceNameKey: String
var kAudioEndPointDeviceUIDKey: String
var kAudioEndPointInputChannelsKey: String
var kAudioEndPointNameKey: String
var kAudioEndPointOutputChannelsKey: String
var kAudioEndPointUIDKey: String
var kAudioHardwareNotReadyError: OSStatus
var kAudioHardwarePropertyProcessInputMute: AudioObjectPropertySelector
var kAudioHardwarePropertyProcessIsMain: AudioObjectPropertySelector
var kAudioHardwarePropertyProcessObjectList: AudioObjectPropertySelecto
var kAudioHardwarePropertyTapList: AudioObjectPropertySelector
var kAudioHardwarePropertyTranslatePIDToProcessObject: AudioObject
PropertySelector
var kAudioHardwarePropertyTranslateUIDToTap: AudioObjectPropertySelecto
var kAudioHardwareRunLoopMode: String
var kAudioObjectPropertyElementMain: AudioObjectPropertyScope
var kAudioProcessClassID: AudioClassID
var kAudioSubDeviceDriftCompensationKey: String


## Page 10

var kAudioSubDeviceDriftCompensationQualityKey: String
var kAudioSubDeviceExtraInputLatencyKey: String
var kAudioSubDeviceExtraOutputLatencyKey: String
var kAudioSubDeviceInputChannelsKey: String
var kAudioSubDeviceNameKey: String
var kAudioSubDeviceOutputChannelsKey: String
var kAudioSubDeviceUIDKey: String
var kAudioSubTapDriftCompensationKey: String
var kAudioSubTapDriftCompensationQualityKey: String
var kAudioSubTapExtraInputLatencyKey: String
var kAudioSubTapExtraOutputLatencyKey: String
var kAudioSubTapUIDKey: String
Core Audio Structures
Core Audio Data Types
Core Audio Functions
Core Audio Enumerations
See Also
Reference


## Page 11

Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Topics
Enumerations
Core Audio / Core Audio Enumerations
API Collection
Core Audio Enumerations


## Page 12

Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous


## Page 13

Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
enum AudioHardwarePowerHint
enum AudioLevelControlTransferFunction


## Page 14

Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
enum AudioHardwareDirection
An enum representing audio stream direction.
enum CATapMuteBehavior
Core Audio Structures
Core Audio Data Types
Core Audio Functions
Core Audio Constants
See Also
Reference


