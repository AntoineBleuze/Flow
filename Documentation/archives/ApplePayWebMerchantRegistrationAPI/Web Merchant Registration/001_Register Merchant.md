# 001_Register Merchant.pdf

## Page 1

RegisterMerchant
Request
The request body you use to register merchants.
Content-Type: application/json
200
OK
Success.
400
Bad Request
The request is malformed or invalid.
401
Unauthorized
The e-commerce platform doesn’t have permission to call this API.
417
Expectation Failed
The e-commerce platform isn’t registered with Apple Developer.
500
Internal Server Error
An internal server error occurred.
URL
HTTP Body
Response Codes
Mentioned in
Apple Pay Web Merchan… / Register Merchant
Web Service Endpoint
Register Merchant
Register a merchant and its corresponding set of fully qualified domains.
Apple Pay Web Merchant Registration API 1.0+


## Page 2

Preparing merchant domains for verification
Call this API to register a merchant and their domains. You can register domains in multiple
requests. The API has a limit of 99 domain names per partnerInternalMerchant
Identifier.
Before making a Register Merchant request, you must prepare each domain included in the
request for verification. For more information on domain verification, see Preparing merchant
domains for verification.
This request returns no response body for a successful 200 response. Apple Pay servers register
the relationship between the e-commerce partner, the merchant, and the merchant’s domains.
Note
To access the sandbox environment, use POST https://apple-pay-gateway-cert
.apple.com/paymentservices/registerMerchant.
Preparing merchant domains for verification
Host a domain verification file on each domain before requesting registration.
object RegisterMerchantRequest
The request body you use to register merchants.
Discussion
See Also
Web Merchant Registration


