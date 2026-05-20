# 001_Passkey use in web browsers.pdf

## Page 1

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


## Page 2

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


