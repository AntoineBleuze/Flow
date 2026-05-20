# 003_AMWorkspace.pdf

## Page 1

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


## Page 2

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


