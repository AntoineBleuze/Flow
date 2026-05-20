# 002_BGTaskRequest.pdf

## Page 1

var earliestBeginDate: Date?
The earliest date and time at which to run the task.
var identifier: String
The identifier of the task associated with the request.
NSObject
BGAppRefreshTaskRequest, BGContinuedProcessingTaskRequest, 
BGProcessingTaskRequest
Topics
Configuring a Task Request
Relationships
Inherits From
Inherited By
Background Tasks / BGTaskRequest
Class
BGTaskRequest
An abstract class for representing task requests.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class BGProcessingTaskRequest
A request to launch your app in the background to execute a processing task that can take
minutes to complete.
class BGAppRefreshTaskRequest
A request to launch your app in the background to execute a short refresh task.
class BGHealthResearchTaskRequest
A request to launch your app in the background to execute processing for a health research
study in which a user participates.
class BGContinuedProcessingTaskRequest
A request for a workload that the system continues processing even if a person backgrounds
the app.
Conforms To
See Also
Task requests


