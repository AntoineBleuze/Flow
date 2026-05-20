# Dispatch Objects.pdf

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


## Page 4

You use dispatch predicates with the dispatchPrecondition(condition:) method.
case onQueue(DispatchQueue)
A predicate that indicates the evaluated context is the associated dispatch queue.
case onQueueAsBarrier(DispatchQueue)
A predicate that indicates the evaluated context is the associated dispatch queue as part of 
barrier operation.
case notOnQueue(DispatchQueue)
A predicate that indicates the evaluated context is not the associated dispatch queue.
Overview
Topics
Predicates
Relationships
Dispatch / DispatchPredicate
Enumeration
DispatchPredicate
Logical conditions to evaluate within a given execution context.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst
macOS 10.12+
tvOS 10.0+
visionOS
watchOS 3.0+


## Page 5

Sendable, SendableMetatype
class DispatchObject
The base class for most dispatch types.
func dispatchPrecondition(condition: @autoclosure () -> Dispatch
Predicate)
Checks a dispatch condition necessary for further execution.
Dispatch Objects
The basic behaviors supported by all dispatch types.
Conforms To
See Also
Dispatch Objects


## Page 6

condition
A dispatch predicate for the current context to check.
Use this function to detect conditions about the current execution context that must prevent the
program from proceeding even in shipping code.
In playgrounds and -Onone builds (the default for Xcode’s Debug configuration): if conditio
evaluates to false, stop program execution in a debuggable state.
In -O builds (the default for Xcode’s Release configuration): if condition evaluates to false
stop program execution.
In -Ounchecked builds, condition is not evaluated, but the optimizer may assume that it
would evaluate to true. Failure to satisfy that assumption in -Ounchecked builds is a serious
programming error.
Parameters
Discussion
See Also
Dispatch Objects
Dispatch / dispatchPrecondition(condition:)
Function
dispatchPrecondition(condition:)
Checks a dispatch condition necessary for further execution.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst
macOS 10.12+
tvOS 10.0+
visionOS
watchOS 3.0+


## Page 7

class DispatchObject
The base class for most dispatch types.
enum DispatchPredicate
Logical conditions to evaluate within a given execution context.
Dispatch Objects
The basic behaviors supported by all dispatch types.


## Page 8

There are many types of dispatch objects, including dispatch_queue_t, dispatch_group_t
and dispatch_source_t. The base dispatch object interfaces allow you to manage memory,
pause and resume execution, define object context, log task data, and more.
By default, dispatch objects are declared as Objective-C types when you build them with an
Objective-C compiler. This behavior lets you adopt ARC and enable memory leak checks by the
static analyzer. It also lets you add your objects to Cocoa collections.
func activate()
Activates the dispatch object.
func suspend()
Suspends the invocation of block objects on a dispatch object.
func resume()
Resumes the invocation of block objects on a dispatch object.
typealias dispatch_object_t
A dispatch object.
Overview
Topics
Activating, Suspending, and Resuming the Object
Dispatch / Dispatch Objects
API Collection
Dispatch Objects
The basic behaviors supported by all dispatch types.


## Page 9

func setTarget(queue: dispatch_queue_t?)
Specifies the dispatch queue on which to perform work associated with the current object.
class DispatchObject
The base class for most dispatch types.
enum DispatchPredicate
Logical conditions to evaluate within a given execution context.
func dispatchPrecondition(condition: @autoclosure () -> Dispatch
Predicate)
Checks a dispatch condition necessary for further execution.
Changing the Assigned Target Queue
See Also
Dispatch Objects


