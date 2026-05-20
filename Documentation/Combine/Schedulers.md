# Schedulers.pdf

## Page 1

Receiving and Handling Events with Combine
You can use a scheduler to execute code as soon as possible, or after a future date. Individual
scheduler implementations use whatever time-keeping system makes sense for them. Schedulers
express this as their SchedulerTimeType. Since this type conforms to SchedulerTime
IntervalConvertible, you can always express these times with the convenience functions lik
.milliseconds(500). Schedulers can accept options to control how they execute the actions
passed to them. These options may control factors like which threads or dispatch queues execute
the actions.
associatedtype SchedulerTimeType : Strideable
Describes an instant in time for this scheduler.
Required
Mentioned in
Overview
Topics
Declaring scheduler timekeeping and options
Combine / Scheduler
Protocol
Scheduler
A protocol that defines when and how to execute a closure.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

associatedtype SchedulerOptions
A type that defines options accepted by the scheduler.
Required
var minimumTolerance: Self.SchedulerTimeType.Stride
The minimum tolerance allowed by the scheduler.
Required
var now: Self.SchedulerTimeType
This scheduler’s definition of the current moment in time.
Required
func schedule(() -> Void)
Performs the action at the next possible opportunity, without options.
func schedule(after: Self.SchedulerTimeType, () -> Void)
Performs the action at some time after the specified date, using the scheduler’s minimum
tolerance.
func schedule(after: Self.SchedulerTimeType, interval: Self.Scheduler
TimeType.Stride, () -> Void) -> any Cancellable
Performs the action at some time after the specified date, at the specified frequency, using
minimum tolerance possible for this Scheduler.
func schedule(after: Self.SchedulerTimeType, interval: Self.Scheduler
TimeType.Stride, tolerance: Self.SchedulerTimeType.Stride, () -> Void) 
> any Cancellable
Performs the action at some time after the specified date, at the specified frequency, taking
into account tolerance if possible.
func schedule(after: Self.SchedulerTimeType, interval: Self.Scheduler
TimeType.Stride, tolerance: Self.SchedulerTimeType.Stride, options: Sel
.SchedulerOptions?, () -> Void) -> any Cancellable
Performs the action at some time after the specified date, at the specified frequency,
optionally taking into account tolerance if possible.
Required
Accessing scheduler time properties
Scheduling actions


## Page 3

func schedule(after: Self.SchedulerTimeType, tolerance: Self.Scheduler
TimeType.Stride, () -> Void)
Performs the action at some time after the specified date.
func schedule(after: Self.SchedulerTimeType, tolerance: Self.Scheduler
TimeType.Stride, options: Self.SchedulerOptions?, () -> Void)
Performs the action at some time after the specified date.
Required
func schedule(options: Self.SchedulerOptions?, () -> Void)
Performs the action at the next possible opportunity.
Required
ImmediateScheduler
struct ImmediateScheduler
A scheduler for performing synchronous actions.
protocol SchedulerTimeIntervalConvertible
A protocol that provides a scheduler with an expression for relative time.
Relationships
Conforming Types
See Also
Schedulers


## Page 4

You can only use this scheduler for immediate actions. If you attempt to schedule actions after a
specific date, this scheduler ignores the date and performs them immediately.
struct SchedulerTimeType
The time type used by the immediate scheduler.
typealias SchedulerOptions
A type that defines options accepted by the immediate scheduler.
var minimumTolerance: ImmediateScheduler.SchedulerTimeType.Stride
The minimum tolerance allowed by the immediate scheduler.
var now: ImmediateScheduler.SchedulerTimeType
Overview
Topics
Declaring scheduler timekeeping and options
Accessing scheduler time properties
Combine / ImmediateScheduler
Structure
ImmediateScheduler
A scheduler for performing synchronous actions.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 5

The immediate scheduler’s definition of the current moment in time.
static let shared: ImmediateScheduler
The shared instance of the immediate scheduler.
func schedule(after: ImmediateScheduler.SchedulerTimeType, interval:
ImmediateScheduler.SchedulerTimeType.Stride, tolerance: Immediate
Scheduler.SchedulerTimeType.Stride, options: ImmediateScheduler.
SchedulerOptions?, () -> Void) -> any Cancellable
Performs the action at some time after the specified date, at the specified frequency,
optionally taking into account tolerance if possible.
func schedule(after: ImmediateScheduler.SchedulerTimeType, tolerance:
ImmediateScheduler.SchedulerTimeType.Stride, options: ImmediateSchedule
.SchedulerOptions?, () -> Void)
Performs the action at some time after the specified date.
func schedule(options: ImmediateScheduler.SchedulerOptions?, () -> Void
Performs the action at the next possible opportunity.
Scheduler
protocol Scheduler
A protocol that defines when and how to execute a closure.
Using the shared scheduler
Scheduling actions
Relationships
Conforms To
See Also
Schedulers


## Page 6

protocol SchedulerTimeIntervalConvertible
A protocol that provides a scheduler with an expression for relative time.


## Page 7

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


## Page 8

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


