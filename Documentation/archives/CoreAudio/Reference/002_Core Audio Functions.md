# 002_Core Audio Functions.pdf

## Page 1

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


## Page 2

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


## Page 3

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


