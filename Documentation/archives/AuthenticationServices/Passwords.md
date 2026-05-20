# Passwords.pdf

## Page 1

Password AutoFill simplifies login and account creation tasks for iOS apps and webpages. With ju
a few taps, your users can create and save new passwords or log in to an existing account. Users
don’t even need to know their password; the system handles everything. This convenience
increases the likelihood that users will complete your app’s onboarding process and start using
your app more quickly. Additionally, by encouraging users to select unique, strong passwords, you
increase the security of your app.
By default, Password AutoFill saves the user’s login credentials on their current iOS device. iOS ca
sync these credentials securely across the user’s devices using iCloud Keychain. Password AutoF
recommends credentials only for your app’s associated domain, and the user must authenticate
using Face ID or Touch ID before accessing these credentials. For more information on privacy an
security, see Approach to Privacy and iOS Security Guide.
Password AutoFill also provides credentials from third-party password managers that implement a
credential provider extension. For more information on the credential provider extension, see the
Authentication Services framework.
Password AutoFill uses heuristics to determine when the user logs in or creates new passwords,
and automatically provides the password QuickType bar. These heuristics give users some
Password AutoFill support in most apps, even if those apps haven’t been updated to support
AutoFill. However, to provide the best user experience and ensure your app fully supports
Password AutoFill, perform the following steps:
1. Set up your app’s associated domains. To learn how to set up your app’s associated domains,
see Supporting associated domains.
2. Set the correct AutoFill type on relevant text fields. For an iOS app, see Enabling Password
AutoFill on a text input view. For a web app, see Enabling Password AutoFill on an HTML input
element.
Overview
Enable Password AutoFill
Security / Password AutoFill
Password AutoFill
Streamline your app’s login and onboarding procedures.


## Page 2

Password AutoFill streamlines logging into web services at your domain; however, if you need to lo
into a third-party service, use ASWebAuthenticationSession instead, which supports
Password AutoFill when your user hasn’t already logged in.
If you’re developing a password management app, create AutoFill Credential Provider Extensions 
surface credentials from your app in Password AutoFill and pull your app’s password data into the
Password AutoFill workflow. When your app integrates with Password AutoFill, users don’t have to
copy and paste credentials. Instead, they can use password data stored in your app easily becaus
the data will be offered to the user to fill in compatible user name and password fields. To integrat
a password app with Password AutoFill, use in the Authentication Services framework.
About the Password AutoFill workflow
Learn how Password AutoFill interacts with both iOS and web apps.
Supporting associated domains
Connect your app and a website to provide both a native app and a browser experience.
object applinks
The root object for a universal links service definition.
Enabling Password AutoFill on a text input view
Make sure a text input view displays the correct AutoFill suggestions.
var textContentType: UITextContentType!
The semantic meaning for a text input area.
static let username: UITextContentType
A property that defines the content in a text input area as an account or login name.
static let password: UITextContentType
Support third-party web services
Integrate a password management app with Password
AutoFill
Topics
Essentials
Text input views


## Page 3

A property that defines the content in a text input area as a password.
static let newPassword: UITextContentType
A property that defines the content in a text input area as a new password.
static let oneTimeCode: UITextContentType
A property that defines the content in a text input area as a one-time code.
Enabling Password AutoFill on an HTML input element
Make sure a web view or webpage provides the correct AutoFill suggestions.
Customizing Password AutoFill rules
Modify the strong password rules for your app by adding your own restrictions.
var passwordRules: UITextInputPasswordRules?
class UITextInputPasswordRules
A class that represents password rules for a text input field.
Text input elements
Password rules


## Page 4

func createRequest() -> ASAuthorizationPasswordRequest
Creates a new password authorization request.
class ASAuthorizationPasswordRequest
An authorization request that uses credentials stored in the keychain.
NSObject
ASAuthorizationProvider
CVarArg
CustomDebugStringConvertible
Topics
Creating Requests
Relationships
Inherits From
Conforms To
Authentication Services / ASAuthorizationPasswordProvider
Class
ASAuthorizationPasswordProvider
A mechanism for generating requests to perform keychain credential sharing.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 15.0+
visionOS 1.0+
watchOS 6.0+


## Page 5

CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Password AutoFill
Streamline your app’s login and onboarding procedures.
class ASPasswordCredential
A password credential.
Password use in web browsers
Register and authenticate website users by using passwords.
See Also
Passwords


## Page 6

init(user: String, password: String)
Initializes a password credential.
var user: String
The user for a password credential object.
var password: String
The password for a password credential object.
NSObject
Topics
Creating a credential
Accessing the username and password
Relationships
Inherits From
Authentication Services / ASPasswordCredential
Class
ASPasswordCredential
A password credential.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 15.0+
visionOS 1.0+
watchOS 6.0+


## Page 7

ASAuthorizationCredential
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Password AutoFill
Streamline your app’s login and onboarding procedures.
class ASAuthorizationPasswordProvider
A mechanism for generating requests to perform keychain credential sharing.
Password use in web browsers
Register and authenticate website users by using passwords.
Conforms To
See Also
Passwords


## Page 8

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


## Page 9

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


