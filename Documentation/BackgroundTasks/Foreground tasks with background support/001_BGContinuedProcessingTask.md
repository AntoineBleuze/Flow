# 001_BGContinuedProcessingTask.pdf

## Page 1

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


## Page 2

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


## Page 3

The entitlement the system requires for a continuous background task to use the GPU.


