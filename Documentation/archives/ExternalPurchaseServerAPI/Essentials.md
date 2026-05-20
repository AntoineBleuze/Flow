# Essentials.pdf

## Page 1

The App Store Server API, the Advanced Commerce API, and the External Purchase Server API
require JSON Web Tokens (JWTs) to authorize each request you make to the API. You generate
JWTs using a private API key that you download from App Store Connect. For information about
generating the JWT using your private key, see Generating JSON Web Tokens for API requests.
An API key has two parts: a public portion that Apple keeps, and a private key that you download.
Use the private key to sign tokens that authorize the API to access or submit your data to the App
Store.
Important
Store your private keys in a secure place. Don’t share your keys, don’t store keys in a code
repository, and don’t include keys in client-side code. If you suspect a private key is
compromised, immediately revoke the key in App Store Connect. See Revoking API Keys for
details.
Use the API key for the App Store Server API, the Advanced Commerce API, and the External
Purchase Server API. You can’t use the key for other Apple services.
To generate an API key to use with the App Store Server API, the Advanced Commerce API, and th
External Purchase Server API, log in to App Store Connect and complete the following steps:
1. On the homepage, click Users and Access.
Overview
Generate a private key
App Store Server API / Creating API keys to authorize API requests
Article
Creating API keys to authorize API
requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.


## Page 2

2. Click the Integrations tab.
3. In the sidebar under Keys, click In-App Purchase.
4. Click Generate In-App Purchase Key. If you already have an Active In-App Purchase key
generated, click the Add (+) icon to add more.
5. Enter a name for the key. The name is for your reference only and is not part of the key itself.
6. Click Generate.
After you generate an in-app purchase key, you cannot edit its name. If you need to make change
revoke the key and generate a new one.
The new key’s name, key ID, a download link, and other information appear on the page.
After generating your API key, App Store Connect gives you the opportunity to download the
private half of the key. The private key is only available for download a single time.
1. Log in to App Store Connect.
2. On the homepage, click Users and Access.
3. Click the Integrations tab.
4. In the sidebar under Keys, click In-App Purchase.
5. Navigate to a key under the Active section, then click Download Key for the key you want to
download.
6. In the dialog, click Download.
The download link appears only if you haven’t yet downloaded the private key. Apple doesn’t keep
a copy of the private key. Store your private key in a secure place.
Simplifying your implementation by using the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize your calls,
verify transactions, extract transaction identifiers from receipts, and more.
Generating JSON Web Tokens for API requests
Download and store the private key
See Also
Essentials


## Page 3

Create JSON Web Tokens signed with your private key to authorize requests for App Store
Server API and External Purchase Server API.
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle them in
your code.
App Store Server API changelog
Learn about new features and updates in the App Store Server API.


## Page 4

JSON Web Token (JWT) is an open standard (RFC 7519) that defines a way to securely transmit
information. The App Store Server API and External Purchase Server API require a JWT to authori
each request you make to the API. You create the token, signing it with the private key you
downloaded from App Store Connect. For more information about creating keys, see Creating AP
keys to authorize API requests.
To generate a signed JWT:
1. Create the JWT header.
2. Create the JWT payload.
3. Sign the JWT.
Include the signed JWT in the authorization header of each API request. Generate a new signed
JWT for each new request.
Tip
The App Store Server Library provides an API client and creates JWTs for use with the App
Store Server API. For more information, see Simplifying your implementation by using the App
Store Server Library.
Overview
Create the JWT header
App Store Server API / Generating JSON Web Tokens for API requests
Article
Generating JSON Web Tokens for API
requests
Create JSON Web Tokens signed with your private key to authorize requests for
App Store Server API and External Purchase Server API.


## Page 5

