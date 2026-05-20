# 003_DispatchTimeoutResult.pdf

## Page 1

case success
Indicates that a dispatch operation successfully finished before the specified time elapsed.
case timedOut
Indicates that a dispatch operation failed to finish before the specified time elapsed.
BitwiseCopyable
Copyable
Equatable
Hashable
Sendable
Topics
Enumeration Cases
Relationships
Conforms To
Dispatch / DispatchTimeoutResult
Enumeration
DispatchTimeoutResult
A result value indicating whether a dispatch operation finished before a specified
time.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

SendableMetatype
struct DispatchTime
A point in time relative to the default clock, with nanosecond precision.
struct DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
enum DispatchTimeInterval
A number of seconds, millisconds, microseconds, or nanoseconds.
typealias dispatch_time_t
An abstract representation of time.
var DISPATCH_WALLTIME_NOW: UInt
The current time.
Wall Time Constants
Constants for wall time values.
See Also
Time Constructs


