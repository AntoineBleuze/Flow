# 000_Applying to use the registration API and configuring IDs.pdf

## Page 1

An e-commerce platform that’s enrolled in the Apple Developer program as an organization can
apply to use the Apple Pay Web Merchant Registration API by completing the following steps:
1. Sign in the Apple Developer and fill out the submission form to request access to the API.
2. Once Apple grants access, create your unique Apple Pay payment platform integrator ID.
3. Set up your payment processing certificate and platform integrator identity certificate.
After you create your payment platform integrator ID, you can access a domain-verification file. Yo
need to host a domain-verification file on a merchant’s domain before registering the merchant. F
more information about domain verification, see Preparing merchant domains for verification.
To use the Apple Pay Web Merchant Registration API, you’ll need an Apple Pay payment platform
integrator ID. This unique ID identifies you as an entity that’s able to register merchants who wish 
accept Apple Pay payments. Create your payment platform integrator ID and register it with Apple
in your developer account. Payment platform integrator IDs never expire.
To create your payment platform integrator ID, log in to your Apple developer account with the
Account Holder or Admin role:
1. In Certificates, Identifiers & Profiles, select Identifiers from the sidebar.
2. Select App IDs in the upper-right corner, and then select Payment Platform Integrator IDs.
3. Select the Add button (+).
4. Enter the platform description and identifier name, then click Continue.
Overview
Create a payment platform integrator ID
Apple Pay Web Merchan… / Applying to use the registration API and configuring IDs
Article
Applying to use the registration API and
configuring IDs
Request access to the Registration API and register an ID to use the web service.


## Page 2

5. Review the settings, then click Register.
The identifier name you enter is your payment platform integrator ID. If you have multiple
environments, such as production and sandbox, you may choose to create additional payment
platform integrator IDs for other environments.
To complete your Apple Pay setup, create the two certificates associated with your payment
platform integrator ID:
A payment processing certificate that Apple Pay servers use to encrypt payment data
A platform integrator identity certificate that you use to authenticate communication with Apple
Pay servers
To create the certificates, log in to your Apple developer account using the Account Holder or
Admin roles. For the payment processing certificate, see Create a payment processing certificate
For the platform integrator certificate, see Create a merchant identity certificate.
Create payment processing and merchant identity
certificates


