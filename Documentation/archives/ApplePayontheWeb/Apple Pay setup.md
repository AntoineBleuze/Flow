# Apple Pay setup.pdf

## Page 1

These are the requirements for incorporating Apple Pay on your website:
You must serve all pages that include Apple Pay over HTTPS.
Your domain must have a valid SSL certificate.
Your server must support the Transport Layer Security (TLS) protocol version 1.2 or later, and
one of the cipher suites listed here:
Cipher suite value
Name
0x13, 0x01
TLS_AES_128_GCM_SHA256
0x13, 0x02
TLS_AES_256_GCM_SHA384
0xC0,0x2B
ECDHE-ECDSA-AES128-GCM-SHA256
0xC0,0x2F
ECDHE-RSA-AES128-GCM-SHA256
0xC0,0x2C
ECDHE-ECDSA-AES256-GCM-SHA384
0xC0,0x30
ECDHE-RSA-AES256-GCM-SHA384
To successfully connect with Apple Pay IP addresses and domains, your server needs to allow
access over HTTPS (TCP over port 443) and include the TLS Server Name Indication (SNI)
extension. Apple Pay requires SNI on all connections. Your server needs to connect to the Apple
Pay IP addresses and domains provided listed in Listing 1, below.
Overview
Allow Apple Pay IP Addresses
Apple Pay on the Web / Setting Up Your Server
Article
Setting Up Your Server
Set up your server for secure communications with Apple Pay.


## Page 2

Important
Use a strict allow list for Apple IP addresses and domains provided in Listing 1. Do not allow
your server to access any other IP addresses or domains.
Listing 1. Apple Pay IP addresses and domain names for production.
Important
Use the IP addresses, in Listing 2 for development and sandbox testing only. Do not allow your
production apps or production servers to use these testing services in production.
Listing 2. Apple Pay IP addresses and domain names for testing (development sandbox).


## Page 3

For more information about merchant validation, see Providing Merchant Validation.
Apple uses the following IP addresses when you register or verify your merchant domain. If you
protect your domain from public access and you wish to complete domain verification, you need t
allow the following IP address ranges.
See Register and Verify Your Domain for more information.
Configuring Your Environment
Create your Apple Pay merchant ID and certificates, and verify your domain.
Maintaining Your Environment
Prevent interruptions in your Apple Pay service by keeping certificates and domain verificatio
current.
Allow Apple IP Addresses for Domain Verification
See Also
Apple Pay setup


## Page 4



## Page 5

To support Apple Pay on your website, you must complete the setup steps in your developer
account. The steps include registering a merchant ID, creating two certificates, and verifying your
domain. Completing the setup enables you to use either or both web APIs: Apple Pay JS API or
Payment Request API.
Note
Incorporating Apple Pay on your website is subject to the Apple Pay Acceptable Use
Guidelines. You must have an Apple Developer Account to complete the setup, and log in with
a Team Agent or Admin role.
Follow the instructions in Configure Apple Pay on the Web. They guide you to create the following
Merchant ID. An identifier you register with Apple that uniquely identifies your business as a
merchant able to accept payments. This ID never expires, and you can use it in multiple websit
and iOS apps. See Create a merchant identifier for the setup steps.
Payment processing certificate. A certificate associated with your merchant ID, used to secur
transaction data. Apple Pay servers use the certificate’s public key to encrypt payment data.
You, or your payment service provider, use the private key to decrypt data to process payment
See Create a payment processing certificate for the setup steps.
Merchant identity certificate. A Transport Layer Security (TLS) certificate associated with you
merchant ID, used to authenticate your sessions with the Apple Pay servers. The merchant
identity certificate is only required for Apple Pay on the web; it isn’t needed for apps. See Creat
a merchant identity certificate for the setup steps.
Overview
Configure Merchant ID and Certificates
Apple Pay on the Web / Configuring Your Environment
Article
Configuring Your Environment
Create your Apple Pay merchant ID and certificates, and verify your domain.


