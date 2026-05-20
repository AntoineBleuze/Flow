# 001_JWSAppTransaction.pdf

## Page 1

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


## Page 2

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


