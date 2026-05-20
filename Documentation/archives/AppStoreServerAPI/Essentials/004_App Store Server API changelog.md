# 004_App Store Server API changelog.pdf

## Page 1

Use this changelog to learn about feature updates, deprecations, and removals for the App Store
Server API.
New features
Added the Send Consumption Information endpoint.
Added the revocationType and revocationPercentage fields to the JWSTransaction
DecodedPayload.
Added the advancedCommercePriceIncreaseInfo object, and advancedCommerce
PriceIncreaseInfoDependentSKU, advancedCommercePriceIncreaseInfoStatus
advancedCommercePriceIncreaseInfoPrice, fields to the JWSRenewalInfoDecoded
Payload.
Deprecations
The Send Consumption Information V1 endpoint is deprecated. Use the new Send
Consumption Information endpoint instead.
New features
Added the ONE_TIME value to offerDiscountType to indicate In-App Purchase offer codes
Overview
1.19 - 2025/12/10
1.18 - 2025/10/29
App Store Server API / App Store Server API changelog
Article
App Store Server API changelog
Learn about new features and updates in the App Store Server API.


## Page 2

New features
Added the Get App Transaction Info endpoint and AppTransactionInfoResponse
response object.
New features
Added the Set App Account Token endpoint and UpdateAppAccountTokenRequest
request object, and related error codes: TransactionIdIsNotOriginalTransactionId
Error, FamilyTransactionNotSupportedError, and InvalidAppAccountToken
UUIDError.
New features
Updated the JWSRenewalInfoDecodedPayload and JWSTransactionDecodedPayload
to include the new appTransactionId and offerPeriod fields.
Updated the JWSRenewalInfoDecodedPayload to include the appAccountToken field.
Added the AppTransactionIdNotSupportedError error object.
New features
Added support for Advanced Commerce API.
New features
Updated the JWSRenewalInfoDecodedPayload to include the new eligibleWinBack
OfferIds field.
Added the win-back offer type in offerType.
New features
1.17 - 2025/10/16
1.16 - 2025/06/09
1.15 - 2025/02/21
1.14 - 2025/01/17
1.13 — 2024/07/08
1.12 — 2024/06/10


## Page 3

Added the endpoint Get Transaction History, which provides transaction history for all
In-App Purchases, including consumable In-App Purchases in a finished state.
Added the fields renewalPrice, currency and offerDiscountType to the JWSRenewal
InfoDecodedPayload.
Deprecations
The Get Transaction History V1 endpoint is deprecated. Use the new Get
Transaction History endpoint instead.
New features
Added the refundPreferenceV1 field to the ConsumptionRequestV1 request body.
Send Consumption Information V1 added support for receiving information for auto-
renewable subscriptions.
Added the InvalidTransactionTypeNotSupportedError error object.
Deprecations
The system no longer sends the InvalidTransactionNotConsumableError error object
It uses InvalidTransactionTypeNotSupportedError instead.
The type of the price field changed from int32 to int64.
New features
The Get Notification History endpoint adds support for the new notification type for
unreported external purchase tokens.
New features
Added the following new properties in the decoded transaction payload JWSTransaction
DecodedPayload: price, currency, and offerDiscountType.
1.11 — 2024/04/11
1.10.1 — 2024/03/12
Server update — 2024/02/29
1.10 — 2023/10/26


## Page 4

New features
Updated the error format of the Send Consumption Information V1 endpoint to match
that of other endpoints. The endpoint now returns a JSON body that can contain an error code
New error codes for the Send Consumption Information V1 endpoint include: Invalid
AccountTenureError, InvalidAppAccountTokenError, InvalidConsumption
StatusError, InvalidCustomerConsentedError, InvalidDeliveryStatusError,
InvalidLifetimeDollarsPurchasedError, InvalidLifetimeDollarsRefunded
Error, InvalidPlatformError, InvalidPlayTimeError, InvalidSampleContent
ProvidedError, InvalidTransactionNotConsumableError, InvalidUserStatus
Error.
New features
Added a new endpoint Get Transaction Info with its response TransactionInfo
Response, which provides information about a single transaction.
The Get Notification History endpoint adds a new filter parameter, onlyFailures.
When you set it to true, the endpoint returns only the notifications that failed to reach the
developer’s server.
The following endpoints changed their path parameters from originalTransactionId to
transactionId: Get All Subscription Statuses, Get Transaction History V
Get Refund History, and Send Consumption Information V1. These endpoints now
accept any transaction identifier, including original transaction identifiers.
The Get Notification History endpoint now accepts a transactionId instead of
requiring an original transaction identifier (originalTransactionId) in the Notification
HistoryRequest body.
The Get Transaction History V1 endpoint adds a new filter parameter, revoked, that
filters the response to return only revoked transactions or only nonrevoked transactions.
The Get All Subscription Statuses endpoint adds a new filter parameter, status, th
enables you to request subscriptions with the status values you specify.
Added the storefront, storefrontId, and transactionReason fields to the
JWSTransactionDecodedPayload object.
Added the renewalDate field to the JWSRenewalInfoDecodedPayload object.
Added the sendAttempts field to the CheckTestNotificationResponse and the
notificationHistoryResponseItem of the NotificationHistoryResponse to
1.9 — 2023/09/27
1.8 — 2023/06/05


