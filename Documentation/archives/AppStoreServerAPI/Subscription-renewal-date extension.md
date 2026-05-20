# Subscription-renewal-date extension.pdf

## Page 1

If your service experiences a temporary outage, canceled event, or interruption to a live streamed
event, you may choose to compensate your customers by extending the renewal date of their paid
active subscription. The App Store Server API provides two endpoints for requesting such
extensions:
Extend a Subscription Renewal Date for an individual subscription
Extend Subscription Renewal Dates for All Active Subscribers for all
subscriptions based on a product identifier, optionally limited to a list of storefronts
You can move the renewal date for active auto-renewable subscriptions up to 90 days into the
future if your service experiences an unexpected outage. To give you flexibility to resolve service
issues or outages, you can extend the renewal date twice within a year (365 days) per customer.
Note
After the subscription renewal extension goes into effect, there’s no way to reverse it. The
extension period doesn’t count toward the one year of paid service when the App Store
calculates the developer’s commission rate.
After a successful renewal date extension, Apple sends an email to notify the customer of their
updated subscription renewal date.
Overview
Determine eligible subscriptions
App Store Server API / Extending the renewal date for auto-renewable subscriptions
Article
Extending the renewal date for auto-
renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a
subscription’s renewal date.


## Page 2

Only active auto-renewable subscriptions with at least one previously paid period are eligible to
have a renewal date extension.
The following types of subscriptions aren’t eligible for renewal date extensions:
Subscriptions in a free offer period
Inactive subscriptions in a billing retry state
Subscriptions in a billing grace period state with an expiration date in the past
Subscriptions that have already received two renewal date extensions within the past 365 days
Expired subscriptions
The App Store attempts to extend the renewal dates for eligible subscriptions only.
When the system extends eligible purchased subscriptions that support Family Sharing, it
automatically extends the family members’ subscriptions as well. However, the Extend a
Subscription Renewal Date endpoint doesn’t support requests to extend a family member
subscription directly.
To request a renewal date extension for all eligible subscribers, call the Extend Subscription
Renewal Dates for All Active Subscribers endpoint. You indicate the subscription by
its productId. This endpoint is convenient for applying the renewal date extension to a large
number of subscriptions with just one call. If a server outage affects some regions and not others
you can limit the request by storefront by including the optional storefrontCountryCodes
property in the request body, MassExtendRenewalDateRequest.
To request a renewal date extension for a single subscriber, call the Extend a Subscription
Renewal Date endpoint. You identify the subscription with an originalTransactionId. Us
this endpoint to retry a renewal date extension that fails with the other endpoint, as the Retry
attempts that fail section below describes.
Requests to the Extend Subscription Renewal Dates for All Active Subscriber
endpoint can take hours or days to complete, depending on the number of subscribers. The App
Store server sends real-time notifications as it processes your request. The notifications inform yo
as each renewal date extension succeeds or fails, as well as when your request is complete.
To receive notifications, support App Store Server Notifications V2 on your server. For
more information, see Enabling App Store Server Notifications.
The following table lists the notifications and their notificationType and subtype values:
Extend renewal dates for one or many subscribers
Receive in-progress and summary notifications


## Page 3

Notification type
Subtype
Description
RENEWAL
_EXTENDED
(none)
The App Store extended the subscription renewal date for a
specific subscription.
RENEWAL
_EXTENSION
FAILURE
The subscription-renewal-date extension failed for a specific
subscription.
RENEWAL
_EXTENSION
SUMMARY
The request is complete.
For more information about the contents of a notification payload, see responseBodyV2Decode
Payload.
For requests to the Extend a Subscription Renewal Date endpoint, App Store Server
Notifications sends a RENEWAL_EXTENDED notification when the request succeeds. The endpoin
returns more information in its response body, ExtendRenewalDateResponse.
To check whether your request to Extend Subscription Renewal Dates for All
Active Subscribers is complete, call the Get Status of Subscription Renewal
Date Extensions endpoint. Complete requests include the final count of successful and failed
renewal date extensions. If you don’t need this status on demand, use App Store Server
Notifications for status information instead, as the previous section describes.
The App Store server sends real-time notifications as it processes your request to Extend
Subscription Renewal Dates for All Active Subscribers. The notifications inform
you each time an attempt to extend the renewal date succeeds or fails. You can retry the failed
attempts by calling the Extend a Subscription Renewal Date endpoint with the failed
subscription’s transaction identifier. Follow these steps:
1. Support App Store Server Notifications V2 on your server. For more information, se
Enabling App Store Server Notifications.
2. Look for notifications with a notificationType of RENEWAL_EXTENSION and subtype of
FAILURE. The notification identifies a specific subscription that failed to receive a subscription
renewal-date extension.
3. Find the subscription’s transaction identifier in the notification’s payload, responseBody
V2DecodedPayload. Specifically, use the originalTransactionId in the
Check whether a request is complete
Retry attempts that fail


