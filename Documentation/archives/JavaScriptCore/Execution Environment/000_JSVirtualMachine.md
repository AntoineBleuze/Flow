# 000_JSVirtualMachine.pdf

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


