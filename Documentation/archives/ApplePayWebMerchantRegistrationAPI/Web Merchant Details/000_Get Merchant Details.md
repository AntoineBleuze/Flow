# 000_Get Merchant Details.pdf

## Page 1

partnerInternal
MerchantIdentifier
string
(Required) A unique identifier for the merchant that the e-commerce partner
created and used in the Register Merchant request.
Maximum length: 1024
Value: /a-zA-Z0-9~-_+&@$!|,.;/
200
MerchantDetails
OK
Success. The response contains an object with information for the registered
merchant.
Content-Type: application/json
400
Bad Request
The request is malformed or invalid, or the merchant isn’t registered.
401
Unauthorized
The e-commerce platform doesn’t have permission to call this API.
417
Expectation Failed
The e-commerce platform isn’t registered with Apple Developer.
URL
Path Parameters
Response Codes
Apple Pay Web Merchan… / Get Merchant Details
Web Service Endpoint
Get Merchant Details
Retrieve information about a registered merchant’s current state by using the
merchant’s internal merchant identifier.
Apple Pay Web Merchant Registration API 1.0+


## Page 2

500
Internal Server Error
An internal server error occurred.
Get information about a merchant you previously registered. You provide the merchant’s unique
identifier (partnerInternalMerchantIdentifier). A succesful response contains a
MerchantDetails object in the response body.
object MerchantDetails
Detailed information for a single registered merchant.
Discussion
See Also
Web Merchant Details


