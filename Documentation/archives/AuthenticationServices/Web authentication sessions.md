# Web authentication sessions.pdf

## Page 1

Some websites provide, as a service, a secure mechanism for authenticating users. When the use
navigates to the site’s authentication URL, the site presents the user with a form to collect
credentials. After validating the credentials, the site redirects the user’s browser, typically using a
custom scheme, to a URL that indicates the outcome of the authentication attempt.
You can make use of a web authentication service in your app by initializing an ASWeb
AuthenticationSession instance with a URL that points to the authentication webpage. The
page can be one that you maintain, or one operated by a third party. During initialization, indicate
the callback scheme that the page uses to return the authentication outcome:
Use the initializer’s trailing closure to tell the session how to handle the callback after
authentication completes, as described below in Handle the Callback.
Overview
Create a Web Authentication Session
Authentication Services / Authenticating a User Through a Web Service
Article
Authenticating a User Through a Web
Service
Use a web authentication session to authenticate a user in your app.


## Page 2

In macOS, or if you have a deployment target of iOS 13 or later, the session keeps a strong
reference to itself until the authentication process completes to prevent the system from
deallocating the closure. For earlier iOS deployment targets, your app needs to keep a strong
reference to the session until authentication completes.
Your app indicates the window that should act as a presentation anchor for the session by adoptin
the ASWebAuthenticationPresentationContextProviding protocol. From the
presentationAnchor(for:) method, which is the protocol’s one required method, return the
window that should act as the anchor:
After creating the session, set an appropriate context provider instance as the session’s
presentationContextProvider delegate:
You can configure the session to request ephemeral browsing by setting the session’s prefers
EphemeralWebBrowserSession property to true:
This setting asks the browser to avoid using any existing browsing data, like cookies, during the
authentication process. It also asks that the browser avoid retaining any data collected during the
authentication attempt beyond the lifetime of the attempt, or sharing it with any other session. An
ephemeral session may improve security but prevents reusing the result of a previously successfu
authentication, potentially forcing the user to reenter credentials. As a result, it’s typically best to
let the user choose whether to request ephemeral browsing.
Safari always respects the request. In macOS, the user can choose a different default browser tha
might or might not respect the request.
Provide a Presentation Context
Optionally Request Ephemeral Browsing


## Page 3

Note
When not using an ephemeral session, all cookies except session cookies are available to the
browser.
After configuring the session, call its start() method:
In iOS, the session loads the authentication web page that you indicated during initialization in an
embedded browser view. In macOS, the session sends the page load request to the user’s defaul
browser if it handles authentication sessions, or to Safari otherwise. In any case, the browser
presents the user with the authentication page, which is typically a form for entering a username
and password.
You can cancel the authentication attempt from your app before the user finishes by calling the
session’s cancel() method:
When you cancel, the session automatically dismisses the corresponding browser view.
After the user authenticates, the authentication provider redirects the browser to a URL that uses
the callback scheme. The browser detects the redirect, dismisses itself, and passes the complete
URL to your app by calling the closure you specified during initialization.
When you receive this callback, first check for errors. For example, you receive the canceled
Login error if the user aborts the flow by dismissing the browser window. If the error is nil,
inspect the callback URL to determine the outcome of the authentication:
Start the Authentication Flow
Handle the Callback


## Page 4

The above example looks for a token stored as a query parameter. The specific parsing that you
have to do depends on how the authentication provider structures the callback URL.
Securing Logins with iCloud Keychain Verification Codes
Use time-based codes generated on-device for a secure authentication experience.
class ASWebAuthenticationSession
A session that an app uses to authenticate a user through a web service.
struct WebAuthenticationSession
A SwiftUI environment value that views use to authenticate someone using a web service.
Supporting Single Sign-On in a Web Browser App
Extend your web browser app to handle web authentication requests from other apps.
class ASWebAuthenticationSessionWebBrowserSessionManager
A session manager that mediates sharing data between an app and a web browser.
ASWebAuthenticationSessionWebBrowserSupportCapabilities
A collection of keys that a browser app uses to declare its ability to handle authentication
requests from other apps.
See Also
Web authentication sessions


## Page 5

