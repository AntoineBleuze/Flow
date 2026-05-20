# 003_Password use in web browsers.pdf

## Page 1

If your browser app uses WKWebView to display web content, WebKit automatically handles Web
Authentication challenges in webpages and requests credentials from the person using the
browser. If your browser app uses an alternative web browser engine — for example, an alternate
browser engine for iPhone that you write using BrowserEngineKit — when the website makes a We
Authentication challenge, use ASAuthorizationController to discover and use
credentials to respond to the challenge. ASAuthorizationController works with passwords
the system stores on the keychain or that third-party credential managers control.
class ASAuthorizationWebBrowserPublicKeyCredentialManager
A class that you use to request access to a person’s passkeys in a web browser, and that
reports on the access status.
protocol ASAuthorizationWebBrowserSecurityKeyPublicKeyCredential
AssertionRequest
An interface you use to respond to authentication challenges in a web browser.
protocol ASAuthorizationWebBrowserSecurityKeyPublicKeyCredential
RegistrationRequest
Overview
Topics
Website authorization
Website authentication requests
Authentication Services / Password use in web browsers
API Collection
Password use in web browsers
Register and authenticate website users by using passwords.


## Page 2

An interface you use to respond to password-creation challenges in a web browser.
protocol ASAuthorizationWebBrowserSecurityKeyPublicKeyCredentialProvide
A protocol for creating passkey requests.
Password AutoFill
Streamline your app’s login and onboarding procedures.
class ASAuthorizationPasswordProvider
A mechanism for generating requests to perform keychain credential sharing.
class ASPasswordCredential
A password credential.
Website credential providers
See Also
Passwords


