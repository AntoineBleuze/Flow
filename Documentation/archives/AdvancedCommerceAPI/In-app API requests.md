# In-app API requests.pdf

## Page 1

You can make certain Advanced Commerce API requests through StoreKit in your app, while you
make other requests directly from your server. In both cases, you authorize the calls with
signatures you generate on your server.
The following Advanced Commerce API requests are available in your app using StoreKit APIs:
OneTimeChargeCreateRequest
SubscriptionCreateRequest
SubscriptionModifyInAppRequest
SubscriptionReactivateInAppRequest
To make Advanced Commerce requests from your app, follow these steps:
1. Collect the request data according to the API you’re invoking. On your server, create your
base64-encoded request data by combining the request data into a UTF-8 JSON string and
base64-encoding the string.
2. On your server, create a JWS compact serialization that includes your base64-encoded reques
data in the JWS payload, as described in Include custom claims for Advanced Commerce API in
app requests. For more information, see Generating JWS to sign App Store requests.
3. Wrap the JWS in a JSON object, and convert it into a Data buffer to create the Advanced
Commerce request data object, advancedCommerceRequestData.
4. In your app, use the advancedCommerceRequestData as the value of a purchase option in
your product purchase call.
Overview
StoreKit / In-App Purchase / Sending Advanced Commerce API requests from your app
Article
Sending Advanced Commerce API
requests from your app
Send Advanced Commerce API requests from your app that you authorize with a
JSON Web Signature (JWS) you generate on your server.


## Page 2

For more information on authorizing server-based calls, see Authorizing API requests from your
server.
Place the Advanced Commerce request data in a UTF-8 JSON string and base64-encode the
request.
For example, the following JSON represents a OneTimeChargeCreateRequest for the purchas
of a one-time charge product:
The result of base64-encoding the example JSON request is:
ewogICAgIm9wZXJhdGlvbiI6ICJDUkVBVEVfT05FX1RJTUVfQ0hBUkdFIiwKICAg
ICJ2ZXJzaW9uIjogIjEiLCAgICAgICAgICAgICAgICAgICAgIAogICAgInJlcXVlc3RJbmZ
IjogewogICAgICAgICJyZXF1ZXN0UmVmZXJlbmNlSWQiOiAiZjU1ZGYwNDgtNGNkOC00MjY
LWI0MDQtYjZmODEzZmY3MGU1IgogICAgfSwKICAgICJjdXJyZW5jeSI6ICJVU0QiLAogICA
InRheENvZGUiOiAiQzAwMy0wMC0yIiwgCiAgICAic3RvcmVmcm9udCI6ICJVU0EiLAogICA
Iml0ZW0iOiB7CiAgICAgICAgIlNLVSI6ICJCT09LX1NIRVJMT0NLX0hPTUxFUyIsCiAgICA
ICAgImRpc3BsYXlOYW1lIjogIlNoZXJsb2NrIEhvbG1lcyIsIAogICAgICAgICJk
ZXNjcmlwdGlvbiI6ICJUaGUgU2hlcmxvY2sgSG9sbWVzLCA1dGggRWRpdGlvbiIsCiAgICA
ICAgInByaWNlIjogNDk5MAogICAgfQp9
This value, calculated using your own data, is your base64-encoded request data.
Create the base64-encoded request data


## Page 3

Follow the signing instructions for Advanced Commerce API in-app requests in Generating JWS t
sign App Store requests. The Advanced Commerce API requires a custom claim, request. Provid
the base64-encoded request data from the previous step as the value of the request claim in th
JWS payload.
The result after following the instructions is a JWS compact serialization.
Wrap the JWS to create a signatureInfo JSON string that contains a token key. You can
complete this step on your server or in your app. Create the signatureInfo JSON string as
shown below:
Set the value of the token key to your JWS compact serialization.
Next, convert the signatureInfo JSON string into a Data buffer, as shown below:
The result is the Advanced Commerce request data object, referred to as advancedCommerce
RequestData in the code snippets.
Securely send the advancedCommerceRequestData to your app.
To complete the Advanced Commerce request in the app, call a StoreKit purchase method and
provide the signed request, in the Advanced Commerce request data form, as a purchase option.
The following code example sets up the purchase request:
Generate the JWS using your request data
Wrap the JWS and convert it into data
Call the StoreKit purchase API using the signed
request data


## Page 4

In this example:
Use the custom key "advancedCommerceData" for all Advanced Commerce in-app request
For more information about the custom purchase option, see custom(key:value:).
For the value attribute, provide your Advanced Commerce request data, which you created usin
your JWS compact serialization
For more information about the product purchase method, see purchase(options:).
struct AdvancedCommerceProduct
A product configured as a generic SKU in App Store Connect for use with the Advanced
Commerce API.
Generating JWS to sign App Store requests
Create signed JSON Web Signature (JWS) strings on your server to authorize your API
requests in your app.
See Also
Advanced Commerce API interactions


## Page 5

JWS is an open standard (RFC 7515) that defines a way to securely transmit information. You
create the JWS header and payload using information specific to the App Store feature. You sign
the JWS on your server using a private API key that you download from App Store Connect.
The following App Store features require a JWS Compact Serialization to authorize calls in StoreK
Advanced Commerce API in-app requests
Promotional offer signatures
Introductory offer eligibility
The data you sign when generating the JWS is a JSON Web Token (JWT). The JWT contains nam
value pairs called claims, including claims specific to the feature you’re using. Your server returns
the JWS Compact Serialization to your app. Your app uses the JWS in the relevant StoreKit API ca
Tip
The App Store Server Library provides a signing utility that creates JWS specific for each of
these uses. For more information, see Simplifying your implementation by using the App Store
Server Library.
To get started, you need your key ID and issuer ID from App Store Connect. Then, to generate a
signed JWS, you perform these steps on your server:
1. Create the JWS header.
Overview
StoreKit / In-App Purchase / Generating JWS to sign App Store requests
Article
Generating JWS to sign App Store
requests
Create signed JSON Web Signature (JWS) strings on your server to authorize you
API requests in your app.