Apps and services often use verification codes in a two-factor authentication scheme. When used
properly, they strengthen account security over just using passwords alone. During sign in, a
service asks for a code to verify the user’s identity. These codes are often sent over SMS. The us
then confirms their identity by entering the code they receive. Delivering codes over SMS entails 
number of risks. For example, SMS-based verification codes can be snooped on carrier networks
or redirected to an attacker through SIM swapping attacks.
With iCloud Keychain verification codes, iPhones, iPads, and Macs generate verification codes
entirely offline, reducing the risk associated with sending them online. iCloud Keychain
synchronizes codes across all of the user’s devices.
Both iOS and macOS handle a special URL based on the industry standard otpauth specification.
The Apple-specific version of this URL is identical to the standard, but uses the apple-otpauth
scheme. Embed this URL in your webpages and apps to allow your users to set up new code
generators directly in the iCloud Keychain password manager with minimal effort. On the web, use
an <a> tag to create a link. In apps, create an NSAttributedString with a link attribute, or
open the URL in response to a button tap. When the user taps on the URL, the system prompts
them to choose a credential. A new verification code is set up for that credential using the
parameters specified in the URL.
The host portion of the URL must be totp, and the path should be the proper name of your
service, followed by a colon and the user name or email of the account. The otpauth:
specification defines a number of query parameters. The following are the most important:
Overview
Set Up the Verification Code
Authentication Services / Securing Logins with iCloud Keychain Verification Codes
Article
Securing Logins with iCloud Keychain
Verification Codes
Use time-based codes generated on-device for a secure authentication
experience.


## Page 6

secret
An arbitrary key value encoded in Base32. Secrets should be at least 160 bits.
digits
The length of a one-time passcode. The value is either 6 or 8. The default is 6.
period
The number of seconds that a verification code is valid for. The default value is 30.
issuer
The domain of the site or app. The password manager uses this field to suggest credentials
when setting up a new code generator.
Here’s an example of the URL for an app called Example for the user meichen3@icloud.com:
apple-otpauth://totp/Example:meichen3@icloud.com?
secret=HAZDGMBWGE4DOMZYGEYTOMJTG43TMOJRGE4DANJQGE3DGOBRGI4TOOJZGEYTENJT
IYTEMJRHEZDA&digits=6&period=30&issuer=example.com
AutoFill on iOS and macOS offer to fill verification codes automatically in text fields where you set
the content type of the field to a one-time code type. In SwiftUI, set the content type to oneTime
Code with the textContentType(_:) view modifier. In UIKit, set textContentType to one
TimeCode. In AppKit, set contentType to oneTimeCode. For web-based text fields, set the
HTML attribute on the input element to autocomplete=one-time-code.
Authenticating a User Through a Web Service
Use a web authentication session to authenticate a user in your app.
class ASWebAuthenticationSession
A session that an app uses to authenticate a user through a web service.
struct WebAuthenticationSession
A SwiftUI environment value that views use to authenticate someone using a web service.
Supporting Single Sign-On in a Web Browser App
Extend your web browser app to handle web authentication requests from other apps.
class ASWebAuthenticationSessionWebBrowserSessionManager
Prepare the Text Input Field
See Also
Web authentication sessions


## Page 7

A session manager that mediates sharing data between an app and a web browser.
ASWebAuthenticationSessionWebBrowserSupportCapabilities
A collection of keys that a browser app uses to declare its ability to handle authentication
requests from other apps.


## Page 8

Authenticating a User Through a Web Service
Supporting Single Sign-On in a Web Browser App
Use an ASWebAuthenticationSession instance to authenticate a user through a web service
including one run by a third party. Initialize the session with a URL that points to the authenticatio
webpage. When the user starts the authentication session, the operating system shows a modal
view telling them which domain the app is authenticating with and asking whether to proceed. If t
user proceeds with the authentication attempt, a browser loads and displays the page, from whic
the user can authenticate. In iOS, the browser is a secure, embedded web view. In macOS, the
system opens the user’s default browser if it supports web authentication sessions, or Safari
otherwise.
On completion, the service sends a callback URL to the session with an authentication token. The
session passes this URL back to the app through a completion handler. ASWebAuthentication
Session ensures that only the calling app’s session receives the authentication callback, even
when more than one app registers the same callback URL scheme.
For more details, see Authenticating a User Through a Web Service.
Mentioned in
Overview
Authentication Services / ASWebAuthenticationSession
Class
ASWebAuthenticationSession
A session that an app uses to authenticate a user through a web service.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 12.0+
macOS 10.15+
tvOS 16.0+
visionOS 1.0+
watchOS 6.2+


