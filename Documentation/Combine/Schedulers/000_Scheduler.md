# 000_Scheduler.pdf

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


