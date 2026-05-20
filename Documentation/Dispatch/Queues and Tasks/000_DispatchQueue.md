# 000_DispatchQueue.pdf

## Page 1

Dispatch queues are FIFO queues to which your application can submit tasks in the form of block
objects. Dispatch queues execute tasks either serially or concurrently. Work submitted to dispatc
queues executes on a pool of threads managed by the system. Except for the dispatch queue
representing your app’s main thread, the system makes no guarantees about which thread it uses
to execute a task.
You schedule work items synchronously or asynchronously. When you schedule a work item
synchronously, your code waits until that item finishes execution. When you schedule a work item
asynchronously, your code continues executing while the work item runs elsewhere.
Important
Attempting to synchronously execute a work item on the main queue results in deadlock.
When designing tasks for concurrent execution, do not call methods that block the current thread
of execution. When a task scheduled by a concurrent dispatch queue blocks a thread, the system
creates additional threads to run other queued concurrent tasks. If too many tasks block, the
system may run out of threads for your app.
Overview
Avoiding Excessive Thread Creation
Dispatch / DispatchQueue
Class
DispatchQueue
An object that manages the execution of tasks serially or concurrently on your
app’s main thread or on a background thread.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Another way that apps consume too many threads is by creating too many private concurrent
dispatch queues. Because each dispatch queue consumes thread resources, creating additional
concurrent dispatch queues exacerbates the thread consumption problem. Instead of creating
private concurrent queues, submit tasks to one of the global concurrent dispatch queues. For ser
tasks, set the target of your serial queue to one of the global concurrent queues. That way, you ca
maintain the serialized behavior of the queue while minimizing the number of separate queues
creating threads.
class var main: DispatchQueue
The dispatch queue associated with the main thread of the current process.
class func global(qos: DispatchQoS.QoSClass) -> DispatchQueue
Returns the global system queue with the specified quality-of-service class.
convenience init(label: String, qos: DispatchQoS, attributes: Dispatch
Queue.Attributes, autoreleaseFrequency: DispatchQueue.Autorelease
Frequency, target: DispatchQueue?)
Creates a new dispatch queue to which you can submit blocks.
enum QoSClass
Quality-of-service classes that specify the priorities for executing tasks.
struct Attributes
Attributes that define the behavior of a dispatch queue.
enum AutoreleaseFrequency
Constants indicating the frequency with which a dispatch queue autoreleases objects.
class OS_dispatch_queue_main
A system-provided dispatch queue that schedules tasks for serial execution on the app’s ma
thread.
class OS_dispatch_queue_global
A system-provided dispatch queue that schedules tasks for concurrent execution.
class DispatchSerialQueue
A custom dispatch queue that schedules tasks for serial execution on an arbitrary thread.
Topics
Creating a Dispatch Queue


## Page 3

class DispatchConcurrentQueue
A custom dispatch queue that schedules tasks for concurrent execution.
typealias dispatch_queue_main_t
A dispatch queue that is bound to the app’s main thread and executes tasks serially on that
thread.
typealias dispatch_queue_global_t
A dispatch queue that executes tasks concurrently using threads from the global thread poo
typealias dispatch_queue_serial_t
A dispatch queue that executes tasks serially in first-in, first-out (FIFO) order.
typealias dispatch_queue_concurrent_t
A dispatch queue that executes tasks concurrently and in any order, respecting any barriers
that may be in place.
func async(execute: DispatchWorkItem)
Schedules a work item for immediate execution, and returns immediately.
func asyncAfter(deadline: DispatchTime, execute: DispatchWorkItem)
Schedules a work item for execution at the specified time, and returns immediately.
func asyncAfter(deadline: DispatchTime, qos: DispatchQoS, flags:
DispatchWorkItemFlags, execute: () -> Void)
Schedules a block for execution using the specified attributes, and returns immediately.
func asyncAfter(wallDeadline: DispatchWallTime, execute: DispatchWork
Item)
Schedules a work item for execution after the specified time, and returns immediately.
func asyncAfter(wallDeadline: DispatchWallTime, qos: DispatchQoS, flags
DispatchWorkItemFlags, execute: () -> Void)
Schedules a block for execution using the specified attributes, and returns immediately.
func sync(execute: DispatchWorkItem)
Submits a work item for execution on the current queue and returns after that block finishes
executing.
Executing Tasks Asynchronously
Executing Tasks Synchronously


