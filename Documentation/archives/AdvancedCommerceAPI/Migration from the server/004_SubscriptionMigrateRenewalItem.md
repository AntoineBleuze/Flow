# 004_SubscriptionMigrateRenewalItem.pdf

## Page 1

SKU
SKU
(Required) The SKU that the subscription item renews to at the next renewa
period.
Maximum length: 128
description
description
(Required) The description of the renewing SKU.
Maximum length: 45
displayName
displayName
(Required) The display name of the renewing SKU.
Maximum length: 30
If you migrate a subscription that is to renew to another SKU, provide the item that is to renew in
the SubscriptionMigrateRenewalItem.
For example, if a customer downgrades a subscription, the subscription continues unchanged un
the end of the billing period, and downgrades when it renews. If you migrate a subscription in this
state before the end of the billing period, you need to provide the item that renews.
Properties
Discussion
See Also
Advanced Commerce API / SubscriptionMigrateRenewalItem
Object
SubscriptionMigrateRenewalItem
The item information that replaces a migrated subscription item when the
subscription renews.
Advanced Commerce API 1.1+


## Page 2

Migrate a Subscription to Advanced Commerce API
Migrate a subscription that a customer purchased through In-App Purchase to a subscriptio
you manage using the Advanced Commerce API.
object SubscriptionMigrateRequest
The subscription details you provide to migrate a subscription from In-App Purchase to the
Advanced Commerce API, such as descriptors, items, storefront, and more.
object SubscriptionMigrateResponse
A response that contains signed renewal and transaction information after a subscription
successfully migrates to the Advanced Commerce API.
object SubscriptionMigrateItem
The SKU, description, and display name to use for a migrated subscription item.
object SubscriptionMigrateDescriptors
The description and display name of the subscription to migrate to that you manage.
Migration from the server


