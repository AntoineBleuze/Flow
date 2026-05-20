# 002_ASError_Code.pdf

## Page 1

case activationFailed
Session activation failed.
case discoveryTimeout
Accessory discovery timed out.
case invalidated
The session invalidated prior to completing the operation.
case extensionNotFound
The framework couldn’t find the app extension.
case userRestricted
The person using the app restricted access.
Topics
Activation errors
Timeout and life cycle errors
Configuration errors
AccessorySetupKit / ASError / ASError.Code
Enumeration
ASError.Code
Codes that describe errors encountered during accessory discovery.
iOS 18.0+
iPadOS 18.0+


## Page 2

case invalidRequest
The session received an invalid request.
case pickerRestricted
The picker can’t be used because the app is in the background.
case pickerAlreadyActive
The picker received a show request when it was already active.
case userCancelled
The person using the app canceled the operation.
case connectionFailed
The session was unable to establish a connection.
case success
A code that represents a successful action.
case unknown
An underlying failure with an unknown cause.
static var errorDomain: String
let ASErrorDomain: String
NSError domain for AccessorySetupKit errors.
Picker errors
Cancellation errors
Communication errors
Success cases
Unclassified errors
Accessing the error domain
Working with raw values


## Page 3

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct ASError
An error encountered during accessory discovery.
let ASErrorDomain: String
NSError domain for AccessorySetupKit errors.
Relationships
Conforms To
See Also
Errors


