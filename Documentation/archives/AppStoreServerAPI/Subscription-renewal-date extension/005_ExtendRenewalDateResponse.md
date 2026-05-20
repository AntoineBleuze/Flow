# 005_ExtendRenewalDateResponse.pdf

## Page 1

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


## Page 2

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


## Page 3

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


