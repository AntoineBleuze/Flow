# 002_responseBodyV2DecodedPayload.pdf

## Page 1

notificationType
notificationType
The in-app purchase event for which the App Store sends this version 2
notification.
subtype
subtype
Additional information that identifies the notification event. The subtype fiel
is present only for specific version 2 notifications.
data
data
The object that contains the app metadata and signed renewal and transactio
information.
The data, appData, summary, and externalPurchaseToken fields are
mutually exclusive. The payload contains only one of these fields.
summary
summary
The summary data that appears when the App Store server completes your
request to extend a subscription renewal date for eligible subscribers. For mo
information, see Extend Subscription Renewal Dates for All
Active Subscribers.
The data, appData, summary, and externalPurchaseToken fields are
mutually exclusive. The payload contains only one of these fields.
externalPurchase
Token
externalPurchase
Token
This field appears when the notificationType is EXTERNAL_PURCHASE
_TOKEN.
The data, appData, summary, and externalPurchaseToken fields are
mutually exclusive. The payload contains only one of these fields.
Properties
App Store Server Notific… / responseBodyV2DecodedPayload
Object
responseBodyV2DecodedPayload
A decoded payload that contains the version 2 notification data.
App Store Server Notifications 2.0+


## Page 2

appData
appData
The object that contains the app metadata and signed app transaction
information. This field appears when the notificationType is RESCIND
_CONSENT.
The data, appData, summary, and externalPurchaseToken fields are
mutually exclusive. The payload contains only one of these fields.
version
version
The App Store Server Notification version number, "2.0".
signedDate
signedDate
The UNIX time, in milliseconds, that the App Store signed the JSON Web
Signature data.
notificationUUID
notificationUUID
A unique identifier for the notification. Use this value to identify a duplicate
notification.
App Store Server Notifications changelog
The responseBodyV2DecodedPayload is the Base64URL-decoded notification information
from the JWS payload portion of the signedPayload. Use the notificationType and
subtype to understand the event that led to this notification.
The payload can contain only one of the following four fields:
A data object, which contains details including the environment, the app metadata, and the
signed transaction and subscription renewal information.
An appData object, which contains details including the environment, the app metadata, and
the signed app transaction information.
A summary object, which contains information only when the notification is a RENEWAL
_EXTENSION with a SUMMARY subtype. For more information, see Extend Subscription
Renewal Dates for All Active Subscribers.
An externalPurchaseToken object, which contains an external purchase token only when
the notification is EXTERNAL_PURCHASE_TOKEN. For more information about this notification,
see externalPurchaseToken.
Mentioned in
Discussion
Topics
Response objects for in-app purchases


## Page 3

object summary
The payload data for a subscription-renewal-date extension notification.
object data
The payload data that contains app metadata and the signed renewal and transaction
information.
object appData
The object that contains the app metadata and signed app transaction information.
object externalPurchaseToken
The payload data that contains an external purchase token.
type notificationType
The type that describes the In-App Purchase or external purchase event for which the App
Store sends the version 2 notification.
type subtype
A string that provides details about select notification types in version 2.
type version
A string that indicates the notification’s App Store Server Notifications version number.
type signedDate
The UNIX time, in milliseconds, that the App Store signed the JSON Web Signature data.
type notificationUUID
A unique identifier for the notification.
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
Response object for an external purchase
Response types
JWS header and payload data types


## Page 4

object JWSDecodedHeader
A decoded JSON Web Signature header containing transaction or renewal information.
Transaction data types
Refer to these data types for decoded transaction and renewal information payloads.
App Store Server Notifications V2
Specify your secure server’s URL in App Store Connect to receive version 2 notifications.
object responseBodyV2
The response body the App Store sends in a version 2 server notification.
type notificationType
The type that describes the In-App Purchase or external purchase event for which the App
Store sends the version 2 notification.
type subtype
A string that provides details about select notification types in version 2.
See Also
Server notifications version 2


