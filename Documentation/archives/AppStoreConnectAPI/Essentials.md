# Essentials.pdf

## Page 1

The App Store Connect API requires a JSON Web Token (JWT) to authorize each request you ma
to the API. You generate JWTs using an API key downloaded from App Store Connect.
An API key has two parts: a public portion that Apple keeps, and a private key that you download.
You can use the private key to sign tokens that authorize access to your data in App Store Connec
and the Apple Developer website.
There are two types of API keys:
Team
Access to all apps, with varying levels of access based on selected roles.
Individual
Access and roles of the associated user. Individual keys aren’t able to use Provisioning
endpoints, access Sales and Finance, or notaryTool.
Important
Secure your private keys as you do for other credentials, such as usernames and passwords. If
you suspect a private key is compromised, immediately revoke the key in App Store Connect.
See Revoking API Keys for details.
App Store Connect API keys are unique to the App Store Connect API and you can’t use them for
other Apple services.
Overview
Generate a Team Key and Assign It a Role
App Store Connect API / Creating API Keys for App Store Connect API
Article
Creating API Keys for App Store Connect
API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.


## Page 2

When you create an API key, assign it a role that determines the key’s access to areas of the App
Store Connect API and permissions for performing tasks. For example, keys with the Admin role
have broad permissions and can do things like create new users and delete users. Team API keys
can access all apps, regardless of their role. The roles that apply to keys are the same roles that
apply to users on your team; for more information, see Program Roles.
Note
Team keys give access that’s not isolated to a single app, but individual key access is tied to
the apps and permissions of the user.
To generate team keys, you must have an Admin account in App Store Connect. You can generate
multiple API keys with any roles you choose.
To generate a team API key to use with the App Store Connect API, log in to App Store Connect
and:
1. Select Users and Access, and then select the Integrations tab.
2. Select App Store Connect API in the left column.
3. Make sure the Team Keys tab is selected.
4. Click Generate API Key or the Add (+) button.
5. Enter a name for the key. The name is for your reference only and isn’t part of the key itself.
6. Under Access, select the role for the key.
7. Click Generate.
The new key’s name, key ID, a download link, and other information appears on the page.
Once you generate your API key, you can download the private half of the key. The private key is
available for download a single time, to begin log in to App Store Connect and:
1. Select Users and Access, and then select the Integrations tab.
2. Select App Store Connect API in the left column.
3. Select Team Keys if it is not already selected.
4. Click Download API Key link next to the new API key.
The download link only appears if you haven’t downloaded the private key. Apple doesn’t keep a
copy of the private key.
Download and Store a Team Private Key


## Page 3

Important
Keep your API keys secure and private. Don’t share your keys, store keys in a code repository,
or include keys in client-side code. If the key becomes lost or compromised, remember to
revoke it immediately. See Revoking API Keys for more information.
To generate an individual API key, which has access and permissions of the associated user, for th
App Store Connect API, log in to App Store Connect and:
1. Go to your user profile.
2. Scroll down to Individual API Key.
3. Click Generate API Key.
The key ID, a download link, and other information appears on the page.
Note
If you don’t have the Generate Individual API Keys permission, the Generate API Key button
won’t show on your profile. A team Admin can grant you this permission.
Once you’ve generated your API key, you can download the private half of the key. The private key
is available for download a single time, to begin log in to App Store Connect and:
1. Go to your user profile.
2. Scroll down to Individual API Key.
3. Click Download API Key link.
The download link only appears if you haven’t downloaded the private key. Apple doesn’t keep a
copy of the private key.
Generating Tokens for API Requests
Generate an Individual Key
Download and Store an Individual Private Key
See Also
Essentials


## Page 4

Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
Uploading Assets to App Store Connect
Upload screenshots, app previews, attachments for App Review, and routing app coverage
files to App Store Connect.
App Store Connect API Release Notes
Learn about new features and updates in the App Store Connect API.


## Page 5

