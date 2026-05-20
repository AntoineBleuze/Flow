# 002_JWSAppTransactionDecodedPayload.pdf

## Page 1

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


## Page 2

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


## Page 3