## Page 9

init(url: URL, callback: ASWebAuthenticationSession.Callback, completio
Handler: ASWebAuthenticationSession.CompletionHandler)
Creates a web authentication session instance that uses a callback to evaluate a redirection
URL.
class Callback
An object for evaluating navigation events in an authentication session.
typealias CompletionHandler
A completion handler for the web authentication session.
var prefersEphemeralWebBrowserSession: Bool
A Boolean value that indicates whether the session should ask the browser for a private
authentication session.
var canStart: Bool
A Boolean indicating whether the session can begin.
func start() -> Bool
Starts a web authentication session.
func cancel()
Cancels a web authentication session.
var presentationContextProvider: (any ASWebAuthenticationPresentation
ContextProviding)?
A delegate that provides a display context in which the system can present an authentication
session to the user.
Topics
Creating a session
Configuring a session
Starting and Stopping a Session
Presenting a Session


## Page 10

protocol ASWebAuthenticationPresentationContextProviding
An interface the session uses to ask a delegate for a presentation context.
struct ASWebAuthenticationSessionError
Errors that a web authentication session can generate.
let ASWebAuthenticationSessionErrorDomain: String
The error domain for a web authentication session.
enum Code
The error code for a web authentication session error.
var additionalHeaderFields: [String : String]?
Any additional header fields to set when loading the initial URL.
init(url: URL, callbackURLScheme: String?, completionHandler: ASWeb
AuthenticationSession.CompletionHandler)
Creates a web authentication session instance.
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Recognizing Errors
Instance properties
Deprecated symbols
Relationships
Inherits From
Conforms To


## Page 11

Hashable
NSObjectProtocol
Authenticating a User Through a Web Service
Use a web authentication session to authenticate a user in your app.
Securing Logins with iCloud Keychain Verification Codes
Use time-based codes generated on-device for a secure authentication experience.
struct WebAuthenticationSession
A SwiftUI environment value that views use to authenticate someone using a web service.
Supporting Single Sign-On in a Web Browser App
Extend your web browser app to handle web authentication requests from other apps.
class ASWebAuthenticationSessionWebBrowserSessionManager
A session manager that mediates sharing data between an app and a web browser.
ASWebAuthenticationSessionWebBrowserSupportCapabilities
A collection of keys that a browser app uses to declare its ability to handle authentication
requests from other apps.
See Also
Web authentication sessions


## Page 12

You access an instance of this type by using the SwiftUI Environment property wrapper and
specifying webAuthenticationSession as the environment value.
To begin an authentication session and display the browser, call authenticate(using:
callbackURLScheme:preferredBrowserSession:). For example, when someone taps a
button, the web service authenticates that person and then the authentication provider redirects
the browser to a URL it constructs using the app’s custom callback scheme. The browser detects
that redirect, dismisses itself, and returns the complete URL to the awaiting caller.
The following example shows how to use a SwiftUI Button to invoke a session:
Overview
Authentication Services / WebAuthenticationSession
Structure
WebAuthenticationSession
A SwiftUI environment value that views use to authenticate someone using a web
service.
AuthenticationServices
SwiftUI
iOS 16.4+
iPadOS 16.4+
Mac Catalyst 16.4+
macOS 13.3+
tvOS 16.4+
visionOS 1.0+
watchOS 9.4+


## Page 13

After receiving the URL, inspect it to determine the authentication request’s outcome. For examp
you might search the URL’s query parameters for a token of some form:
Note
Refer to your authentication provider’s documentation for information on the structure of the
returned URL and, if necessary, how you should parse it.
func authenticate(using: URL, callback: ASWebAuthenticationSession.
Callback, preferredBrowserSession: WebAuthenticationSession.Browser
Session?, additionalHeaderFields: [String : String]) async throws -> UR
Begins a web authentication session.
struct BrowserSession
Describes the preferred browser session behavior.
class Callback
An object for evaluating navigation events in an authentication session.
Topics
Authenticating a session


## Page 14

