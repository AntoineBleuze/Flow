# 004_Supporting Single Sign-On in a Web Browser App.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


