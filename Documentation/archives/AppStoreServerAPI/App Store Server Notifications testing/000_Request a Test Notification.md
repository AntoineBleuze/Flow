# 000_Request a Test Notification.pdf

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


