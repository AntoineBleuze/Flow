# 005_JWSRenewalInfo.pdf

## Page 1

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


## Page 2

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


