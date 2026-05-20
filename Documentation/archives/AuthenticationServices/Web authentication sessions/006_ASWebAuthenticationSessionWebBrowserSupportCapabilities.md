# 006_ASWebAuthenticationSessionWebBrowserSupportCapabilities.pdf

## Page 1

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


## Page 2

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