To create a JWT to communicate with the App Store Server API or External Purchase Server API,
use the following fields and values in the header:
Header Field
Value
alg - Encryption Algorithm
ES256
All JWTs must be signed with ES256 encryption
kid - Key ID
Your private key ID from App Store Connect (Ex: 2X9R4HXF34)
typ - Token Type
JWT
To get your key ID, copy it from App Store Connect by logging in to App Store Connect, then:
1. Select Users and Access, then select the Keys tab.
2. The key IDs appear in a column under the Active heading. Hover the cursor next to a key ID to
display the Copy Key ID link.
3. Click Copy Key ID.
If you have more than one API key, copy the key ID of the private key that you use to sign the JWT
Here’s an example of a JWT header:
The JWT payload contains information specific to the App Store Server API and External Purchase
Server API, such as issuer ID and expiration time. Use the following fields — also known as JWT
claims — to include these values in the JWT payload:
Payload Field
Value
iss - Issuer
Your issuer ID from the Keys page in App Store Connect (Ex: “57246542-
96fe-1a63-e053-0824d011072a")
Create the JWT payload


## Page 6

Payload Field
Value
iat - Issued
At
The time at which you issue the token, in UNIX time, in seconds (Ex:
1623085200)
exp -
Expiration
Time
The token’s expiration time, in UNIX time, in seconds. Tokens that expire more
than 60 minutes after the time in iat are not valid (Ex: 1623086400)
aud -
Audience
appstoreconnect-v1
bid - Bundle
ID
Your app’s bundle ID (Ex: “com.example.testbundleid”)
To get your issuer ID, log in to App Store Connect, then:
1. Select Users and Access, then select the Keys tab.
2. The issuer ID appears near the top of the page. To copy the issuer ID, click Copy next to the ID.
Here’s an example of a JWT payload:
Note that the JWT is valid for up to one hour after the time you indicate in the iat field, or it
expires sooner if you set the exp field for an earlier time.
Use the private key associated with the key ID you specified in the header to sign the token using
ES256 encryption.
There are a variety of open source libraries available online for creating and signing JWT tokens.
See JWT.io for more information. For calls to the App Store Server API, consider using the App
Store Server Library to create the JWTs instead. For more information, see Simplifying your
implementation by using the App Store Server Library.
Sign the JWT


## Page 7

After you create and sign the JWT, provide it in the request’s authorization header as a bearer
token.
The following example for the App Store Server API shows a curl command using a bearer token
Replace the text [signed token] with the value of the signed JWT itself. Replace
{transactionId} with a transaction identifier of your customer.
Simplifying your implementation by using the App Store Server Library
Use Apple’s open source library to create JSON Web Tokens (JWT) to authorize your calls,
verify transactions, extract transaction identifiers from receipts, and more.
Creating API keys to authorize API requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.
Identifying rate limits
Recognize the rate limits that apply to App Store Server API endpoints and handle them in
your code.
App Store Server API changelog
Learn about new features and updates in the App Store Server API.
Include the JWT in the authorization header of the request
See Also
Essentials


## Page 8

Use this changelog to learn about feature updates, deprecations, and removals for the External
Purchase Server API.
New features
Added support for new custom link token types, ACQUISITION and SERVICES.
Added DUPLICATE_TOKEN possible value in status and ExternalPurchaseReport
objects.
Added errors LineItemCreationDateOutOfRangeError and DuplicateTokenStatus
NotAllowedError.
New features
Added errors RestatementCreationDateMismatchError, RestatementNotAllowed
CreationDateError, and RefundNotAllowedCreationDateError.
Initial release.
Overview
1.2.0 — 2025/06/26
1.1.0 — 2025/04/14
Server update — 2024/03/05
External Purchase Serve… / External Purchase Server API changelog
Article
External Purchase Server API changelog
Learn about new features and updates in the External Purchase Server API.


## Page 9

Initial beta release with functionality enabled for sandbox testing.
Initial beta release for preview.
Creating API keys to authorize API requests
Create API keys you use to sign JSON Web Tokens and authorize API requests.
Generating JSON Web Tokens for API requests
Create JSON Web Tokens signed with your private key to authorize requests for App Store
Server API and External Purchase Server API.
1.0.0 — 2024/02/29
0.1.0 — 2024/01/25
See Also
Essentials


