# Passkeys.pdf

## Page 1

Eliminating passwords simplifies account creation and authentication for apps and websites.
Additionally, it reduces risks that arise from the reuse of one password across multiple services,
brute force attacks, and social engineering that bad actors use to obtain credential information. B
implementing public-private authentication according to the W3C Web Authentication
specification, your users no longer need to remember complicated passwords or rely on password
managers.
Instead of using a password, your macOS, iOS, or iPadOS device, known as the authenticator,
generates a public-private key pair at account creation time, and sends the public key to the serv
The server, known as the relying party, holds the public key for subsequent authentication, and
uses assertion to challenge the authenticator to prove its identity is valid.
There are two forms of public-private key authentication: passkeys and security keys. With
passkeys, the device stores its public-private key pair in the user’s iCloud Keychain and syncs the
keys across the user’s devices. Security keys store the public-private key pair on a physical
medium, such as a security card or a USB key.
Connecting to a service with passkeys
Allow users to sign in to a service without typing a password.
Overview
Topics
Fundamentals
Authentication Services / Public-Private Key Authentication
API Collection
Public-Private Key Authentication
Register and authenticate users with passkeys and security keys, without using
passwords.


## Page 2

Supporting passkeys
Eliminate passwords for your users when they sign in to apps and websites.
Supporting Security Key Authentication Using Physical Keys
Allow users to authenticate using NFC, USB, and Lightning security keys in your app or
service.
protocol ASAuthorizationPublicKeyCredentialRegistration
An interface that credential registration requests adhere to.
class ASAuthorizationPlatformPublicKeyCredentialRegistration
A newly created platform credential that results from a credential registration request.
class ASAuthorizationSecurityKeyPublicKeyCredentialRegistration
A newly created security key credential that results from a credential registration request.
protocol ASAuthorizationPublicKeyCredentialRegistrationRequest
An interface that defines properties for a credential registration request.
class ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest
The object for registering a new platform public key credential.
class ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest
The object for registering a new security key credential.
protocol ASAuthorizationPublicKeyCredentialAssertion
An interface for establishing a public key-based assertion.
class ASAuthorizationPlatformPublicKeyCredentialAssertion
A class that represents the platform credential assertion type.
class ASAuthorizationSecurityKeyPublicKeyCredentialAssertion
A class that represents the security key credential assertion type.
protocol ASAuthorizationPublicKeyCredentialAssertionRequest
An interface for requesting a public key-based credential assertion.
class ASAuthorizationPlatformPublicKeyCredentialAssertionRequest
Account registration
Account authentication


## Page 3

The concrete assertion request type for platform credentials.
class ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest
A class that defines the assertion request type for security key credentials.
class ASAuthorizationPlatformPublicKeyCredentialProvider
A mechanism for providing public key credential requests to an app or service with iCloud
Keychain.
class ASAuthorizationSecurityKeyPublicKeyCredentialProvider
A mechanism for providing public key credential requests to an app or service with a physica
security key.
protocol ASPublicKeyCredential
An interface that defines the properties of the public key.
class ASAuthorizationPublicKeyCredentialParameters
An object that provides required parameters for the credential during registration.
struct ASCOSEAlgorithmIdentifier
An identifier for the algorithm that a credential’s key pair uses.
struct ASCOSEEllipticCurveIdentifier
A structure that contains the elliptic curve identifier.
struct ASAuthorizationPublicKeyCredentialAttestationKind
A structure that defines the types of attestations a developer can request.
struct ASAuthorizationPublicKeyCredentialResidentKeyPreference
A structure that specifies the relying party’s preference for resident key storage.
struct ASAuthorizationPublicKeyCredentialUserVerificationPreference
A structure that defines the relying party’s user verification preference.
protocol ASAuthorizationPublicKeyCredentialDescriptor
An interface that defines the credential identifier.
class ASAuthorizationPlatformPublicKeyCredentialDescriptor
Credential providers
Request configuration


## Page 4

An object that holds the credential.
class ASAuthorizationSecurityKeyPublicKeyCredentialDescriptor
An object that holds public key credential transport information.
struct Transport
A structure that defines the security key credential transport type.
static var allSupported: [ASAuthorizationSecurityKeyPublicKeyCredential
Descriptor.Transport]
An array of currently supported transport types.
Passkey use in web browsers
Register and authenticate website users by using passkeys.
Performing fast account creation with passkeys
Allow people to quickly create an account with passkeys and associated domains.
Connecting to a service with passkeys
Allow users to sign in to a service without typing a password.
See Also
Passkeys


