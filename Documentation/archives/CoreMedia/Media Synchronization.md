# Media Synchronization.pdf

## Page 1

The CMSync API provides a reference clock that you use to synchronize applications and device
This API also provides functions to monitor relative drift between CMClocks and functions that a
associated with timer services.
func CMClockGetHostTimeClock() -> CMClock
Returns a reference to the singleton clock that reflects the host time.
func CMClockInvalidate(CMClock)
Stops the clock.
func CMClockGetTime(CMClock) -> CMTime
Returns the current time from a clock.
Overview
Topics
Accessing the Host Clock
Stopping the Clock
Accessing and Converting Time
Core Media / CMClock
API Collection
CMClock
A reference clock you use to synchronize applications and devices.


## Page 2

func CMClockGetAnchorTime(CMClock, clockTimeOut: UnsafeMutablePointer<
CMTime>, referenceClockTimeOut: UnsafeMutablePointer<CMTime>) ->
OSStatus
Returns the current time from a clock and the matching time from the clock’s reference cloc
func CMClockConvertHostTimeToSystemUnits(CMTime) -> UInt64
Converts a host time from a core media time structure to the host time’s native units.
func CMClockMakeHostTimeFromSystemUnits(UInt64) -> CMTime
Converts a host time from native units to a core media time structure.
func CMSyncGetTime(CMClockOrTimebase) -> CMTime
Returns the time from a clock or timebase.
func CMSyncGetRelativeRate(CMClockOrTimebase, relativeTo: CMClockOr
Timebase) -> Float64
Returns the relative rate of one timebase or clock relative to another timebase or clock.
func CMSyncGetRelativeRateAndAnchorTime(CMClockOrTimebase, relativeTo:
CMClockOrTimebase, relativeRateOut: UnsafeMutablePointer<Float64>?,
anchorTimeOut: UnsafeMutablePointer<CMTime>?, relativeToAnchorTimeOut:
UnsafeMutablePointer<CMTime>?) -> OSStatus
Returns the relative rate of one timebase or clock relative to another timebase or clock and
the times of each timebase or clock at which the relative rate went into effect.
func CMSyncConvertTime(CMTime, from: CMClockOrTimebase, to: CMClockOr
Timebase) -> CMTime
Converts a time from one timebase or clock to another timebase or clock.
func CMClockMightDrift(CMClock, otherClock: CMClock) -> Bool
Returns a Boolean value that indicates whether it’s possible for two clocks to drift relative to
each other.
func CMSyncMightDrift(CMClockOrTimebase, CMClockOrTimebase) -> Bool
Returns a Boolean value that indicates whether it’s possible for one timebase or clock to drif
relative to the other.
Getting and Syncing Time
Determining Clock Drift


## Page 3

class CMClock
An object that represents a source of time.
typealias CMClockOrTimebase
A type you use in argument lists and function results to indicate that you can pass either a
clock or timebase.
func CMClockGetTypeID() -> CFTypeID
Returns the core foundation type identifier of a clock type.
CMClock Error Codes
Constants that represent the errors in Core Media clock operations.
CMTimebase Error Codes
Constants that represent errors in Core Media timebase operations.
CMSync error codes
Constants that represent error codes Core Media sync operations return.
Timebase Notifications
Keys that represent timebase notifications.
CMAudioClock
A specialized reference clock that synchronizes with audio sources.
CMTimebase
A model of a timeline under application control.
Data Types
Constants
See Also
Media Synchronization


## Page 4

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


## Page 5

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


## Page 6

A timebase represents a timeline that clients can control by setting the rate and time. Each
timebase has either a host clock or a host timebase, and its rate is expressed relative to its host:
When a timebase has rate 0.0, its time is fixed and doesn’t change as its host’s time changes.
When a timebase has rate 1.0, its time increases one second as its host’s time increases by one
second.
When a timebase has rate 2.0, its time increases two seconds as its host’s time increases by on
second.
When a timebase has rate -1.0, its time decreases one second as its host’s time increases by o
second.
If a timebase has a host timebase, the host timebase’s rate is a factor in determining the timebase
effective rate. In fact, a timebase’s effective rate is defined as the product of its rate, its host
timebase’s rate, its host timebase’s host timebase’s rate, and so on up to the ultimate host clock.
This is the rate at which the timebase’s time changes relative to the ultimate host clock.
func CMTimebaseCreateWithSourceClock(allocator: CFAllocator?, source
Clock: CMClock, timebaseOut: UnsafeMutablePointer<CMTimebase?>) ->
OSStatus
Creates a timebase by using a source clock.
Overview
Topics
Creating Timebases
Core Media / CMTimebase
API Collection
CMTimebase
A model of a timeline under application control.


