# Subscription modification in the app.pdf

## Page 1

addItems
[SubscriptionModify
AddItem]
changeItems
[SubscriptionModify
ChangeItem]
currency
currency
descriptors
SubscriptionModify
Descriptors
operation
string
(Required)
Value: MODIFY_SUBSCRIPTION
periodChange
SubscriptionModify
PeriodChange
removeItems
Properties
Advanced Commerce API / SubscriptionModifyInAppRequest
Object
SubscriptionModifyInAppRequest
The request data your app provides to make changes to an auto-renewable
subscription.
Advanced Commerce API 1.0+


## Page 2

[SubscriptionModify
RemoveItem]
requestInfo
RequestInfo
(Required)
retainBillingCycle
retainBillingCycle
(Required)
storefront
storefront
taxCode
taxCode
transactionId
transactionId
(Required)
version
version
(Required)
You use the SubscriptionModifyInAppRequest in your app when the customer makes one 
more changes to a subscription, such as upgrading, downgrading, or adding or removing items.
In the following request:
The customer upgrades the subscription from a monthly to an annual subscription, effective
immediately.
The billing cycle resets.
The example doesn’t include optional fields in requestInfo.
Discussion
Example: upgrade a subscription
Request


## Page 3

In the following request:
The customer adds an item to the subscription, effective immediately.
The billing cycle remains the same. The customer needs to pay the prorated price of the new
item. Apple calculates the prorated price and presents a payment sheet to the customer.
The customer is charged USD 4.99, as indicated by the price and currency fields in the
request, at the next regular billing period.
The example doesn’t include optional fields in requestInfo.
Example: add an item and retain the billing cycle
Request


## Page 4

In the following request:
The customer removes an item from the subscription, effective at the next renewal.
The billing cycle remains the same.
The remaining items renew at the next billing period.
The example doesn’t include optional fields in requestInfo.
Example: remove an item at the next renewal
Request


## Page 5

In the following request:
The customer downgrades the subscription, effective at the next renewal.
The billing cycle remains the same.
The example doesn’t include optional fields in requestInfo.
Example: downgrade a subscription at the next renewal
Request


## Page 6

object SubscriptionModifyAddItem
The data your app provides to add items when it makes changes to an auto-renewable
subscription.
object SubscriptionModifyChangeItem
The data your app provides to change an item of an auto-renewable subscription.
object SubscriptionModifyRemoveItem
The data your app provides to remove an item from an auto-renewable subscription.
object SubscriptionModifyPeriodChange
The data your app provides to change the period of an auto-renewable subscription.
See Also
Subscription modification in the app


## Page 7

SKU
SKU
(Required)
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
proratedPrice
proratedPrice
Properties
See Also
Advanced Commerce API / SubscriptionModifyAddItem
Object
SubscriptionModifyAddItem
The data your app provides to add items when it makes changes to an auto-
renewable subscription.
Advanced Commerce API 1.0+


## Page 8

object SubscriptionModifyInAppRequest
The request data your app provides to make changes to an auto-renewable subscription.
object SubscriptionModifyChangeItem
The data your app provides to change an item of an auto-renewable subscription.
object SubscriptionModifyRemoveItem
The data your app provides to remove an item from an auto-renewable subscription.
object SubscriptionModifyPeriodChange
The data your app provides to change the period of an auto-renewable subscription.
Subscription modification in the app


## Page 9

SKU
SKU
(Required)
Maximum length: 128
currentSKU
SKU
(Required)
Maximum length: 128
description
description
(Required)
Maximum length: 45
displayName
displayName
(Required)
Maximum length: 30
effective
effective
(Required)
offer
Offer
price
price
(Required)
proratedPrice
proratedPrice
Properties
Advanced Commerce API / SubscriptionModifyChangeItem
Object
SubscriptionModifyChangeItem
The data your app provides to change an item of an auto-renewable subscription
Advanced Commerce API 1.0+


## Page 10

reason
string
(Required)
Possible Values: UPGRADE, DOWNGRADE, APPLY_OFFER
object SubscriptionModifyInAppRequest
The request data your app provides to make changes to an auto-renewable subscription.
object SubscriptionModifyAddItem
The data your app provides to add items when it makes changes to an auto-renewable
subscription.
object SubscriptionModifyRemoveItem
The data your app provides to remove an item from an auto-renewable subscription.
object SubscriptionModifyPeriodChange
The data your app provides to change the period of an auto-renewable subscription.
See Also
Subscription modification in the app


## Page 11

SKU
SKU
(Required)
Maximum length: 128
object SubscriptionModifyInAppRequest
The request data your app provides to make changes to an auto-renewable subscription.
object SubscriptionModifyAddItem
The data your app provides to add items when it makes changes to an auto-renewable
subscription.
object SubscriptionModifyChangeItem
The data your app provides to change an item of an auto-renewable subscription.
object SubscriptionModifyPeriodChange
Properties
See Also
Subscription modification in the app
Advanced Commerce API / SubscriptionModifyRemoveItem
Object
SubscriptionModifyRemoveItem
The data your app provides to remove an item from an auto-renewable
subscription.
Advanced Commerce API 1.0+


## Page 12

The data your app provides to change the period of an auto-renewable subscription.


## Page 13

effective
effective
(Required)
period
period
(Required)
object SubscriptionModifyInAppRequest
The request data your app provides to make changes to an auto-renewable subscription.
object SubscriptionModifyAddItem
The data your app provides to add items when it makes changes to an auto-renewable
subscription.
object SubscriptionModifyChangeItem
The data your app provides to change an item of an auto-renewable subscription.
Properties
See Also
Subscription modification in the app
Advanced Commerce API / SubscriptionModifyPeriodChange
Object
SubscriptionModifyPeriodChange
The data your app provides to change the period of an auto-renewable
subscription.
Advanced Commerce API 1.0+


## Page 14

object SubscriptionModifyRemoveItem
The data your app provides to remove an item from an auto-renewable subscription.


