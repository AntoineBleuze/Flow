# Foreground tasks with background support.pdf

## Page 1

On iOS and iPadOS, apps can execute long-running jobs using the Continuous Background Task
(BGContinuedProcessingTask), which enables your app’s critical work that can take minutes
or more, to complete in the background if a person backgrounds the app before the job complete
Unlike other BGTask subclasses, BGContinuedProcessingTask starts in the foreground. In
addition, your app needs to run the task only in response to someone’s action, such as tapping a
button. If a person backgrounds the app before the task completes, a continuous background tas
can still perform operations, for example, Core ML processing or sensor data analysis, that
leverage the GPU (on supported devices). In the background, continuous background tasks can
also use the network and perform intenstive CPU-based operations, for example, image processi
with Core Image, Vision, and Accelerate. Example tasks include:
Exporting video in a film-editing app, or audio in a digital audio workstation (DAW)
Creating thumbnails for a new batch of photo uploads
Applying visual filters (HDR, etc) or compressing images for social media posts
For added flexibility, you can set the system to fail any task if, under resource constraints, the
system can’t begin processing the task immediately. Otherwise, the system queues the task to
begin as soon as possible.
Overview
Background Tasks / Performing long-running tasks on iOS and iPadOS
Article
Performing long-running tasks on iOS and
iPadOS
Use a continuous background task to do work that can complete as needed.


## Page 2

When the system runs a continuous background task and a person backgrounds the app, the
system keeps them informed of the task’s progress through a system interface. For power and
performance considerations, people can cancel a continuous background task if they desire,
through the interface. Your app regularly reports progress of the task, which enables the system t
make informed suggestions through the interface about possibly stuck tasks that a person can
cancel.
If a person cancels a task through the interface, the framework invokes the task’s expiration
handler and the app handles the failure. Otherwise, the framework returns control to the app’s
completion handler with a success status.


## Page 3

To begin a job that you want to complete even if a person backgrounds the app, start by creating 
task request (BGContinuedProcessingTaskRequest). Choose a name the system can use to
identify the specific job in the taskIdentifier parameter of the initializer and prefix it with you
app’s bundle ID:
Make the task-name portion of the task identifier unique for this specific job. The system display
the title and subtitle arguments you choose in a Live Activity, where a person can monitor
the job’s progress and cancel it, if they choose.
Create a Continuous Background Task request


## Page 4

If your job includes API that can utilize the GPU, enable background GPU use for your task by
setting requiredResources to gpu. First, check whether the device supports background GPU
use by seeing if supportedResources contains .gpu:
The system requires your app to have the Background GPU Access entitlement with a value o
true to use the GPU in the background. To do that, enable the Background GPU Access capabilit
on your app’s target. For more information about capabilities in Xcode, see Adding capabilities to
your app.
When the system is busy or resource constrained, it might queue your task request for later
execution. The default submission strategy, BGContinuedProcessingTaskRequest
.SubmissionStrategy.queue, instructs the system to add your task request to a queue if
there’s no immediately available room to run it.
If instead you want the task submission to fail if the system is unable to run the task immediately,
set strategy to BGContinuedProcessingTaskRequest.SubmissionStrategy.fail .
The system cancels a fail task right away if it can’t begin processing the task immediately, for
example, when the system reaches a maximum number of concurrent tasks.
To run the job, register the task request with the shared BGTaskScheduler using the unique
taskIdentifier:
Enable background GPU use
Choose a processing strategy
Run the continuous background task


## Page 5

The register(forTaskWithIdentifier:using:launchHandler:) launch handler
provides the BGContinuedProcessingTask reference for you to control execution.
Inside the launch handler, define your task’s long-running code:
Next, submit the request by passing it to the shared scheduler’s submit(_:) method:
The system displays the job and other continuous background tasks in a Live Activity to inform
people of background task progress. It’s important to display accurate progress, as a person can
Report progress


## Page 6

cancel a task through the Live Activity widget if the task appears to be stuck.
To set progress, use the ProgressReporting protocol that BGContinuedProcessingTask
conforms to:
The system also prioritizes the termination of tasks that reflect minimal progress, if resource
constraints occur at run time.
Prepare to handle task failure or success by checking the tasks expirationHandler:
Respond to task completion


## Page 7

A task can fail if your code encounters an error or the system expires your task, as occurs when a
person cancels the task in the system UI.
Note
The system cancels any running tasks if a person closes the app in the app switcher, but the
app doesn’t receive an indication of cancellation in that case.
class BGContinuedProcessingTask
A task that starts in the foreground and can continue running in the background as needed.
Background GPU Access
The entitlement the system requires for a continuous background task to use the GPU.
See Also
Foreground tasks with background support


## Page 8

Performing long-running tasks on iOS and iPadOS
This task works with BGContinuedProcessingTaskRequest.
The system displays the progress of this task in a Live Activity and a person can cancel it through
the interface if they wish.
The system can terminate a continuous background task abruptly depending on run-time
conditions, for example, under resource constraints. Your implementation needs to report progres
using the ProgressReporting protocol that this task conforms to. The system prioritizes the
termination of tasks that reflect minimal or no progress, when resources become constrained.
For more information on Continuous Background Task requests, see Performing long-running tas
on iOS and iPadOS.
Mentioned in
Overview
Topics
Background Tasks / BGContinuedProcessingTask
Class
BGContinuedProcessingTask
A task that starts in the foreground and can continue running in the background a
needed.
iOS 26.0+
iPadOS 26.0+


## Page 9

var title: String
The localized title displayed to a person.
var subtitle: String
The localized subtitle displayed to a person.
func updateTitle(String, subtitle: String)
Update the task title and subtitle that the system displays to a person.
BGTask
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
ProgressReporting
Performing long-running tasks on iOS and iPadOS
Use a continuous background task to do work that can complete as needed.
Background GPU Access
Titling the task
Relationships
Inherits From
Conforms To
See Also
Foreground tasks with background support


## Page 10

The entitlement the system requires for a continuous background task to use the GPU.


## Page 11

Key
com.apple.developer.background-tasks.continued-processing.gpu
Type
Boolean
Default: NO
This entitlement works with BGContinuedProcessingTask, which allows your app’s critical
work to complete even when the app goes into the background before the task finishes.
To enable GPU use in the task, add this entitlement to your app by adding the Background GPU
Access capability to your target in Xcode. For more information, see Adding capabilities to your
app.
For more information about continuous background tasks, see Performing long-running tasks on
iOS and iPadOS.
Details
Attributes
Discussion
Bundle Resources / Entitlements / Background GPU Access
Property List Key
Background GPU Access
The entitlement the system requires for a continuous background task to use the
GPU.
iOS 26.0+
iPadOS 26.0+


