# 002_CLSError_Code.pdf

## Page 1

case none
No error.
case authorizationDenied
The app isn’t authorized to perform the requested operation.
case classKitUnavailable
ClassKit isn’t available on this device.
case databaseInaccessible
ClassKit isn’t accessible because the device is locked.
case invalidAccountCredentials
case invalidArgument
An invalid argument was provided to the API.
case invalidCreate
An attempt to save a new object that already exists in the data store failed.
Topics
Error codes
ClassKit / CLSError / CLSError.Code
Enumeration
CLSError.Code
Error codes that ClassKit issues.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 2

case invalidModification
An attempt to modify a read-only object failed.
case invalidUpdate
ClassKit failed to save an updated object in the data store.
case limits
A limit has been exceeded.
case partialFailure
ClassKit encountered more than one error.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct CLSError
Errors issued by ClassKit.
let CLSErrorCodeDomain: String
The error domain that ClassKit uses when issuing errors.
Initializers
Relationships
Conforms To
See Also
Errors


## Page 3

struct CLSErrorUserInfoKey
Keys that appear in the user info dictionary in errors that ClassKit creates.


