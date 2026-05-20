# 000_AEAssessmentError.pdf

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