## Page 6

2. Create the JWS payload. The payload includes the base payload claims, and may also require
feature-specific claims.
3. Sign the JWS.
First you need your key ID for the JWS header and your issuer ID for the JWS payload. Sign in to
App Store Connect to get these values.
To get the key ID:
1. Select Users and Access, then select the Keys tab.
2. Hover the cursor next to a key ID to display the Copy Key ID link. The key IDs appear in a colum
under the Active heading.
3. Click Copy Key ID.
If you have more than one API key, copy the key ID of the private key that you use to sign the JWS
For information about creating keys, see Creating API keys to authorize API requests.
To get the issuer ID:
1. Select Users and Access, then select the Keys tab.
2. To copy the issuer ID that appears near the top of the page, click Copy next to the ID.
The App Store features all use the same JWS header.
To create a JWS to communicate with the App Store, use the following fields and values in the
header:
Header field
Value
alg - Encryption
Algorithm
ES256
You need to sign JWS with ES256 encryption.
kid - Key ID
Your private key ID from App Store Connect (example:
2X9R4HXF34)
typ - Token Type
JWT
Here’s an example of a JWS header:
Get your key ID and issuer ID from App Store Connect
Create the JWS header


## Page 7

The JWS payload contains base claims specific to the App Store, such as an issuer ID and issuan
time. It also includes custom claims that are specific to App Store features. The following table
shows the base claims. The next sections shows the feature-specific claims that you also include
the JWS payload.
Include the following base claims in the JWS payload:
Payload
field
Value
iss - Issuer
Your issuer ID from the Keys page in App Store Connect (example: “57246542-
96fe-1a63-e053-0824d011072a")
iat -
Issued At
The UNIX time, in seconds, that you issue the token, which the App Store server
uses to calculate an expiration time (example: 1623085200)
aud -
Audience
A value that depends on the feature you’re using (see the table below)
bid -
Bundle ID
Your app’s bundle ID (example: “com.example.testbundleid”)
nonce -
Nonce
A one-time-use UUID that identifies this request (example: “368f3888-dcd8-
11ef-b3c8-325096b39f47")
Don’t include an exp field in your payload, because including it makes the request fail. The App
Store server enforces an expiration time based on your iat value.
Choose the aud value to match the feature you’re using:
Feature
aud value
Advanced Commerce API in-app request
“advanced-commerce-api"
Promotional offer signature
“promotional-offer"
Create the JWS payload


## Page 8

Feature
aud value
Introductory offer eligibility
“introductory-offer-eligibility"
Here’s an example of the base payload, without any feature-specific fields:
Be sure to include feature-specific custom claims in the JWS payload as well.
For custom claims for Advanced Commerce in-app requests, use the following values:
Payload field
Value
request
Base64-encoded request data
For more information on generating the base64-encoded request data, see Create the base64-
encoded request data.
Here’s an example of a payload for an Advanced Commerce API in-app request:
Include custom claims for Advanced Commerce API in-app
requests


## Page 9

For more information about making Advanced Commerce API requests in StoreKit, see Sending
Advanced Commerce API requests from your app.
For promotional offer signature custom claims, use the following values:
Payload field
Value
productId
The unique identifier of the product (for more information, see id)
offer
Identifier
The promotional offer identifier that you set up in App Store Connect
transaction
Id
The unique identifier of any transaction that belongs to the customer. You
can use the customer’s appTransactionID, even for customers who
haven’t made any In-App Purchases in your app. This field is optional, but
recommended.
Here’s an example of a payload for a promotional offer signature:
For introductory offer eligibility custom claims, use the following values:
Payload field
Value
productId
The unique identifier of the product (for more information, see id)
Include custom claims for promotional offer signatures
Include custom claims for introductory offer eligibility


## Page 10

Payload field
Value
allow
Introductory
Offer
A Boolean value, true or false, that determines whether the customer
is eligible for an introductory offer
transactionId
The unique identifier of any transaction that belongs to the customer.
You can use the customer’s appTransactionID, even for customers
who haven’t made any In-App Purchases in your app.
Here’s an example of a payload for introductory offer eligibility:
For more information about providing the introductory offer eligibility signed value in a purchase
option, see Product.PurchaseOption.
On your server, use the private key associated with the key ID you specified in the header to
generate the signature using ES256 encryption. The process of signing combines the JWS Heade
and JWS Payload into a single signed string.
There are a variety of open source libraries available online for creating and signing JWT tokens;
see JWT.io for more information. Consider using the App Store Server Library to create the JWS.
For more information, see Simplifying your implementation by using the App Store Server Library.
After signing, you should have a string in JWS compact serialization format. Send that string to
your app.
Sign the JWS


## Page 11

Note
Always use a secure connection when sending data, including the signature, between your app
and server. For more information on ensuring your data’s security, see Preventing Insecure
Network Connections.
struct AdvancedCommerceProduct
A product configured as a generic SKU in App Store Connect for use with the Advanced
Commerce API.
Sending Advanced Commerce API requests from your app
Send Advanced Commerce API requests from your app that you authorize with a JSON Web
Signature (JWS) you generate on your server.
See Also
Advanced Commerce API interactions


