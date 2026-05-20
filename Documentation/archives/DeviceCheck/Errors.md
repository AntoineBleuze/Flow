# Errors.pdf

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


## Page 3

case featureUnsupported
DeviceCheck is unavailable on this device.
case invalidInput
An error code that indicates when your app provides data that isn’t formatted correctly.
case invalidKey
An error caused by a failed attempt to use the App Attest key.
case serverUnavailable
An error that indicates a failed attempt to contact the App Attest service during an attestatio
case unknownSystemFailure
A failure has occurred, such as the failure to generate a token.
init?(rawValue: Int)
Topics
Error codes
Initializers
DeviceCheck / DCError / DCError.Code
Enumeration
DCError.Code
DeviceCheck error codes.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 11.0+
visionOS 1.0+
watchOS 9.0+


## Page 4

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct DCError
A type that indicates when DeviceCheck encounters an error.
let DCErrorDomain: String
The error domain for errors associated with DeviceCheck APIs.
Relationships
Conforms To
See Also
Errors


## Page 5

struct DCError
A type that indicates when DeviceCheck encounters an error.
enum Code
DeviceCheck error codes.
See Also
Errors
DeviceCheck / DCErrorDomain
Global Variable
DCErrorDomain
The error domain for errors associated with DeviceCheck APIs.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 11.0+
visionOS 1.0+
watchOS 9.0+


