# 002_DistributedTargetInvocationEncoder.pdf

## Page 1

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


## Page 2

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


## Page 3

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


