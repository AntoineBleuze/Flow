# 001_BGTaskScheduler.pdf

## Page 1

Performing long-running tasks on iOS and iPadOS
Background tasks give your app a way to run code even when the app is suspended:
To register, schedule, and run tasks in the background, see Using background tasks to update
your app.
To submit work in the foreground that can finish even if the app moves to the background, see
Performing long-running tasks on iOS and iPadOS.
class var shared: BGTaskScheduler
The shared background task scheduler instance.
Mentioned in
Overview
Topics
Getting the shared task scheduler
Background Tasks / BGTaskScheduler
Class
BGTaskScheduler
A class for scheduling tasks that add background support to your app’s most
critical work.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 2

class var supportedResources: BGContinuedProcessingTaskRequest.Resource
Additional system resources that a continuous background task can request.
func register(forTaskWithIdentifier: String, using: dispatch_queue_t?,
launchHandler: (BGTask) -> Void) -> Bool
Register a launch handler for the task with the associated identifier that’s executed on the
specified queue.
func submit(BGTaskRequest) throws
Submit a previously registered background task for execution.
func cancel(taskRequestWithIdentifier: String)
Cancel a previously scheduled task request.
func cancelAllTaskRequests()
Cancel all scheduled task requests.
func getPendingTaskRequests(completionHandler: ([BGTaskRequest]) -> Voi
)
Request a list of unexecuted scheduled task requests.
struct Error
The Errors for the BGTaskSchedulerError domain.
enum Code
An enumeration of the task scheduling errors.
class let errorDomain: String
Checking task requirements
Scheduling a task
Canceling a task
Getting all scheduled tasks
Handling errors


## Page 3

The background tasks error domain as a string.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Background Tasks updates
Learn about important changes in Background Tasks.
class BGTask
An abstract class for the framework’s tasks.
Relationships
Inherits From
Conforms To
See Also
Essentials


