# 000_Authenticating a User Through a Web Service.pdf

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


