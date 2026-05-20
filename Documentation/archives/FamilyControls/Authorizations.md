# Authorizations.pdf

## Page 1

To authorize your app so that it can provide parental controls, access the shared Authorizatio
Center instance.
Important
You must add the Family Controls capability to your app before you call the request
Authorization(for:) or revokeAuthorization(completionHandler:) methods.
This capability adds the Family Controls entitlement to your app. In a compatible iPad or
iPhone app running in visionOS, authorization attempts always fail. For more information, see
Adding capabilities to your app.
Next, to request authorization to provide parental controls, call request
Authorization(completionHandler:)
Overview
Family Controls / AuthorizationCenter
Class
AuthorizationCenter
The center for requesting authorization to provide parental controls.
iOS 15.0+
iPadOS 15.0+


## Page 2

or requestAuthorization(for:).
Always request authorization when your app first launches. If the user’s parent or guardian hasn’t
previously authorized your app, the system displays an alert. If the parent or guardian chooses to
continue, it displays an authentication sheet. When a parent or guardian either approves or cance
the request, the system sends the result back to the requestAuthorization(completion
Handler:) method’s completion handler.
If you’re authenticating an individual who hasn’t previously authorized your app, the system
displays an alert. If the individual chooses to continue, the device asks to authorize that
individual using Face ID or Touch ID.
After your app has been authorized, additional calls to requestAuthorization(for:) don’t
display the authentication sheet or ask to authorize that individual using Face ID or Touch ID.
Instead, the system sets the authorization status.
To observe changes to the authorization status, use the authorizationStatus property.
The status may change due to external events, such as a child graduating to an adult account, or 
parent or guardian changing the status in Settings. You can also revoke authorization by calling
revokeAuthorization(completionHandler:)
static let shared: AuthorizationCenter
The shared center for requesting and revoking authorization.
func requestAuthorization(for: FamilyControlsMember) async throws
Requests authorization to provide parental controls for a child or individual.
Topics
Accessing the shared center
Requesting and revoking authorization


## Page 3

func revokeAuthorization(completionHandler: (Result<Void, any Error>) -
Void)
Revokes authorization to provide parental controls.
var authorizationStatus: AuthorizationStatus
The status of your app’s authorization to provide parental controls.
var $authorizationStatus: Published<AuthorizationStatus>.Publisher
A publisher for the authorization status property.
func requestAuthorization(completionHandler: (Result<Void, any Error>) 
> Void)
Requests authorization to provide parental controls for a child.
Deprecated
ObservableObject
enum AuthorizationStatus
The status of your app’s authorization to provide parental controls.
Family Controls
A Boolean value that indicates whether the app can request or revoke authorization to provid
parental controls.
Tracking authorization changes
Deprecated APIs
Relationships
Conforms To
See Also
Authorizations


## Page 4

Requesting the Family Controls entitlement
Register your app and its Screen Time API app extensions to use Family Controls.


## Page 5

case notDetermined
The app hasn’t requested authorization.
case denied
The user, parent, or guardian denied the request for authorization.
case approved
The user, parent, or guardian approved the request for authorization.
var description: String
A nonlocalized description of the authorization value, suitable for debugging.
Topics
Determining the status
Debugging
Relationships
Family Controls / AuthorizationStatus
Enumeration
AuthorizationStatus
The status of your app’s authorization to provide parental controls.
iOS 15.0+
iPadOS 15.0+


## Page 6

Copyable
CustomStringConvertible
Decodable
Encodable
Equatable
Hashable
RawRepresentable
class AuthorizationCenter
The center for requesting authorization to provide parental controls.
Family Controls
A Boolean value that indicates whether the app can request or revoke authorization to provid
parental controls.
Requesting the Family Controls entitlement
Register your app and its Screen Time API app extensions to use Family Controls.
Conforms To
See Also
Authorizations


## Page 7

Key
com.apple.developer.family-controls
Type
Boolean
You must add the Family Controls entitlement to your app before you call the Authorization
Center class’s requestAuthorization(completionHandler:) or revoke
Authorization(completionHandler:) methods.
Adding the Family Controls capability to your app automatically sets this entitlement. Before
submitting your app to the App Store, you must request permission to use the entitlement. For
more information, see Adding capabilities to your app.
Details
Discussion
Bundle Resources / Entitlements / Family Controls
Property List Key
Family Controls
A Boolean value that indicates whether the app can request or revoke
authorization to provide parental controls.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
visionOS 1.0+


## Page 8

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


## Page 9

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


## Page 10

A Boolean value that indicates whether the app can request or revoke authorization to provid
parental controls.


