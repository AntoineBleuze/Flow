# 003_SubscriptionMigrateItem.pdf

## Page 1

SKU
SKU
(Required) The SKU to use for the migrated item.
Maximum length: 128
description
description
(Required) The description of the SKU.
Maximum length: 45
displayName
displayName
(Required) The display name of the SKU.
Maximum length: 30
Migrate a Subscription to Advanced Commerce API
Migrate a subscription that a customer purchased through In-App Purchase to a subscriptio
you manage using the Advanced Commerce API.
object SubscriptionMigrateRequest
The subscription details you provide to migrate a subscription from In-App Purchase to the
Advanced Commerce API, such as descriptors, items, storefront, and more.
Properties
See Also
Migration from the server
Advanced Commerce API / SubscriptionMigrateItem
Object
SubscriptionMigrateItem
The SKU, description, and display name to use for a migrated subscription item.
Advanced Commerce API 1.1+


## Page 2

object SubscriptionMigrateResponse
A response that contains signed renewal and transaction information after a subscription
successfully migrates to the Advanced Commerce API.
object SubscriptionMigrateRenewalItem
The item information that replaces a migrated subscription item when the subscription
renews.
object SubscriptionMigrateDescriptors
The description and display name of the subscription to migrate to that you manage.


