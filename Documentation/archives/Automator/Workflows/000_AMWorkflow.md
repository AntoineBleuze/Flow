# 000_AMWorkflow.pdf

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


