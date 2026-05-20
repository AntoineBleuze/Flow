# 001_Extend a Subscription Renewal Date.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


