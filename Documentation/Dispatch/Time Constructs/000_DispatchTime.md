# 000_DispatchTime.pdf

## Page 1

On Apple platforms, the default clock is based on the Mach absolute time unit.
static func now() -> DispatchTime
Returns the current time.
static let distantFuture: DispatchTime
A time in the distant future.
init(uptimeNanoseconds: UInt64)
Creates a time relative to the amount of time the system has been running.
Overview
Topics
Getting Well-Known Times
Creating a Dispatch Time Object
Getting the Time
Dispatch / DispatchTime
Structure
DispatchTime
A point in time relative to the default clock, with nanosecond precision.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

let rawValue: dispatch_time_t
Returns the underlying time value.
var uptimeNanoseconds: UInt64
Returns the number of nanoseconds since boot, excluding any time the system spent asleep
func advanced(by: DispatchTimeInterval) -> DispatchTime
func distance(to: DispatchTime) -> DispatchTimeInterval
func + (DispatchTime, Double) -> DispatchTime
func + (DispatchTime, DispatchTimeInterval) -> DispatchTime
func - (DispatchTime, Double) -> DispatchTime
func - (DispatchTime, DispatchTimeInterval) -> DispatchTime
Comparable
Equatable
Sendable
SendableMetatype
struct DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
Modifying the Value
Operator Functions
Relationships
Conforms To
See Also
Time Constructs


## Page 3

enum DispatchTimeInterval
A number of seconds, millisconds, microseconds, or nanoseconds.
enum DispatchTimeoutResult
A result value indicating whether a dispatch operation finished before a specified time.
typealias dispatch_time_t
An abstract representation of time.
var DISPATCH_WALLTIME_NOW: UInt
The current time.
Wall Time Constants
Constants for wall time values.


