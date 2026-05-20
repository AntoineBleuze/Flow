# Essentials.pdf

## Page 1

App Store Server Notifications is a server-to-server service that sends real-time notifications for i
app purchase events, and notifications for unreported external purchase tokens. To enable
notifications, set up an HTTPS URL on your server, and configure settings in App Store Connect.
For information about parsing and interpreting notifications, see Receiving App Store Server
Notifications.
To receive server notifications from the App Store, your server must support the Transport Layer
Security (TLS) 1.2 protocol or later.
To enable App Store Server Notifications, follow these steps:
1. Determine the HTTPS URL on your server to receive notifications for the production
environment.
2. Optionally, determine the HTTPS URL on your server to receive notifications for the sandbox
environment for testing notifications. You may use the same URL for both the production and t
sandbox environments.
3. App Store Connect gives you the choice of receiving version 2 or version 1 notifications for eac
environment. To choose version 2, set up your endpoint as App Store Server
Notifications V2.
4. Configure your URL in App Store Connect. For more information, see Enter a URL for App Store
Server Notifications.
Overview
Set up your server and App Store Connect settings
App Store Server Notific… / Enabling App Store Server Notifications
Article
Enabling App Store Server Notifications
Configure your server and provide an HTTPS URL to receive notifications about in
app purchase events and unreported external purchase tokens.


## Page 2

Important
If you specify a port in your URL, the port must be either 443 or greater than or equal to 1024.
For example, the URL https://example.com:1234/notifications specifies the port
1234.
Configure your server to respond with HTTP status codes to indicate whether the App Store serve
notification POST is successful. For more information, see Responding to App Store Server
Notifications.
For new implementations, use App Store Server Notifications V2. To transition from
using version 1 notifications to version 2, test version 2 notifications in the sandbox environment
before you update your production environment to version 2.
For information about changes to App Store Server Notifications, see App Store Server
Notifications changelog.
If your server requires IP addresses to be on an allow list, add the IP address subnet 17.0.0
.0/8 to allow your server to receive notifications from the App Store server. This subnet applies t
both the sandbox and the production environments.
To determine whether your server is receiving notifications, call the Request a Test
Notification endpoint in the App Store Server API. This endpoint asks the App Store server to
send a notification with the notificationType TEST. Use the testNotificationToken yo
receive to call the Get Test Notification Status endpoint to learn how your server
responds to the test notification.
The App Store server sends the TEST notification in the version 2 notification format. However, it
sends it to your server regardless of whether you configure a version 1 or version 2 notification UR
in App Store Connect.
Receiving App Store Server Notifications
Implement server-side code to receive and parse notification posts.
Configure an allow list
Test your server setup
See Also
Essentials


## Page 3

Responding to App Store Server Notifications
Send HTTP status codes to indicate the success of a notification post.
App Store Server Notifications changelog
Learn about changes to the App Store Server Notifications service.


## Page 4

The App Store delivers JSON objects using an HTTP POST to your server for notable in-app
purchase events and unreported external purchase tokens. Your server is responsible for parsing,
interpreting, and responding to all server-to-server notification posts. For more information about
responding, see Responding to App Store Server Notifications.
The body of the POST contains the data elements described in the responseBodyV2 for version
2 notifications, and responseBodyV1 for version 1. Parse them using the following information:
The version 2 response body, responseBodyV2, contains a signedPayload that’s
cryptographically signed by the App Store in JSON Web Signature (JWS) format. The JWS
format increases security and enables you to decode and validate the signature on your server
Some notifications include a data object, which has transaction and subscription renewal
information that the App Store signs in JWS. The App Store Server API and the StoreKit In-App
Purchase API use the same JWS-signed format for transaction and subscription status
information. For more information about JWS, see the IETF RFC 7515 specification.
The version 1 response body, responseBodyV1, is a JSON object. It includes the receipt that
contains the most recent in-app purchase transaction for the app. For more information, see th
unified_receipt object.
Important
The App Store Server Notifications V1 endpoint and version 1 notifications,
notification_type, are deprecated. Instead, implement the App Store Server
Notifications V2 endpoint on your server to receive version 2 notifications.
Use the notification type along with the transaction and subscription renewal information to upda
a user’s service or present promotional offers according to your business logic. For information o
Overview
App Store Server Notific… / Receiving App Store Server Notifications
Article
Receiving App Store Server Notifications
Implement server-side code to receive and parse notification posts.


