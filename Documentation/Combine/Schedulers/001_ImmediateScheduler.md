# 001_ImmediateScheduler.pdf

## Page 1

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


## Page 2

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


## Page 3

protocol SchedulerTimeIntervalConvertible
A protocol that provides a scheduler with an expression for relative time.


