# Errors.pdf

## Page 1

static var notImplemented: TKError.Code
The system doesn’t implement the requested functionality.
static var communicationError: TKError.Code
The system had a communication error.
static var corruptedData: TKError.Code
The system idenfitied the data as corrupted.
static var canceledByUser: TKError.Code
The user canceled the operation.
static var authenticationFailed: TKError.Code
Authentication failed.
static var objectNotFound: TKError.Code
The system didn’t find the object.
static var tokenNotFound: TKError.Code
The system didn’t find the token.
Topics
Checking Error Codes
CryptoTokenKit / TKError
Structure
TKError
An error specific to the CryptoTokenKit framework.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

static var badParameter: TKError.Code
An invalid parameter was provided.
static var authenticationNeeded: TKError.Code
Authentication is needed.
static var TKErrorAuthenticationFailed: TKError.Code
Deprecated
static var TKErrorObjectNotFound: TKError.Code
Deprecated
static var TKErrorTokenNotFound: TKError.Code
Deprecated
static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
let TKErrorDomain: String
The domain for all CryptoTokenKit framework errors.
enum Code
Error codes from CryptoTokenKit.
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 3



## Page 4

struct TKError
An error specific to the CryptoTokenKit framework.
enum Code
Error codes from CryptoTokenKit.
See Also
Errors
CryptoTokenKit / TKErrorDomain
Global Variable
TKErrorDomain
The domain for all CryptoTokenKit framework errors.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 5

case notImplemented
The functionality is not implemented.
case communicationError
A communication error occurred.
case corruptedData
The data was corrupted.
case canceledByUser
The operation was canceled by the user.
case authenticationFailed
Authentication failed.
case objectNotFound
The object was not found.
case tokenNotFound
The token was not found.
Topics
Error Codes
CryptoTokenKit / TKError / TKError.Code
Enumeration
TKError.Code
Error codes from CryptoTokenKit.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 6

case badParameter
An invalid parameter was provided.
case authenticationNeeded
Authentication is needed.
static var TKErrorAuthenticationFailed: TKError.Code
Deprecated
static var TKErrorObjectNotFound: TKError.Code
Deprecated
static var TKErrorTokenNotFound: TKError.Code
Deprecated
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct TKError
An error specific to the CryptoTokenKit framework.
let TKErrorDomain: String
The domain for all CryptoTokenKit framework errors.
Initializers
Relationships
Conforms To
See Also
Errors


## Page 7



