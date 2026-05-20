# Web Merchant Registration.pdf

## Page 1

Before making a Register Merchant request, prepare each domain included in the request fo
verification.
Download and distribute to each merchant that has a domain registered via the Web Merchant
Registration API. If merchants will be using Apple Pay via pages hosted on your domain, host this
file on your own domain also.
You can find the domain-verification file for each of your payment platform integrator IDs in your
Apple Developer account.
Host your domain-verification file at the following path for each domain you’re registering:
https://[DOMAIN_NAME]/.well-known/apple-developer-merchantid-domain-
association
Make sure the domain-verification file is in place before invoking Register Merchant. Use the
domain-verification file associated with the payment platform integrator ID and payment platform
identity certificate used to secure the Register Merchant request.
Apple Pay servers don’t require domain verification in the sandbox environment.
Overview
Host the domain-verification file
See Also
Apple Pay Web Merchan… / Preparing merchant domains for verification
Article
Preparing merchant domains for
verification
Host a domain verification file on each domain before requesting registration.


## Page 2

Register Merchant
Register a merchant and its corresponding set of fully qualified domains.
object RegisterMerchantRequest
The request body you use to register merchants.
Web Merchant Registration


## Page 3

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


## Page 4

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


## Page 5

domainNames
[string]
(Required) A list of fully qualified domain names for which Apple Pay
processes payments for this merchant. Items must be unique within the scop
of each partnerInternalMerchantIdentifier. The API is limited to 9
domain names per partnerInternalMerchantIdentifier.
encryptTo
string
(Required) The payment platform integrator ID or merchant ID associated wi
the payment processing certificate Apple Pay will use to encrypt payment da
on behalf of the merchant you’re registering. Typically, use the payment
platform integrator ID of the calling e-commerce platform. If a party other tha
the e-commerce platform decrypts the Apple Pay data, use their payment
platform integrator ID or merchant ID.
merchantUrl
string
An optional field in which you provide the merchant website’s top-level doma
Supply this value when registering merchants using a shared payment page
hosted on the payment platform’s domain. This URL doesn’t have to be
affiliated with the payment transaction nor is it verified.
partnerInternal
MerchantIdentifier
string
(Required) A unique identifier that you create for the merchant you’re
registering. Each merchant your e-commerce platform serves must have a
unique identifier. This is the same identifier that you pass as the merchant
Identifier field into canMakePaymentsWithActiveCard and when
requesting and Apple Pay payment session. For more information, see
Requesting an Apple Pay payment session.
The partnerInternalMerchantIdentifier value must use allowed
characters only: a-zA-Z0-9~-_+&@$!|,.;
Properties
Apple Pay Web Merchan… / RegisterMerchantRequest
Object
RegisterMerchantRequest
The request body you use to register merchants.
Apple Pay Web Merchant Registration API 1.0+


## Page 6

Minimum length: 3
Maximum length: 1024
Value: / a-zA-Z0-9~-_+&@$!|,.;/
partnerMerchantName
string
(Required) A human-readable name for the merchant; the API does not pars
this name programmatically.
Maximum length: 1024
The following example shows the structure of a JSON object with information on how to register
merchant requests.
Preparing merchant domains for verification
Host a domain verification file on each domain before requesting registration.
Register Merchant
Register a merchant and its corresponding set of fully qualified domains.
Discussion
See Also
Web Merchant Registration


