# 000_DispatchObject.pdf

## Page 1

There are many types of dispatch objects, including DispatchQueue, DispatchGroup, and
DispatchSource. The base dispatch object interfaces allow you to manage memory, pause and
resume execution, define object context, log task data, and more.
func activate()
Activates the dispatch object.
func resume()
Resumes the invocation of block objects on a dispatch object.
func suspend()
Suspends the invocation of block objects on a dispatch object.
Overview
Topics
Activating, Suspending, and Resuming
Changing the Assigned Target Queue
Dispatch / DispatchObject
Class
DispatchObject
The base class for most dispatch types.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

func setTarget(queue: dispatch_queue_t?)
Specifies the dispatch queue on which to perform work associated with the current object.
OS_object
DispatchGroup
DispatchIO
DispatchQueue
DispatchSemaphore
DispatchSource
CVarArg
Equatable
Hashable
NSObjectProtocol
enum DispatchPredicate
Logical conditions to evaluate within a given execution context.
func dispatchPrecondition(condition: @autoclosure () -> Dispatch
Predicate)
Checks a dispatch condition necessary for further execution.
Dispatch Objects
Relationships
Inherits From
Inherited By
Conforms To
See Also
Dispatch Objects


## Page 3

The basic behaviors supported by all dispatch types.