JSON Web Token (JWT) is an open standard (RFC 7519) that defines a way to securely transmit
information. The App Store Connect API requires JWTs to authorize each API request. You create
the token, and sign it with the private key you downloaded from App Store Connect.
To generate a signed JWT:
1. Create the JWT header.
2. Create the JWT payload.
3. Sign the JWT.
Include the signed JWT in the authorization header of each App Store Connect API request.
To create a JWT to communicate with the App Store Connect API, use the following fields and
values in the header:
Header Field
Value
alg - Encryption
Algorithm
ES256
All JWTs for App Store Connect API must be signed with ES256
encryption.
kid - Key Identifier
Your private key ID from App Store Connect, for example,
2X9R4HXF34
Overview
Create the JWT Header
App Store Connect API / Generating Tokens for API Requests
Article
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API
requests.


## Page 6

Header Field
Value
typ - Token Type
JWT
To get your key ID for your team API key from App Store Connect, log in to App Store Connect an
1. Select Users and Access.
2. Select the Integrations tab.
The key IDs appear in a column under the Active heading.
1. Hover the cursor next to a key ID to display the Copy Key ID link.
2. Click Copy Key ID.
To get your key ID for your individual API key from App Store Connect, log in to App Store Connec
and:
1. Go to your user profile.
2. Scroll down to Individual API Key.
3. Click Generate API Key.
Tip
If you have more than one team API key, use the key ID of the same private key that you use to
sign the JWT.
Here’s an example of a JWT header:
The JWT payload contains information specific to the App Store Connect APIs, such as issuer ID
and expiration time. Use the following fields and values in the JWT payload:
Create the JWT Payload for Team Keys


## Page 7

Payload Field
Value
iss - Issuer
ID
Your issuer ID from the API Keys page in App Store Connect, for example,
57246542-96fe-1a63-e053-0824d011072a
iat - Issued
At Time
The token’s creation time, in UNIX epoch time, for example, 1528407600
exp -
Expiration
Time
The token’s expiration time in Unix epoch time. Tokens that expire more than 20
minutes into the future are not valid except for resources listed in Determine th
Appropriate Token Lifetime.
aud -
Audience
appstoreconnect-v1
scope -
Token Scope
A list of operations you want App Store Connect to allow for this token; for
example, GET /v1/apps/123 (Optional)
To get your issuer ID, log in to App Store Connect and:
1. Select Users and Access.
2. Select the Integrations tab.
The issuer ID appears near the top of the page. To copy the issuer ID, click Copy next to the ID.
Here’s an example of a JWT payload:
The JWT payload for Individual keys contains information specific to the App Store Connect APIs,
and expiration time. Use the following fields and values in the JWT payload:
Create the JWT Payload for Individual Keys


## Page 8

Payload Field
Value
sub - Subject
user
``This value is always the same for individual keys.
iat - Issued
At Time
The token’s creation time, in UNIX epoch time, for example, 1528407600
exp -
Expiration
Time
The token’s expiration time in Unix epoch time. Tokens that expire more than 20
minutes in the future are not valid except for resources listed in Determine the
Appropriate Token Lifetime.
aud -
Audience
appstoreconnect-v1
scope -
Token Scope
A list of operations you want App Store Connect to allow for this token, for
example, GET /v1/apps/123 (Optional)
Note
Individual keys don’t use the Issuer ID key iss, but do require the Subject key sub.
Here’s an example of a JWT payload:
To reduce potential attack surface and improve security of your tokens, you can explicitly specify
the scope of a token. The scope tells App Store Connect which requests it needs to accept for th
token. If you unintentionally share a token with an unauthorized party, a limited scope reduces the
requests that a potential attacker can make using the token.
Determine the Scope of the Token


## Page 9

The scope claim is an array of strings, each representing a request. Each scope entry includes:
The HTTP GET method
The URL path, for example, /v1/apps or /v1/ciWorkflows/1234
The optional URL query string, for example, ?filter[platform]=IOS
App Store Connect rejects a token with a scope claim if none of the scope entries match the
attempted request.
Note
The order of query parameters isn’t important. Additionally, App Store Connect ignores the
following query parameters when it checks the scope: limit, cursor, and sort.
The following code listing shows an example of a JWT payload with a scope.
With this payload, App Store Connect only allows you to fetch a list of iOS apps using the List
Apps endpoint if you use the filter[platform]=IOS query parameter.
You can use a JWT without a scope for any request as long as the role of the API key allows it.
For every request, App Store Connect calculates the valid time for a token, referred as the token’s
lifetime, by subtracting the iat claim from the exp claim. For increased security, carefully
consider the lifetime of tokens you create and choose a lifetime that doesn’t allow usage of the
token for longer than necessary. For example, an appropriate lifetime for a token you use for a one
off request is two minutes. In contrast, consider using a token with a lifetime of 20 minutes for a
long-running process that makes many requests with the same token. Additionally, consider
generating a new token periodically throughout the process, instead of issuing tokens with longer
lifetimes.
Determine the Appropriate Token Lifetime


