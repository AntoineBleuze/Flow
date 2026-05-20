# 000_AuthorizationCenter.pdf

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


