# 006_JWSRenewalInfoDecodedPayload.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

Refer to these data types for decoded transaction and renewal information payloads.


