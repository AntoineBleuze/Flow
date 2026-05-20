# Remote Calls.pdf

## Page 1

Actor systems generally should treat the identifier as an opaque string, and pass it along to
the remote system for in their remoteCall implementation. Alternative approaches are possible
where the identifiers are either compressed, cached, or represented in other ways, as long as the
recipient system is able to determine which target was intended to be invoked.
The string representation will attempt to pretty print the target identifier, however its exact format
is not specified and may change in future versions.
init(String)
var description: String
Overview
Topics
Initializers
Instance Properties
Distributed / RemoteCallTarget
Structure
RemoteCallTarget
Represents a ‘target’ of a distributed call, such as a distributed func or
distributed computed property. Identification schemes may vary between
systems, and are subject to evolution.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 2

Attempts to pretty format the underlying target identifier. If unable to, returns the raw
underlying identifier.
var identifier: String
The underlying identifier of the target, returned as-is.
CustomStringConvertible, Equatable, Hashable
struct RemoteCallArgument
Represents an argument passed to a distributed call target.
protocol DistributedTargetInvocationEncoder
Used to encode an invocation of a distributed target (method or computed property).
protocol DistributedTargetInvocationDecoder
Decoder that must be provided to executeDistributedTarget and is used by the Swift
runtime to decode arguments of the invocation.
protocol DistributedTargetInvocationResultHandler
Protocol a distributed invocation execution’s result handler.
Relationships
Conforms To
See Also
Remote Calls


## Page 3

init(label: String?, name: String, value: Value)
var effectiveLabel: String
The effective label of this argument. This reflects the semantics of call sites of function
declarations without explicit label definitions in Swift.
let label: String?
The “argument label” of the argument. The label is the name visible name used in external
calls made to this target, e.g. for func hello(label name: String) it is label.
let name: String
The internal name of parameter this argument is accessible as in the function body. It is not
part of the functions API and may change without breaking the target identifier.
let value: Value
Topics
Initializers
Instance Properties
Distributed / RemoteCallArgument
Structure
RemoteCallArgument
Represents an argument passed to a distributed call target.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 4

The value of the argument being passed to the call. As RemoteCallArgument is always
used in conjunction with recordArgument and populated by the compiler, this Value will
generally conform to a distributed actor system’s SerializationRequirement.
struct RemoteCallTarget
Represents a ‘target’ of a distributed call, such as a distributed func or distributed
computed property. Identification schemes may vary between systems, and are subject to
evolution.
protocol DistributedTargetInvocationEncoder
Used to encode an invocation of a distributed target (method or computed property).
protocol DistributedTargetInvocationDecoder
Decoder that must be provided to executeDistributedTarget and is used by the Swift
runtime to decode arguments of the invocation.
protocol DistributedTargetInvocationResultHandler
Protocol a distributed invocation execution’s result handler.
See Also
Remote Calls


## Page 5

On the sending-side an instance of an invocation is constructed by the runtime, and calls to:
recordGenericSubstitution, recordArgument, recordReturnType, recordError
Type, and finally doneRecording are made (in this order).
If the return type of the target is Void the recordReturnType is not invoked.
If the error type thrown by the target is not defined the recordErrorType is not invoked.
An invocation implementation may decide to perform serialization right-away in the record...
invocations, or it may choose to delay doing so until the invocation is passed to the remoteCall
This decision largely depends on if serialization is allowed to happen on the caller’s task, and if an
smarter encoding can be used once all parameter calls have been recorded (e.g. it may be possib
to run-length encode values of certain types etc.)
Once encoded, the system should use some underlying transport mechanism to send the bytes
serialized by the invocation to the remote peer.
Since every actor system is going to deal with a concrete invocation type, they may implement
decoding them whichever way is most optimal for the given system.
Forming an invocation
Decoding an invocation
Distributed / DistributedTargetInvocationEncoder
Protocol
DistributedTargetInvocationEncoder
Used to encode an invocation of a distributed target (method or computed
property).
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 6

