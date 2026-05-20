# 002_SendTestNotificationResponse.pdf

## Page 1

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


## Page 2

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