## Page 4

func sync(execute: () -> Void)
Submits a block object for execution and returns after that block finishes executing.
func sync<T>(execute: () throws -> T) rethrows -> T
Submits a work item for execution and returns the results from that item after it finishes
executing.
func sync<T>(flags: DispatchWorkItemFlags, execute: () throws -> T)
rethrows -> T
Submits a work item for execution using the specified attributes and returns the results from
that item after it finishes executing.
func asyncAndWait(execute: () -> Void)
Submits a work item for execution and returns only after it finishes executing.
class func concurrentPerform(iterations: Int, execute: (Int) -> Void)
Submits a single block to the dispatch queue and causes the block to be executed the
specified number of times.
func async(group: DispatchGroup, execute: DispatchWorkItem)
Schedules a work item asynchronously for execution and associates it with the specified
dispatch group.
func async(group: DispatchGroup?, qos: DispatchQoS, flags: DispatchWork
ItemFlags, execute: () -> Void)
Schedules a block asynchronously for execution and optionally associates it with a dispatch
group.
var label: String
The label you assigned to the dispatch queue at creation time.
var qos: DispatchQoS
The quality-of-service level assgined to the queue.
func setTarget(queue: dispatch_queue_t?)
Executing a Task in Parallel
Dispatching Work to Groups
Managing Queue Attributes


## Page 5

Specifies the dispatch queue on which to perform work associated with the current object.
func setSpecific<T>(key: DispatchSpecificKey<T>, value: T?)
Sets the key/value data for the specified dispatch queue.
func getSpecific<T>(key: DispatchSpecificKey<T>) -> T?
Returns the value for the key associated with this dispatch queue.
class func getSpecific<T>(key: DispatchSpecificKey<T>) -> T?
Returns the value for the key associated with the current execution context.
class DispatchSpecificKey
A key associated with a specific contextual value on a dispatch queue.
func dispatchMain() -> Never
Executes blocks submitted to the main queue.
struct SchedulerTimeType
The scheduler time type used by the dispatch queue.
struct SchedulerOptions
A set of options that affect the operation of the dispatch queue scheduler.
class func global(priority: DispatchQueue.GlobalQueuePriority) ->
DispatchQueue
enum GlobalQueuePriority
Legacy constants for queue priorities.
func asyncAfterUnsafe(deadline: DispatchTime, qos: DispatchQoS, flags:
DispatchWorkItemFlags, execute: () -> Void)
Getting and Setting Contextual Data
Managing the Main Dispatch Queue
Scheduling Combine Publishers
Deprecated
Instance Methods


## Page 6

func asyncAfterUnsafe(wallDeadline: DispatchWallTime, qos: DispatchQoS,
flags: DispatchWorkItemFlags, execute: () -> Void)
func asyncAndWait<T>(execute: () throws -> T) rethrows -> T
func asyncAndWait(execute: DispatchWorkItem)
func asyncAndWait<T>(flags: DispatchWorkItemFlags, execute: () throws -
T) rethrows -> T
func asyncUnsafe(group: DispatchGroup?, qos: DispatchQoS, flags:
DispatchWorkItemFlags, execute: () -> Void)
Scheduler Implementations
DispatchObject
DispatchConcurrentQueue
DispatchSerialQueue
DispatchWorkloop
OS_dispatch_queue_global
CVarArg
Copyable
Equatable
Executor
Hashable
NSObjectProtocol
Scheduler
Sendable
SendableMetatype
Default Implementations
Relationships
Inherits From
Inherited By
Conforms To


## Page 7

TaskExecutor
class DispatchWorkItem
The work you want to perform, encapsulated in a way that lets you attach a completion hand
or execution dependencies.
class DispatchGroup
A group of tasks that you monitor as a single unit.
Dispatch Queue
An object that manages the execution of tasks serially or concurrently on your app’s main
thread or on a background thread.
Dispatch Work Item
The work you want to perform, encapsulated in a way that lets you attach a completion hand
or execution dependencies.
Dispatch Group
A group of tasks that you monitor as a single unit.
Workloop
A dispatch object that prioritizes the execution of tasks based on their quality-of-service
(QoS) level.
See Also
Queues and Tasks