## Page 5

handling notifications that contain an external purchase token, see externalPurchaseToken.
Enabling App Store Server Notifications
Configure your server and provide an HTTPS URL to receive notifications about in-app
purchase events and unreported external purchase tokens.
Responding to App Store Server Notifications
Send HTTP status codes to indicate the success of a notification post.
App Store Server Notifications changelog
Learn about changes to the App Store Server Notifications service.
See Also
Essentials


## Page 6

When you set up the endpoints on your server to receive notifications, configure your server to
send a response. Use HTTP status codes to indicate whether the App Store server notification po
succeeded:
Send HTTP 200, or any HTTP code between 200 and 206, if the post was successful.
Send HTTP 50x or 40x to have the App Store retry the notification, if the post didn’t succeed.
The system considers all other HTTP codes an unsuccessful post. Your server isn’t required to
return a data value.
If the App Store server doesn’t receive a success response from your server after the initial
notification attempt, it retries as follows:
For version 2 notifications, it retries five times, at 1, 12, 24, 48, and 72 hours after the previous
attempt.
For version 1 notifications, it retries three times, at 6, 24, and 48 hours after the previous
attempt.
Note
Retry notifications are available only in the production environment. In the sandbox
environment, the App Store server attempts to send the notification one time.
Overview
Recover from server outages
App Store Server Notific… / Responding to App Store Server Notifications
Article
Responding to App Store Server
Notifications
Send HTTP status codes to indicate the success of a notification post.


## Page 7

If your server misses notifications due to an outage, you can always get up-to-date transaction
information by calling App Store Server API endpoints including Get Transaction History
and Get All Subscription Statuses.
If you use version 2 notifications (App Store Server Notifications V2), you can recover
missed notifications by calling Get Notification History. You can also test whether your
server is receiving and responding to version 2 notifications correctly by calling the Request a
Test Notification endpoint.
Enabling App Store Server Notifications
Configure your server and provide an HTTPS URL to receive notifications about in-app
purchase events and unreported external purchase tokens.
Receiving App Store Server Notifications
Implement server-side code to receive and parse notification posts.
App Store Server Notifications changelog
Learn about changes to the App Store Server Notifications service.
See Also
Essentials


## Page 8

App Store Server Notifications has two versions of notifications. Version 1 notifications and the Ap
Store Server Notifications V1 endpoint are deprecated. Instead, implement the App
Store Server Notifications V2 endpoint on your server to receive version 2 notifications
To set up your server to receive notifications, see Enabling App Store Server Notifications. Use th
changelog to learn about feature updates, version information, deprecations, and removals for Ap
Store Server Notifications.
New features
Added the revocationType and revocationPercentage fields to the JWSTransaction
DecodedPayload.
Added the advancedCommercePriceIncreaseInfo object, and advancedCommerce
PriceIncreaseInfoDependentSKU, advancedCommercePriceIncreaseInfoStatus
advancedCommercePriceIncreaseInfoPrice, fields to the JWSRenewalInfoDecoded
Payload.
New features
Updated the responseBodyV2DecodedPayload to include the new payload object, app
Data.
Added the notification type RESCIND_CONSENT to notificationType.
Overview
December 10, 2025
November 4, 2025
App Store Server Notific… / App Store Server Notifications changelog
Article
App Store Server Notifications changelog
Learn about changes to the App Store Server Notifications service.


## Page 9

New features
Added the ONE_TIME value to offerDiscountType to indicate In-App Purchase offer codes
New features
Added the ACTIVE_TOKEN_REMINDER and CREATED values to subtype, which can appear i
notifications with an EXTERNAL_PURCHASE_TOKEN notificationType.
Updated externalPurchaseToken to include the new fields tokenType and token
ExpirationDate.
New features
The ONE_TIME_CHARGE notificationType is now available in the production environment
New features
Added the notification types METADATA_UPDATE and MIGRATE to notificationType.
Added the previousOriginalTransactionId field to the JWSTransactionDecoded
Payload.
New features
Updated the JWSRenewalInfoDecodedPayload and JWSTransactionDecodedPayload
to include the new appTransactionId and offerPeriod fields.
Updated the JWSRenewalInfoDecodedPayload to include the appAccountToken field.
New features
Added support for the Advanced Commerce API.
October 29, 2025
June 26, 2025
May 27, 2025
March 24, 2025
February 21, 2025
January 17, 2025