func authenticate(using: URL, callbackURLScheme: String, preferred
BrowserSession: WebAuthenticationSession.BrowserSession?) async throws 
> URL
Begins a web authentication session.
Deprecated
Sendable, SendableMetatype
Authenticating a User Through a Web Service
Use a web authentication session to authenticate a user in your app.
Securing Logins with iCloud Keychain Verification Codes
Use time-based codes generated on-device for a secure authentication experience.
class ASWebAuthenticationSession
A session that an app uses to authenticate a user through a web service.
Supporting Single Sign-On in a Web Browser App
Extend your web browser app to handle web authentication requests from other apps.
class ASWebAuthenticationSessionWebBrowserSessionManager
A session manager that mediates sharing data between an app and a web browser.
ASWebAuthenticationSessionWebBrowserSupportCapabilities
Deprecated methods
Relationships
Conforms To
See Also
Web authentication sessions


## Page 15

A collection of keys that a browser app uses to declare its ability to handle authentication
requests from other apps.


## Page 16

Apps can authenticate users through a web service using an instance of ASWebAuthenticatio
Session. When an app calls the authentication session’s start() method, the system asks the
user’s default web browser to initiate the authentication attempt at a given URL. If the default
browser doesn’t handle authentication requests, the system falls back on Safari. Either way, the
designated browser loads the URL, waits for the user to authenticate, and returns a callback URL
that indicates the outcome of the attempt.
If you distribute a web browser app on macOS, you can make it eligible to participate in this flow.
You register the browser as a session handler, and then listen for and handle authentication
requests.
Using the Xcode property list editor, add the ASWebAuthenticationSessionWebBrowser
SupportCapabilities key to your web browser’s Information Property List. For the
key’s value, create a dictionary that contains the IsSupported key, with a corresponding value o
YES.
Overview
Declare the Session Handling Capability
Authentication Services / Supporting Single Sign-On in a Web Browser App
Article
Supporting Single Sign-On in a Web
Browser App
Extend your web browser app to handle web authentication requests from other
apps.


## Page 17

By declaring this capability, you tell the system that your web browser app handles single sign-on
requests. If the user has set your browser as the default, the system routes authentication reques
to it.
Optionally, add the EphemeralBrowserSessionIsSupported key with a value that indicates
whether your browser supports ephemeral browsing.
If you don’t provide the key, or if you set its value to NO and an app tries to conduct an ephemeral
authentication session, the system warns the user. If do you declare support by setting the value 
YES, be sure to respect the shouldUseEphemeralSession property on any incoming
authentication requests, as described below in Perform Authentication.
Note
It’s strongly recommended that your web browser support ephemeral sessions. Apps can
specifically request this kind of session, and it’s important to honor the request.


## Page 18

Adopt the ASWebAuthenticationSessionWebBrowserSessionHandling protocol in your
web browser app to receive authentication requests. Choose a class that can act as the handler,
and declare conformance to the protocol:
From within the conforming class, implement the protocol’s begin(_:) method to receive new
ASWebAuthenticationSessionRequest instances. Handle the request using the data it
encapsulates as described in Perform Authentication below.
Implement the cancel(_:) method to listen for cancellations, which might happen if the calling
app terminates or cancels the operation. If you have multiple requests in progress, you can use th
cancellation request’s uuid property to identify the in-progress request to cancel:
After implementing the interface, tell the system how to find your session handler by setting the
sessionHandler property of the shared session manager. You typically do this once at startup.
For example, you might set the property in your app delegate’s applicationDidFinish
Launching(_:) method:
Listen for Authentication Requests


## Page 19

When your handler receives a new authentication request, load the URL given in the request’s ur
property and display the content to the user. The user interacts with the content to authenticate—
for example, by entering credentials and clicking a button. The service performing the
authentication indicates the outcome by redirecting the browser to a URL that uses a known
callback scheme.
The request’s callbackURLScheme property tells your browser what callback scheme the
service uses. When your browser detects a redirect involving this scheme, pass the entire URL
back to the session manager by calling the request’s complete(withCallbackURL:) method
For example, when using the WebKit API, you can do this from the navigation delegate’s web
View(_:decidePolicyFor:decisionHandler:) method:
Alternatively, if the browser can’t complete the operation for any reason—for example, because th
user has closed the authentication window—call the request’s cancelWithError(_:) method
instead.
If you declare that your browser supports ephemeral browsing, as described above in Declare the
Session Handling Capability, be sure to respect the request’s shouldUseEphemeralSession
property. When this value is true, avoid using any existing browsing data, like cookies, during the
authentication process. Also, avoid retaining any data collected during the authentication attempt
beyond the lifetime of the attempt, or sharing it with any other session.
Perform Authentication
Handle Launch for Authentication


