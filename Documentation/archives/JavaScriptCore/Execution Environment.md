# Execution Environment.pdf

## Page 1

You use this class for two main purposes: to support concurrent JavaScript execution, and to
manage memory for objects that bridge between JavaScript and Objective-C or Swift.
Each JavaScript context (a JSContext object) belongs to a virtual machine. Each virtual machine
can encompass multiple contexts, allowing values (JSValue objects) to pass between contexts.
However, each virtual machine is distinct—you can’t pass a value that you create in one virtual
machine to a context in another virtual machine.
The JavaScriptCore API is thread-safe—for example, you can create JSValue objects or evaluate
scripts from any thread—however, all other threads attempting to use the same virtual machine
must wait. To run JavaScript concurrently on multiple threads, use a separate JSVirtual
Machine instance for each thread.
When you export an Objective-C or Swift object to JavaScript, you must not to store JavaScript
values in that object. This action creates a retain cycle—JSValue objects hold strong references 
their enclosing JavaScript contexts, and JSContext objects hold strong references to the native
objects you export to JavaScript. Instead, use the JSManagedValue class to conditionally retain
JavaScript value, and report the native ownership chain for that managed value to the
Overview
Support Threading and Concurrent JavaScript Execution
Manage Memory for Exported Objects
JavaScriptCore / JSVirtualMachine
Class
JSVirtualMachine
A self-contained environment for JavaScript execution.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 2

JavaScriptCore virtual machine. Use the addManagedReference(_:withOwner:) and remov
ManagedReference(_:withOwner:) methods to describe your native object graph to
JavaScriptCore. After you remove the last managed reference for an object, the JavaScript garba
collector can safely destroy that object.
init!()
Initializes a JavaScript virtual machine.
func addManagedReference(Any!, withOwner: Any!)
Notifies the JavaScriptCore virtual machine of an external object relationship.
func removeManagedReference(Any!, withOwner: Any!)
Notifies the JavaScriptCore virtual machine that a previously registered object relationship n
longer exists.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Topics
Creating a JavaScript Virtual Machine
Managing Memory for Bridged Values
Relationships
Inherits From
Conforms To


## Page 3

class JSContext
A JavaScript execution environment.
See Also
Execution Environment


## Page 4

You create and use JavaScript contexts to evaluate JavaScript scripts from Objective-C or Swift
code; to access values that JavaScript defines or calculates; and to make native objects, methods
or functions accessible to JavaScript.
init!()
Initializes a new JavaScript context.
init!(virtualMachine: JSVirtualMachine!)
Creates a new JavaScript context associated with a specific virtual machine.
var isInspectable: Bool
A Boolean value that indicates whether you can inspect the JavaScript context with Safari
Web Inspector.
Overview
Topics
Creating JavaScript contexts
Making JavaScript context inspectable
JavaScriptCore / JSContext
Class
JSContext
A JavaScript execution environment.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 5

func evaluateScript(String!) -> JSValue!
Executes the specified JavaScript code.
func evaluateScript(String!, withSourceURL: URL!) -> JSValue!
Executes the specified JavaScript code, treating the specified URL as its source location.
class func current() -> JSContext!
Returns the context currently executing JavaScript code.
class func currentCallee() -> JSValue!
Returns the currently executing JavaScript function.
class func currentThis() -> JSValue!
Returns the value of the this keyword in currently executing JavaScript code.
class func currentArguments() -> [Any]!
Returns the arguments to the current native callback from JavaScript code.
var globalObject: JSValue!
The JavaScript global object associated with the context.
var exception: JSValue!
A JavaScript exception to be thrown in evaluation of the script.
var exceptionHandler: ((JSContext?, JSValue?) -> Void)!
A block to be invoked should evaluating a script result in a JavaScript exception being throw
var virtualMachine: JSVirtualMachine!
The JavaScript virtual machine to which the context belongs.
var name: String!
A descriptive name for the context.
Evaluating scripts
Inspecting callback state in a running context
Working with JavaScript global state
Accessing JavaScript global state with subscripts


## Page 6

func objectForKeyedSubscript(Any!) -> JSValue!
Returns the value of the specified JavaScript property in the context’s global object, allowing
subscript getter syntax.
func setObject(Any!, forKeyedSubscript: (any NSCopying & NSObject
Protocol)!)
Sets the specified JavaScript property of the context’s global object, allowing subscript sette
syntax.
var jsGlobalContextRef: JSGlobalContextRef!
Returns the C representation of the JavaScript context.
init!(JSGlobalContextRef: JSGlobalContextRef!)
Creates a JavaScript context object from the equivalent C representation.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Working with the C JavaScriptCore API
Relationships
Inherits From
Conforms To
See Also
Execution Environment


## Page 7

class JSVirtualMachine
A self-contained environment for JavaScript execution.


