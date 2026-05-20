# 001_DispatchWallTime.pdf

## Page 1

static func now() -> DispatchWallTime
Returns the current time.
static let distantFuture: DispatchWallTime
A time in the distant future.
init(timespec: timespec)
Creates an absolute time for a specified value.
let rawValue: dispatch_time_t
The underlying time value.
Topics
Getting Well-Known Times
Creating a Dispatch Wall Time Object
Getting the Time
Operator Functions
Dispatch / DispatchWallTime
Structure
DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func + (DispatchWallTime, DispatchTimeInterval) -> DispatchWallTime
func + (DispatchWallTime, Double) -> DispatchWallTime
func - (DispatchWallTime, Double) -> DispatchWallTime
func - (DispatchWallTime, DispatchTimeInterval) -> DispatchWallTime
Comparable
Equatable
Sendable
SendableMetatype
struct DispatchTime
A point in time relative to the default clock, with nanosecond precision.
enum DispatchTimeInterval
A number of seconds, millisconds, microseconds, or nanoseconds.
enum DispatchTimeoutResult
A result value indicating whether a dispatch operation finished before a specified time.
typealias dispatch_time_t
An abstract representation of time.
var DISPATCH_WALLTIME_NOW: UInt
The current time.
Wall Time Constants
Relationships
Conforms To
See Also
Time Constructs


## Page 3

Constants for wall time values.


