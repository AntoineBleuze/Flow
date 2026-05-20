# 001_TransactionInfoResponse.pdf

## Page 1

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


## Page 2

Transaction information signed by the App Store, in JSON Web Signature (JWS) Compact
Serialization format.
Get Transaction Info
Get information about a single transaction for your app.
See Also
Transaction information


