# Essentials.pdf

## Page 1

The Enterprise Program API requires a JSON Web Token (JWT) to authorize each request you ma
to the API. You generate JWTs using an API key downloaded from the Apple Developer website.
An API key has two parts: a public portion that Apple keeps, and a private key that you download.
You can use the private key to sign tokens that authorize access to your data in the Apple
Developer website.
Important
Secure your private keys as you do for other credentials, such as usernames and passwords. If
you suspect a private key is compromised, immediately revoke the key in the Apple Developer
website. See Revoking API Keys for details.
Enterprise Program API keys are unique to the Enterprise Program API and you can’t use them for
other Apple services.
When you create an API key, assign it a role that determines the key’s access to areas of the
Enterprise Program API and permissions for performing tasks. For example, keys with the Admin
role have broad permissions and can do things like create new users and delete users. The other
available role is Developer, which is restricted to provisioning actions, such as creating provisionin
profiles and managing development certificates.
When you create an API key, assign it a role that determines the key’s access to areas of the
Enterprise Program API and permissions for performing tasks. To learn more information about us
Overview
Generate a Enterprise Program API Key and Assign It a Role
Enterprise Program API / Creating API Keys for Enterprise Program API
Article
Creating API Keys for Enterprise Program
API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.


## Page 2

roles and permissions, see the Apple Developer website.
To generate Enterprise Program API keys, you must have an Admin account for your developer
team in the Apple Developer website. You can generate multiple API keys with the roles you
choose.
To generate a key to use with the Enterprise Program API, log in to the Apple Developer website
and:
1. Select Users and Access, and then select the Integrations tab.
2. Click Generate API Key or the Add (+) button.
3. Enter a name for the key. The name is for your reference only and isn’t part of the key itself.
4. Under Access, select the role for the key.
5. Click Generate.
The new key’s name, key ID, a download link, and other information appears on the page.
Once you’ve generated your API key, you can download the private half of the key. The private key
is available for download a single time, to begin log in to the Apple Developer website and:
1. Select Users and Access, and then select the Integrations tab.
2. Click Download link next to the new API key.
The download link only appears if you haven’t downloaded the private key. Apple doesn’t keep a
copy of the private key.
Important
Keep your API keys secure and private. Don’t share your keys, store keys in a code repository,
or include keys in client-side code. If the key becomes lost or compromised, remember to
revoke it immediately. See Revoking API Keys for more information.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Download and Store a Enterprise Program API Private Key
See Also
Essentials


## Page 3

Revoking API Keys
Revoke unused, lost, or compromised private keys.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
Enterprise Program API Release Notes
Learn about new features and updates in the Enterprise Program API.


## Page 4

JSON Web Token (JWT) is an open standard (RFC 7519) that defines a way to securely transmit
information. The the Enterprise Program API requires JWTs to authorize each API request. You
create the token, and sign it with the private key you downloaded from the Enterprise Program AP
To generate a signed JWT:
1. Create the JWT header.
2. Create the JWT payload.
3. Sign the JWT.
Include the signed JWT in the authorization header of each the Enterprise Program API request.
To create a JWT to communicate with the the Enterprise Program API, use the following fields and
values in the header:
Header Field
Value
alg - Encryption
Algorithm
ES256
All JWTs for the Enterprise Program API must be signed with ES256
encryption.
kid - Key Identifier
Your private key ID from the Enterprise Program API, for example,
2X9R4HXF34
Overview
Create the JWT Header
Enterprise Program API / Generating Tokens for API Requests
Article
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API
requests.


## Page 5

Header Field
Value
typ - Token Type
JWT
To get your key ID for you API key for the Enterprise Program API, log in to the Apple Developer
website and:
1. Select Users and Access.
2. Select the Integrations tab.
The key IDs appear in a column under the Active heading.
1. Hover the cursor next to a key ID to display the Copy Key ID link.
2. Click Copy Key ID.
Tip
If you have more than one Enterprise Program key, use the key ID of the same private key that
you use to sign the JWT.
Here’s an example of a JWT header:
The JWT payload contains information specific to the the Enterprise Program APIs, such as issue
ID and expiration time. Use the following fields and values in the JWT payload:
Payload Field
Value
iss - Issuer
ID
Your issuer ID from the Integrations page in the the Apple Developer website,
for example, 57246542-96fe-1a63-e053-0824d011072a
iat - Issued
At Time
The token’s creation time, in UNIX epoch time, for example, 1528407600
Create the JWT Payload for Enterprise Program API Keys


## Page 6

Payload Field
Value
exp -
Expiration
Time
The token’s expiration time in Unix epoch time. Tokens that expire more than 20
minutes into the future are not valid except for resources listed in Determine th
Appropriate Token Lifetime.
aud -
Audience
apple-developer-enterprise-v1
scope -
Token Scope
A list of operations you want the Enterprise Program API to allow for this token;
for example, GET /v1/users/123 (Optional)
To get your issuer ID, log in to the Apple Developer website and:
1. Select Users and Access.
2. Select the Integrations tab.
The issuer ID appears near the top of the page. To copy the issuer ID, click Copy next to the ID.
Here’s an example of a JWT payload:
To reduce potential attack surface and improve security of your tokens, you can explicitly specify
the scope of a token. The scope tells the Enterprise Program API which requests it needs to acce
for the token. If you unintentionally share a token with an unauthorized party, a limited scope
reduces the requests that a potential attacker can make using the token.
The scope claim is an array of strings, each representing a request. Each scope entry includes:
The HTTP GET method
The URL path, for example, /v1/users or /v1/bundleIds/1234
Determine the Scope of the Token