## Page 4

JWSTransactionDecodedPayload, which you get from the JWSTransaction of the data
object in the payload.
4. Call Extend a Subscription Renewal Date using the originalTransactionID.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.
See Also
Subscription-renewal-date extension


## Page 5

originalTransaction
Id
originalTransaction
Id
(Required) The original transaction identifier of the subscription receiving a
renewal date extension.
ExtendRenewalDate
Request
The request body containing subscription-renewal-extension data.
Content-Type: application/json
200
ExtendRenewalDate
Response
OK
Request succeeded.
Content-Type: application/json
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
App Store Server API / Extend a Subscription Renewal Date
Web Service Endpoint
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original
transaction identifier.
App Store Server API 1.1+


## Page 6

400
(InvalidOriginal
TransactionIdError |
InvalidExtendByDays
Error | Invalid
ExtendReasonCode
Error | Invalid
RequestIdentifier
Error)
Bad Request
The request is invalid and can’t be accepted.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
403
(Subscription
ExtensionIneligible
Error | Subscription
MaxExtensionError |
FamilyShared
Subscription
ExtensionIneligible
Error)
Forbidden
The request is invalid and can’t be accepted.
Content-Type: application/json
404
OriginalTransaction
IdNotFoundError
Not Found
The request is invalid and can’t be accepted.
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
The request failed. This may be due to a temporary outage. Check the specif
error message for further information.
Content-Type: application/json
Extending the renewal date for auto-renewable subscriptions
App Store Server API changelog
Identifying rate limits
Mentioned in
Discussion


## Page 7

Use this endpoint to compensate your customers for temporary service outages, canceled events
or interruptions to live streamed events by extending the renewal date of their paid, active
subscription. This endpoint acts on a single subscription for a transaction identifier that you
specify.
To call this endpoint, provide the original transaction identifier of the subscription that experience
the service interruption. In the request body, ExtendRenewalDateRequest, provide the
extension duration, the reason code for the extension, and a unique requestIdentifier for
each extension request.
When this endpoint extends eligible purchased subscriptions that support Family Sharing, it
automatically extends the family members’ subscriptions as well. However, the endpoint doesn’t
support requests to extend a family member’s subscription directly.
A successful response with an HTTP 200 status code contains the ExtendRenewalDate
Response object. The response object includes the same unique request identifier you provide in
the request, and information you need to determine whether the extension succeeds. For
successful extensions, the new subscription expiration date is the effectiveDate. All status
codes other than HTTP 200 indicate that the request failed.
Note
After the subscription renewal extension goes into effect, there’s no way to reverse it. The
extension period doesn’t count toward the one year of paid service when the App Store
calculates the developer’s commission rate.
After a successful renewal date extension, Apple sends an email to notify the customer of their
updated subscription renewal date.
For more information about this and related endpoints, including subscription eligibility, see
Extending the renewal date for auto-renewable subscriptions.
Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
See Also
Subscription-renewal-date extension


## Page 8

Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.


## Page 9

