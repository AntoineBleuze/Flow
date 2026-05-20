# 002_SchedulerTimeIntervalConvertible.pdf

## Page 1

static func microseconds(Int) -> Self
Converts the specified number of microseconds into an instance of this scheduler time type
Required
static func milliseconds(Int) -> Self
Converts the specified number of milliseconds into an instance of this scheduler time type.
Required
static func nanoseconds(Int) -> Self
Converts the specified number of nanoseconds into an instance of this scheduler time type.
Required
static func seconds(Double) -> Self
Converts the specified number of seconds, as a floating-point value, into an instance of this
scheduler time type.
Required
static func seconds(Int) -> Self
Converts the specified number of seconds into an instance of this scheduler time type.
Topics
Converting seconds to scheduler time intervals
Combine / SchedulerTimeIntervalConvertible
Protocol
SchedulerTimeIntervalConvertible
A protocol that provides a scheduler with an expression for relative time.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

Required
ImmediateScheduler.SchedulerTimeType.Stride
protocol Scheduler
A protocol that defines when and how to execute a closure.
struct ImmediateScheduler
A scheduler for performing synchronous actions.
Relationships
Conforming Types
See Also
Schedulers


