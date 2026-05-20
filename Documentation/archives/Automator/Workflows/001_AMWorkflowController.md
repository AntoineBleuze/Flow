# 001_AMWorkflowController.pdf

## Page 1

A controller can run and stop a workflow and obtain information about its state. The controller’s
delegate (AMWorkflowControllerDelegate) receives messages as the workflow is executed
and its actions are run.
You can load and run a workflow with minimal overhead by using the AMWorkflow class method
run(at:withInput:). Use AMWorkflowController where you need greater control, such a
the ability to start and stop the workflow. In that case, you must create and initialize both the
workflow and the workflow controller objects.
var workflow: AMWorkflow?
The controller’s workflow.
var workflowView: AMWorkflowView?
The controller’s workflow view.
Overview
Topics
Accessing the Workflow
Accessing the Workflow View
Automator / AMWorkflowController
Class
AMWorkflowController
An object that lets you manage an Automator workflow in your app.
Mac Catalyst 14.0+
macOS 10.4+


## Page 2

var delegate: (any AMWorkflowControllerDelegate)?
The controller’s delegate.
protocol AMWorkflowControllerDelegate
A set of optional methods that a delegate of a workflow controller implements.
func pause(Any)
Pauses a workflow that’s running.
func reset(Any)
Stops a workflow, clears any action results, and resets the workflow back to an un-run state.
func run(Any)
Runs the associated workflow, after first clearing any results stored by its actions during any
previous run.
func step(Any)
In a paused workflow, runs the next action in the workflow and then pauses again.
func stop(Any)
Stops the associated workflow.
var canRun: Bool
A Boolean value that indicates whether the controller’s workflow is able to run.
var isPaused: Bool
A Boolean value that indicates whether the controller’s workflow is currently paused.
var isRunning: Bool
A Boolean value that indicates whether the controller’s workflow is currently running.
Accessing the Delegate
Controlling the Workflow
Getting Workflow Information
Relationships


## Page 3

NSController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSEditor
NSEditorRegistration
NSObjectProtocol
Sendable
SendableMetatype
class AMWorkflow
An object that lets you use an Automator workflow in your app.
class AMWorkflowView
An object that lets you view and edit Automator workflows in your app.
class AMWorkspace
A workspace for running an Automator workflow.
Inherits From
Conforms To
See Also
Workflows