MassExtendRenewal
DateRequest
The request body for extending a subscription renewal date for all of its activ
subscribers.
Content-Type: application/json
200
MassExtendRenewal
DateResponse
OK
Request succeeded.
If you reuse the requestIdentifier to call the endpoint again, the server
responds with 200.
Content-Type: application/json
400
Bad Request
URL
Sandbox URL
HTTP Body
Response Codes
App Store Server API / Extend Subscription Renewal Dates for All Active Subscribers
Web Service Endpoint
Extend Subscription Renewal Dates for All
Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its
eligible active subscribers.
App Store Server API 1.7+


## Page 10

(InvalidExtendByDays
Error | Invalid
ProductIdError |
InvalidExtendReason
CodeError | Invalid
RequestIdentifier
Error | InvalidEmpty
StorefrontCountry
CodeListError |
InvalidStorefront
CountryCodeError)
The request is invalid and can’t be accepted.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
403
(Subscription
ExtensionIneligible
Error | Subscription
MaxExtensionError)
Forbidden
The request is invalid and can’t be accepted.
Content-Type: application/json
404
StatusRequestNot
FoundError
Not Found
The server didn’t find a subscription-renewal-date extension request for the
request identifier and product identifier you provided.
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
The request failed. This may be due to a temporary outage. Check the specif
error message for further information.
Content-Type: application/json
Extending the renewal date for auto-renewable subscriptions
App Store Server API changelog
Identifying rate limits
Mentioned in
Discussion


## Page 11

Use this endpoint to compensate your customers for temporary service outages, canceled events
or interruptions to live streamed events by extending the renewal date of their paid, active
subscription. This endpoint acts on all active subscriptions for the product identifier you specify,
and is limited to the storefronts you optionally specify.
To call this endpoint, provide the subscription product identifier that experienced the service
interruption, and other information, in the request body, MassExtendRenewalDateRequest.
A successful response with an HTTP 200 status code contains the MassExtendRenewalDate
Response object, which includes the same unique requestIdentifier you provide in the
request. This endpoint is an asynchronous request. A successful response indicates that the App
Store server is processing the request. Status codes other than HTTP 200 indicate that the
request failed.
Note
After the subscription renewal extension goes into effect, there’s no way to reverse it. The
extension period doesn’t count toward the one year of paid service when the App Store
calculates the developer’s commission rate.
After a successful renewal date extension, Apple sends an email to notify the customer of their
updated subscription renewal date.
For more information about this endpoint, including subscription eligibility, getting status
notifications, and retrying extensions that fail, see Extending the renewal date for auto-renewable
subscriptions.
Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
See Also
Subscription-renewal-date extension


## Page 12

object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.


## Page 13

productId
productId
(Required) The product identifier of the auto-renewable subscription that yo
request a renewal-date extension for.
requestIdentifier
requestIdentifier
(Required) The UUID that represents your request to the Extend
Subscription Renewal Dates for All Active Subscribers
endpoint.
Maximum length: 128
200
MassExtendRenewal
DateStatusResponse
OK
The request succeeded.
Content-Type: application/json
URL
Sandbox URL
Path Parameters
Response Codes
App Store Server API / Get Status of Subscription Renewal Date Extensions
Web Service Endpoint
Get Status of Subscription Renewal Date
Extensions
Checks whether a renewal date extension request completed, and provides the
final count of successful or failed extensions.
App Store Server API 1.7+


## Page 14

400
(InvalidProductId
Error | Invalid
RequestIdentifier
Error)
Bad Request
The request is invalid.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
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
Extending the renewal date for auto-renewable subscriptions
This endpoint provides basic status information about a request you initiate when you call the
Extend Subscription Renewal Dates for All Active Subscribers endpoint. Suc
requests may take hours, or even days, depending on the number of subscribers. This status tells
whether the request is complete. If so, it has the total count of successful and failed subscription
renewal-date extensions.
Tip
If you don’t need this status on demand, or need more details, use the App Store Server
Notifications for near real-time status information instead. For more information about related
notifications, see Extending the renewal date for auto-renewable subscriptions.
Mentioned in
Discussion
See Also


## Page 15

Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.
Subscription-renewal-date extension


## Page 16

