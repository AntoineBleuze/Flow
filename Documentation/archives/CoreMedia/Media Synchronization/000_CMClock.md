# 000_CMClock.pdf

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


