# 004_JWSTransactionDecodedPayload.pdf

## Page 1

appAccountToken
appAccountToken
A UUID you create at the time of purchase that associates the transaction wit
a customer on your own service. If your app doesn’t provide an appAccount
Token, this field is omitted. For more information, see appAccount
Token(_:).
appTransactionId
appTransactionId
The unique identifier of the app download transaction.
bundleId
bundleId
The bundle identifier of the app.
currency
currency
The three-letter ISO 4217 currency code associated with the price paramet
This value is present only if price is present.
environment
environment
The server environment, either sandbox or production.
expiresDate
expiresDate
The UNIX time, in milliseconds, that the subscription expires or renews.
inAppOwnershipType
inAppOwnershipType
A string that describes whether the transaction was purchased by the
customer, or is available to them through Family Sharing.
Properties
App Store Server API / JWSTransactionDecodedPayload
Object
JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
App Store Server API 1.0+


## Page 2

isUpgraded
isUpgraded
A Boolean value that indicates whether the customer upgraded to another
subscription.
offerDiscountType
offerDiscountType
The payment mode you configure for the offer.
offerIdentifier
offerIdentifier
The identifier that contains the offer code or the promotional offer identifier.
offerPeriod
offerPeriod
The duration of the offer applied to the transaction.
offerType
offerType
A value that represents the promotional offer type.
originalPurchaseDate
originalPurchaseDate
The UNIX time, in milliseconds, that represents the purchase date of the
original transaction identifier.
originalTransaction
Id
originalTransaction
Id
The transaction identifier of the original purchase.
price
price
An integer value that represents the price multiplied by 1000 of the in-app
purchase or subscription offer you configured in App Store Connect and that
the system records at the time of the purchase. For more information, see
price. The currency parameter indicates the currency of this price.
productId
productId
The unique identifier of the product.
purchaseDate
purchaseDate
The UNIX time, in milliseconds, that the App Store charged the customer’s
account for a purchase, restored product, subscription, or subscription renew
after a lapse.
quantity
quantity
The number of consumable products the customer purchased.
revocationDate
revocationDate
The UNIX time, in milliseconds, that the App Store refunded the transaction o
revoked it from Family Sharing.
revocationPercentage
revocationPercentage
The percentage, in milliunits, of the transaction that the App Store has
refunded or revoked.
Minimum: 0
Maximum: 100000


## Page 3

revocationReason
revocationReason
The reason that the App Store refunded the transaction or revoked it from
Family Sharing.
revocationType
revocationType
The type of the refund or revocation that applies to the transaction.
signedDate
signedDate
The UNIX time, in milliseconds, that the App Store signed the JSON Web
Signature (JWS) data.
storefront
storefront
The three-letter code that represents the country or region associated with t
App Store storefront for the purchase.
storefrontId
storefrontId
An Apple-defined value that uniquely identifies the App Store storefront
associated with the purchase.
subscriptionGroup
Identifier
subscriptionGroup
Identifier
The identifier of the subscription group to which the subscription belongs.
transactionId
transactionId
The unique identifier of the transaction.
transactionReason
transactionReason
The reason for the purchase transaction, which indicates whether it’s a
customer’s purchase or a renewal for an auto-renewable subscription that th
system initates.
type
type
The type of the in-app purchase.
webOrderLineItemId
webOrderLineItemId
The unique identifier of subscription purchase events across devices, includi
subscription renewals.
advancedCommerceInfo
advancedCommerce
TransactionInfo
Transaction information that is present only for Advanced Commerce SKUs.
App Store Server API changelog
Mentioned in
Discussion


## Page 4

Important
Don’t use the price or currency values for any revenue reconciliation or recognition. App
Store Connect reporting is your source of record for financial and accounting purposes. For
more information, see Overview of reporting tools.
object JWSDecodedHeader
A decoded JSON Web Signature (JWS) header containing transaction or renewal information
type JWSAppTransaction
App transaction information signed by the App Store, in JSON Web Signature (JWS) Compa
Serialization format.
object JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
type JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
type JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signature (JWS)
format.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
Data types
Refer to these data types for decoded transaction and renewal information payloads.
See Also
JWS headers and payloads


