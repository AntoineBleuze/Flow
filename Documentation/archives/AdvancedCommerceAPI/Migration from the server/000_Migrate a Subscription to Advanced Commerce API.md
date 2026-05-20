# 000_Migrate a Subscription to Advanced Commerce API.pdf

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