## Page 7

func CMTimebaseCreateWithSourceTimebase(allocator: CFAllocator?, source
Timebase: CMTimebase, timebaseOut: UnsafeMutablePointer<CMTimebase?>) -
OSStatus
Creates a timebase by using a source timebase.
func CMTimebaseCopySource(CMTimebase) -> CMClockOrTimebase
Returns the immediate source — either a clock or timebase — of a timebase.
func CMTimebaseCopySourceClock(CMTimebase) -> CMClock?
Returns the immediate source clock of a timebase.
func CMTimebaseCopySourceTimebase(CMTimebase) -> CMTimebase?
Returns the immediate source timebase of a timebase.
func CMTimebaseCopyUltimateSourceClock(CMTimebase) -> CMClock
Returns the source clock that’s the source of all of a timebase’s source timebases.
func CMTimebaseGetTime(CMTimebase) -> CMTime
Returns the current time from a timebase.
func CMTimebaseGetTimeWithTimeScale(CMTimebase, timescale: CMTimeScale,
method: CMTimeRoundingMethod) -> CMTime
Returns the current time from a timebase in the specified timescale.
func CMTimebaseGetTimeAndRate(CMTimebase, timeOut: UnsafeMutablePointer
CMTime>?, rateOut: UnsafeMutablePointer<Float64>?) -> OSStatus
Returns the current time and rate of a timebase.
func CMTimebaseSetTime(CMTimebase, time: CMTime) -> OSStatus
Sets the current time of a timebase.
func CMTimebaseSetSourceClock(CMTimebase, CMClock) -> OSStatus
Sets the source clock of a timebase.
func CMTimebaseSetSourceTimebase(CMTimebase, CMTimebase) -> OSStatus
Sets the source timebase of a timebase.
Copying Timebases
Getting and Setting Time


## Page 8

func CMTimebaseSetAnchorTime(CMTimebase, timebaseTime: CMTime, immediat
SourceTime: CMTime) -> OSStatus
Sets the time of a timebase at a particular host time.
func CMTimebaseGetRate(CMTimebase) -> Float64
Returns the current rate of a timebase.
func CMTimebaseGetEffectiveRate(CMTimebase) -> Float64
Returns the effective rate of a timebase, which combines its rate with the rates of all its host
timebases.
func CMTimebaseSetRate(CMTimebase, rate: Float64) -> OSStatus
Sets the rate of a timebase.
func CMTimebaseSetRateAndAnchorTime(CMTimebase, rate: Float64, anchor
Time: CMTime, immediateSourceTime: CMTime) -> OSStatus
Sets the time of a timebase at a particular host time, and changes the rate at exactly that tim
func CMTimebaseAddTimer(CMTimebase, timer: CFRunLoopTimer, runloop:
CFRunLoop) -> OSStatus
Adds the timer to the list of timers the timebase manages.
func CMTimebaseAddTimerDispatchSource(CMTimebase, timerSource: dispatch
_source_t) -> OSStatus
Adds the timer dispatch source to the list of timers the timebase manages.
func CMTimebaseRemoveTimer(CMTimebase, timer: CFRunLoopTimer) ->
OSStatus
Removes the timer from the list of timers the timebase manages.
func CMTimebaseRemoveTimerDispatchSource(CMTimebase, timerSource:
dispatch_source_t) -> OSStatus
Removes the timer dispatch source from the list of timers the timebase manages.
func CMTimebaseSetTimerNextFireTime(CMTimebase, timer: CFRunLoopTimer,
fireTime: CMTime, flags: UInt32) -> OSStatus
Sets the time on the timebase’s timeline at which the timer should fire next.
Getting and Setting the Time Rate
Interacting with Timers


## Page 9