extendByDays
extendByDays
Required. The number of days to extend the subscription renewal date.
Maximum: 90
extendReasonCode
extendReasonCode
Required. The reason code for the subscription date extension.
requestIdentifier
requestIdentifier
Required. A string that contains a value you provide to uniquely identify this
renewal-date extension request.
Maximum length: 128
Use this object with the Extend a Subscription Renewal Date endpoint.
type extendByDays
Properties
Discussion
Topics
Request data types
App Store Server API / ExtendRenewalDateRequest
Object
ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an
individual subscription.
App Store Server API 1.1+


## Page 17

The number of days to extend the subscription renewal date.
type extendReasonCode
The code that represents the reason for the subscription-renewal-date extension.
type requestIdentifier
A string that contains a unique identifier you provide to track each subscription-renewal-dat
extension request.
Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
See Also
Subscription-renewal-date extension


## Page 18

object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.


## Page 19

effectiveDate
effectiveDate
The new subscription expiration date of a successful subscription-renewal-
date extension.
originalTransaction
Id
originalTransaction
Id
The original transaction identifier of the subscription that experienced a servi
interruption.
success
success
A Boolean value that indicates whether the subscription-renewal-date
extension succeeded.
webOrderLineItemId
webOrderLineItemId
A unique ID that identifies subscription-purchase events, including subscripti
renewals, across devices.
Extending the renewal date for auto-renewable subscriptions
This object is the response data for the Extend a Subscription Renewal Date endpoint.
Properties
Mentioned in
Discussion
App Store Server API / ExtendRenewalDateResponse
Object
ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension
succeeded, and related details.
App Store Server API 1.1+


## Page 20

type effectiveDate
The new subscription expiration date for a subscription-renewal extension.
type originalTransactionId
The original transaction identifier of a purchase.
type success
A Boolean value that indicates whether the subscription-renewal-date extension succeeded
type webOrderLineItemId
The unique identifier of subscription-purchase events across devices, including renewals.
Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateRequest
Topics
Response data types
See Also
Subscription-renewal-date extension


## Page 21

The request body that contains subscription-renewal-extension data for an individual
subscription.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.


## Page 22

requestIdentifier
requestIdentifier
Required. A string that contains a one-time UUID value you provide to identif
this subscription-renewal-date extension request.
Maximum length: 128
extendByDays
extendByDays
Required. The number of days to extend the subscription renewal date.
Maximum: 90
extendReasonCode
extendReasonCode
Required. The reason code for the subscription-renewal-date extension.
productId
productId
Required. The product identifier of the auto-renewable subscription that you
requesting the renewal-date extension for.
storefrontCountry
Codes
storefrontCountry
Codes
A list of storefront country codes you provide to limit the storefronts that are
eligible to receive the subscription-renewal-date extension. Omit this list to
request the subscription-renewal-date extension in all storefronts.
Extending the renewal date for auto-renewable subscriptions
Properties
Mentioned in
App Store Server API / MassExtendRenewalDateRequest
Object
MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for
all eligible active subscribers.
App Store Server API 1.7+


## Page 23

This request body applies to the Extend Subscription Renewal Dates for All Activ
Subscribers endpoint.
The requestIdentifier uniquely identifies this request. Use the same requestIdentifier
in the following APIs :
The Get Status of Subscription Renewal Date Extensions endpoint
The summary object in App Store Server Notifications.
For more information, see Extending the renewal date for auto-renewable subscriptions.
type extendByDays
The number of days to extend the subscription renewal date.
type extendReasonCode
The code that represents the reason for the subscription-renewal-date extension.
type productId
The product identifier of the In-App Purchase.
type requestIdentifier
A string that contains a unique identifier you provide to track each subscription-renewal-dat
extension request.
type storefrontCountryCode
The three-letter code that represents the country or region associated with the App Store
storefront.
type storefrontCountryCodes
A list of storefront country codes you provide to limit the storefronts for a subscription-
renewal-date extension.
Discussion
Topics
Data types
See Also


## Page 24

Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.
Subscription-renewal-date extension


## Page 25

