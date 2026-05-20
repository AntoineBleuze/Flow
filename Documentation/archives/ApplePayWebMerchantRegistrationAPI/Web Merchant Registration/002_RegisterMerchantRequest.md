# 002_RegisterMerchantRequest.pdf

## Page 1

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


## Page 2

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


