# Errors.pdf

## Page 1

var AMActionErrorKey: String
A key to retrieve the action that caused an error.
struct AMError
An Automator error.
enum Code
Automator error codes.
See Also
Errors
Automator / AMAutomatorErrorDomain
Global Variable
AMAutomatorErrorDomain
A string that identifies the Automator error domain.
Mac Catalyst 14.0+
macOS 10.4+


## Page 2

Use this key to obtain, from the userInfo dictionary of an instance of NSError, a reference to
the action (AMAction) that caused the error.
var AMAutomatorErrorDomain: String
A string that identifies the Automator error domain.
struct AMError
An Automator error.
enum Code
Automator error codes.
Discussion
See Also
Errors
Automator / AMActionErrorKey
Global Variable
AMActionErrorKey
A key to retrieve the action that caused an error.
Mac Catalyst 14.0+
macOS 10.4+


## Page 3

static var workflowActionsNotLoadedError: AMError.Code
An error that indicates one of the actions of the workflow couldn’t be loaded.
static var workflowNewerActionVersionError: AMError.Code
An error that indicates an action in a workflow is newer than the installed action.
static var workflowNewerVersionError: AMError.Code
An error that indicates an attempt to open a workflow document that was saved with a newe
version of Automator.
static var workflowNoEnabledActionsError: AMError.Code
An error that indicates there are no enabled actions in the workflow.
static var workflowOlderActionVersionError: AMError.Code
An error that indicates an action in a workflow is older than the installed action.
static var workflowPropertyListInvalidError: AMError.Code
An error that indicates an attempt to open a workflow document whose property list couldn’
be read.
Topics
Error Codes
Automator / AMError
Structure
AMError
An Automator error.
Mac Catalyst 14.0+
macOS 10.4+


## Page 4

static var userCanceledError: AMError.Code
An error that indicates the user cancelled.
static var actionApplicationResourceError: AMError.Code
An error that indicates an app required by the action is not found.
static var actionApplicationVersionResourceError: AMError.Code
An error that indicates an app required by the action is the wrong version.
static var actionArchitectureMismatchError: AMError.Code
An error that indicates the action’s binary is not compatible with the current processor.
static var actionExceptionError: AMError.Code
An error that indicates an action encounters an exception while running.
static var actionExecutionError: AMError.Code
An error that indicates an action encounters an error while running (reason unknown).
static var actionFailedGatekeeperError: AMError.Code
An error that indicates the action doesn’t meet the Gatekeeper security policy.
static var actionFileResourceError: AMError.Code
An error that indicates a file required by the action is not found.
static var actionInitializationError: AMError.Code
An error that indicates Automator is unable to initialize an action (reason unknown).
static var actionInsufficientDataError: AMError.Code
An error that indicates the action requires input data to run, but none was supplied.
static var actionIsDeprecatedError: AMError.Code
An error that indicates the action has been deprecated.
static var actionLicenseResourceError: AMError.Code
An error that indicates a license required by the action was not found.
static var actionLinkError: AMError.Code
An error that indicates the action’s executable failed to load due to linking issues.
static var actionLoadError: AMError.Code
An error that indicates the action’s executable failed to load.
static var actionMalwareError: AMError.Code


## Page 5

An error that indicates the action has been identified as malware by XProtect.
static var actionNotLoadableError: AMError.Code
An error that indicates the action’s executable is of a type that is not loadable in the current
process.
static var actionPropertyListInvalidError: AMError.Code
An error that indicates the property list for an action is invalid.
static var actionQuarantineError: AMError.Code
An error that indicates action has been quarantined by XProtect, the antimalware system on
the Mac.
static var actionRequiredActionResourceError: AMError.Code
An error that indicates an action required by the action is not loaded.
static var actionRuntimeMismatchError: AMError.Code
An error that indicates an attempt was made to load an action that is not compiled in a way
that is compatible with the current app.
static var actionSignatureCorruptError: AMError.Code
An error that indicates developer signature for this action is corrupted.
static var actionThirdPartyActionsNotAllowedError: AMError.Code
An error that indicates the action is a third party action, and loading it has not been allowed b
the user.
static var actionXPCError: AMError.Code
An error that indicates the remote process running the action has crashed.
static var actionXProtectError: AMError.Code
An error that indicates XProtect is unable to successfully analyze the action.
static var noSuchActionError: AMError.Code
An error that indicates the action could not be located on the system.
static var conversionFailedError: AMError.Code
An error that occurs when, for example, the converter encounters an error converting data
from one type to another.
static var conversionNoDataError: AMError.Code
An error that occurs when the converter determines that the conversion, though possible,
would produce a nil result.


