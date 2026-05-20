# 001_SubscriptionRevokeRequest.pdf

## Page 1

refundReason
refundReason
(Required)
refundRisking
Preference
refundRisking
Preference
(Required)
refundType
string
(Required)
Possible Values: FULL, PRORATED
requestInfo
RequestInfo
(Required)
storefront
storefront
This is the request body for the Revoke Subscription endpoint.
Properties
Discussion
Advanced Commerce API / SubscriptionRevokeRequest
Object
SubscriptionRevokeRequest
The request body you provide to terminate a subscription and all its items
immediately.
Advanced Commerce API 1.1+


## Page 2

Revoke Subscription
Immediately cancel a customer’s subscription and all the items that are included in the
subscription, and request a full or prorated refund.
object SubscriptionRevokeResponse
The response body for a successful revoke-subscription request.
See Also
Subscription revocation from the server


