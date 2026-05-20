# Workflows.pdf

## Page 1

A workflow consists of one or more actions, discrete tasks which together can perform complex
automation tasks. Your app can use workflows to package its own features and to take advantage
of features provided by other apps. You create actions with Xcode, while you create workflows wi
the Automator app.
You can load and run a workflow with minimal overhead by using the class method run(at:with
Input:). However, in situations where you need greater control, such as the ability to start and
stop the workflow, you can use an instance of the AMWorkflowController class instead. In tha
case, you must create and initialize both the workflow and the workflow controller objects.
In either case, the workflow runs in a separate process so that any actions it contains are execute
in a separate memory space. That helps to insulate your app from crashes, memory leaks, or
exceptions that might occur from running the actions in the workflow.
You can display a workflow with an instance of AMWorkflowView.
init()
Overview
Topics
Creating a Workflow
Automator / AMWorkflow
Class
AMWorkflow
An object that lets you use an Automator workflow in your app.
Mac Catalyst 14.0+
macOS 10.4+


## Page 2

Creates and initializes a workflow.
convenience init(contentsOf: URL) throws
Creates and initializes a workflow based on the contents of the specified file.
class func run(at: URL, withInput: Any?) throws -> Any
Loads and runs the specified workflow file.
func write(to: URL) throws
Writes the workflow to the specified file.
var actions: [AMAction]
An array of the workflow’s actions.
var fileURL: URL?
A URL that specifies the location of the workflow file.
func valueForVariable(withName: String) -> Any?
Returns the value of the workflow variable with the specified name.
var input: Any?
The input data that is passed to the first action in the workflow.
var output: Any?
The output data that is provided by the last action in the workflow.
func setValue(Any?, forVariableWithName: String) -> Bool
Sets the value of the workflow variable with the specified name.
Running a Workflow
Saving Changes to a Workflow
Getting Information About a Workflow
Working with the Workflow’s Input and Output
Manipulating the Workflow
Manipulating the Workflow’s Actions


## Page 3

func addAction(AMAction)
Adds the specified action at the end of the receiving workflow.
func insertAction(AMAction, at: Int)
Inserts the specified action at the specified position of the receiving workflow.
func moveAction(at: Int, to: Int)
Moves the action from the specified start position to the specified end position in the
receiving workflow.
func removeAction(AMAction)
Removes the specified action from the workflow.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class AMWorkflowController
An object that lets you manage an Automator workflow in your app.
class AMWorkflowView
Relationships
Inherits From
Conforms To
See Also
Workflows


## Page 4

An object that lets you view and edit Automator workflows in your app.
class AMWorkspace
A workspace for running an Automator workflow.


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

A workflow view displays an instance of AMWorkflow.
You can use Interface Builder to add an instance of AMWorkflowView to a window in your app.
You can then add an AMWorkflowView object to the nib window and use the controller’s
workflowView outlet to connect it to the workflow view. The controller object also has run(_:
and stop(_:) actions that can be connected to buttons or other user interface elements.
var isEditable: Bool
A Boolean value that indicates whether the workflow view is editable.
var workflowController: AMWorkflowController?
The view’s workflow controller.
Overview
Topics
Configuring the Workflow View
Automator / AMWorkflowView
Class
AMWorkflowView
An object that lets you view and edit Automator workflows in your app.
Mac Catalyst 14.0+
macOS 10.4+


## Page 9

NSView
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
class AMWorkflow
An object that lets you use an Automator workflow in your app.
class AMWorkflowController
An object that lets you manage an Automator workflow in your app.
class AMWorkspace
Relationships
Inherits From
Conforms To
See Also
Workflows


## Page 10

A workspace for running an Automator workflow.


## Page 11

The AMWorkspace class provides access to the shared workspace in the Automator framework,
where you can run workflows without a workflow controller. Use shared to access the shared
workspace and runWorkflow(atPath:withInput:) to run your workflow in it.
class var shared: AMWorkspace!
The shared workspace object.
func runWorkflow(atPath: String!, withInput: Any!) throws -> Any
Loads and runs the specified workflow file.
Overview
Topics
Accessing the Shared Workspace
Running Workflows
Automator / AMWorkspace
Class
AMWorkspace
A workspace for running an Automator workflow.
Mac Catalyst 14.0+
macOS 10.4+


## Page 12

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class AMWorkflow
An object that lets you use an Automator workflow in your app.
class AMWorkflowController
An object that lets you manage an Automator workflow in your app.
class AMWorkflowView
An object that lets you view and edit Automator workflows in your app.
Relationships
Inherits From
Conforms To
See Also
Workflows


