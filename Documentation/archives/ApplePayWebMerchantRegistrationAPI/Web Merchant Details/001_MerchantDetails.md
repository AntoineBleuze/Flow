# 001_MerchantDetails.pdf

## Page 1

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


## Page 2

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


