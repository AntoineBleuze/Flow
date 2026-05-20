# Essentials.pdf

## Page 1

The App Store Server Library is an open source library from Apple, available in four languages. It
makes adopting the App Store Server API and working with JSON Web Signature (JWS)
transactions easier. Find the App Store Server Library for each language in the following GitHub
repositories:
Swift: App Store Server Swift Library
Java: App Store Server Java Library
Python: App Store Server Python Library
Node: App Store Server Node Library
Choose the language that best supports your server and expertise.
The App Store Server Library offers the following capabilities:
An API client that encodes App Store Server API requests, decodes the responses, and creates
the JSON Web Token (JWT) you use to authenticate the calls. For more information on using
JWTs, see Generating JSON Web Tokens for API requests.
Functions that verify JWS transactions, to verify that Apple signed the transaction data you ge
in API responses, from App Store Server Notifications V2 and from devices using
StoreKit. See the functions verifyAndDecodeTransaction, verifyAndDecodeApp
Transaction, and verifyAndDecodeRenewalInfo, available in each language the library
supports.
Overview
App Store Server API / Simplifying your implementation by using the App Store Server Library
Article
Simplifying your implementation by using
the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize
your calls, verify transactions, extract transaction identifiers from receipts, and
more.


## Page 2

A utility that extracts transaction identifiers from receipts. The App Store Server API endpoints
take a transaction identifier in the path parameter. Use this utility as you migrate from using
verifyReceipt with App Store Receipts to using the App Store Server API for transaction
information.
A function that generates JWS signatures, which you use in your app for promotional offer
signatures, Advanced Commerce API in-app requests, and introductory offer eligibility. For mo
information, see Generating JWS to sign App Store requests.
For more information, see the WWDC23 session Meet the App Store Server Library.
Creating API keys to authorize API requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.
Generating JSON Web Tokens for API requests
Create JSON Web Tokens signed with your private key to authorize requests for App Store
Server API and External Purchase Server API.
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle them in
your code.
App Store Server API changelog
Learn about new features and updates in the App Store Server API.
See Also
Essentials


## Page 3

The App Store Server API, the Advanced Commerce API, and the External Purchase Server API
require JSON Web Tokens (JWTs) to authorize each request you make to the API. You generate
JWTs using a private API key that you download from App Store Connect. For information about
generating the JWT using your private key, see Generating JSON Web Tokens for API requests.
An API key has two parts: a public portion that Apple keeps, and a private key that you download.
Use the private key to sign tokens that authorize the API to access or submit your data to the App
Store.
Important
Store your private keys in a secure place. Don’t share your keys, don’t store keys in a code
repository, and don’t include keys in client-side code. If you suspect a private key is
compromised, immediately revoke the key in App Store Connect. See Revoking API Keys for
details.
Use the API key for the App Store Server API, the Advanced Commerce API, and the External
Purchase Server API. You can’t use the key for other Apple services.
To generate an API key to use with the App Store Server API, the Advanced Commerce API, and th
External Purchase Server API, log in to App Store Connect and complete the following steps:
1. On the homepage, click Users and Access.
Overview
Generate a private key
App Store Server API / Creating API keys to authorize API requests
Article
Creating API keys to authorize API
requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.


## Page 4

2. Click the Integrations tab.
3. In the sidebar under Keys, click In-App Purchase.
4. Click Generate In-App Purchase Key. If you already have an Active In-App Purchase key
generated, click the Add (+) icon to add more.
5. Enter a name for the key. The name is for your reference only and is not part of the key itself.
6. Click Generate.
After you generate an in-app purchase key, you cannot edit its name. If you need to make change
revoke the key and generate a new one.
The new key’s name, key ID, a download link, and other information appear on the page.
After generating your API key, App Store Connect gives you the opportunity to download the
private half of the key. The private key is only available for download a single time.
1. Log in to App Store Connect.
2. On the homepage, click Users and Access.
3. Click the Integrations tab.
4. In the sidebar under Keys, click In-App Purchase.
5. Navigate to a key under the Active section, then click Download Key for the key you want to
download.
6. In the dialog, click Download.
The download link appears only if you haven’t yet downloaded the private key. Apple doesn’t keep
a copy of the private key. Store your private key in a secure place.
Simplifying your implementation by using the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize your calls,
verify transactions, extract transaction identifiers from receipts, and more.
Generating JSON Web Tokens for API requests
Download and store the private key
See Also
Essentials


## Page 5

Create JSON Web Tokens signed with your private key to authorize requests for App Store
Server API and External Purchase Server API.
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle them in
your code.
App Store Server API changelog
Learn about new features and updates in the App Store Server API.


## Page 6

JSON Web Token (JWT) is an open standard (RFC 7519) that defines a way to securely transmit
information. The App Store Server API and External Purchase Server API require a JWT to authori
each request you make to the API. You create the token, signing it with the private key you
downloaded from App Store Connect. For more information about creating keys, see Creating AP
keys to authorize API requests.
To generate a signed JWT:
1. Create the JWT header.
2. Create the JWT payload.
3. Sign the JWT.
Include the signed JWT in the authorization header of each API request. Generate a new signed
JWT for each new request.
Tip
The App Store Server Library provides an API client and creates JWTs for use with the App
Store Server API. For more information, see Simplifying your implementation by using the App
Store Server Library.
Overview
Create the JWT header
App Store Server API / Generating JSON Web Tokens for API requests
Article
Generating JSON Web Tokens for API
requests
Create JSON Web Tokens signed with your private key to authorize requests for
App Store Server API and External Purchase Server API.


