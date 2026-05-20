# 001_SubscriptionPriceChangeRequest.pdf

## Page 1

currency
currency
The currency of the prices.
items
[SubscriptionPrice
ChangeItem]
(Required) An array that contains one or more SKUs and the changed price f
each SKU.
requestInfo
RequestInfo
(Required) Metadata that identifies the request.
storefront
storefront
The App Store storefront of the subscription.
This is the request body for the Change Subscription Price endpoint.
The items array contains SubscriptionPriceChangeItem. Include one entry for each SKU
within the subscription that has a price change.
Properties
Discussion
See Also
Advanced Commerce API / SubscriptionPriceChangeRequest
Object
SubscriptionPriceChangeRequest
The request body you use to change the price of an auto-renewable subscription
Advanced Commerce API 1.0+


## Page 2

Change Subscription Price
Increase or decrease the price of an auto-renewable subscription, a bundle, or individual
items within a subscription at the next renewal.
object SubscriptionPriceChangeResponse
A response that contains signed JWS renewal and JWS transaction information after a
subscription price change request.
Subscription price change from the server


