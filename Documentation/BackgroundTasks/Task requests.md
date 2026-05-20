# Task requests.pdf

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

Choosing Background Strategies for Your App
var protectionTypeOfRequiredData: NSString
The file protection required to access health research data relevant to complete the task.
BGProcessingTaskRequest
Mentioned in
Topics
Setting file permissions
Relationships
Inherits From
Background Tasks / BGHealthResearchTaskRequest
Class
BGHealthResearchTaskRequest
A request to launch your app in the background to execute processing for a health
research study in which a user participates.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
tvOS 17.0+
visionOS 1.0+


## Page 8

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
class BGTaskRequest
An abstract class for representing task requests.
class BGContinuedProcessingTaskRequest
A request for a workload that the system continues processing even if a person backgrounds
the app.
Conforms To
See Also
Task requests


## Page 9

Performing long-running tasks on iOS and iPadOS
The app submits this request from the foreground. Submission needs to occur as a result of a
person’s action, such as tapping a button. The framework begins processing the task immediately
if possible, and the system allows it to continue running even if the app moves to the background
For more information on Continuous Background Task requests, see Performing long-running tas
on iOS and iPadOS.
init(identifier: String, title: String, subtitle: String)
Creates an instance on behalf of the currently foregrounded app.
Mentioned in
Overview
Topics
Creating a task request
Background Tasks / BGContinuedProcessingTaskRequest
Class
BGContinuedProcessingTaskRequest
A request for a workload that the system continues processing even if a person
backgrounds the app.
iOS 26.0+
iPadOS 26.0+


## Page 10

var requiredResources: BGContinuedProcessingTaskRequest.Resources
An option that indicates any special system resources that the task requires.
struct Resources
Options that specify additional system resources a background task needs.
var strategy: BGContinuedProcessingTaskRequest.SubmissionStrategy
The submission strategy for the scheduler to abide by.
enum SubmissionStrategy
The ways your app suggests the system handle your task’s submission under varying
conditions.
var subtitle: String
The localized subtitle displayed to a person.
var title: String
The localized task title displayed to a person.
BGTaskRequest
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Identifying resource dependencies
Choosing a processing strategy
Titling the task
Relationships
Inherits From
Conforms To


## Page 11

Hashable
NSCopying
NSObjectProtocol
class BGProcessingTaskRequest
A request to launch your app in the background to execute a processing task that can take
minutes to complete.
class BGAppRefreshTaskRequest
A request to launch your app in the background to execute a short refresh task.
class BGTaskRequest
An abstract class for representing task requests.
class BGHealthResearchTaskRequest
A request to launch your app in the background to execute processing for a health research
study in which a user participates.
See Also
Task requests


