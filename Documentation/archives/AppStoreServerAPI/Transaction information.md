# Transaction information.pdf

## Page 1

transactionId
transactionId
(Required) The identifier of a transaction that belongs to the customer, and
which may be an original transaction identifier (originalTransactionId)
200
TransactionInfo
Response
OK
Request succeeded.
Content-Type: application/json
400
(InvalidTransaction
IdError | App
TransactionIdNot
SupportedError)
Bad Request
Invalid request.
Content-Type: application/json
401
Unauthorized
URL
Sandbox URL
Path Parameters
Response Codes
App Store Server API / Get Transaction Info
Web Service Endpoint
Get Transaction Info
Get information about a single transaction for your app.
App Store Server API 1.8+


## Page 2

The JSON Web Token (JWT) in the authorization header is invalid. For more
information, see Generating JSON Web Tokens for API requests.
404
TransactionIdNot
FoundError
Not Found
The transaction identifier wasn’t found.
Content-Type: application/json
429
RateLimitExceeded
Error
The request exceeded the rate limit.
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
Use this endpoint to get transaction information for any transaction identifier, including original
transaction identifiers. This endpoint supports all in-app purchase types, including consumable,
non-consumable, non-renewing subscriptions, and auto-renewable subscriptions. It also support
transactions that your app marked as finished using finish() or finishTransaction(_:) in
StoreKit.
object TransactionInfoResponse
A response that contains signed transaction information for a single transaction.
Mentioned in
Discussion
See Also
Transaction information


## Page 3

signedTransaction
Info
JWSTransaction
A customer’s in-app purchase transaction, signed by Apple, in JSON Web
Signature (JWS) format.
App Store Server API changelog
The TransactionInfoResponse contains information about the transaction that you request
using the Get Transaction Info endpoint. The transactionId in the signed
TransactionInfo matches the transactionId you provide in the request path.
type JWSTransaction
Properties
Mentioned in
Discussion
Topics
Response data types
App Store Server API / TransactionInfoResponse
Object
TransactionInfoResponse
A response that contains signed transaction information for a single transaction.
App Store Server API 1.8+


## Page 4

Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
Get Transaction Info
Get information about a single transaction for your app.
See Also
Transaction information


