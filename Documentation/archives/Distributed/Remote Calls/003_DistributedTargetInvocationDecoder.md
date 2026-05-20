# 003_DistributedTargetInvocationDecoder.pdf

## Page 1

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


## Page 2

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


## Page 3

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


