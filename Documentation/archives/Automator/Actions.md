# Actions.pdf

## Page 1

Automator loads action bundles from standard locations in the file system:
/System/Library/Automator, /Library/Automator, and ~/Library/Automator.
AMBundleAction objects have several important properties:
The Bundle object associated with the action’s physical bundle
The action’s view, which holds its user interface
A parameters dictionary that reflects the settings in the user interface
When you create a Cocoa Automator Action project in Xcode, the project template includes a
custom subclass of AMBundleAction. This custom class uses the name of the project.
You must provide an implementation of run(withInput:), which is declared by the superclass
AMAction. If you add any instance variables, you must override the init(definition:from
Archive:) method and the write(to:) method of AMAction to work with them.
func awakeFromBundle()
Overview
Topics
Initializing the Action
Automator / AMBundleAction
Class
AMBundleAction
An object that represents an Automator action that’s a loadable bundle.
Mac Catalyst 14.0+
macOS 10.4+


## Page 2

Allows the action object to perform setup tasks requiring the presence of all bundle objects.
var bundle: Bundle
The action’s bundle object.
var hasView: Bool
A Boolean value that indicates whether the action has a view associated with it.
var view: NSView?
The action’s view object.
var parameters: NSMutableDictionary?
The action’s parameters.
AMAction
AMAppleScriptAction, AMShellScriptAction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Managing Action Properties
Relationships
Inherits From
Inherited By
Conforms To


## Page 3

class AMShellScriptAction
An object that represents Automator actions whose runtime behavior is driven by a shell scri
or by a Perl or Python script.
class AMAction
An abstract class that defines the interface and general characteristics of Automator actions
See Also
Actions


## Page 4

When you create a Shell Script Automator Action project in Xcode, the project template supplies a
AMShellScriptAction instance as the Principal Class of the action bundle. This ready-made
instance provides a default implementation of the AMAction run(withInput:) method that
uses the logic defined in the script. You can substitute your own subclass of AMShellScript
Action for Principal Class if you need to.
var inputFieldSeparator: String
A string to use as the delimiter between items in the string passed to the action through
standard input.
var outputFieldSeparator: String
A string to use as a delimiter in the string output by the action.
var remapLineEndings: Bool
Overview
Topics
Handling the I/O Separator Character
Automator / AMShellScriptAction
Class
AMShellScriptAction
An object that represents Automator actions whose runtime behavior is driven by
shell script or by a Perl or Python script.
Mac Catalyst 14.0+
macOS 10.4+


## Page 5

A Boolean value that indicates whether you want automatic remapping of carriage return (\r
to newline (\n) characters in the input string.
AMBundleAction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class AMBundleAction
An object that represents an Automator action that’s a loadable bundle.
class AMAction
An abstract class that defines the interface and general characteristics of Automator actions
Relationships
Inherits From
Conforms To
See Also
Actions


## Page 6

Automator is an Apple app that allows users to construct and execute workflows consisting of a
sequence of discrete modules called actions. An action performs a specific task, such as copying
file or cropping an image, and passes its output to Automator to give to the next action in the
workflow. Actions are currently implemented as loadable bundles owned by objects of the
AMBundleAction class, a subclass of AMAction.
The critically important method declared by AMAction is run(withInput:). When Automator
executes a workflow, it sends this message to each action object in the workflow (in workflow
sequence), in most cases passing in the output of the previous action as input. The action object
performs its task in this method and ends by returning an output object for the next action in the
workflow.
Subclassing AMAction is not recommended. For most situations requiring an enhancement to th
Automator framework, it is sufficient to subclass AMBundleAction.
init?(definition: [String : Any]?, fromArchive: Bool)
Overview
Topics
Initializing and Encoding
Automator / AMAction
Class
AMAction
An abstract class that defines the interface and general characteristics of
Automator actions.
Mac Catalyst 14.0+
macOS 10.4+


## Page 7

Initializes the action with the specified definition.
init(contentsOf: URL) throws
Loads an Automator action from a file URL.
func write(to: NSMutableDictionary)
Examines the parameters and other configuration information specified in the passed
dictionary and adds its own information to it if appropriate.
func run(withInput: Any?) throws -> Any
Requests the action to perform its task using the specified input.
func runAsynchronously(withInput: Any?)
Causes Automator to wait for notification that the action has completed execution, which
allows the action to perform an asynchronous operation.
func finishRunningWithError((any Error)?)
Causes the action to stop running and return an error, which, in turn, causes the workflow to
stop.
func willFinishRunning()
Provides an opportunity for an action to perform cleanup operations, such as closing window
and deallocating memory.
func stop()
Stops the action from running.
func reset()
Resets the action to its initial state.
func activated()
Allows the action to synchronize its information with settings in another app.
func opened()
Allows the action to initialize its user interface.
Controlling the Action
Initializing and Synchronizing the Action User Interface
Performing Logging


## Page 8

enum AMLogLevel
Logging levels that Automator supports.
func parametersUpdated()
Requests the action to update its user interface from its stored parameters, which have
changed.
func updateParameters()
Requests the action to update its stored set of parameters from the settings in the action’s
user interface.
var name: String
The name of the action.
var progressValue: CGFloat
A float value between 0 and 1, which indicates how far along the action is while processing.
var ignoresInput: Bool
A Boolean value that indicates whether the action acts upon its input or the input is ignored.
var output: Any?
The action’s output.
var selectedInputType: String?
The type of input, in UTI format, of the input received by the action.
var selectedOutputType: String?
The type of output, in UTI format, of the output to be produced by the action.
var isStopped: Bool
A Boolean value that indicates whether the user clicked the stop button on the parent
workflow.
func closed()
Updating Action Parameters
Getting Action Information
Performing Cleanup Operations


## Page 9

Invoked by Automator when the receiving action is removed from a workflow, allowing it to
perform cleanup operations.
NSObject
AMBundleAction
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class AMBundleAction
An object that represents an Automator action that’s a loadable bundle.
class AMShellScriptAction
An object that represents Automator actions whose runtime behavior is driven by a shell scri
or by a Perl or Python script.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Actions


