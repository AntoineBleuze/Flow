# 000_Creating API keys to authorize API requests.pdf

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