## Page 5

provide information about all the send attempts for App Store Server Notifications.
Added the error codes FamilySharedSubscriptionExtensionIneligibleError,
StatusRequestNotFoundError, InvalidStatusError, InvalidRevokedError,
InvalidTransactionIdError, TransactionIdNotFoundError, and RateLimit
ExceededError.
All endpoints are subject to a rate limit and can return a RateLimitExceededError with an
HTTP 429 error code. For more information, see Identifying rate limits.
Deprecations
The excludeRevoked filter in Get Transaction History V1 is deprecated. Use the new
revoked filter instead.
The firstSendAttemptResult field is deprecated in the CheckTestNotification
Response and notificationHistoryResponseItem objects. Use the first sendAttemp
Item in the sendAttempts array instead.
New features
The new endpoint Extend Subscription Renewal Dates for All Active
Subscribers takes a subscription product identifier and extends the renewal date for all
eligible subscribers. It responds with MassExtendRenewalDateResponse. For more
information, see Extending the renewal date for auto-renewable subscriptions. For information
about new App Store server notifications related to this endpoint, see the App Store Server
Notifications changelog.
The new endpoint Get Status of Subscription Renewal Date Extensions checks
the status of a subscription-renewal-date extension, and responds with the MassExtend
RenewalDateStatusResponse.
New features
The new version 2 endpoint Get Refund History returns a paginated list of refunded
transactions in the RefundHistoryResponse.
Deprecations
The endpoint Get Refund History V1 and its response RefundLookupResponse are
deprecated.
In firstSendAttemptResult, the SSL_ISSUE value is deprecated and replaced with TLS
_ISSUE.
1.7 — 2023/01/30
1.6 — 2022/08/08


## Page 6

New features
The API has two new endpoints to support testing how your server receives App Store Server
Notifications. The endpoints are: Request a Test Notification and Get Test
Notification Status.
The API adds the new Get Notification History endpoint.
The Get Transaction History V1 endpoint is enhanced with new parameters to support
filtering and sorting functionality.
The JWSRenewalInfoDecodedPayload now includes the recentSubscriptionStart
Date field.
This version doesn’t contain any public changes.
This version doesn’t contain any public changes.
Removals
The JWSDecodedHeader object no longer includes the kid field.
New features
The JWSTransactionDecodedPayload and JWSRenewalInfoDecodedPayload objects
now include the environment field.
The Get Refund History V1 endpoint now returns a maximum of 50 refunded transaction
1.5 — 2022/06/06
1.4
1.3
Server update — 2022/03/17
1.2 — 2022/02/24
Server update — 2022/02/23
1.1 — 2022/10/21


## Page 7

New features
The API adds three endpoints: Look Up Order ID, Get Refund History V1, and Exten
a Subscription Renewal Date.
The API is now available in the production environment, using the following base URL:
Initial version of the App Store Server API.
New features
This API has three endpoints, available in the sandbox environment: Get Transaction
History V1, Send Consumption Information V1, and Get All Subscription
Statuses.
Simplifying your implementation by using the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize your calls,
verify transactions, extract transaction identifiers from receipts, and more.
Creating API keys to authorize API requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.
Generating JSON Web Tokens for API requests
Create JSON Web Tokens signed with your private key to authorize requests for App Store
Server API and External Purchase Server API.
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle them in
your code.
Server update — 2021/09/20
1.0b1 — 2021/06/07
See Also
Essentials


## Page 8



