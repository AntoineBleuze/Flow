# 002_AAAttributionError_Code.pdf

## Page 1

init?(rawValue: Int)
Creates an error code structure with the specified raw value.
case internalError
The server is unable to provide a token because of an internal error.
case networkError
The server is unable to provide a token because the internet isn’t available.
case platformNotSupported
The server is unable to provide a token because of an unsupported operating system.
var localizedDescription: String
Retrieve the localized description for this error.
Topics
Creating an error code
Determining the cause of an error
Getting information about error codes
AdServices / AAAttributionError / AAAttributionError.Code
Enumeration
AAAttributionError.Code
The error code that the parent class issues.
iOS 14.3+
iPadOS 14.3+
Mac Catalyst 14.3+
macOS 11.1+
visionOS 1.0+


## Page 2

func != ((), ()) -> Bool
Returns a Boolean value indicating whether any corresponding components of the two tuple
are not equal.
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct AAAttributionError
The error code that the parent class issues.
let AAAttributionErrorDomain: String
The framework attribution error domain.
Comparing errors
Relationships
Conforms To
See Also
Errors


