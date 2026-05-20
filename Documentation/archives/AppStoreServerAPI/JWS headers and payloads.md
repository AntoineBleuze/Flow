# JWS headers and payloads.pdf

## Page 1

alg
alg
The algorithm used for signing the JSON Web Signature (JWS).
x5c
x5c
The X.509 certificate chain that corresponds to the key that the App Store
used to secure the JWS.
App Store Server API changelog
The types JWSTransaction and JWSRenewalInfo contain headers that are JWSDecoded
Header objects when decoded. Use the information in the JWSDecodedHeader to validate the
JWS signature. For more information about validating signatures, see the JSON Web Signature
(JWS) IETF RFC 7515 specification.
The App Store signs transaction and renewal information that you receive in App Store Serve
Notifications V2 and in the App Store Server API. It uses the following x5c certificate chain,
in the following order:
Properties
Mentioned in
Discussion
App Store Server API / JWSDecodedHeader
Object
JWSDecodedHeader
A decoded JSON Web Signature (JWS) header containing transaction or renewa
information.
App Store Server API 1.0+


## Page 2

1. A certificate that contains the public key that corresponds to the key the App Store uses to
digitally sign the JWS. Section 4.11.10 Mac App Store Receipt Signing Certificates of the Apple
Inc. Certificate Practice Statement Worldwide Developer Relations document defines the custo
extensions this certificate uses.
2. An Apple intermediate certificate that contains an extension with the extension ID for Apple
Worldwide Developer Relations (1.2.840.113635.100.6.2.1).
3. An Apple root certificate.
For more information, or to download Apple’s root certificate, see Apple PKI.
type alg
An algorithm used to sign a JSON Web Signature.
type x5c
The JSON Web Signature (JWS) header parameter that contains the certificate chain that
corresponds to the key used to digitally sign the JWS.
type JWSAppTransaction
App transaction information signed by the App Store, in JSON Web Signature (JWS) Compa
Serialization format.
object JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
type JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
Topics
Data types
See Also
JWS headers and payloads


## Page 3

type JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signature (JWS)
format.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
Data types
Refer to these data types for decoded transaction and renewal information payloads.


## Page 4

The JWSAppTransaction type is a string of three Base64URL-encoded components separated
by a period. The string contains the JWS Compact Serialization of the transaction information,
signed by the App Store according to the JSON Web Signature (JWS) IETF RFC 7515 specificatio
The three components of the string are a header, a payload, and a signature, in that order.
To read the transaction information, Base64URL-decode the payload. Use a JWSApp
TransactionDecodedPayload object to read the payload information.
To read the header, decode it and use a JWSDecodedHeader object to access the information
Use the information in the header to verify the signature.
To verify a JWSAppTransaction on your server, consider implementing the verification using th
App Store Server Library function verifyAndDecodeAppTransaction. The library provides th
function in each language the library supports. For more information, see Simplifying your
implementation by using the App Store Server Library.
Discussion
Use App Store Server Library functions
See Also
App Store Server API / JWSAppTransaction
Type
JWSAppTransaction
App transaction information signed by the App Store, in JSON Web Signature
(JWS) Compact Serialization format.
App Store Server API 1.17+


## Page 5

object JWSDecodedHeader
A decoded JSON Web Signature (JWS) header containing transaction or renewal information
object JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
type JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
type JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signature (JWS)
format.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
Data types
Refer to these data types for decoded transaction and renewal information payloads.
JWS headers and payloads


## Page 6

appAppleId
appAppleId
The unique identifier the App Store uses to identify the app.
appTransactionId
appTransactionId
The unique identifier of the app download transaction.
bundleId
bundleId
The bundle identifier that the app transaction applies to.
originalApplication
Version
originalApplication
Version
The app version that the customer originally purchased from the App Store.
originalPlatform
originalPlatform
The platform on which the customer originally purchased the app.
originalPurchaseDate
originalPurchaseDate
The date the customer originally purchased the app from the App Store.
preorderDate
preorderDate
The date the customer placed an order for the app before it’s available in the
App Store.
receiptCreationDate
The date that the App Store signed the JWS app transaction.
Properties
App Store Server API / JWSAppTransactionDecodedPayload
Object
JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
App Store Server API 1.17+


## Page 7

receiptCreationDate
receiptType
environment
The server environment, production or sandbox, that signed the app
transaction.
The Get App Transaction Info endpoint returns a JWSAppTransaction, which you
decode to get JWSAppTransactionDecodedPayload.
You can also get app transaction information in your app from StoreKit, using AppTransaction
object JWSDecodedHeader
A decoded JSON Web Signature (JWS) header containing transaction or renewal information
type JWSAppTransaction
App transaction information signed by the App Store, in JSON Web Signature (JWS) Compa
Serialization format.
type JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
type JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signature (JWS)
format.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
Data types
Refer to these data types for decoded transaction and renewal information payloads.
Discussion
See Also
JWS headers and payloads


## Page 8



## Page 9