## Page 10

For most requests, App Store Connect rejects a token with a lifetime greater than 20 minutes.
However, it accepts long-lived tokens for some inherently safe requests if:
The token defines a scope.
The scope only includes GET requests.
The resources in the scope allow long-lived tokens.
If a token meets all the above criteria, App Store Connect accepts a token with a lifetime of up to
six months for the following resources:
Build Actions
Build Runs
Git References
Issues
macOS Versions
Products
Providers
Power and Performance Metrics and Logs
Pull Requests
Repositories
Test Results
Workflows
Xcode Versions
Use the private key associated with the key ID you specified in the header to sign the token.
Regardless of the programming language you’re using with the App Store Connect API, there are 
variety of open source libraries available online for creating and signing JWT tokens. See JWT.io f
more information.
Tip
You don’t need to generate a new token for every API request. To get better performance from
the App Store Connect API, reuse the same signed token for multiple requests until it expires.
Sign the JWT


## Page 11

Once you have a complete and signed token, provide the token in the request’s authorization
header as a bearer token.
The following example shows a curl command using a bearer token. Replace the text [signed
token] with the value of the signed token itself.
Creating API Keys for App Store Connect API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
Uploading Assets to App Store Connect
Upload screenshots, app previews, attachments for App Review, and routing app coverage
files to App Store Connect.
App Store Connect API Release Notes
Learn about new features and updates in the App Store Connect API.
Include the JWT in the Request’s Authorization Header
See Also
Essentials


## Page 12

Revoke an API key immediately if it becomes inactive, lost, or compromised. A revoked API key
denies access to the App Store Connect API on your organization’s behalf.
Important
Once you revoke an API key, you can’t reinstate it. Revoked keys are displayed for 30 days on
the API Keys page under the Revoked heading.
To revoke a team API key, log in to App Store Connect with an Admin account.
1. Select Users and Access, then select the Keys tab.
2. Click Edit next to the list of Active keys.
3. Select the API keys to revoke, and click Revoke Key.
4. Click the Revoke button to confirm.
There are two ways to revoke an individual API key, depending on your role. Begin both methods b
logging in to App Store Connect.
To revoke keys for another user, as an Admin:
1. Select Users and Access, then select the Keys tab.
Overview
Revoking Team Keys
Revoking Individual Keys
App Store Connect API / Revoking API Keys
Article
Revoking API Keys
Revoke unused, lost, or compromised private keys.


## Page 13

2. Click Individual Keys.
3. Click Edit next to the list of Active keys.
4. Select the API keys to revoke, and click Revoke Key.
5. Click the Revoke button to confirm.
To revoke your own key:
1. Go to your user profile.
2. Scroll down to Individual API Key.
3. Click Revoke.
4. Click the Revoke button to confirm.
Tip
Admins can prevent a user from creating an Individual Key by removing the Generate Individual
API Keys permission.
Creating API Keys for App Store Connect API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
Uploading Assets to App Store Connect
Upload screenshots, app previews, attachments for App Review, and routing app coverage
files to App Store Connect.
App Store Connect API Release Notes
Learn about new features and updates in the App Store Connect API.
See Also
Essentials


## Page 14



## Page 15

The App Store Connect API limits the volume of requests that you can submit within a specified
timeframe. The limits apply to requests you send using the same API key.
The API presents rate limits to users in an HTTP header. Every response from the API includes an
X-Rate-Limit HTTP header. Its value has the form:
The header info includes:
user-hour-lim, which indicates the number of requests you can make per hour with the sam
API key.
user-hour-rem, which shows the number of requests remaining.
In this example, you are limited to 3500 requests per hour, with 500 remaining. Actual limits can
vary.
The time frame is a “rolling hour.” At any moment, the user-hour-rem value is your per-hour lim
minus the total requests you’ve made in the previous 60 minutes.
Overview
Identify Limits Provided in the HTTP Header
Interpret the Error Response
App Store Connect API / Identifying Rate Limits
Article
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in yo
code.


## Page 16

