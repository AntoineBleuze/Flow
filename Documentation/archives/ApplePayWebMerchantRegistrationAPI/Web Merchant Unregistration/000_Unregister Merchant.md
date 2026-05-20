# 000_Unregister Merchant.pdf

## Page 1

UnregisterMerchant
Request
The request body for unregistering merchants.
Content-Type: application/json
200
OK
Success.
400
Bad Request
The request is malformed or invalid, or the merchant isn’t registered.
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
Discussion
Apple Pay Web Merchan… / Unregister Merchant
Web Service Endpoint
Unregister Merchant
Unregister one or more domains associated with a previously registered merchan
Apple Pay Web Merchant Registration API 1.0+


## Page 2

Only request to unregister merchants for domains you previously registered using the Register
Merchant API.
If you pass a subset of the merchant’s registered domains, Apple Pay server unregisters only thos
domains and the merchant remains active. If you unregister a merchant’s last-remaining registere
domain, Apple Pay servers delete the merchant’s registration.
Note
To access the sandbox environment, use POST https://apple-pay-gateway-cert
.apple.com/paymentservices/unregisterMerchant.
object UnregisterMerchantRequest
The request body you use to unregister one or more merchant domains.
See Also
Web Merchant Unregistration