The JWSTransaction type is a string of three Base64URL-encoded components separated by 
period. The string contains the JWS Compact Serialization of the transaction information, signed
by the App Store according to the JSON Web Signature (JWS) IETF RFC 7515 specification.
The three components of the string are a header, a payload, and a signature, in that order.
To read the transaction information, Base64URL-decode the payload. Use a JWSTransactio
DecodedPayload object to read the payload information.
To read the header, decode it and use a JWSDecodedHeader object to access the information
Use the information in the header to verify the signature.
To verify a JWSTransaction on your server, consider implementing the verification using the Ap
Store Server Library function verifyAndDecodeTransaction. The library provides this functi
in each language the library supports. For more information, see Simplifying your implementation
by using the App Store Server Library.
Discussion
Use App Store Server Library functions
See Also
App Store Server API / JWSTransaction
Type
JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS)
Compact Serialization format.
App Store Server API 1.0+


## Page 10

object JWSDecodedHeader
A decoded JSON Web Signature (JWS) header containing transaction or renewal information
type JWSAppTransaction
App transaction information signed by the App Store, in JSON Web Signature (JWS) Compa
Serialization format.
object JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
type JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signature (JWS)
format.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
Data types
Refer to these data types for decoded transaction and renewal information payloads.
JWS headers and payloads


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

The JWSRenewalInfo type is a string of three Base64 URL-encoded components, separated by
period, containing subscription renewal information signed by the App Store. The App Store signs
the string according to the JSON Web Signature (JWS) IETF RFC 7515 specification.
The three components in the string are a header, a payload, and a signature.
To read the subscription renewal information, decode the payload. Use a JWSRenewalInfo
DecodedPayload object to read the payload information.
To read the header, decode it and use a JWSDecodedHeader object to access the information
Use the information in the header to verify the signature.
object JWSDecodedHeader
A decoded JSON Web Signature (JWS) header containing transaction or renewal information
type JWSAppTransaction
Discussion
See Also
JWS headers and payloads
App Store Server API / JWSRenewalInfo
Type
JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signatu
(JWS) format.
App Store Server API 1.0+


## Page 16

App transaction information signed by the App Store, in JSON Web Signature (JWS) Compa
Serialization format.
object JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
type JWSTransaction
Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
Data types
Refer to these data types for decoded transaction and renewal information payloads.


## Page 17

appAccountToken
appAccountToken
A UUID you create at the time of purchase that associates the transaction wit
a customer on your own service. This is the token that applies to the upcomin
renewal transaction. If your app doesn’t provide an appAccountToken, this
field is omitted. For more information, see appAccountToken(_:).
appTransactionId
appTransactionId
The unique identifier of the app download transaction.
autoRenewProductId
autoRenewProductId
The identifier of the product that renews at the next billing period.
autoRenewStatus
autoRenewStatus
The renewal status of the auto-renewable subscription.
currency
currency
The currency code for the renewalPrice of the subscription.
eligibleWinBackOffer
Ids
eligibleWinBackOffer
Ids
The list of win-back offer IDs that the customer is eligible for.
environment
The server environment, either sandbox or production.
Properties
App Store Server API / JWSRenewalInfoDecodedPayload
Object
JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-
renewable subscription.
App Store Server API 1.0+


## Page 18

environment
expirationIntent
expirationIntent
The reason the subscription expired.
gracePeriodExpires
Date
gracePeriodExpires
Date
The time when the Billing Grace Period for subscription renewals expires.
isInBillingRetry
Period
isInBillingRetry
Period
A Boolean value that indicates whether the App Store is attempting to
automatically renew the expired subscription.
offerDiscountType
offerDiscountType
The payment mode you configure for the offer.
offerIdentifier
offerIdentifier
The offer code or the promotional offer identifier.
offerPeriod
offerPeriod
The duration of the offer.
offerType
offerType
The type of subscription offer.
originalTransaction
Id
originalTransaction
Id
The transaction identifier of the original purchase associated with this
transaction.
priceIncreaseStatus
priceIncreaseStatus
The status that indicates whether the auto-renewable subscription is subject
a price increase.
productId
productId
The product identifier of the In-App Purchase.
recentSubscription
StartDate
recentSubscription
StartDate
The earliest start date of the auto-renewable subscription in a series of
subscription purchases that ignores all lapses of paid service that are 60 day
or fewer.
renewalDate
renewalDate
The UNIX time, in milliseconds, when the most recent auto-renewable
subscription purchase expires.


## Page 19

renewalPrice
renewalPrice
The renewal price, in milliunits, of the auto-renewable subscription that renew
at the next billing period.
signedDate
signedDate
The UNIX time, in milliseconds, that the App Store signed the JSON Web
Signature (JWS) data.
advancedCommerceInfo
advancedCommerce
RenewalInfo
Renewal information that is present only for Advanced Commerce SKUs.
App Store Server API changelog
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
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
type JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signature (JWS)
format.
Data types
Mentioned in
See Also
JWS headers and payloads


## Page 20

