# Web Merchant Details.pdf

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


## Page 3

domainNames
[string]
A list of fully qualified domain names for which Apple Pay processes payment
for this merchant.
encryptTo
string
A SHA-256 hash of the payment platform integrator ID or merchant ID that yo
provided for the encryptTo value when calling Register Merchant.
partnerMerchantName
string
A human-readable name for the merchant.
Maximum length: 1024
partnerMerchant
ValidationURI
string
The URI used by Apple to locate the domain verification file during merchant
registration. It is used for tracking and debugging.
partnerInternal
MerchantIdentifier
string
The identifier that uniquely identifies the merchant.
Maximum length: 1024
Value: / a-zA-Z0-9~-_+&@$!|,.;/
The following example shows the structure of a JSON object that contains the merchant details
response.
Properties
Discussion
Apple Pay Web Merchan… / MerchantDetails
Object
MerchantDetails
Detailed information for a single registered merchant.
Apple Pay Web Merchant Registration API 1.0+


## Page 4

To compare a payment platform integrator ID or merchant ID with the value that this request
returns in the encryptTo string, create a SHA-256 hash of the payment platform integrator ID o
merchant ID first. In the Terminal app, enter the following command, replacing com.your.id wit
the payment platform integrator ID or merchant ID:
The result is a hexadecimal value that you can compare with the value that this request returns in
the encryptTo string.
Get Merchant Details
Retrieve information about a registered merchant’s current state by using the merchant’s
internal merchant identifier.
See Also
Web Merchant Details


