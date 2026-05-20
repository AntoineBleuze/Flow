# Errors.pdf

## Page 1

static var unknown: AEAssessmentError.Code
The session encountered an unknown error.
static var unsupportedPlatform: AEAssessmentError.Code
The feature isn’t supported on this platform.
enum Code
Error codes that the framework returns if a session fails.
let AEAssessmentErrorDomain: String
A constant representing the error domain that the framework uses when issuing errors.
var notInstalledParticipants: [String]?
var restrictedSystemParticipants: [String]?
Topics
Error codes
Error characteristics
Instance Properties
Automatic Assessment …
/ AEAssessmentError
Structure
AEAssessmentError
Errors issued by an assessment session to its delegate.
iOS 13.4+
iPadOS 13.4+
Mac Catalyst 14.0+
macOS 10.15.4+


## Page 2

static var configurationUpdatesNotSupported: AEAssessmentError.Code
static var errorDomain: String
static var multipleParticipantsNotSupported: AEAssessmentError.Code
static var requiredParticipantsNotAvailable: AEAssessmentError.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
enum Code
Error codes that the framework returns if a session fails.
let AEAssessmentErrorDomain: String
A constant representing the error domain that the framework uses when issuing errors.
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 3

case configurationUpdatesNotSupported
An active session fails to update its configuration because configuration updates are not
supported by the current device or platform.
case multipleParticipantsNotSupported
A session fails to begin or update with a configuration that contains one or more participant
applications because mulitple participant configurations are not supported by the device or
platform.
case unknown
The session encountered an unknown error.
case unsupportedPlatform
The feature isn’t supported on this platform.
case requiredParticipantsNotAvailable
Topics
Possible errors
Enumeration Cases
Automatic Assessment …
/ AEAssessmentError / AEAssessmentError.Code
Enumeration
AEAssessmentError.Code
Error codes that the framework returns if a session fails.
iOS 13.4+
iPadOS 13.4+
Mac Catalyst 14.0+
macOS 10.15.4+


## Page 4

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct AEAssessmentError
Errors issued by an assessment session to its delegate.
let AEAssessmentErrorDomain: String
A constant representing the error domain that the framework uses when issuing errors.
Initializers
Relationships
Conforms To
See Also
Errors


## Page 5

struct AEAssessmentError
Errors issued by an assessment session to its delegate.
enum Code
Error codes that the framework returns if a session fails.
See Also
Errors
Automatic Assessment …
/ AEAssessmentErrorDomain
Global Variable
AEAssessmentErrorDomain
A constant representing the error domain that the framework uses when issuing
errors.
iOS 13.4+
iPadOS 13.4+
Mac Catalyst 14.0+
macOS 10.15.4+