requestIdentifier
requestIdentifier
A string that contains the UUID that identifies the subscription-renewal-date
extension request.
Maximum length: 128
App Store Server API changelog
The App Store server returns this response when you call the Extend Subscription Renewa
Dates for All Active Subscribers endpoint. Because the endpoint runs asynchronously
this response means the App Store received your request and is processing it. The request may
take multiple hours or days to complete, depending on the number of subscribers.
As the App Store server processes your request, it sends notifications (App Store Server
Notifications V2) in near real-time to report on each subscription it processes. Look for
notifications with the notificationType of RENEWAL_EXTENSION and RENEWAL_EXTENDED
The server sends a RENEWAL_EXTENSION notification with a subtype of SUCCESS when it
completes the request.
Properties
Mentioned in
Discussion
App Store Server API / MassExtendRenewalDateResponse
Object
MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-
renewal-date extension request.
App Store Server API 1.7+


## Page 26

The Get Status of Subscription Renewal Date Extensions endpoint reports on
whether your request is complete. For completed requests, it also reports the count of successfu
and failed subscription-renewal-date extensions.
For more information, see Extending the renewal date for auto-renewable subscriptions.
Extending the renewal date for auto-renewable subscriptions
Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscription renewal
date to all eligible subscribers.
See Also
Subscription-renewal-date extension


## Page 27



## Page 28

requestIdentifier
requestIdentifier
The UUID that represents your request for a subscription-renewal-date
extension.
Maximum length: 128
complete
complete
A Boolean value that’s TRUE to indicate that the App Store completed your
request to extend a subscription renewal date for all eligible subscribers.
The value is FALSE if the request is in progress.
completeDate
completeDate
The date that the App Store completes the request.
Appears only if complete is TRUE.
failedCount
failedCount
The final count of subscribers that fail to receive a subscription-renewal-date
extension.
Appears only if complete is TRUE.
succeededCount
succeededCount
The final count of subscribers that successfully receive a subscription-
renewal-date extension.
Appears only if complete is TRUE.
Properties
Mentioned in
App Store Server API / MassExtendRenewalDateStatusResponse
Object
MassExtendRenewalDateStatusResponse
A response that indicates the current status of a request to extend the subscriptio
renewal date to all eligible subscribers.
App Store Server API 1.7+


## Page 29

App Store Server API changelog
The App Store server sends this response when you call the Get Status of Subscription
Renewal Date Extensions endpoint. Your request to Extend Subscription Renewal
Dates for All Active Subscribers is complete when the value of the complete field is
TRUE. Otherwise, the request is still in progress.
The App Store server also sends real-time notifications as it’s processing the subscription-
renewal-date extension, including notifications with notificationType values of RENEWAL
_EXTENSION and RENEWAL_EXTENDED. For more information, see App Store Server Notification
For more information about extending subscription renewal dates, see Extending the renewal date
for auto-renewable subscriptions.
type complete
A Boolean value that indicates whether the App Store completed the request to extend a
subscription renewal date to active subscribers.
type completeDate
The UNIX time, in milliseconds, that the App Store completes a request to extend a
subscription renewal date for eligible subscribers.
type failedCount
The count of subscriptions that fail to receive a subscription-renewal-date extension.
type succeededCount
The count of subscriptions that successfully receive a subscription-renewal-date extension.
Extending the renewal date for auto-renewable subscriptions
Discussion
Topics
Data types
See Also
Subscription-renewal-date extension


## Page 30

Compensate eligible active subscribers for service interruptions by extending a subscription
renewal date.
Extend a Subscription Renewal Date
Extends the renewal date of a customer’s active subscription using the original transaction
identifier.
Extend Subscription Renewal Dates for All Active Subscribers
Uses a subscription’s product identifier to extend the renewal date for all of its eligible active
subscribers.
Get Status of Subscription Renewal Date Extensions
Checks whether a renewal date extension request completed, and provides the final count o
successful or failed extensions.
object ExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data for an individual
subscription.
object ExtendRenewalDateResponse
A response that indicates whether an individual renewal-date extension succeeded, and
related details.
object MassExtendRenewalDateRequest
The request body that contains subscription-renewal-extension data to apply for all eligible
active subscribers.
object MassExtendRenewalDateResponse
A response that indicates the server successfully received the subscription-renewal-date
extension request.