## Page 10

New features
Updated the JWSRenewalInfoDecodedPayload to include the new field eligibleWinBac
OfferIds.
Added the win-back offer type to offerType.
New features
Added the notification type ONE_TIME_CHARGE to notificationType. This notification typ
is currently available only in the sandbox environment.
Added the fields renewalPrice, currency, and offerDiscountType to the JWSRenewal
InfoDecodedPayload.
New features
Added the consumptionRequestReason to the data object.
The CONSUMPTION_REQUEST notificationType added notifications for refund requests fo
auto-renewable subscriptions.
New features
The type of the price field changed from int32 to int64.
New features
Added a new notificationType: EXTERNAL_PURCHASE_TOKEN and a subtype:
UNREPORTED.
Updated the responseBodyV2DecodedPayload to include the new payload object,
externalPurchaseToken.
Added the types externalPurchaseId and tokenCreationDate.
July 8, 2024
June 10, 2024
April 11, 2024
March 12, 2024
February 29, 2024


## Page 11

New features
Changed the notification type the App Store server sends when a customer redeems a
subscription offer for an inactive subscription to the SUBSCRIBED notificationType. The
App Store server only sends the OFFER_REDEEMED notification type when customers redeem
an offer on an active subscription.
New features
Added new properties in the JWSTransactionDecodedPayload object: price, currency
and offerDiscountType.
New features
Added a new version 2 notificationType, REFUND_REVERSED.
Added the following new fields in the transaction decoded payload, JWSTransactionDecode
Payload: storefront, storefrontId, and transactionReason.
Added the renewalDate field in the renewal info decoded payload, JWSRenewalInfo
DecodedPayload.
Added a subscription status field in the data object of the responseBodyV2Decoded
Payload.
The responseBodyV1 now includes a deprecation field.
Deprecations
The App Store Server Notifications V1 endpoint and version 1 notifications are
deprecated. Implement the App Store Server Notifications V2 endpoint on your
server to receive version 2 notifications instead.
New features
Added a new notification type for App Store Server Notifications 2 that consists of the
notificationType value RENEWAL_EXTENSION and subtype values of SUMMARY and
FAILURE. This notification provides information when you extend the subscription renewal dat
for all active subscribers, based on a product identifier. For more information, see Extend
January 23, 2024
October 26, 2023
June 5, 2023
January 30, 2023


## Page 12

Subscription Renewal Dates for All Active Subscribers in the App Store Serv
API.
Updated the responseBodyV2DecodedPayload to include the new summary object, which
appears in the payload for a RENEWAL_EXTENSION notification with a SUMMARY subtype.
New features
Added the PRODUCT_NOT_FOR_SALE subtype for the EXPIRED notificationType.
New features
App Store Server Notifications 2 supports sending a TEST notification. For more information, s
notificationType, and the endpoints Request a Test Notification and Get Test
Notification Status in the App Store Server API.
New features
In App Store Server Notifications 2, the notification subtype ACCEPTED is now sent when the
App Store notifies the customer of an auto-renewable subscription price increase that doesn’t
require customer consent. This notification subtype is available only in version 2 notifications.
For more information, see subtype.
New features
App Store Server Notifications V2 is available, and version 1 is still supported. For
information about the notifications sent in version 2, see notificationType, substate, an
responseBodyV2.
For information about the notifications sent in version 1, see notification_type and
responseBodyV1 (previously named responseBody).
Deprecations
November 7, 2022
June 6, 2022
May 12, 2022
October 21, 2021 - version 2
March 10, 2021


## Page 13

In App Store Server Notifications Version 1, the following notification type and top-level objects
are deprecated and removed: RENEWAL,latest_receipt, latest_receipt_info,
latest_expired_receipt, and latest_expired_receipt_info. For more information
see responseBodyV1 and notification_type.
New features
App Store Server Notifications is available.
Enabling App Store Server Notifications
Configure your server and provide an HTTPS URL to receive notifications about in-app
purchase events and unreported external purchase tokens.
Receiving App Store Server Notifications
Implement server-side code to receive and parse notification posts.
Responding to App Store Server Notifications
Send HTTP status codes to indicate the success of a notification post.
November 21, 2019 - version 1
See Also
Essentials


