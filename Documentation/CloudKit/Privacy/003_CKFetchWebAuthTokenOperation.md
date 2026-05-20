# 003_CKFetchWebAuthTokenOperation.pdf

## Page 1

Changing Access Controls on User Data
CloudKit web services provides an HTTP interface to fetch, create, update, and delete records,
zones, and subscriptions. Each request you send requires an API token, which you configure in
CloudKit Dashboard. You must create an API token for each container in each environment.
If you want to send a request to an endpoint that requires an authenticated user, use this operatio
to fetch an authentication token. Append the authentication token, along with the API token, to th
endpoint’s URL. That request then acts on behalf of the current user. Authentication tokens are
short-lived and expire after a single use.
For an example of using a web authentication token with a CloudKit web service, see Changing
Access Controls on User Data.
This operation executes the handlers you provide on an internal queue it manages. Your handlers
must be capable of executing on a background queue. Tasks that need access to the main queue
must redirect as appropriate.
The operation calls fetchWebAuthTokenCompletionBlock after it executes to provide the
fetched token. Use the completion handler to perform housekeeping tasks for the operation. It
should also manage any failures, whether due to an error or an explicit cancellation.
Mentioned in
Overview
CloudKit / CKFetchWebAuthTokenOperation
Class
CKFetchWebAuthTokenOperation
An operation that creates an authentication token for use with CloudKit web
services.
iOS 9.2+
iPadOS 9.2+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.1+
visionOS 1.0+
watchOS 3.0+


## Page 2

Note
Because this class inherits from Operation, you can also set the completionBlock
property. The operation calls both completion handlers if they’re both set.
CloudKit operations have a default QoS of QualityOfService.default. Operations with this
service level are discretionary. The system schedules their execution at an optimal time according
to battery level and network conditions, among other factors. Use the qualityOfService
property to set a more appropriate QoS for the operation.
The following example shows how to create the operation, configure its callbacks, and execute it 
the user’s private database:
convenience init(apiToken: String)
Topics
Creating a Fetch Token Operation


## Page 3

Creates a fetch operation for the specified API token.
init()
Creates an empty fetch operation.
var apiToken: String?
The API token that allows access to an app’s container.
var fetchWebAuthTokenCompletionBlock: ((String?, (any Error)?) -> Void)
The block to execute when the operation finishes.
Deprecated
var fetchWebAuthTokenResultBlock: ((Result<String, any Error>) -> Void)
CKDatabaseOperation
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Managing the Operation’s Configuration
Instance Properties
Relationships
Inherits From
Conforms To
See Also


## Page 4

Encrypting User Data
Deploy industry-standard security technologies using CloudKit encryption.
Providing User Access to CloudKit Data
Provide users access to the data your app stores on their behalf.
Changing Access Controls on User Data
Restrict access to or remove restrictions from a user’s data at their request.
Responding to Requests to Delete Data
Provide options for users to delete their CloudKit data from your app.
Identifying an App’s Containers
Use Xcode’s Project navigator to find the identifiers of active CloudKit containers.
Privacy


