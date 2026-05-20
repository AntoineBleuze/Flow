# 007_Data types.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