## Page 7

To create a JWT to communicate with the App Store Server API or External Purchase Server API,
use the following fields and values in the header:
Header Field
Value
alg - Encryption Algorithm
ES256
All JWTs must be signed with ES256 encryption
kid - Key ID
Your private key ID from App Store Connect (Ex: 2X9R4HXF34)
typ - Token Type
JWT
To get your key ID, copy it from App Store Connect by logging in to App Store Connect, then:
1. Select Users and Access, then select the Keys tab.
2. The key IDs appear in a column under the Active heading. Hover the cursor next to a key ID to
display the Copy Key ID link.
3. Click Copy Key ID.
If you have more than one API key, copy the key ID of the private key that you use to sign the JWT
Here’s an example of a JWT header:
The JWT payload contains information specific to the App Store Server API and External Purchase
Server API, such as issuer ID and expiration time. Use the following fields — also known as JWT
claims — to include these values in the JWT payload:
Payload Field
Value
iss - Issuer
Your issuer ID from the Keys page in App Store Connect (Ex: “57246542-
96fe-1a63-e053-0824d011072a")
Create the JWT payload


## Page 8

Payload Field
Value
iat - Issued
At
The time at which you issue the token, in UNIX time, in seconds (Ex:
1623085200)
exp -
Expiration
Time
The token’s expiration time, in UNIX time, in seconds. Tokens that expire more
than 60 minutes after the time in iat are not valid (Ex: 1623086400)
aud -
Audience
appstoreconnect-v1
bid - Bundle
ID
Your app’s bundle ID (Ex: “com.example.testbundleid”)
To get your issuer ID, log in to App Store Connect, then:
1. Select Users and Access, then select the Keys tab.
2. The issuer ID appears near the top of the page. To copy the issuer ID, click Copy next to the ID.
Here’s an example of a JWT payload:
Note that the JWT is valid for up to one hour after the time you indicate in the iat field, or it
expires sooner if you set the exp field for an earlier time.
Use the private key associated with the key ID you specified in the header to sign the token using
ES256 encryption.
There are a variety of open source libraries available online for creating and signing JWT tokens.
See JWT.io for more information. For calls to the App Store Server API, consider using the App
Store Server Library to create the JWTs instead. For more information, see Simplifying your
implementation by using the App Store Server Library.
Sign the JWT


## Page 9

After you create and sign the JWT, provide it in the request’s authorization header as a bearer
token.
The following example for the App Store Server API shows a curl command using a bearer token
Replace the text [signed token] with the value of the signed JWT itself. Replace
{transactionId} with a transaction identifier of your customer.
Simplifying your implementation by using the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize your calls,
verify transactions, extract transaction identifiers from receipts, and more.
Creating API keys to authorize API requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle them in
your code.
App Store Server API changelog
Learn about new features and updates in the App Store Server API.
Include the JWT in the authorization header of the request
See Also
Essentials


## Page 10

The App Store Server API limits the number of requests that you can submit to each endpoint
within a specified timespan. The request limits apply per app.
The following table lists the rate limits for each endpoint in the production environment, expresse
in requests per second. The system enforces rate limits on an hourly basis.
Endpoint
Rate limit (pe
second
Get App Transaction Info
5
Get Transaction Info
5
Get Transaction History
5
Get Transaction History V1
5
Get All Subscription Statuses
5
Send Consumption Information
5
Send Consumption Information V1
5
Get Notification History
5
Extend a Subscription Renewal Date
2
Set App Account Token
2
Overview
App Store Server API / Identifying rate limits
Article
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle
them in your code.


## Page 11

Endpoint
Rate limit (pe
second
Look Up Order ID
1
Get Refund History
1
Get Refund History V1
1
Extend Subscription Renewal Dates for All Active
Subscribers
Request a Test Notification
Get Test Notification Status
The rate limits in the sandbox environment are 10% of the limits in the table above.
The App Store server may make adjustments to reduce or increase these rate limits as needed at
any time.
If you exceed a per-hour limit, the API rejects the request with an HTTP 429 response, with a Rat
LimitExceededError in the body. Consider the following as you integrate the API:
If you periodically call the API, throttle your requests to avoid exceeding the per-hour limit for a
endpoint.
Manage the HTTP 429 RateLimitExceededError in your error-handling process. For
example, log the failure and queue the job to process it again at a later time.
Check the Retry-After header if you receive the HTTP 429 error. This header contains a
UNIX time, in milliseconds, that informs you when you can next send a request.
Simplifying your implementation by using the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize your calls,
verify transactions, extract transaction identifiers from receipts, and more.
Handle exceeded rate limits gracefully
See Also
Essentials


## Page 12

Creating API keys to authorize API requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.
Generating JSON Web Tokens for API requests
Create JSON Web Tokens signed with your private key to authorize requests for App Store
Server API and External Purchase Server API.
App Store Server API changelog
Learn about new features and updates in the App Store Server API.


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20



