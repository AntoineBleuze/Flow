# App Transaction information.pdf

## Page 1

transactionId
transactionId
(Required) Any originalTransactionId, transactionId or app
TransactionId that belongs to the customer for your app.
200
AppTransactionInfo
Response
OK
Request succeeded.
Content-Type: application/json
400
InvalidTransactionId
Error
Bad Request
Invalid request.
Content-Type: application/json
401
Unauthorized
The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
URL
Sandbox URL
Path Parameters
Response Codes
App Store Server API / Get App Transaction Info
Web Service Endpoint
Get App Transaction Info
Get a customer’s app transaction information for your app.
App Store Server API 1.17+


## Page 2

404
(TransactionIdNot
FoundError | App
TransactionDoesNot
ExistError)
Not Found
Check the specific error message for further information.
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit. For more information, see Identifying rat
limits.
Content-Type: application/json
500
(GeneralInternal
Error | General
InternalRetryable
Error)
Internal Server Error
Server error. Try again later.
Content-Type: application/json
App Store Server API changelog
Identifying rate limits
Use this endpoint to get the app transaction information for a customer of your app. You can
provide any transaction ID that belongs to the customer to get their app transaction information.
App transaction information represents the customer’s purchase of the app, cryptographically
signed by the App Store. The App Store generates a single, globally unique appTransactionId
for each Apple Account that downloads your app and for each family group member for apps that
support Family Sharing. The appTransactionId value remains the same for the same Apple
Account and app if the customer redownloads the app on any device, receives a refund,
repurchases the app, or changes the storefront. For apps that support Family Sharing, the app
TransactionId is unique for each family group member.
App transaction information includes details about the app the customer purchased, such as its
bundleID, original version, original purchase date, and more. You can also get app transaction
information in your app from StoreKit, using AppTransaction.
object AppTransactionInfoResponse
Mentioned in
Discussion
See Also
App Transaction information


## Page 3

A response that contains signed app transaction information for a customer.


## Page 4

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


## Page 5

App transaction information signed by the App Store, in JSON Web Signature (JWS) Compa
Serialization format.
object JWSAppTransactionDecodedPayload
A decoded payload that contains app transaction information.
Get App Transaction Info
Get a customer’s app transaction information for your app.
See Also
App Transaction information


