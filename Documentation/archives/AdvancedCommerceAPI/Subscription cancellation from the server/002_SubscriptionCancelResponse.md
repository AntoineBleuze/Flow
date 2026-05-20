# 002_SubscriptionCancelResponse.pdf

## Page 1

signedRenewalInfo
JWSRenewalInfo
(Required) Subscription renewal information signed by the App Store, in JSO
Web Signature (JWS) format.
signedTransaction
Info
JWSTransaction
(Required) Transaction information signed by the App Store, in JWS Compac
Serialization format.
This is the response body for the Cancel a Subscription endpoint.
Cancel a Subscription
Turn off automatic renewal to cancel a customer’s auto-renewable subscription.
object SubscriptionCancelRequest
Properties
Discussion
See Also
Subscription cancellation from the server
Advanced Commerce API / SubscriptionCancelResponse
Object
SubscriptionCancelResponse
The response body for a successful subscription cancellation.
Advanced Commerce API 1.0+


## Page 2

The request body for turning off automatic renewal of a subscription.


