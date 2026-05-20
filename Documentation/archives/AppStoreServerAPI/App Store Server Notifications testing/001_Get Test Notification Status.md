# 001_Get Test Notification Status.pdf

## Page 1

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


## Page 2

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


## Page 3

A response that contains the contents of the App Store server’s test notification and the res
from your server.


