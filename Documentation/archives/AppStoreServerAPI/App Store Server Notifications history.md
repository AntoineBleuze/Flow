# App Store Server Notifications history.pdf

## Page 1

paginationToken
paginationToken
An optional token you use to get the next set of up to 20 notification history
records. All responses that have more records available include a paginati
Token.
Note: Omit this parameter the first time you call this endpoint.
NotificationHistory
Request
The request body that includes the start and end dates, and optional query
constraints.
Content-Type: application/json
200
OK
URL
Sandbox URL
Query Parameters
HTTP Body
Response Codes
App Store Server API / Get Notification History
Web Service Endpoint
Get Notification History
Get a list of notifications that the App Store server attempted to send to your
server.
App Store Server API 1.5+


## Page 2

NotificationHistory
Response
Request succeeded.
Content-Type: application/json
400
(InvalidTransaction
IdError | Pagination
TokenExpiredError |
InvalidPagination
TokenError | Invalid
StartDateError |
InvalidEndDateError
| StartDateAfterEnd
DateError | Start
DateTooFarInPast
Error | Invalid
NotificationType
Error | Multiple
FiltersSupplied
Error)
Bad Request
Invalid request.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
(TransactionIdNot
FoundError | Account
NotFoundError)
Not Found
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit.
Content-Type: application/json
500
(GeneralInternal
Error | General
InternalRetryable
Error)
Internal Server Error
Server error. Try again later.
Content-Type: application/json
App Store Server API changelog
Identifying rate limits
Mentioned in
Discussion


## Page 3

Call this endpoint to get a paginated list of the version 2 App Store Server Notifications that the
App Store attempted to send to your server’s App Store Server Notifications V2
endpoint in a specified timespan. Notification history is available for the past 180 days in the
production environment, and the past 30 days in the sandbox environment.
You can further limit the request by specifying a notificationType or notification
Subtype in the NotificationHistoryRequest object. Alternatively, to get the notification
history for a single user, provide a transactionId. The response, NotificationHistory
Response, contains the full contents of the original notifications.
Each time you call this endpoint, it returns a maximum of 20 notification history records. If the ha
More field in the NotificationHistoryResponse is true, use the paginationToken from
the response in your subsequent request to get the next set of records. Use the same
NotificationHistoryRequest body on subsequent requests.
This endpoint is available in the production and sandbox environments. For more information abo
configuring App Store Server Notifications, see Enabling App Store Server Notifications and Enter
URL for App Store server notifications.
Note
For notifications that relate to in-app purchases, the history records reflect the state of an in-
app purchase at the time the App Store originally sent the notification, and may not reflect its
current state. To get the current state of auto-renewable subscriptions, call the Get All
Subscription Statuses endpoint. For all other in-app purchase types, call the Get
Transaction History endpoint.
object NotificationHistoryRequest
The request body for notification history.
object NotificationHistoryResponse
A response that contains the App Store Server Notifications history for your app.
object notificationHistoryResponseItem
The App Store server notification history record, including the signed notification payload an
the result of the server’s first send attempt.
See Also
App Store Server Notifications history


## Page 4



## Page 5

startDate
startDate
Required. The start date of the timespan for the requested App Store Server
Notification history records. The startDate needs to precede the endDate
Choose a startDate that’s within the past 180 days. In the sandbox
environment, choose a startDate that’s within the past 30 days.
endDate
endDate
Required. The end date of the timespan for the requested App Store Server
Notification history records. Choose an endDate that’s later than the start
Date. If you choose an endDate in the future, the endpoint automatically us
the current date as the endDate.
notificationType
notificationType
Optional. A notification type. Provide this field to limit the notification history
records to those with this one notification type. For a list of notifications type
see notificationType.
Note: You may include either the transactionId or the notification
Type property (or neither) in your query, but not both.
notificationSubtype
notificationSubtype
Optional. A notification subtype. Provide this field to limit the notification
history records to those with this one notification subtype. For a list of
subtypes, see subtype. If you specify a notificationSubtype, you nee
to also specify its related notificationType.
onlyFailures
onlyFailures
Optional. A Boolean value you set to true to request only the notifications th
haven’t reached your server successfully. The response also includes
notifications that the App Store server is currently retrying to send to your
server.
Properties
App Store Server API / NotificationHistoryRequest
Object
NotificationHistoryRequest
The request body for notification history.
App Store Server API 1.5+


## Page 6

