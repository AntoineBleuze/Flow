# 001_AppTransactionInfoResponse.pdf

## Page 1

signedAppTransaction
Info
JWSAppTransaction
A customer’s app transaction information, signed by Apple, in JSON Web
Signature (JWS) format.
App Store Server API changelog
This response contains information that you request by calling the Get App Transaction
Info endpoint. For information on decoding and reading the app transaction, see JWSApp
Transaction and JWSAppTransactionDecodedPayload.
type JWSAppTransaction
Properties
Mentioned in
Discussion
Topics
Response data types
App Store Server API / AppTransactionInfoResponse
Object
AppTransactionInfoResponse
A response that contains signed app transaction information for a customer.
App Store Server API 1.17+


## Page 2

App transaction information signed by the App Store, in JSON Web Signature (JWS) Compa
Serialization format.
object JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
Get App Transaction Info
Get a customer’s app transaction information for your app.
See Also
App Transaction information


