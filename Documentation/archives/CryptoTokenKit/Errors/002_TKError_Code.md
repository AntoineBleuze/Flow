# 002_TKError_Code.pdf

## Page 1

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


## Page 2

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


## Page 3



