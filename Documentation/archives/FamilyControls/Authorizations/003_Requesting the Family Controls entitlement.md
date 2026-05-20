# 003_Requesting the Family Controls entitlement.pdf

## Page 1

Before you distribute an app that uses Family Controls, your Apple Developer Account Holder mu
request permission to use the Family Controls entitlement, and update your Xcode project to
use the entitlement.
Request the Family Controls entitlement at Family Controls distribution. If your app includes a
Screen Time API app extension such as Device Activity Monitor, Device Activity Report, Shield
Action, or Shield Configuration, submit the same request for the extension. For more information 
the Screen Time APIs, see Screen Time Technology Frameworks.
Note
You can also use the Capability Requests tab in Certificates, Identifiers & Profiles to request
permission to use the Family Controls entitlement for distribution. For more information, see
Capability requests.
Apple reviews your app, and if it’s approved, adds the entitlement to your developer account usin
managed capabilities. For more information, see Provisioning with capabilities.
To check your request status, follow the steps in Check the status of your request in Capability
Requests, then select Family Controls from the Capabilities list. When Apple approves your reque
Overview
Request the entitlement
Check the status of your request
Family Controls / Requesting the Family Controls entitlement
Article
Requesting the Family Controls
entitlement
Register your app and its Screen Time API app extensions to use Family Controls.


## Page 2

Certificates, Identifiers & Profiles displays an Assigned status for this capability.
Click the info button next to the capability. In the dialog that appears, check that Provisioning
Support lists all the distribution methods you need.
When you receive the Family Controls entitlement, update your Xcode project to use it. For more
information, see Configuring Family Controls.
If your Xcode project already includes the Family Controls capability for development and you use
automatic signing, Xcode automatically updates your app to use this capability for distribution.
class AuthorizationCenter
The center for requesting authorization to provide parental controls.
enum AuthorizationStatus
The status of your app’s authorization to provide parental controls.
Family Controls
Configure the Family Controls entitlement for your app
See Also
Authorizations


## Page 3

A Boolean value that indicates whether the app can request or revoke authorization to provid
parental controls.


