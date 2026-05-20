# 000_DCError.pdf

## Page 1

static var featureUnsupported: DCError.Code
DeviceCheck is not available on this device.
static var invalidInput: DCError.Code
An error code that indicates when your app provides data that isn’t formatted correctly.
static var invalidKey: DCError.Code
An error caused by a failed attempt to use the App Attest key.
static var serverUnavailable: DCError.Code
An error that indicates a failed attempt to contact the App Attest service during an attestatio
static var unknownSystemFailure: DCError.Code
A failure has occurred, such as the failure to generate a token.
enum Code
DeviceCheck error codes.
Topics
Errors
Error information
DeviceCheck / DCError
Structure
DCError
A type that indicates when DeviceCheck encounters an error.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 11.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

static var errorDomain: String
The error domain for errors associated with DeviceCheck APIs.
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
enum Code
DeviceCheck error codes.
let DCErrorDomain: String
The error domain for errors associated with DeviceCheck APIs.
Relationships
Conforms To
See Also
Errors