If you exceed a per-hour limit, the API rejects requests with an HTTP 429 response, with the RAT
_LIMIT_EXCEEDED error code. See About the HTTP Status Code for more information.
Consider rate limits as you integrate the API:
If you periodically call the API to check a value, throttle your requests to avoid exceeding the
per-hour limit for that endpoint.
Manage the HTTP 429 RATE_LIMIT_EXCEEDED error in your error-handling process. For
example, log the failure and queue the job to be processed again at a later time.
Creating API Keys for App Store Connect API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Uploading Assets to App Store Connect
Upload screenshots, app previews, attachments for App Review, and routing app coverage
files to App Store Connect.
App Store Connect API Release Notes
Learn about new features and updates in the App Store Connect API.
Handle Exceeded Limits Gracefully
See Also
Essentials


## Page 17

While managing your App Store apps, you may need to upload various assets or files to App Store
Connect. These assets may include screenshots, app previews, attachments for App Review, and
routing app coverage files. The uploading APIs are designed to ensure reliability for large files, eve
over an unreliable connection. The API instructs you to divide individual large asset files into
multiple upload requests. When you tell the API you’ve finished uploading, App Store Connect
begins processing your files.
There are four steps to upload an asset:
1. Make an asset reservation.
2. Upload an asset, potentially in multiple parts.
3. Commit the upload.
4. Verify that App Store Connect processed the asset successfully.
This workflow is the same for every asset type you manage and upload using the following API
resources:
Asset Type
API Resource
App Store screenshots
App Screenshot Sets   App Screenshots
App event screenshots
App Event Screenshots
App previews
App Preview Sets   App Previews
Overview
App Store Connect API / Uploading Assets to App Store Connect
Article
Uploading Assets to App Store Connect
Upload screenshots, app previews, attachments for App Review, and routing app
coverage files to App Store Connect.


## Page 18

Asset Type
API Resource
App Clip card images
App Clip Header Images   Advanced App Clip
Experience Images
Attachments for the App Review team
App Store review attachments
Game center activity images
Game Center activity images
Game center challenge images
Game Center challenge images
In-App purchase App Store review
screenshots
In-App Purchase App Store Review Screenshots
In-app purchase images
In-app purchase images
Subscription App Store review
screenshots
Subscription App Store Review Screenshots
Subscription images
Subscription images
Routing app coverage files
Routing App Coverages
The first step to upload an asset is making an asset reservation. You send a request that specifies
the type of asset you’ll be uploading, its filename, and size in bytes. A successful response
provides a set of operations you will use to upload the asset. If your asset is large, you may receiv
multiple operations in the response that ask you to divide the asset into parts for uploading.
For example, to make a reservation to upload an app screenshot called “my_screenshot.png” with
file size of 11097 bytes, the request is:
Make an Asset Reservation


## Page 19

A successful response includes these fields to note:
A unique ID that identifies the reservation throughout the delivery workflow.
A set of operations that you use to upload the parts of the asset to App Store Connect.
Attributes that describe the file.
The asset delivery state, which will be AWAITING_UPLOAD.
The full response is:


## Page 20

Note the upload operations. In this example, the file can be uploaded in a single operation:
After you make a successful reservation, your asset moves into the AWAITING_UPLOAD state,
which you can see in the response.
If your reservation request fails, the API returns an error code (ErrorResponse). For more
information, see Interpreting and Handling Errors.
The next step in delivering an asset to App Store Connect is uploading the binary data that is the
asset or file. Use the upload operations returned in the response to your reservation request to
upload your asset to App Store Connect.
Upload the Asset


## Page 21

Important
You have limited time to complete the upload. In general, plan to finish an upload within a week
of creating the asset reservation. See Resolve failures due to an expired
reservation for more information.
If your asset is large enough, you will receive multiple upload operations, each specifying the leng
in bytes and the byte offset into the file. Divide the large asset into binary data parts as specified 
those instructions. One option, using the length 11097, is:
The resulting split files are have a sequential naming convention, you need to upload all splits of t
original file. The system will combine the splits into one image.
Next you:
Make an HTTP request using the method, URL, and request headers specified in the operation
In the body of the request, include the binary data from the given byte range of the original file
The provided upload URLs are unauthenticated and time-limited. You don’t need to supply a JWT
don’t share the URLs.
You can upload parts of your asset concurrently and in any order to improve performance. If one
part doesn’t upload correctly, you can resend it at any time before you commit the asset. See
Resolve upload failures caused by lost connections including power
outages for more information.
The asset state remains as AWAITING_UPLOAD while you upload the parts that make up your file
After you’ve uploaded all parts of your asset to App Store Connect, you must commit the
reservation. The commit tells App Store Connect that you’ve finished uploading and the asset is
ready to be processed.
To commit the reservation, provide the following attributes in the PATCH request:
uploaded
sourceFileChecksum - the MD5 checksum of your original, entire asset file
Commit the Reservation


