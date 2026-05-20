# 001_NotificationHistoryRequest.pdf

## Page 1

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


## Page 2

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


## Page 3

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


