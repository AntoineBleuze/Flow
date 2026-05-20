# Errors.pdf

## Page 1

let CLSErrorCodeDomain: String
The error domain that ClassKit uses when issuing errors.
static var none: CLSError.Code
No error.
static var authorizationDenied: CLSError.Code
The app isn’t authorized to perform the requested operation.
static var classKitUnavailable: CLSError.Code
ClassKit isn’t available on this device.
static var databaseInaccessible: CLSError.Code
ClassKit isn’t accessible because the device is locked.
static var invalidAccountCredentials: CLSError.Code
static var invalidArgument: CLSError.Code
Topics
Error Domain
Error Codes
ClassKit / CLSError
Structure
CLSError
Errors issued by ClassKit.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 2

An invalid argument was provided to the API.
static var invalidCreate: CLSError.Code
An attempt to save a new object that already exists in the data store failed.
static var invalidModification: CLSError.Code
An attempt to modify a read-only object failed.
static var invalidUpdate: CLSError.Code
ClassKit failed to save an updated object in the data store.
static var limits: CLSError.Code
A limit has been exceeded.
static var partialFailure: CLSError.Code
ClassKit encountered more than one error.
enum Code
Error codes that ClassKit issues.
struct CLSErrorUserInfoKey
Keys that appear in the user info dictionary in errors that ClassKit creates.
static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
User info
Type Properties
Relationships
Conforms To


## Page 3

SendableMetatype
let CLSErrorCodeDomain: String
The error domain that ClassKit uses when issuing errors.
enum Code
Error codes that ClassKit issues.
struct CLSErrorUserInfoKey
Keys that appear in the user info dictionary in errors that ClassKit creates.
See Also
Errors


## Page 4

struct CLSError
Errors issued by ClassKit.
enum Code
Error codes that ClassKit issues.
struct CLSErrorUserInfoKey
Keys that appear in the user info dictionary in errors that ClassKit creates.
See Also
Errors
ClassKit / CLSErrorCodeDomain
Global Variable
CLSErrorCodeDomain
The error domain that ClassKit uses when issuing errors.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 5

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


## Page 6

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


## Page 7

struct CLSErrorUserInfoKey
Keys that appear in the user info dictionary in errors that ClassKit creates.


## Page 8

static let objectKey: CLSErrorUserInfoKey
A key whose value is the object that caused the error.
static let successfulObjectsKey: CLSErrorUserInfoKey
static let underlyingErrorsKey: CLSErrorUserInfoKey
A key whose value is the array of errors that contributed to this error.
init(String)
Initializes the key.
init(rawValue: String)
Initializes the key with a value.
Topics
Keys
Initializers
Relationships
ClassKit / CLSErrorUserInfoKey
Structure
CLSErrorUserInfoKey
Keys that appear in the user info dictionary in errors that ClassKit creates.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 9

Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct CLSError
Errors issued by ClassKit.
let CLSErrorCodeDomain: String
The error domain that ClassKit uses when issuing errors.
enum Code
Error codes that ClassKit issues.
Conforms To
See Also
Errors