## Page 7

The optional URL query string, for example, ?filter[platform]=IOS
the Enterprise Program API rejects a token with a scope claim if none of the scope entries match
the attempted request.
Note
The order of query parameters isn’t important. Additionally, the Enterprise Program API ignores
the following query parameters when it checks the scope: limit, cursor, and sort.
The following code listing shows an example of a JWT payload with a scope.
With this payload, the Enterprise Program API only allows you to fetch a list of bundle IDs for iOS
using the List Bundle Ids endpoint if you use the filter[platform]=IOS query
parameter.
You can use a JWT without a scope for any request as long as the role of the API key allows it.
For every request, the Enterprise Program API calculates the valid time for a token, referred as the
token’s lifetime, by subtracting the iat claim from the exp claim. For increased security,
carefully consider the lifetime of tokens you create and choose a lifetime that doesn’t allow usage
of the token for longer than necessary. For example, an appropriate lifetime for a token you use fo
a one-off request is two minutes. In contrast, consider using a token with a lifetime of 20 minutes
for a long-running process that makes many requests with the same token. Additionally, consider
generating a new token periodically throughout the process, instead of issuing tokens with longer
lifetimes.
For most requests, the Enterprise Program API rejects a token with a lifetime greater than 20
minutes.
Determine the Appropriate Token Lifetime


## Page 8

Use the private key associated with the key ID you specified in the header to sign the token.
Regardless of the programming language you’re using with the the Enterprise Program API, there
are a variety of open source libraries available online for creating and signing JWT tokens. See
JWT.io for more information.
Tip
You don’t need to generate a new token for every API request. To get better performance from
the the Enterprise Program API, reuse the same signed token for multiple requests until it
expires.
Once you have a complete and signed token, provide the token in the request’s authorization
header as a bearer token.
The following example shows a curl command using a bearer token. Replace the text [signed
token] with the value of the signed token itself.
Creating API Keys for Enterprise Program API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
Enterprise Program API Release Notes
Sign the JWT
Include the JWT in the Request’s Authorization Header
See Also
Essentials


## Page 9

Learn about new features and updates in the Enterprise Program API.


## Page 10

Revoke an API key immediately if it becomes inactive, lost, or compromised. A revoked API key
denies access to the Enterprise Program API on your organization’s behalf.
Important
Once you revoke an API key, you can’t reinstate it. Revoked keys are displayed for 30 days on
the Integrations page under the Revoked heading.
To revoke a team API key, log in to the Apple Developer website with an Admin account.
1. Select Users and Access, then select the Integrations tab.
2. Click Edit next to the list of Active keys.
3. Select the API keys to revoke, and click Revoke Key.
4. Click the Revoke button to confirm.
Creating API Keys for Enterprise Program API
Overview
Revoking Enterprise Program Keys
See Also
Essentials
Enterprise Program API / Revoking API Keys
Article
Revoking API Keys
Revoke unused, lost, or compromised private keys.


## Page 11

Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.
Enterprise Program API Release Notes
Learn about new features and updates in the Enterprise Program API.


## Page 12

The Enterprise Program API limits the volume of requests that you can submit within a specified
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
Enterprise Program API / Identifying Rate Limits
Article
Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in yo
code.


## Page 13

If you exceed a per-hour limit, the API rejects requests with an HTTP 429 response, with the RAT
_LIMIT_EXCEEDED error code. See About the HTTP Status Code for more information.
Consider rate limits as you integrate the API:
If you periodically call the API to check a value, throttle your requests to avoid exceeding the
per-hour limit for that endpoint.
Manage the HTTP 429 RATE_LIMIT_EXCEEDED error in your error-handling process. For
example, log the failure and queue the job to be processed again at a later time.
Creating API Keys for Enterprise Program API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Enterprise Program API Release Notes
Learn about new features and updates in the Enterprise Program API.
Handle Exceeded Limits Gracefully
See Also
Essentials


## Page 14

The Enterprise Program API is a REST API that enables the automation of actions you take in
developer.apple.com. Download the latest OpenAPI specification.
Enterprise Program API 1.0 release notes
The initial version of the Enterprise Program API.
Creating API Keys for Enterprise Program API
Create API keys to sign JSON Web Tokens (JWTs) and authorize API requests.
Generating Tokens for API Requests
Create JSON Web Tokens (JWTs) signed with your private key to authorize API requests.
Revoking API Keys
Revoke unused, lost, or compromised private keys.
Overview
Topics
Versions
See Also
Essentials
Enterprise Program API / Enterprise Program API Release Notes
Enterprise Program API Release Notes
Learn about new features and updates in the Enterprise Program API.


## Page 15

Identifying Rate Limits
Recognize the rate limits that REST API responses provide and handle them in your code.


