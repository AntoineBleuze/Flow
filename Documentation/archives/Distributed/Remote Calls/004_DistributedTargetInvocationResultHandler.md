# 004_DistributedTargetInvocationResultHandler.pdf

## Page 1

An instance conforming to this type must be passed when invoking executeDistributed
Target(on:target:invocationDecoder:handler:) while handling an incoming
distributed call.
The handler will then be invoked with the return value (or error) that the invoked target returned (
threw).
associatedtype SerializationRequirement
The serialization requirement that the value passed to onReturn is required to conform to.
Required
func onReturn<Success>(value: Success) async throws
Invoked when the distributed target execution returns successfully. The value is the return
value of the executed distributed invocation target.
Overview
Topics
Associated Types
Instance Methods
Distributed / DistributedTargetInvocationResultHandler
Protocol
DistributedTargetInvocationResultHandle
Protocol a distributed invocation execution’s result handler.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 2

Required
func onReturnVoid() async throws
Invoked when the distributed target execution of a Void returning function has completed
successfully.
Required
func onThrow<Err>(error: Err) async throws
Invoked when the distributed target execution of a target has thrown an error.
Required
LocalTestingInvocationResultHandler
struct RemoteCallTarget
Represents a ‘target’ of a distributed call, such as a distributed func or distributed
computed property. Identification schemes may vary between systems, and are subject to
evolution.
struct RemoteCallArgument
Represents an argument passed to a distributed call target.
protocol DistributedTargetInvocationEncoder
Used to encode an invocation of a distributed target (method or computed property).
protocol DistributedTargetInvocationDecoder
Decoder that must be provided to executeDistributedTarget and is used by the Swift
runtime to decode arguments of the invocation.
Relationships
Conforming Types
See Also
Remote Calls


