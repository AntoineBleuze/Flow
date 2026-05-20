# 002_SubscriptionPriceChangeResponse.pdf

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
This is the response body for the Change Subscription Price endpoint.
Change Subscription Price
Increase or decrease the price of an auto-renewable subscription, a bundle, or individual
items within a subscription at the next renewal.
Properties
Discussion
See Also
Subscription price change from the server
Advanced Commerce API / SubscriptionPriceChangeResponse
Object
SubscriptionPriceChangeResponse
A response that contains signed JWS renewal and JWS transaction information
after a subscription price change request.
Advanced Commerce API 1.0+


## Page 2

object SubscriptionPriceChangeRequest
The request body you use to change the price of an auto-renewable subscription.


