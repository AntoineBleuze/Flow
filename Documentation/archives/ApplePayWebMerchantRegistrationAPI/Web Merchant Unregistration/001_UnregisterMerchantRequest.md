# 001_UnregisterMerchantRequest.pdf

## Page 1

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


## Page 2

Unregister Merchant
Unregister one or more domains associated with a previously registered merchant.
See Also
Web Merchant Unregistration


