# 001_DispatchWorkItem.pdf

## Page 1

A DispatchWorkItem encapsulates work to be performed on a dispatch queue or within a
dispatch group. You can also use a work item as a DispatchSource event, registration, or
cancellation handler.
init(qos: DispatchQoS, flags: DispatchWorkItemFlags, block: () -> Void)
Creates a new dispatch work item from an existing block and assigns it the specified quality-
of-service class.
struct DispatchWorkItemFlags
A set of behaviors for a work item, such as its quality-of-service class and whether to create
barrier or spawn a new detached thread.
Overview
Topics
Creating a Work Item
Executing the Work Item
Dispatch / DispatchWorkItem
Class
DispatchWorkItem
The work you want to perform, encapsulated in a way that lets you attach a
completion handle or execution dependencies.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst
macOS 10.10+
tvOS
visionOS
watchOS


## Page 2

func perform()
Executes the work item’s block synchronously on the current thread.
func notify(queue: DispatchQueue, execute: DispatchWorkItem)
Schedules the execution of the specified work item after the completion of the current work
item.
func notify(qos: DispatchQoS, flags: DispatchWorkItemFlags, queue:
DispatchQueue, execute: () -> Void)
Schedules the execution of the specified work item, with the specified quality-of-service, aft
the completion of the current work item.
func wait()
Causes the caller to wait synchronously until the dispatch work item finishes executing.
func wait(timeout: DispatchTime) -> DispatchTimeoutResult
Causes the caller to wait synchronously until the dispatch work item finishes executing, or
until the specified time elapses.
func wait(wallTimeout: DispatchWallTime) -> DispatchTimeoutResult
Causes the caller to wait synchronously until the dispatch work item finishes executing, or
until the specified time elapses.
struct DispatchTime
A point in time relative to the default clock, with nanosecond precision.
struct DispatchWallTime
An absolute point in time according to the wall clock, with microsecond precision.
func cancel()
Cancels the current work item asynchronously.
var isCancelled: Bool
A Boolean value indicating whether the work item has been canceled.
Adding a Completion Handler
Waiting for the Completion of a Work Item
Canceling a Work Item


## Page 3

init(flags: DispatchWorkItemFlags, block: () -> Void)
class DispatchQueue
An object that manages the execution of tasks serially or concurrently on your app’s main
thread or on a background thread.
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
Initializers
See Also
Queues and Tasks


