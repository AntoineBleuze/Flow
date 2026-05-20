# 000_Get Notification History.pdf

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