func CMTimebaseSetTimerToFireImmediately(CMTimebase, timer: CFRunLoop
Timer) -> OSStatus
Sets the timer to fire immediately once, overriding any previous timer calls.
func CMTimebaseSetTimerDispatchSourceNextFireTime(CMTimebase, timer
Source: dispatch_source_t, fireTime: CMTime, flags: UInt32) -> OSStatus
Sets the time on the timebase’s timeline at which the timer dispatch source should fire next.
func CMTimebaseSetTimerDispatchSourceToFireImmediately(CMTimebase, time
Source: dispatch_source_t) -> OSStatus
Sets the timer dispatch source to fire immediately once, overriding any previous timer call.
func CMTimebaseNotificationBarrier(CMTimebase) -> OSStatus
Requests that the timebase wait until it isn’t posting notifications.
class CMTimebase
A model of a timeline under application control.
struct CMSync
A type that represents time syncing.
protocol CMSyncProtocol
A type that provides behavior for syncing time.
var kCMTimebaseError_MissingRequiredParameter: OSStatus
A timebase error that indicates a parameter is missing.
var kCMTimebaseError_InvalidParameter: OSStatus
A timebase error that indicates a parameter isn’t valid.
var kCMTimebaseError_AllocationFailed: OSStatus
A timebase error that indicates the memory allocation fails.
var kCMTimebaseError_TimerIntervalTooShort: OSStatus
A timebase error that indicates the time interval is too short.
Pausing Time Notifications
Data Types
Timebase Errors


## Page 10

var kCMTimebaseError_ReadOnly: OSStatus
A timebase error that indicates the system attempts to modify a read-only timebase.
func CMTimebaseGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier that identifies a timebase object.
let kCMTimebaseNotificationKey_EventTime: CFString
A notification that a timebase posts after a discontinuous time jump.
func CMTimebaseSetRateAndAnchorTime(CMTimebase, rate: Double, anchorTim
: CMTime, immediateMasterTime: CMTime)
Deprecated
func CMTimebaseGetMasterTimebase(CMTimebase) -> CMTimebase?
Returns the immediate host timebase of a timebase.
Deprecated
func CMTimebaseGetMasterClock(CMTimebase) -> CMClock?
Returns the immediate host clock of a timebase.
Deprecated
func CMTimebaseGetMaster(CMTimebase) -> CMClockOrTimebase?
Returns the immediate host (either timebase or clock) of a timebase.
Deprecated
func CMTimebaseGetUltimateMasterClock(CMTimebase) -> CMClock?
Returns the host clock that is the host of all of a timebase’s host timebases.
Deprecated
func CMTimebaseSetMasterClock(CMTimebase, CMClock) -> OSStatus
Sets the time of a timebase at a particular source time.
Deprecated
func CMTimebaseSetMasterTimebase(CMTimebase, CMTimebase) -> OSStatus
Deprecated
Constants
Notifications
Deprecations


## Page 11

func CMTimebaseSetAnchorTime(CMTimebase, timebaseTime: CMTime, immediat
MasterTime: CMTime)
Sets the time of a timebase at a particular source time.
Deprecated
func CMTimebaseCopyMaster(CMTimebase) -> CMClockOrTimebase
Returns the immediate host timebase of a timebase.
Deprecated
func CMTimebaseCopyMasterClock(CMTimebase) -> CMClock?
Returns the immediate host clock of a timebase.
Deprecated
func CMTimebaseCopyMasterTimebase(CMTimebase) -> CMTimebase?
Returns the immediate host timebase of a timebase.
Deprecated
func CMTimebaseCopyUltimateMasterClock(CMTimebase) -> CMClock
Returns the host clock that is the host of all of a timebase’s host timebases.
Deprecated
func CMTimebaseCreateWithMasterClock(allocator: CFAllocator?, master
Clock: CMClock, timebaseOut: UnsafeMutablePointer<CMTimebase?>) ->
OSStatus
Creates a timebase by using a primary clock.
Deprecated
func CMTimebaseCreateWithMasterTimebase(allocator: CFAllocator?, master
Timebase: CMTimebase, timebaseOut: UnsafeMutablePointer<CMTimebase?>) -
OSStatus
Creates a timebase by using a host timebase.
Deprecated
CMClock
A reference clock you use to synchronize applications and devices.
See Also
Media Synchronization


## Page 12

CMAudioClock
A specialized reference clock that synchronizes with audio sources.


