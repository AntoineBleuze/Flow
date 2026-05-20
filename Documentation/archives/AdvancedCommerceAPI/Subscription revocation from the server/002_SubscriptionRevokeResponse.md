# 002_SubscriptionRevokeResponse.pdf

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
This is the response body for the Revoke Subscription endpoint.
Revoke Subscription
Immediately cancel a customer’s subscription and all the items that are included in the
subscription, and request a full or prorated refund.
object SubscriptionRevokeRequest
Properties
Discussion
See Also
Subscription revocation from the server
Advanced Commerce API / SubscriptionRevokeResponse
Object
SubscriptionRevokeResponse
The response body for a successful revoke-subscription request.
Advanced Commerce API 1.1+


## Page 2

The request body you provide to terminate a subscription and all its items immediately.