Once decided, the invocation must be passed to executeDistributedTarget which will
decode the substitutions, argument values, return and error types (in that order).
Note that the decoding will be provided the specific types that the sending side used to preform
the call, so decoding can rely on simply invoking e.g. Codable (if that is the Serialization
Requirement) decoding entry points on the provided types.
associatedtype SerializationRequirement
The serialization requirement that the types passed to recordArgument and record
ReturnType are required to conform to.
Required
func doneRecording() throws
Invoked to signal to the encoder that no further record... calls will be made on it.
Required
func recordArgument<Value>(RemoteCallArgument<Value>) throws
Record an argument of Argument type. This will be invoked for every argument of the targe
in declaration order.
Required
func recordErrorType<E>(E.Type) throws
Record the error type of the distributed method. This method will not be invoked if the targe
is not throwing.
Required
func recordGenericSubstitution<T>(T.Type) throws
The arguments must be encoded order-preserving, and once decodeGeneric
Substitutions is called, the substitutions must be returned in the same order in which th
were recorded.
Required
func recordReturnType<R>(R.Type) throws
Record the return type of the distributed method. This method will not be invoked if the targ
is returning Void.
Topics
Associated Types
Instance Methods


## Page 7

Required
LocalTestingInvocationEncoder
struct RemoteCallTarget
Represents a ‘target’ of a distributed call, such as a distributed func or distributed
computed property. Identification schemes may vary between systems, and are subject to
evolution.
struct RemoteCallArgument
Represents an argument passed to a distributed call target.
protocol DistributedTargetInvocationDecoder
Decoder that must be provided to executeDistributedTarget and is used by the Swift
runtime to decode arguments of the invocation.
protocol DistributedTargetInvocationResultHandler
Protocol a distributed invocation execution’s result handler.
Relationships
Conforming Types
See Also
Remote Calls


## Page 8

When using an actor system where ActorID is Codable, every distributed actor using that
system is also implicitly Codable (see DistributedActorSystem). Such distributed actors ar
encoded as their ActorID stored in an Encoder/singleValueContainer. When Codable is
being used by such a system, the decodeNextArgument method will be using Decoder to
decode the incoming values, which may themselves be distributed actors.
An actor system must be provided to the Decoder in order for a distributed actor’s
Decodable/init(from:) to be able to return the instance of the actor. Specifically, the
decodedActorID is passed to the actor system’s resolve(id:as:) method in order to return
either a local instance identified by this ID, or creating a remote actor reference. Thus, you must s
the actor system the decoding is performed for, on the decoder’s userInfo, as follows:
Decoding DistributedActor arguments using Codable
Distributed / DistributedTargetInvocationDecoder
Protocol
DistributedTargetInvocationDecoder
Decoder that must be provided to executeDistributedTarget and is used
by the Swift runtime to decode arguments of the invocation.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 9

associatedtype SerializationRequirement
The serialization requirement that the types passed to decodeNextArgument are required
to conform to. The type returned by decodeReturnType is also expected to conform to th
associated type requirement.
Required
func decodeErrorType() throws -> (any Any.Type)?
Decode the specific error type that the distributed invocation target has recorded. Currently
this effectively can only ever be Error.self.
Required
func decodeGenericSubstitutions() throws -> [any Any.Type]
Decode all generic substitutions that were recorded for this invocation.
Required
func decodeNextArgument<Argument>() throws -> Argument
Attempt to decode the next argument from the underlying buffers into pre-allocated storage
pointed at by ‘pointer’.
Required
func decodeReturnType() throws -> (any Any.Type)?
Attempt to decode the known return type of the distributed invocation.
Required
LocalTestingInvocationDecoder
Topics
Associated Types
Instance Methods
Relationships
Conforming Types


## Page 10

struct RemoteCallTarget
Represents a ‘target’ of a distributed call, such as a distributed func or distributed
computed property. Identification schemes may vary between systems, and are subject to
evolution.
struct RemoteCallArgument
Represents an argument passed to a distributed call target.
protocol DistributedTargetInvocationEncoder
Used to encode an invocation of a distributed target (method or computed property).
protocol DistributedTargetInvocationResultHandler
Protocol a distributed invocation execution’s result handler.
See Also
Remote Calls


## Page 11

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


## Page 12

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


