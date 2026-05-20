# Essentials.pdf

## Page 1

Browse notable changes in Background Tasks.
Execute long-running jobs using the Continuous Background Task (BGContinuedProcessin
Task), which enables your app’s critical work to complete in the background when a person
sends your app to the background before the job completes. For more information, see
Performing long-running tasks on iOS and iPadOS.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
Overview
June 2025
Continuous Background Tasks
See Also
Technology updates
Updates / Background Tasks updates
Article
Background Tasks updates
Learn about important changes in Background Tasks.


## Page 2

AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

Performing long-running tasks on iOS and iPadOS
With the exception of BGContinuedProcessingTask, which your app executes in the
foreground, the system executes BGTask subclasses on behalf of your app, while your app is in t
background.
var identifier: String
The string identifier of the task.
var expirationHandler: (() -> Void)?
Mentioned in
Overview
Topics
Reading Task Information
Configuring a Task
Background Tasks / BGTask
Class
BGTask
An abstract class for the framework’s tasks.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 7

A handler called shortly before the task’s background time expires.
func setTaskCompleted(success: Bool)
Informs the background task scheduler that the task is complete.
NSObject
BGAppRefreshTask, BGContinuedProcessingTask, BGProcessingTask
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Background Tasks updates
Learn about important changes in Background Tasks.
class BGTaskScheduler
A class for scheduling tasks that add background support to your app’s most critical work.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Essentials