## Page 6

While your merchant ID never expires, the payment processing certificate, merchant identity
certificate, and domain verification do expire. See Maintaining Your Environment for more
information.
Tip
You can use the same merchant ID and payment processing certificate in iOS and watchOS
apps. If you’re developing apps, enable Apple Pay in Xcode as a last step. See Setting up Apple
Pay for more information.
You must register and verify all top-level domains and subdomains where you’ll display the Apple
Pay button. Apple Pay associates domains with your Apple Developer Team ID. As a result:
You can register multiple domains under a single merchant ID.
You can register the same domains under multiple merchant IDs.
You can’t register the same domain with a different Team ID.
Domains can’t be behind a proxy or redirect, and must be accessible to the Apple servers listed in
Allow Apple IP Addresses for Domain Verification.
To register and verify your domain, log in to your Apple Developer account as an Account Holder 
Admin. See Register a merchant domain and Verify a merchant domain for the setup steps.
It’s up to you to determine how many merchant IDs you need. Most merchants need only one for a
environments: in multiple websites, iOS or watchOS apps, across test environments, and
production environments.
However, you can create more than one merchant ID if you wish. Be sure to use the payment
processing and merchant identity certificates created for the specific merchant ID. The certificate
are valid only with their corresponding merchant ID.
Setting Up Your Server
Set up your server for secure communications with Apple Pay.
Register and Verify Your Domain
Use the Merchant ID in Multiple Environments
See Also
Apple Pay setup


## Page 7

Maintaining Your Environment
Prevent interruptions in your Apple Pay service by keeping certificates and domain verificatio
current.


## Page 8

To prevent interruptions in your website’s Apple Pay service, your domain verification and the
certificates that you set up in Configuring Your Environment must remain valid. While your
merchant ID never expires, certificates and domain verification do expire, as follows:
The Payment Processing certificate expires every 25 months.
The Merchant Identity certificate expires every 25 months.
A registered domain’s verification expires when its SSL certificate expires.
Important
As the expiration dates for certificates and domain verifications approach, Apple sends an
email reminder to the Admin and the Account Holder of the Apple Developer Account. Ensure
that your organization continually monitors the inbox of these users so you can renew
certificates before they expire to avoid interruptions to your Apple Pay service.
You can view expiration dates and update your certificates on the Apple developer website by
following these steps:
Sign in to your account — you need to be an Account Holder or Admin.
Open the Certificates, Identifiers, and Profiles page.
Under Identifiers, select Merchant IDs.
Select your domain’s ID and select Edit.
Overview
View Expiration Dates and Update Certificates
Apple Pay on the Web / Maintaining Your Environment
Article
Maintaining Your Environment
Prevent interruptions in your Apple Pay service by keeping certificates and domai
verification current.


## Page 9

Certificate expiration dates appear for each of the certificates listed on the page. You can also
update the certificates on this page.
Domain verification expires on the same date that your domain’s SSL certificate expires. Apple
servers check if SSL certificates have been renewed at 30, 15, and 7 days before expiration.
If you update the SSL certificate before it expires, Apple detects the renewed certificate and th
domain remains verified. No further action is required on your part.
If the SSL certificate expires and is not replaced before expiring, you must redo domain
verification in your Apple Developer Account. See Verify a Merchant Domain for additional
information.
Make sure that the Apple servers — listed in Allow Apple IP Addresses for Domain Verification
— can access the URL you used to validate the merchant domain. If the URL is behind a proxy or
redirect the Apple servers won’t be able to access it. The URL may be similar to
https://yourdomain.com/.well-known/apple-developer-merchantid-domain-
association.
Setting Up Your Server
Set up your server for secure communications with Apple Pay.
Configuring Your Environment
Create your Apple Pay merchant ID and certificates, and verify your domain.
Renew Your Domain Verification
See Also
Apple Pay setup