## Page 5

If your browser app uses WKWebView to display web content, WebKit automatically handles Web
Authentication challenges in web pages and requests credentials from the person using the
browser. If your browser app uses an alternative web browser engine—for example, an alternate
browser engine for iPhone that you write using BrowserEngineKit—when the website makes a Web
Authentication challenge, use ASAuthorizationController to discover and use
credentials to respond to the challenge. ASAuthorizationController works with passkeys
stored on the keychain or managed by third-party credential managers.
The person using your browser chooses whether to let your app access their passkeys. Use
ASAuthorizationWebBrowserPublicKeyCredentialManager to determine whether you
browser app has access, and to request access if it has no access.
Authenticating people by using passkeys in browser apps
Provide a secure and convenient alternative to passwords.
class ASAuthorizationWebBrowserPublicKeyCredentialManager
A class that you use to request access to a person’s passkeys in a web browser, and that
reports on the access status.
Overview
Topics
Website authorization
Website authentication requests
Authentication Services / Passkey use in web browsers
API Collection
Passkey use in web browsers
Register and authenticate website users by using passkeys.


## Page 6

protocol ASAuthorizationWebBrowserExternallyAuthenticatableRequest
An authorization request for which a web browser can retrieve credentials.
protocol ASAuthorizationWebBrowserPlatformPublicKeyCredentialAssertion
Request
An interface you use to respond to authentication challenges in a web browser.
protocol ASAuthorizationWebBrowserPlatformPublicKeyCredential
RegistrationRequest
An interface you use to respond to passkey-creation challenges in a web browser.
protocol ASAuthorizationWebBrowserPlatformPublicKeyCredentialProvider
A mechanism you use to provide public key credential requests to a browser app.
Public-Private Key Authentication
Register and authenticate users with passkeys and security keys, without using passwords.
Performing fast account creation with passkeys
Allow people to quickly create an account with passkeys and associated domains.
Connecting to a service with passkeys
Allow users to sign in to a service without typing a password.
Website credential providers
See Also
Passkeys


## Page 7

Note
This sample code project is associated with WWDC25 session 279: What’s new in passkeys.
To configure the sample code project, do the following:
1. In Xcode, click the project’s target, then select your team from the Team pop-up menu in the
Signing & Capabilities pane to let Xcode automatically manage your provisioning profile.
2. Add the Associated Domains capability using the + Capability button in the same pane, and
specify your domain with the webcredentials service.
3. Ensure an apple-app-site-association (AASA) file is present on your domain in the
.well-known directory, and that it contains an entry for this app’s App ID for the
webcredentials service.
4. In the SignUpView.swift file, replace all occurrences of example.com with the name of yo
domain.
Overview
Configure the sample code project
Authentication Services / Performing fast account creation with passkeys
Sample Code
Performing fast account creation with
passkeys
Allow people to quickly create an account with passkeys and associated domains
Download
iOS 26.0+
iPadOS 26.0+
Xcode 26.0+


## Page 8

Public-Private Key Authentication
Register and authenticate users with passkeys and security keys, without using passwords.
Passkey use in web browsers
Register and authenticate website users by using passkeys.
Connecting to a service with passkeys
Allow users to sign in to a service without typing a password.
See Also
Passkeys


## Page 9

Note
This sample code project is associated with WWDC22 session 10092: Meet passkeys and
WWDC21 session 10106: Move beyond passwords.
To build and run this sample:
1. Open the sample with Xcode 14 or later.
2. Select the Shiny project.
3. For the project’s target, select your team from the Team drop-down menu in the Signing &
Capabilities pane to let Xcode automatically manage your provisioning profile.
4. Add the Associated Domains capability using the “+ Capability” button in the same pane, and
specify your domain with the webcredentials service.
5. Ensure an apple-app-site-association (AASA) file is present on your domain in the
.well-known directory, and that it contains an entry for this app’s App ID for the
webcredentials service.
6. In the AccountManager.swift file, replace all occurrences of example.com with the name
of your domain.
Overview
Configure the sample code project
Authentication Services / Connecting to a service with passkeys
Sample Code
Connecting to a service with passkeys
Allow users to sign in to a service without typing a password.
Download
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
Xcode 14.0+


## Page 10

Public-Private Key Authentication
Register and authenticate users with passkeys and security keys, without using passwords.
Passkey use in web browsers
Register and authenticate website users by using passkeys.
Performing fast account creation with passkeys
Allow people to quickly create an account with passkeys and associated domains.
See Also
Passkeys


