# Time Constructs.pdf

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


## Page 4

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


## Page 5

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


## Page 6

Constants for wall time values.


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

var DISPATCH_TIME_NOW: UInt64
var DISPATCH_TIME_FOREVER: UInt64
var USEC_PER_SEC: UInt64
var NSEC_PER_SEC: UInt64
var NSEC_PER_MSEC: UInt64
var NSEC_PER_USEC: UInt64
Topics
Well-Defined Times
Time Multiplier Constants
See Also
Time Constructs
Dispatch / dispatch_time_t
Type Alias
dispatch_time_t
An abstract representation of time.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 12

struct DispatchTime
A point in time relative to the default clock, with nanosecond precision.
struct DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
enum DispatchTimeInterval
A number of seconds, millisconds, microseconds, or nanoseconds.
enum DispatchTimeoutResult
A result value indicating whether a dispatch operation finished before a specified time.
var DISPATCH_WALLTIME_NOW: UInt
The current time.
Wall Time Constants
Constants for wall time values.


## Page 13

struct DispatchTime
A point in time relative to the default clock, with nanosecond precision.
struct DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
enum DispatchTimeInterval
A number of seconds, millisconds, microseconds, or nanoseconds.
enum DispatchTimeoutResult
A result value indicating whether a dispatch operation finished before a specified time.
typealias dispatch_time_t
An abstract representation of time.
Wall Time Constants
Constants for wall time values.
See Also
Time Constructs
Dispatch / DISPATCH_WALLTIME_NOW
Global Variable
DISPATCH_WALLTIME_NOW
The current time.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+
macOS 10.14+
tvOS 12.0+
visionOS 1.0+
watchOS 5.0+


## Page 14

var DISPATCH_WALLTIME_NOW: UInt
The current time.
struct DispatchTime
A point in time relative to the default clock, with nanosecond precision.
struct DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
enum DispatchTimeInterval
A number of seconds, millisconds, microseconds, or nanoseconds.
enum DispatchTimeoutResult
A result value indicating whether a dispatch operation finished before a specified time.
typealias dispatch_time_t
An abstract representation of time.
Topics
Times
See Also
Time Constructs
Dispatch / Wall Time Constants
API Collection
Wall Time Constants
Constants for wall time values.


## Page 15

var DISPATCH_WALLTIME_NOW: UInt
The current time.


