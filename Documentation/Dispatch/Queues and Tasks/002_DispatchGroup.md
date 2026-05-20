# 002_DispatchGroup.pdf

## Page 1

Groups allow you to aggregate a set of tasks and synchronize behaviors on the group. You attach
multiple work items to a group and schedule them for asynchronous execution on the same queue
or different queues. When all work items finish executing, the group executes its completion
handler. You can also wait synchronously for all tasks in the group to finish executing.
init()
Creates a new group to which you can assign block objects.
func notify(qos: DispatchQoS, flags: DispatchWorkItemFlags, queue:
DispatchQueue, execute: () -> Void)
Schedules the submission of a block with the specified attributes to a queue when all tasks i
the current group have finished executing.
Overview
Topics
Creating a Dispatch Group
Adding a Completion Handler
Dispatch / DispatchGroup
Class
DispatchGroup
A group of tasks that you monitor as a single unit.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func notify(queue: DispatchQueue, work: DispatchWorkItem)
Schedules the submission of a block to a queue when all tasks in the current group have
finished executing.
func wait()
Waits synchronously for the previously submitted work to finish.
func wait(timeout: DispatchTime) -> DispatchTimeoutResult
Waits synchronously for the previously submitted work to complete, and returns if the work 
not completed before the specified timeout period has elapsed.
func wait(wallTimeout: DispatchWallTime) -> DispatchTimeoutResult
Waits synchronously for the previously submitted work to complete, and returns if the work 
not completed before the specified timeout period has elapsed.
func enter()
Explicitly indicates that a block has entered the group.
func leave()
Explicitly indicates that a block in the group finished executing.
DispatchObject
CVarArg
Equatable
Hashable
NSObjectProtocol
Sendable
Waiting for Tasks to Finish Executing
Updating the Group Manually
Relationships
Inherits From
Conforms To


## Page 3

SendableMetatype
class DispatchQueue
An object that manages the execution of tasks serially or concurrently on your app’s main
thread or on a background thread.
class DispatchWorkItem
The work you want to perform, encapsulated in a way that lets you attach a completion hand
or execution dependencies.
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