transactionId
transactionId
Optional. The transaction identifier, which may be an original transaction
identifier, of any transaction belonging to the customer. Provide this field to
limit the notification history request to this one customer.
Note: You may include either the transactionId or the notification
Type property (or neither) in your query, but not both.
originalTransaction
Id
string
Deprecated   Use transactionId instead.
App Store Server API changelog
Specify the constraints for the App Store Server Notification history entries you’re requesting from
Get Notification History. The request requires the startDate and endDate fields; all
other fields are optional. Include only the fields in your request that you need to constrain the
response.
If you provide both the notificationType and subtype, they need to be a valid combination,
otherwise, the request returns an InvalidNotificationTypeError error. For more
information, see notificationType and subtype.
Note
Notification history is available for the past 180 days in the production environment, and the
past 30 days in the sandbox environment. Choose a startDate that’s within the past 180
days in the production environment, and within the past 30 days in the sandbox environment.
type startDate
The start date of a timespan, expressed in UNIX time, in milliseconds.
type endDate
The end date of a timespan, expressed in UNIX time, in milliseconds.
Mentioned in
Discussion
Topics
Data types


## Page 7

type notificationType
A notification type value that App Store Server Notifications 2 uses.
type notificationSubtype
A notification subtype value that App Store Server Notifications 2 uses.
type onlyFailures
A Boolean value that indicates whether the response includes only notifications that failed to
reach your server.
Get Notification History
Get a list of notifications that the App Store server attempted to send to your server.
object NotificationHistoryResponse
A response that contains the App Store Server Notifications history for your app.
object notificationHistoryResponseItem
The App Store server notification history record, including the signed notification payload an
the result of the server’s first send attempt.
See Also
App Store Server Notifications history


## Page 8

notificationHistory
[notificationHistory
ResponseItem]
An array of App Store Server Notifications history records.
If you set onlyFailures to true in the NotificationHistoryRequest
this array contains only the notifications that failed to reach your server.
hasMore
hasMore
A Boolean value that indicates whether the App Store has more notification
history records to send. If hasMore is true, use the paginationToken in
the subsequent request to get more records. If hasMore is false, there are n
more records available.
paginationToken
paginationToken
A pagination token that you provide to Get Notification History on a
subsequent request to get the next page of responses.
App Store Server API changelog
The Get Notification History endpoint returns this response. Notification history records
contain the notifications that the App Store server attempted to send to your server’s App Stor
Server Notifications V2 endpoint.
Properties
Mentioned in
Discussion
App Store Server API / NotificationHistoryResponse
Object
NotificationHistoryResponse
A response that contains the App Store Server Notifications history for your app.
App Store Server API 1.5+


## Page 9

The notification history response contains a maximum of 20 notification history records per
response. If the history has more than 20 records, the hasMore value is true. Call Get
Notification History again with paginationToken in the query to receive the next page 
responses. When the App Store has no more records to send, the hasMore value is false.
Note
The notifications in the history records reflect the state of an in-app purchase at the time the
App Store originally sent the notification, and may not reflect its current state. To get the
current state of auto-renewable subscriptions, call the Get All Subscription Statuses
endpoint. For all other in-app purchase types, call the Get Transaction History
endpoint.
type paginationToken
A pagination token that you return to the endpoint on a subsequent call to receive the next s
of results.
type hasMore
A Boolean value indicating whether the App Store has more transaction data.
Get Notification History
Get a list of notifications that the App Store server attempted to send to your server.
object NotificationHistoryRequest
The request body for notification history.
object notificationHistoryResponseItem
Topics
Data types
See Also
App Store Server Notifications history


## Page 10

The App Store server notification history record, including the signed notification payload an
the result of the server’s first send attempt.


## Page 11

sendAttempts
[sendAttemptItem]
An array of information the App Store server records for its attempts to send 
notification to your server. The maximum number of entries in the array is six
signedPayload
signedPayload
The cryptographically signed payload, in JSON Web Signature (JWS) format,
containing the original response body of a version 2 notification. For more
information, see signedPayload in App Store Server Notifications.
firstSendAttempt
Result
string
Deprecated   The result of the App Store server’s first attempt to send the
notification to your server’s App Store Server Notifications V2
endpoint.
Use the earliest sendAttemptItem in the sendAttempts array instead.
App Store Server API changelog
Properties
Mentioned in
Topics
App Store Server API / notificationHistoryResponseItem
Object
notificationHistoryResponseItem
The App Store server notification history record, including the signed notification
payload and the result of the server’s first send attempt.
App Store Server API 1.5+


## Page 12

type sendAttemptResult
The success or error information the App Store server records when it attempts to send an
App Store server notification to your server.
object sendAttemptItem
The success or error information and the date the App Store server records when it attempts
to send a server notification to your server.
type signedPayload
A cryptographically signed payload, in JSON Web Signature (JWS) format, containing the
response body for a version 2 notification.
Get Notification History
Get a list of notifications that the App Store server attempted to send to your server.
object NotificationHistoryRequest
The request body for notification history.
object NotificationHistoryResponse
A response that contains the App Store Server Notifications history for your app.
Data types
See Also
App Store Server Notifications history


