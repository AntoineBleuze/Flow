# 003_AMError_Code.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

var AMAutomatorErrorDomain: String
A string that identifies the Automator error domain.
var AMActionErrorKey: String
A key to retrieve the action that caused an error.
struct AMError
An Automator error.
Errors


