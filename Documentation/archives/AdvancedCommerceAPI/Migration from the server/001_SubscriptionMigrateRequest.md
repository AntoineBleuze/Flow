# 001_SubscriptionMigrateRequest.pdf

## Page 1

descriptors
SubscriptionMigrate
Descriptors
(Required)
items
[SubscriptionMigrate
Item]
(Required) An array of one or more SKUs, along with descriptions and displa
names, that are included in the subscription.
renewalItems
[SubscriptionMigrate
RenewalItem]
An optional array of subscription items that represents the items that renew a
the next renewal period, if they differ from items. Supply this array if the
customer has a pending subscription downgrade or cross-grade, which appli
at the next renewal period.
requestInfo
RequestInfo
(Required)
storefront
storefront
targetProductId
targetProductId
(Required) Your generic product ID for an auto-renewable subscription. You
configure this product ID in App Store Connect during setup. For more
information, see Creating SKUs for your In-App Purchases.
Properties
Advanced Commerce API / SubscriptionMigrateRequest
Object
SubscriptionMigrateRequest
The subscription details you provide to migrate a subscription from In-App
Purchase to the Advanced Commerce API, such as descriptors, items, storefront,
and more.
Advanced Commerce API 1.1+


## Page 2

taxCode
taxCode
(Required)
Migrate a Subscription to Advanced Commerce API
Migrate a subscription that a customer purchased through In-App Purchase to a subscriptio
you manage using the Advanced Commerce API.
object SubscriptionMigrateResponse
A response that contains signed renewal and transaction information after a subscription
successfully migrates to the Advanced Commerce API.
object SubscriptionMigrateItem
The SKU, description, and display name to use for a migrated subscription item.
object SubscriptionMigrateRenewalItem
The item information that replaces a migrated subscription item when the subscription
renews.
object SubscriptionMigrateDescriptors
The description and display name of the subscription to migrate to that you manage.
See Also
Migration from the server


