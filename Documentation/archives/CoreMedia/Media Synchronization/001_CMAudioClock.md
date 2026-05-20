# 001_CMAudioClock.pdf

## Page 1

An audio clock is a specialized CMClock that you use to synchronize with audio sources. For
details on clocks and synchronization, see CMClock.
func CMAudioClockCreate(allocator: CFAllocator?, clockOut: UnsafeMutabl
Pointer<CMClock?>) -> OSStatus
Creates a clock that advances at the same rate as audio output.
func CMAudioDeviceClockCreate(allocator: CFAllocator?, deviceUID:
CFString?, clockOut: UnsafeMutablePointer<CMClock?>) -> OSStatus
Creates a clock that tracks playback through a Core Audio device with the specified unique
identifier.
func CMAudioDeviceClockCreateFromAudioDeviceID(allocator: CFAllocator?,
deviceID: AudioDeviceID, clockOut: UnsafeMutablePointer<CMClock?>) ->
OSStatus
Creates a clock that tracks playback through a Core Audio device with the specified identifie
Overview
Topics
Creating Audio Clocks
Configuring Audio Clocks
Core Media / CMAudioClock
API Collection
CMAudioClock
A specialized reference clock that synchronizes with audio sources.


## Page 2

func CMAudioDeviceClockGetAudioDevice(CMClock, deviceUIDOut:
AutoreleasingUnsafeMutablePointer<CFString?>?, deviceIDOut: Unsafe
MutablePointer<AudioDeviceID>?, trackingDefaultDeviceOut: UnsafeMutable
Pointer<DarwinBoolean>?) -> OSStatus
Returns the Core Audio device the clock is tracking.
func CMAudioDeviceClockSetAudioDeviceUID(CMClock, deviceUID: CFString?)
-> OSStatus
Changes the Core Audio device the clock is tracking by specifying a new device unique
identifier.
func CMAudioDeviceClockSetAudioDeviceID(CMClock, deviceID: AudioDeviceI
) -> OSStatus
Changes the Core Audio device the clock is tracking by specifying a new device identifier.
CMClock
A reference clock you use to synchronize applications and devices.
CMTimebase
A model of a timeline under application control.
See Also
Media Synchronization


