# 000_Sending Advanced Commerce API requests from your app.pdf

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


