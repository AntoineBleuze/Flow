# 000_BGProcessingTaskRequest.pdf

## Page 1

init(identifier: String)
Return a new processing task request for the specified identifier.
var requiresExternalPower: Bool
A Boolean specifying if the processing task requires a device connected to power.
var requiresNetworkConnectivity: Bool
A Boolean specifying if the processing task requires network connectivity.
Topics
Initializing a Processing Task Request
Setting Task Request Options
Relationships
Inherits From
Background Tasks / BGProcessingTaskRequest
Class
BGProcessingTaskRequest
A request to launch your app in the background to execute a processing task that
can take minutes to complete.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 2

BGTaskRequest
BGHealthResearchTaskRequest
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class BGAppRefreshTaskRequest
A request to launch your app in the background to execute a short refresh task.
class BGTaskRequest
An abstract class for representing task requests.
class BGHealthResearchTaskRequest
A request to launch your app in the background to execute processing for a health research
study in which a user participates.
class BGContinuedProcessingTaskRequest
A request for a workload that the system continues processing even if a person backgrounds
the app.
Inherited By
Conforms To
See Also
Task requests


