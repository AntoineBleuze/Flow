# 003_App Store Server Notifications changelog.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