## Page 22

App Store Connect compares the bytes received with the total bytes you described for your asset
in the asset reservation request (fileSize). If the total bytes received don’t match the file size
value in the reservation, the commit request fails.
A successful commit request changes the asset state to UPLOAD_COMPLETE.
Note
Once you commit the asset, you can no longer upload component parts. If you need to update
your asset after committing it, you must delete it and create another upload, beginning with an
asset reservation.
After receiving your commit request, App Store Connect validates and processes the uploaded
asset. Processing is asynchronous and can take from a few seconds up to a few minutes,
depending on the size and complexity of the asset. Your asset remains in the UPLOAD_COMPLETE
state until App Store Connect finishes processing it. Use the API to re-fetch the asset at any time 
check on its status.
If your asset processes successfully, the system changes the asset’s state to COMPLETE. This is
the final state for a successful asset upload.
If your asset’s processing fails, the system changes the asset’s state to FAILED. FAILED is a
terminal state. To upload your asset you must delete the asset record and retry your upload,
beginning with making an asset reservation.
App Store Connect validates uploads by confirming that the checksum of the final asset received
matches the sourceFileChecksum you specified in your commit request. App Store Connect
also checks other criteria, like file formats and screenshot dimensions.
Verify the Upload Succeeded
Validate Your Upload


## Page 23

You can further validate your uploads by viewing your app’s metadata in App Store Connect or by
using the API to download the final processed asset for review.
You may encounter errors at any stage of the upload process: during the upload due to power
outages or an expired reservations, or after you’ve uploaded the asset if the App Store Connect
processing fails.
If you experience a lost connection while uploading an asset or a part of an asset, you can retry th
upload for just the failed parts using the upload operations. You can continue uploading the asset
parts, as needed, until you commit the reservation.
If an asset reservations expires, attempting an upload or commit returns an error. You have a
limited window of time to finish your upload after you have created an asset reservation. In genera
plan to finish an upload within a week of creating the asset reservation. If the time window expires
before you finish uploading and committing the asset, delete the asset reservation and begin aga
starting with requesting a new asset reservation. The exact expiration time for each upload
operation is found in the Expires parameter in the upload URL. This value is a Unix timestamp, i
UTC.
If your asset fails processing at App Store Connect, the asset state will change to FAILED. FAILE
is a terminal state. Review the error messaging provided by the API so you can identify and resolv
the issue. Then delete the asset record and retry your upload, beginning by making an asset
reservation.
Creating API Keys for App Store Connect API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
App Store Connect API Release Notes
Resolve Upload Failures
See Also
Essentials


## Page 24

Learn about new features and updates in the App Store Connect API.


## Page 25

The App Store Connect API is a REST API that enables the automation of actions you take in App
Store Connect. Download the latest OpenAPI specification.
App Store Connect API 4.2 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 4.1 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 4.0 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.8 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.7 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.6 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.5 release notes
Overview
Topics
Versions
App Store Connect API / App Store Connect API Release Notes
App Store Connect API Release Notes
Learn about new features and updates in the App Store Connect API.


## Page 26

Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.4 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.3 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.2 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.1 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 3.0 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 2.4 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 2.3 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 2.2 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 2.1 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 2.0 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.8 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.7 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.6 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.5 release notes
Update your server-side code to use new features, and test your code against API changes.


## Page 27

App Store Connect API 1.4 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.3 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.2 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.1 release notes
Update your server-side code to use new features, and test your code against API changes.
App Store Connect API 1.0 release notes
The initial version of the API.
Creating API Keys for App Store Connect API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
Uploading Assets to App Store Connect
Upload screenshots, app previews, attachments for App Review, and routing app coverage
files to App Store Connect.
See Also
Essentials


