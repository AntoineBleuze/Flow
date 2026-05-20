# 002_SubscriptionChangeMetadataResponse.pdf

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
This is the response body for the Change Subscription Metadata endpoint.
Change Subscription Metadata
Update the SKU, display name, and description associated with a subscription, without
affecting the subscription’s billing or its service.
object SubscriptionChangeMetadataRequest
Properties
Discussion
See Also
Subscription metadata changes from the server
Advanced Commerce API / SubscriptionChangeMetadataResponse
Object
SubscriptionChangeMetadataResponse
The response body for a successful subscription metadata change.
Advanced Commerce API 1.1+


## Page 2

The request body you provide to change the metadata of a subscription.
object SubscriptionChangeMetadataDescriptors
The subscription metadata to change, specifically the description and display name.
object SubscriptionChangeMetadataItem
The metadata to change for an item, specifically its SKU, description, and display name.


