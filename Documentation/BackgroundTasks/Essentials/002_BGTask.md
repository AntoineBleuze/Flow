# 002_BGTask.pdf

## Page 1

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


## Page 2

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


