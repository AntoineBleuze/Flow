# 001_AuthorizationStatus.pdf

## Page 1

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


## Page 2

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


