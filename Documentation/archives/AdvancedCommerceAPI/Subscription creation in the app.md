# Subscription creation in the app.pdf

## Page 1

currency
currency
(Required)
descriptors
Descriptors
(Required)
items
[SubscriptionCreate
Item]
(Required)
operation
string
(Required)
Value: CREATE_SUBSCRIPTION
period
period
(Required)
previousTransaction
Id
transactionId
requestInfo
RequestInfo
(Required)
Properties
Advanced Commerce API / SubscriptionCreateRequest
Object
SubscriptionCreateRequest
The request data your app provides when a customer purchases an auto-
renewable subscription.
Advanced Commerce API 1.0+


## Page 2

storefront
storefront
taxCode
taxCode
(Required)
version
version
(Required)
Creating SKUs for your In-App Purchases
Creating SKUs for the Mini Apps Partner Program
Mentioned in
Example: subscription with a single item
Request


## Page 3

Example: subscription with multiple items and an offer
See Also
Request


## Page 4

object SubscriptionCreateItem
The data that describes a subscription item.
Subscription creation in the app


## Page 5

SKU
SKU
(Required) The item’s product identifier, which you define.
Maximum length: 128
description
description
(Required)
Maximum length: 45
displayName
displayName
(Required)
Maximum length: 30
offer
Offer
price
price
(Required)
Creating SKUs for the Mini Apps Partner Program
Properties
Mentioned in
See Also
Advanced Commerce API / SubscriptionCreateItem
Object
SubscriptionCreateItem
The data that describes a subscription item.
Advanced Commerce API 1.0+


## Page 6

object SubscriptionCreateRequest
The request data your app provides when a customer purchases an auto-renewable
subscription.
Subscription creation in the app


