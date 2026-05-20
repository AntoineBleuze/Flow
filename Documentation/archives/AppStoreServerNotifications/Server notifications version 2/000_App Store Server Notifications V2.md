# 000_App Store Server Notifications V2.pdf

## Page 1

200
responseBodyV2
OK
The response body for a version 2 notification.
Content-Type: application/json
App Store Server Notifications changelog
Enabling App Store Server Notifications
Receiving App Store Server Notifications
Responding to App Store Server Notifications
To receive server notifications from the App Store, provide your secure server’s HTTPS URL in Ap
Store Connect. For more information, see Enabling App Store Server Notifications. To secure your
server and receive notifications, your server must support the Transport Layer Security (TLS)
protocol version 1.2 or later.
URL
Response Codes
Mentioned in
Discussion
App Store Server Notific… / App Store Server Notifications V2
Web Service Endpoint
App Store Server Notifications V2
Specify your secure server’s URL in App Store Connect to receive version 2
notifications.
App Store Server Notifications 2.0+


## Page 2

Upon receiving a server notification, respond to the App Store with an HTTP status code of 200-
206 if the post was successful. If the post was unsuccessful, send HTTP 50x or 40x to have the
App Store retry the notification. For more information, see Responding to App Store Server
Notifications.
object responseBodyV2
The response body the App Store sends in a version 2 server notification.
object responseBodyV2DecodedPayload
A decoded payload that contains the version 2 notification data.
type notificationType
The type that describes the In-App Purchase or external purchase event for which the App
Store sends the version 2 notification.
type subtype
A string that provides details about select notification types in version 2.
See Also
Server notifications version 2


