# Subscription metadata changes from the server.pdf

## Page 1

transactionId
string
(Required) The transaction identifier of the auto-renewable subscription to g
changes to its metadata. Use the subscription’s original transaction ID or any
subsequent transaction ID of a transaction related to the subscription.
SubscriptionChange
MetadataRequest
The request body that contains the metadata changes.
Content-Type: application/json
200
SubscriptionChange
MetadataResponse
OK
Request succeeded.
Content-Type: application/json
URL
Sandbox URL
Path Parameters
HTTP Body
Response Codes
Advanced Commerce API / Change Subscription Metadata
Web Service Endpoint
Change Subscription Metadata
Update the SKU, display name, and description associated with a subscription,
without affecting the subscription’s billing or its service.
Advanced Commerce API 1.0+


## Page 2

400
(RepeatedRequest
ReferenceIdError |
NullRequestInfoError
| NullEffectiveError
| InvalidAppAccount
TokenError | Null
RequestReference
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
InvalidProduct
ChangesError |
InvalidDisplayName
Error | Invalid
DescriptionError |
InvalidProductError
| InvalidSKUError |
InvalidTaxProduct
CodeError |
MismatchedStorefront
Error | Mismatched
StorefrontError |
OperationNotAllowed
Error | Malformed
PayloadError | At
LeastOneItemError |
AtLeastOneOfDisplay
NameOrDescription
Error)
Bad Request
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Authorizing API requests from your server.
403
(SubscriptionDoesNot
ExistError |
SubscriptionNot
EligibleError |
ProductNotOwnedError
Forbidden
Content-Type: application/json


## Page 3

| InactiveACASub
Error | ProductNot
EligibleError)
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
Use this endpoint to update the display name and description of an auto-renewable subscription.
Calling this endpoint doesn’t change the price, billing details, or the service. For example, you can
call Change Subscription Metadata if a subscription’s display name changes due to a
change in its branding.
Don’t call this endpoint if a customer is changing subscriptions to receive a different service, such
as upgrading, downgrading, or cross-grading. For such changes, use SubscriptionModifyIn
AppRequest.
object SubscriptionChangeMetadataRequest
The request body you provide to change the metadata of a subscription.
Mentioned in
Discussion
See Also
Subscription metadata changes from the server


## Page 4

object SubscriptionChangeMetadataResponse
The response body for a successful subscription metadata change.
object SubscriptionChangeMetadataDescriptors
The subscription metadata to change, specifically the description and display name.
object SubscriptionChangeMetadataItem
The metadata to change for an item, specifically its SKU, description, and display name.


## Page 5

descriptors
SubscriptionChange
MetadataDescriptors
items
[SubscriptionChange
MetadataItem]
requestInfo
RequestInfo
(Required)
storefront
storefront
taxCode
taxCode
Properties
See Also
Subscription metadata changes from the server
Advanced Commerce API / SubscriptionChangeMetadataRequest
Object
SubscriptionChangeMetadataRequest
The request body you provide to change the metadata of a subscription.
Advanced Commerce API 1.1+


## Page 6

Change Subscription Metadata
Update the SKU, display name, and description associated with a subscription, without
affecting the subscription’s billing or its service.
object SubscriptionChangeMetadataResponse
The response body for a successful subscription metadata change.
object SubscriptionChangeMetadataDescriptors
The subscription metadata to change, specifically the description and display name.
object SubscriptionChangeMetadataItem
The metadata to change for an item, specifically its SKU, description, and display name.


## Page 7

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


## Page 8

The request body you provide to change the metadata of a subscription.
object SubscriptionChangeMetadataDescriptors
The subscription metadata to change, specifically the description and display name.
object SubscriptionChangeMetadataItem
The metadata to change for an item, specifically its SKU, description, and display name.


## Page 9

description
description
The new description for the subscription.
Maximum length: 45
displayName
displayName
The new display name for the subscription.
Maximum length: 30
effective
effective
(Required) The string that determines when the metadata change goes into
effect.
Change Subscription Metadata
Update the SKU, display name, and description associated with a subscription, without
affecting the subscription’s billing or its service.
object SubscriptionChangeMetadataRequest
The request body you provide to change the metadata of a subscription.
Properties
See Also
Subscription metadata changes from the server
Advanced Commerce API / SubscriptionChangeMetadataDescriptors
Object
SubscriptionChangeMetadataDescriptors
The subscription metadata to change, specifically the description and display
name.
Advanced Commerce API 1.1+


## Page 10

object SubscriptionChangeMetadataResponse
The response body for a successful subscription metadata change.
object SubscriptionChangeMetadataItem
The metadata to change for an item, specifically its SKU, description, and display name.


## Page 11

SKU
SKU
The new SKU of the item.
Maximum length: 128
currentSKU
SKU
(Required) The original SKU of the item.
Maximum length: 128
description
description
The new description for the item.
Maximum length: 45
displayName
displayName
The new display name for the item.
Maximum length: 30
effective
effective
(Required) The string that determines when the metadata change goes into
effect.
Properties
See Also
Subscription metadata changes from the server
Advanced Commerce API / SubscriptionChangeMetadataItem
Object
SubscriptionChangeMetadataItem
The metadata to change for an item, specifically its SKU, description, and display
name.
Advanced Commerce API 1.1+


## Page 12

Change Subscription Metadata
Update the SKU, display name, and description associated with a subscription, without
affecting the subscription’s billing or its service.
object SubscriptionChangeMetadataRequest
The request body you provide to change the metadata of a subscription.
object SubscriptionChangeMetadataResponse
The response body for a successful subscription metadata change.
object SubscriptionChangeMetadataDescriptors
The subscription metadata to change, specifically the description and display name.


