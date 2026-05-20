# 000_Setting Up Your Server.pdf

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



