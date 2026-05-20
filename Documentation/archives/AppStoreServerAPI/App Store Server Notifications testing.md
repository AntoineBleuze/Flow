# App Store Server Notifications testing.pdf

## Page 1

200
SendTestNotification
Response
OK
Successfully received your request to send a test notification.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
ServerNotification
URLNotFoundError
Not Found
An error that indicates that the App Store server couldn’t find a notifications
URL for your app in this environment. For more information, see Server
NotificationURLNotFoundError.
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit.
Content-Type: application/json
URL
Sandbox URL
Response Codes
App Store Server API / Request a Test Notification
Web Service Endpoint
Request a Test Notification
Ask App Store Server Notifications to send a test notification to your server.
App Store Server API 1.5+


## Page 2

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
Use this endpoint to test if your server is receiving App Store Server Notifications at the URLs tha
you configured in App Store Connect. The Request a Test Notification endpoint prompt
the App Store server to send your server a notification with the TEST notificationType. The
App Store server sends the TEST notification to your production URL if you call this endpoint’s
production URL; it sends it to your sandbox URL if you call this endpoint’s sandbox URL.
Although TEST is a version 2 notification, you can call this endpoint regardless of whether you
configured your App Store Server Notifications URL in App Store Connect for version 1 or version 
For more information about the configuration and enabling notifications, see Enter a URL for App
Store server notifications and Enabling App Store Server Notifications.
This endpoint responds with a testNotificationToken in SendTestNotification
Response. To learn the result that the App Store server recorded when it attempted to send you
server the TEST notification, call the Get Test Notification Status endpoint with the
testNotificationToken. Use the status information to troubleshoot your server if it’s unable
to receive the TEST notification.
Get Test Notification Status
Check the status of the test App Store server notification sent to your server.
object SendTestNotificationResponse
A response that contains the test notification token.
object CheckTestNotificationResponse
Mentioned in
Discussion
See Also
App Store Server Notifications testing


## Page 3

A response that contains the contents of the App Store server’s test notification and the res
from your server.


## Page 4

testNotification
Token
testNotification
Token
(Required) The token that uniquely identifies a test, that you receive when yo
call Request a Test Notification.
200
CheckTest
NotificationResponse
OK
Success.
Content-Type: application/json
400
InvalidTest
NotificationToken
Error
Bad Request
The test notification token is invalid. Use a valid token that you receive in the
SendTestNotificationResponse.
Content-Type: application/json
401
Unauthorized
URL
Sandbox URL
Path Parameters
Response Codes
App Store Server API / Get Test Notification Status
Web Service Endpoint
Get Test Notification Status
Check the status of the test App Store server notification sent to your server.
App Store Server API 1.5+


## Page 5

The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
TestNotificationNot
FoundError
Not Found
The status isn’t yet available or the test notification token wasn’t found.
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
Call this endpoint using the testNotificationToken you receive when you call Request a
Test Notification. You can check the status using the testNotificationToken for up t
six months. Use the information in the CheckTestNotificationResponse to troubleshoot yo
server if it’s unable to receive App Store Server Notifications successfully.
Request a Test Notification
Ask App Store Server Notifications to send a test notification to your server.
object SendTestNotificationResponse
A response that contains the test notification token.
object CheckTestNotificationResponse
Mentioned in
Discussion
See Also
App Store Server Notifications testing


## Page 6

A response that contains the contents of the App Store server’s test notification and the res
from your server.


## Page 7

testNotification
Token
testNotification
Token
The test notification token that uniquely identifies the notification test that Ap
Store Server Notifications sends to your server.
The Request a Test Notification endpoint returns this response, which includes a test
NotificationToken value to reference the test associated with your request. When you reque
a test notification, the App Store server sends a notification with the TEST notificationType 
your server. To learn the result of the App Store server’s attempt to send the TEST notification, ca
Get Test Notification Status with the testNotificationToken.
For more information about notifications, see App Store Server Notifications.
type testNotificationToken
Properties
Discussion
Topics
Data types
App Store Server API / SendTestNotificationResponse
Object
SendTestNotificationResponse
A response that contains the test notification token.
App Store Server API 1.0+


## Page 8

A unique identifier for a notification test that the App Store server sends to your server.
Request a Test Notification
Ask App Store Server Notifications to send a test notification to your server.
Get Test Notification Status
Check the status of the test App Store server notification sent to your server.
object CheckTestNotificationResponse
A response that contains the contents of the App Store server’s test notification and the res
from your server.
See Also
App Store Server Notifications testing


## Page 9

sendAttempts
[sendAttemptItem]
An array of information the App Store server records for its attempts to send
the TEST notification to your server. The array may contain a maximum of six
sendAttemptItem objects.
signedPayload
signedPayload
The signed payload, in JWS format, that contains the TEST notification that t
App Store server sent to your server.
firstSendAttempt
Result
string
Deprecated   The result of the App Store server’s first attempt to send the TES
notification to your server.
Use the first sendAttemptItem in the sendAttempts array instead.
App Store Server API changelog
The Get Test Notification Status endpoint returns this response.
The sendAttempts array contains up to six sendAttemptItem items: one for the initial attemp
and up to five for the retries. Use this information to troubleshoot your server if it doesn’t receive
notifications at its App Store Server Notifications V2 endpoint successfully.
Properties
Mentioned in
Discussion
App Store Server API / CheckTestNotificationResponse
Object
CheckTestNotificationResponse
A response that contains the contents of the App Store server’s test notification
and the result from your server.
App Store Server API 1.5+


## Page 10

The signedPayload contains the TEST notification that the App Store server attempted to send
to your server.
object sendAttemptItem
The success or error information and the date the App Store server records when it attempts
to send a server notification to your server.
type signedPayload
A cryptographically signed payload, in JSON Web Signature (JWS) format, containing the
response body for a version 2 notification.
Request a Test Notification
Ask App Store Server Notifications to send a test notification to your server.
Get Test Notification Status
Check the status of the test App Store server notification sent to your server.
object SendTestNotificationResponse
A response that contains the test notification token.
Topics
Data types
See Also
App Store Server Notifications testing


