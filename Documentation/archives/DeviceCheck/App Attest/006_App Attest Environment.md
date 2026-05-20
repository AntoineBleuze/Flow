# 006_App Attest Environment.pdf

## Page 1

Key
com.apple.developer.devicecheck.appattest-environment
Type
String
development
The App Attest sandbox environment that you use to test a device without affecting its risk
metrics. Keys you create in the sandbox environment don’t work in the production
environment.
production
The App Attest production environment. Keys you create in the production environment don’
work in the sandbox environment.
To add this entitlement to your app, add the key to your app’s entitlements file manually, choose
the String type, and set the associated value to either development or production.
Alternatively, add the App Attest capability to your app target. This adds the entry to the app’s
entitlements file with development as the associated value. If you omit the entitlement during
development, your app uses the App Attest sandbox servers by default. You can test your app
Details
Possible Values
Discussion
Bundle Resources / Entitlements / App Attest Environment
Property List Key
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.
iOS 14.0+
iPadOS 14.0+
tvOS 15.0+
visionOS 1.0+


## Page 2

during development against the App Attest production servers by setting the entitlement to
production.
After distributing your app through TestFlight, the App Store, or the Apple Developer Enterprise
Program, your app ignores the entitlement you set and uses the production environment.
Important
If you use the App Attest service in an App Clip, be sure to add the App Attest capability and
the corresponding entry for both your app and your App Clip. Similarly, if you use the App
Attest service in your app and an app extension, make sure to configure the capability and the
App Attest sandbox environment for both your app and your extension.
com.apple.security.network.server
A Boolean value indicating whether your app may listen for incoming network connections.
com.apple.security.network.client
A Boolean value indicating whether your app may open outgoing network connections.
See Also
Networking


