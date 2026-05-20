# 002_DispatchTimeInterval.pdf

## Page 1

Use DispatchTimeInterval values to specify the interval at which a DispatchSourceTime
fires or I/O handlers are invoked for a DispatchIO channel, as well as to increment and decreme
DispatchTime values.
case seconds(Int)
A number of seconds.
case milliseconds(Int)
A number of milliseconds.
case microseconds(Int)
A number of microseconds.
case nanoseconds(Int)
A number of nanoseconds.
Overview
Topics
Enumeration Cases
Dispatch / DispatchTimeInterval
Enumeration
DispatchTimeInterval
A number of seconds, millisconds, microseconds, or nanoseconds.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

case never
No interval.
Equatable, Sendable, SendableMetatype
struct DispatchTime
A point in time relative to the default clock, with nanosecond precision.
struct DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
enum DispatchTimeoutResult
A result value indicating whether a dispatch operation finished before a specified time.
typealias dispatch_time_t
An abstract representation of time.
var DISPATCH_WALLTIME_NOW: UInt
The current time.
Wall Time Constants
Constants for wall time values.
Relationships
Conforms To
See Also
Time Constructs