Refer to these data types for decoded transaction and renewal information payloads.


## Page 21

type environment
The server environment, either sandbox or production.
type originalTransactionId
The original transaction identifier of a purchase.
type transactionId
The unique identifier for a transaction, such as an In-App Purchase, restored In-App Purchas
or subscription renewal.
type webOrderLineItemId
The unique identifier of subscription-purchase events across devices, including renewals.
type appTransactionId
The unique identifier of the app download transaction.
Topics
Environment
Transaction identifiers
App transaction identifier
App information
App Store Server API / Data types
API Collection
Data types
Refer to these data types for decoded transaction and renewal information
payloads.


## Page 22

type appAppleId
The unique identifier of an app in the App Store.
type bundleId
The bundle identifier of an app.
type originalApplicationVersion
The app version that the customer originally purchased from the App Store.
type originalPlatform
The platform on which a customer originally purchases an app.
type preorderDate
The date a customer places an order for the app before it’s available in the App Store,
expressed in UNIX time, in milliseconds.
type appAccountToken
The UUID that you generate to associate a customer’s In-App Purchase with its resulting Ap
Store transaction.
type productId
The unique identifier of the product.
type type
The type of In-App Purchase products you can offer in your app.
type subscriptionGroupIdentifier
The identifier of the subscription group that the subscription belongs to.
type quantity
The number of purchased consumable products.
type price
The price, in milliunits, of the In-App Purchase that the system records in the transaction.
Account information
Product information
Product price and currency


## Page 23

type currency
The three-letter ISO 4217 currency code for the price of the product.
type storefront
The three-letter code that represents the country or region associated with the App Store
storefront of the purchase.
type storefrontId
An Apple-defined value that uniquely identifies an App Store storefront.
type eligibleWinBackOfferIds
An array of win-back offer identifiers that a customer is eligible to redeem, which sorts the
identifiers with the best offers first.
type offerIdentifier
The string identifier of a subscription offer that you create in App Store Connect.
type offerPeriod
The duration of the offer.
type offerType
The type of offer.
type offerDiscountType
The payment mode for a discount offer on an In-App Purchase.
type originalPurchaseDate
The purchase date of the transaction associated with the original transaction identifier.
type purchaseDate
The time that the App Store charged the customer’s account for an In-App Purchase, a
restored In-App Purchase, a subscription, or a subscription renewal after a lapse.
type recentSubscriptionStartDate
Storefront information
Offers
Product purchase dates


## Page 24

The earliest start date of a subscription in a series of auto-renewable subscription purchase
that ignores all lapses of paid service shorter than 60 days.
type isInBillingRetryPeriod
A Boolean value that indicates whether the App Store is attempting to automatically renew a
expired subscription.
type gracePeriodExpiresDate
The time when the Billing Grace Period for subscription renewals expires.
type autoRenewStatus
The renewal status for an auto-renewable subscription.
type autoRenewProductId
The identifier of the product that renews at the next billing period.
type expirationIntent
The reason an auto-renewable subscription expired.
type expiresDate
The UNIX time, in milliseconds, an auto-renewable subscription purchase expires or renews.
type isUpgraded
The Boolean value that indicates whether the customer upgraded to another subscription.
type renewalDate
The UNIX time, in milliseconds, when the most recent auto-renewable subscription purchase
expires.
type renewalPrice
The renewal price, in milliunits, of the auto-renewable subscription that renews at the next
billing period.
type status
The status of an auto-renewable subscription.
Billing status
Subscription renewal and expiration
Family Sharing


## Page 25

type inAppOwnershipType
A string that describes whether the transaction was purchased by the customer, or is availab
to them through Family Sharing.
type priceIncreaseStatus
The status that indicates whether an auto-renewable subscription is subject to a price
increase.
type revocationDate
The UNIX time, in milliseconds, that the App Store refunded the transaction or revoked it fro
Family Sharing.
type revocationReason
The reason for a refunded transaction.
type revocationPercentage
The percentage, in milliunits, of the transaction that the App Store has refunded or revoked.
type revocationType
The type of the refund or revocation that applies to the transaction.
type transactionReason
The cause of a purchase transaction, which indicates whether it’s a customer’s purchase or 
renewal for an auto-renewable subscription that the system initiates.
type signedDate
The UNIX time, in milliseconds, that the App Store signed the JSON Web Signature data.
type receiptCreationDate
The date that the App Store signs a JSON Web Signature (JWS) app transaction.
Price increase status
Revocation
Transaction reason
JSON Web Signature (JWS) date
Advanced Commerce API data


## Page 26

Data types for Advanced Commerce API
Objects and data types for transactions that use the Advanced Commerce API.
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
object JWSTransactionDecodedPayload
A decoded payload that contains transaction information.
type JWSRenewalInfo
Subscription renewal information, signed by the App Store, in JSON Web Signature (JWS)
format.
object JWSRenewalInfoDecodedPayload
A decoded payload containing subscription renewal information for an auto-renewable
subscription.
See Also
JWS headers and payloads


