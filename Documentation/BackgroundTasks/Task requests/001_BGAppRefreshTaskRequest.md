# 001_BGAppRefreshTaskRequest.pdf

## Page 1

Choosing Background Strategies for Your App
init(identifier: String)
Return a new refresh task request for the specified identifier.
BGTaskRequest
Mentioned in
Topics
Initializing a refresh task request
Relationships
Inherits From
Conforms To
Background Tasks / BGAppRefreshTaskRequest
Class
BGAppRefreshTaskRequest
A request to launch your app in the background to execute a short refresh task.
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
class BGTaskRequest
An abstract class for representing task requests.
class BGHealthResearchTaskRequest
A request to launch your app in the background to execute processing for a health research
study in which a user participates.
class BGContinuedProcessingTaskRequest
A request for a workload that the system continues processing even if a person backgrounds
the app.
See Also
Task requests


