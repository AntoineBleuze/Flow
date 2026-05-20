# Migration from the server.pdf

## Page 1

transactionId
string
(Required) The transaction identifier of the auto-renewable subscription to
migrate. Use the subscription’s original transaction ID or any subsequent
transaction ID of a transaction related to the subscription.
SubscriptionMigrate
Request
The request body that contains the details for the migration.
Content-Type: application/json
200
OK
Request succeeded.
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
Advanced Commerce API / Migrate a Subscription to Advanced Commerce API
Web Service Endpoint
Migrate a Subscription to Advanced
Commerce API
Migrate a subscription that a customer purchased through In-App Purchase to a
subscription you manage using the Advanced Commerce API.
Advanced Commerce API 1.0+


## Page 2

SubscriptionMigrate
Response
Content-Type: application/json
400
(RepeatedRequest
ReferenceIdError |
NullRequestInfoError
| NullTaxCodeError |
NullItemsError |
NullDescriptorsError
| NullSKUError |
NullDisplayNameError
| NullDescription
Error | InvalidApp
AccountTokenError |
NullRequestReference
IDError | Invalid
RequestReference
IDError | Invalid
ConsistencyToken
Error | Invalid
StorefrontError |
SKULengthExceeded
Error | Description
LengthExceededError
| DisplayNameLength
ExceededError |
InvalidDisplayName
Error | Invalid
DescriptionError |
InvalidProductError
| InvalidSKUError |
InvalidTaxProduct
CodeError |
MismatchedStorefront
Error | Missing
PricingConfigFor
StorefrontError |
OperationNotAllowed
Error | Malformed
PayloadError | At
LeastOneItemError |
NullTargetProduct
IDError | Invalid
TargetProductIDError
| Subscription
AlreadyMigratedError
| ItemLimitExceeded
Error | Pending
Bad Request
Content-Type: application/json


## Page 3

ChangesMismatch
Error)
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Authorizing API requests from your server.
403
(SubscriptionDoesNot
ExistError |
SubscriptionAlready
ExistsError |
SubscriptionNot
EligibleError |
ProductNotOwnedError
| InactiveACASub
Error | ProductNot
EligibleError |
StorefrontChange
Error)
Forbidden
Content-Type: application/json
404
(TransactionIdNot
FoundError | Product
NotFoundError)
Not Found
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit. For more information, see Identifying rat
limits for Advanced Commerce APIs.
Content-Type: application/json
500
(GeneralInternal
Error | General
InternalRetryable
Error)
Internal Server Error
Server error. Try again later.
Content-Type: application/json
Authorizing API requests from your server
Advanced Commerce API changelog
Identifying rate limits for Advanced Commerce APIs
Mentioned in
Discussion


## Page 4

Note
You can use the Advanced Commerce API and the StoreKit In-App Purchase APIs in the same
app. Both APIs use the App Store commerce system, including the same signed JWS
transactions and JWS renewal info. For products that you offer using the In-App Purchase API,
you set up product identifiers in App Store Connect. For products that you offer using the
Advanced Commerce API, you host and manage your own catalog of SKUs and add product
details dynamically at runtime.
object SubscriptionMigrateRequest
The subscription details you provide to migrate a subscription from In-App Purchase to the
Advanced Commerce API, such as descriptors, items, storefront, and more.
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


## Page 5

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


## Page 6

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


## Page 7

signedRenewalInfo
JWSRenewalInfo
(Required) Subscription renewal information signed by the App Store, in JSO
Web Signature (JWS) format, for the migrated subscription.
signedTransaction
Info
JWSTransaction
(Required) Transaction information signed by the App Store, in JSON Web
Signature (JWS) Compact Serialization format, for the migrated subscription.
This is the response body for the Migrate a Subscription to Advanced Commerce AP
endpoint.
Migrate a Subscription to Advanced Commerce API
Migrate a subscription that a customer purchased through In-App Purchase to a subscriptio
you manage using the Advanced Commerce API.
Properties
Discussion
See Also
Migration from the server
Advanced Commerce API / SubscriptionMigrateResponse
Object
SubscriptionMigrateResponse
A response that contains signed renewal and transaction information after a
subscription successfully migrates to the Advanced Commerce API.
Advanced Commerce API 1.1+


## Page 8

object SubscriptionMigrateRequest
The subscription details you provide to migrate a subscription from In-App Purchase to the
Advanced Commerce API, such as descriptors, items, storefront, and more.
object SubscriptionMigrateItem
The SKU, description, and display name to use for a migrated subscription item.
object SubscriptionMigrateRenewalItem
The item information that replaces a migrated subscription item when the subscription
renews.
object SubscriptionMigrateDescriptors
The description and display name of the subscription to migrate to that you manage.


## Page 9

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


## Page 10

object SubscriptionMigrateResponse
A response that contains signed renewal and transaction information after a subscription
successfully migrates to the Advanced Commerce API.
object SubscriptionMigrateRenewalItem
The item information that replaces a migrated subscription item when the subscription
renews.
object SubscriptionMigrateDescriptors
The description and display name of the subscription to migrate to that you manage.


## Page 11

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


## Page 12

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


## Page 13

description
description
(Required) The description of the subscription to migrate to. This string
doesn’t display to customers.
Maximum length: 45
displayName
displayName
(Required) The display name of the subscription to migrate to. This string
displays to customers.
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
Advanced Commerce API / SubscriptionMigrateDescriptors
Object
SubscriptionMigrateDescriptors
The description and display name of the subscription to migrate to that you
manage.
Advanced Commerce API 1.1+


## Page 14

object SubscriptionMigrateResponse
A response that contains signed renewal and transaction information after a subscription
successfully migrates to the Advanced Commerce API.
object SubscriptionMigrateItem
The SKU, description, and display name to use for a migrated subscription item.
object SubscriptionMigrateRenewalItem
The item information that replaces a migrated subscription item when the subscription
renews.