## Page 6

static var conversionNotPossibleError: AMError.Code
An error that occurs when the converter determines that it is unable to convert from one dat
type to another.
enum Code
Automator error codes.
var AMAutomatorErrorDomain: String
A string that identifies the Automator error domain.
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
var AMAutomatorErrorDomain: String
A string that identifies the Automator error domain.
var AMActionErrorKey: String
A key to retrieve the action that caused an error.
enum Code
Automator error codes.
Error Domain
Relationships
Conforms To
See Also
Errors


## Page 7



## Page 8

These constants are NSError code numbers in the Automator error domain (AMAutomator
ErrorDomain). You’ll obtain these error codes from the instances of NSError returned, for
example, by certain methods of AMWorkflow and AMWorkflowController. For related
information, see AMActionErrorKey.
case workflowActionsNotLoadedError
An error that indicates one of the actions of the workflow couldn’t be loaded.
case workflowNewerActionVersionError
An error that indicates an action in a workflow is newer than the installed action.
case workflowNewerVersionError
An error that indicates an attempt to open a workflow document that was saved with a newe
version of Automator.
case workflowNoEnabledActionsError
Overview
Topics
Workflow Errors
Automator / AMError / AMError.Code
Enumeration
AMError.Code
Automator error codes.
Mac Catalyst 14.0+
macOS 10.4+


## Page 9

An error that indicates there are no enabled actions in the workflow.
case workflowOlderActionVersionError
An error that indicates an action in a workflow is older than the installed action.
case workflowPropertyListInvalidError
An error that indicates an attempt to open a workflow document whose property list couldn’
be read.
case userCanceledError
An error that indicates the user cancelled.
case actionApplicationResourceError
An error that indicates an app required by the action is not found.
case actionApplicationVersionResourceError
An error that indicates an app required by the action is the wrong version.
case actionArchitectureMismatchError
An error that indicates the action’s binary is not compatible with the current processor.
case actionExceptionError
An error that indicates an action encounters an exception while running.
case actionExecutionError
An error that indicates an action encounters an error while running (reason unknown).
case actionFailedGatekeeperError
An error that indicates the action doesn’t meet the Gatekeeper security policy.
case actionFileResourceError
An error that indicates a file required by the action is not found.
case actionInitializationError
An error that indicates Automator is unable to initialize an action (reason unknown).
case actionInsufficientDataError
An error that indicates the action requires input data to run, but none was supplied.
Workflow Runtime Errors
Action Errors


## Page 10

case actionIsDeprecatedError
An error that indicates the action has been deprecated.
case actionLicenseResourceError
An error that indicates a license required by the action was not found.
case actionLinkError
An error that indicates the action’s executable failed to load due to linking issues.
case actionLoadError
An error that indicates the action’s executable failed to load.
case actionMalwareError
An error that indicates the action has been identified as malware by XProtect.
case actionNotLoadableError
An error that indicates the action’s executable is of a type that is not loadable in the current
process.
case actionPropertyListInvalidError
An error that indicates the property list for an action is invalid.
case actionQuarantineError
An error that indicates action has been quarantined by XProtect, the antimalware system on
the Mac.
case actionRequiredActionResourceError
An error that indicates an action required by the action is not loaded.
case actionRuntimeMismatchError
An error that indicates an attempt was made to load an action that is not compiled in a way
that is compatible with the current app.
case actionSignatureCorruptError
An error that indicates developer signature for this action is corrupted.
case actionThirdPartyActionsNotAllowedError
An error that indicates the action is a third party action, and loading it has not been allowed b
the user.
case actionXPCError
An error that indicates the remote process running the action has crashed.


## Page 11

case actionXProtectError
An error that indicates XProtect is unable to successfully analyze the action.
case noSuchActionError
An error that indicates the action could not be located on the system.
case conversionFailedError
An error that occurs when, for example, the converter encounters an error converting data
from one type to another.
case conversionNoDataError
An error that occurs when the converter determines that the conversion, though possible,
would produce a nil result.
case conversionNotPossibleError
An error that occurs when the converter determines that it is unable to convert from one dat
type to another.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Data Conversion Errors
Initializers
Relationships
Conforms To
See Also


## Page 12

var AMAutomatorErrorDomain: String
A string that identifies the Automator error domain.
var AMActionErrorKey: String
A key to retrieve the action that caused an error.
struct AMError
An Automator error.
Errors