## Page 20

When your browser supports the authentication flow, the system might launch the browser
specifically for the purpose of authentication. You can detect this condition by checking the was
LaunchedByAuthenticationServices property of the shared session manager.
Use this indicator to adjust the behavior of your browser at startup. For example, you might avoid
restoring previously open windows or tabs.
Authenticating a User Through a Web Service
Use a web authentication session to authenticate a user in your app.
Securing Logins with iCloud Keychain Verification Codes
Use time-based codes generated on-device for a secure authentication experience.
class ASWebAuthenticationSession
A session that an app uses to authenticate a user through a web service.
struct WebAuthenticationSession
A SwiftUI environment value that views use to authenticate someone using a web service.
class ASWebAuthenticationSessionWebBrowserSessionManager
A session manager that mediates sharing data between an app and a web browser.
ASWebAuthenticationSessionWebBrowserSupportCapabilities
A collection of keys that a browser app uses to declare its ability to handle authentication
requests from other apps.
See Also
Web authentication sessions


## Page 21

You don’t create a session manager directly. Instead, use the shared session manager to tell the
system what instance within your web browser app handles authentication requests. Do this by
assigning an instance of a class that adopts the ASWebAuthenticationSessionWebBrowser
SessionHandling protocol to the shared manager’s sessionHandler property.
You can also use the shared managers wasLaunchedByAuthenticationServices property 
determine if your web browser app was launched for the specific purpose of performing
authentication.
class var shared: ASWebAuthenticationSessionWebBrowserSessionManager
The shared manager for which a web browser acts as the session handler.
Overview
Topics
Getting the Shared Manager
Handling a Session Request
Authentication Services / ASWebAuthenticationSessionWebBrowserSessionManager
Class
ASWebAuthenticationSessionWeb
BrowserSessionManager
A session manager that mediates sharing data between an app and a web
browser.
macOS 10.15+


## Page 22

var sessionHandler: any ASWebAuthenticationSessionWebBrowserSession
Handling
A handler that a web browser provides to handle session requests from an app.
protocol ASWebAuthenticationSessionWebBrowserSessionHandling
An interface that a session handler implements to handle login requests from an app.
var wasLaunchedByAuthenticationServices: Bool
A Boolean that indicates whether the session was launched by authentication services.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Authenticating a User Through a Web Service
Use a web authentication session to authenticate a user in your app.
Securing Logins with iCloud Keychain Verification Codes
Use time-based codes generated on-device for a secure authentication experience.
Querying the Manager
Relationships
Inherits From
Conforms To
See Also
Web authentication sessions


## Page 23

class ASWebAuthenticationSession
A session that an app uses to authenticate a user through a web service.
struct WebAuthenticationSession
A SwiftUI environment value that views use to authenticate someone using a web service.
Supporting Single Sign-On in a Web Browser App
Extend your web browser app to handle web authentication requests from other apps.
ASWebAuthenticationSessionWebBrowserSupportCapabilities
A collection of keys that a browser app uses to declare its ability to handle authentication
requests from other apps.


## Page 24

Type
Object
Add a dictionary for this key to your app’s Information Property List if your app is a web
browser and it supports web authentication. In the dictionary, include the capability keys listed
below to indicate your browser app’s capabilities. For more information, see Supporting Single
Sign-On in a Web Browser App.
IsSupported
A Boolean that indicates whether the app acts as a browser that supports authentication
sessions.
EphemeralBrowserSessionIsSupported
Details
Discussion
Topics
Capabilities
Bundle Resources / Information Property List / ASWebAuthenticationSessionWebBrowserSupportCapabilities
Property List Key
ASWebAuthenticationSessionWeb
BrowserSupportCapabilities
A collection of keys that a browser app uses to declare its ability to handle
authentication requests from other apps.
macOS 10.15+


## Page 25

A Boolean that indicates whether the app supports ephemeral browsing when conducting
authentication sessions.
CallbackURLMatchingIsSupported
A Boolean that indicates whether the app can handle callbacks to match authentication URL
AdditionalHeaderFieldsAreSupported
A Boolean that indicates whether the app supports additional header fields in requests.
ASAccountAuthenticationModificationOptOutOfSecurityPromptsOnSignIn
A Boolean value that indicates the system shouldn’t show security recommendation prompts
when users sign in using the app.
See Also
Authentication


