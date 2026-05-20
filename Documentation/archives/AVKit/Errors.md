# Errors.pdf

## Page 1

struct AVKitError
A structure that represents a framework error.
enum Code
Constants that identify framework error codes.
See Also
Errors
AVKit / AVKitErrorDomain
Global Variable
AVKitErrorDomain
The domain of errors the framework generates.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 2

static var errorDomain: String
enum Code
Constants that identify framework error codes.
Error Constants
Error code constants for framework operations.
CustomNSError
Equatable
Error
Hashable
Sendable
Topics
Inspecting an Error
Relationships
Conforms To
AVKit / AVKitError
Structure
AVKitError
A structure that represents a framework error.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 3

SendableMetatype
let AVKitErrorDomain: String
The domain of errors the framework generates.
enum Code
Constants that identify framework error codes.
See Also
Errors


## Page 4

case unknown
An unknown error.
case contentRatingUnknown
The media content rating is missing or unrecognized.
case contentDisallowedByPasscode
A restriction disallows access to this content, but the user can override the restriction by
entering the device passcode.
case pictureInPictureStartFailed
The system failed to start Picture in Picture.
case contentDisallowedByProfile
An installed profile restricts access to this content.
Topics
Error Codes
Initializers
AVKit / AVKitError / AVKitError.Code
Enumeration
AVKitError.Code
Constants that identify framework error codes.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 5

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
let AVKitErrorDomain: String
The domain of errors the framework generates.
struct AVKitError
A structure that represents a framework error.
Relationships
Conforms To
See Also
Errors


