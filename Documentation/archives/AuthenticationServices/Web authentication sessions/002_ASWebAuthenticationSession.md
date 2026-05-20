# 002_ASWebAuthenticationSession.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


