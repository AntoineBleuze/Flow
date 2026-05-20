# 000_Preparing merchant domains for verification.pdf

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


