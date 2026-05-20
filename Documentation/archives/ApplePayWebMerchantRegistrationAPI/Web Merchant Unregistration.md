# Web Merchant Unregistration.pdf

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


## Page 3

domainNames
[string]
(Required) A list of fully qualified domain names to unregister. If a merchant
has no remaining domain names after this request removes domains, Apple P
server deletes the merchant’s registration.
partnerInternal
MerchantIdentifier
string
(Required) A merchant identifier that you create to uniquely identify the
registered merchant, and which you use in Apple Pay transactions and in this
API.
Maximum length: 1024
Value: /a-zA-Z0-9~-_+&@$!|,.;/
reason
string
(Required) A short, human-readable phrase that describes the cause of
unregistration.
Maximum length: 1024
The following example shows the format of an UnregisterMerchant request.
Properties
Overview
Apple Pay Web Merchan… / UnregisterMerchantRequest
Object
UnregisterMerchantRequest
The request body you use to unregister one or more merchant domains.
Apple Pay Web Merchant Registration API 1.0+


## Page 4

Unregister Merchant
Unregister one or more domains associated with a previously registered merchant.
See Also
Web Merchant Unregistration


