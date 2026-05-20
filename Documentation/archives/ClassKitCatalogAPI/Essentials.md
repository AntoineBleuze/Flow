# Essentials.pdf

## Page 1

You authenticate the calls you make to the ClassKit Catalog API by including a cryptographically
signed JSON Web Token (JWT). You sign the JWT using a private key that you provision in Apple
Developer website, and then include the signed token as part of the header of each call that you
make.
Sign in to the Apple Developer web site, and navigate to the “Certificates, IDs, & Profiles” page.
Choose Keys in the sidebar, and then click the plus (+) button to add a new key. Name the key, an
enable it for use with ClassKit Catalog. Complete the registration and download the private key.
Overview
Register a Private Key
ClassKit Catalog API / Authenticating Calls to the ClassKit Catalog API
Article
Authenticating Calls to the ClassKit
Catalog API
Establish your identity to the ClassKit Catalog server by providing a
cryptographically signed token for each call.


## Page 2

You can download the private key only once. Apple doesn’t keep a copy of your key, so you can’t
retrieve the key again. If you lose your key, you’ll need to revoke the key and create a new one.
Similarly, if your private key is ever compromised, you’ll need to revoke the original key and create
new one.
Compose a JWT as a combination of a header, a claim set, and a signature, as described in the
JSON Web Token (JWT) specification. Create the header as a JSON object with key-value pairs
representing:
The key identifier, given by the kid key. Provide the key identifier reported to you by the Apple
Developer site after provisioning the key.
The type of token, given by the typ key. Provide a value of JWT to indicated a JSON web token
The algorithm used to sign the token, given by the alg key. Set the value to ES256 to indicate
the Elliptic Curve Digital Signature Algorithm (ECDSA) algorithm with the P-256 curve and SHA
256 hash algorithm.
An example header looks like this:
Create and Sign a Token


## Page 3

Create a claim set as another JSON object with key-value pairs representing:
The issuer claim that identifies you as the issuer of the JWT, given by the iss key. Provide you
Apple Developer account team identifier as the value.
The issued-at claim that indicates when you created the JWT, given by the iat key. Indicate th
number of seconds after the Unix epoch when you created the token.
The expiration-time claim that indicates a time after which the JWT is no longer valid, given by
the exp key. Indicate the number of seconds after the Unix epoch when the token should expir
which is typically 10 to 30 minutes after creation.
An example claim set looks like this:
Base-64 encode and compute a signature over these two objects, as described in the JWT
specification, using your private key with the P-256 ECDSA algorithm and a SHA-256 hash. The
two encoded objects plus the computed signature, separated by periods, make up the JWT.
Include the JWT with every request you make to the ClassKit Catalog API by adding
Authorization: Bearer <JWT> to the header, where you replace <JWT> with your actual
token. Here is an example of making a request using the curl command line utility:
Authenticate Requests with the Signed Token
See Also
Essentials


## Page 4

Testing Your ClassKit Catalog Implementation
Verify your server interaction before deployment by operating in a development environment


## Page 5

Before you deploy your ClassKit Catalog API changes, you can test them in a development
environment that isn’t available to teachers. Use a query parameter in your API calls to choose the
development environment, and then use a device in development mode to inspect your updates.
Important
Contexts that you publish in the development environment may be visible to other developers
using the development environment in Schoolwork.
For calls that you make to the ClassKit Catalog API, you set the environment query parameter.
During normal operation, you set the value of this parameter to production. For example, the
following curl command retrieves the main app context of an example app:
When you want to work with the development environment, set the parameter to development
instead:
Overview
Target the Development Environment
ClassKit Catalog API / Testing Your ClassKit Catalog Implementation
Article
Testing Your ClassKit Catalog
Implementation
Verify your server interaction before deployment by operating in a development
environment.


## Page 6

You can read and write the development environment just like the production environment. Data
isn’t shared between the two environments.
After uploading content to the development environment, you can inspect the changes. On an iOS
device that you use for development, with the Schoolwork app installed, go to Settings >
Developer, and choose ClassKit API.
Then use the ClassKit Catalog Environment section to choose either the Production or
Development environment.
Test Your Changes


## Page 7

When you choose Development, the Schoolwork app on that device shows you data you uploaded
to the development environment instead of the production environment data.
Authenticating Calls to the ClassKit Catalog API
Establish your identity to the ClassKit Catalog server by providing a cryptographically signed
token for each call.
See Also
Essentials


