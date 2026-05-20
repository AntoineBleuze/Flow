# Distributed Actors.pdf

## Page 1

The DistributedActor protocol generalizes over all distributed actor types. Distributed actor
types implicitly conform to this protocol.
It is not possible to conform to this protocol by any other declaration other than a distributed
actor.
It is possible to require a type to conform to the DistributedActor protocol by refining it with
another protocol, or by using a generic constraint.
For every concrete distributed actor declaration, the compiler synthesizes two properties: actor
System and id. They witness the actorSystem and id protocol requirements of the
DistributedActor protocol.
It is not possible to implement these properties explicitly in user code. These properties are
nonisolated and accessible even if the instance is remote, because all distributed actor
references must store the actor system remote calls will be delivered through, as well as the id
identifying the target of those calls.
Overview
Synthesized properties
The ActorSystem associated type
Distributed / DistributedActor
Protocol
DistributedActor
Common protocol to which all distributed actors conform implicitly.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 2

Every distributed actor must declare what type of actor system it is part of by implementing the
ActorSystem associated type requirement.
This causes a number of other properties of the actor to be inferred:
the SerializationRequirement that will be used at compile time to verify distributed
target declarations are well formed,
if the distributed actor is Codable, based on the ID being Codable or not,
the type of the ActorSystem accepted in the synthesized default initializer.
A distributed actor must declare what type of actor system it is ready to work with by fulfilling the
ActorSystem type member requirement:
Since it is fairly common to only be using one specific type of actor system within a module or
entire codebase, it is possible to declare the default type of actor system all distributed actors wil
be using in a module by declaring a DefaultDistributedActorSystem module wide typealia
This declaration makes all distributed actor declarations that do not explicitly specify an
ActorSystem type alias to assume the AmazingActorSystem as their ActorSystem.
It is possible for a specific actor to override the system it is using, by declaring an ActorSystem
type alias as usual:
The DefaultDistributedActorSystem type alias


## Page 3

In general the DefaultDistributedActorSystem should not be declared public, as picking
the default should be left up to each specific module of a project.
While classes and actors receive a synthesized argument-free default initializer (init()),
distributed actors synthesize a default initializer that accepts a distributed actor system the actor
part of: init(actorSystem:).
The accepted actor system must be of the Self.ActorSystem type, which must conform to th
DistributedActorSystem protocol. This is required because distributed actors are always
managed by a concrete distributed actor system and cannot exist on their own without one.
It is possible to explicitly declare a parameter-free initializer (init()), however the actorSyste
property still must be assigned a concrete actor system instance the actor shall be part of.
In general it is recommended to always have an actorSystem parameter as the last non-
defaulted non-closure parameter in every actor’s initializer parameter list. This way it is simple to
swap in a “test actor system” instance in unit tests, and avoid relying on global state which could
make testing more difficult.
Every concrete distributed actor type receives two synthesized properties, which impleme
the protocol requirements of this protocol: id and actorSystem.
The actorSystem property is an important part of every distributed actor’s lifecycle
management.
Both initialization as well as de-initialization require interactions with the actor system, and it is th
actor system that handles all remote interactions of an actor, by both sending or receiving remote
calls made on the actor.
The actorSystem property must be assigned in every designated initializer of a distributed acto
explicitly. It is highly recommended to make it a parameter of every distributed actor initializer, an
simply forward the value to the stored property, like this:
Default initializer
Implicit properties
Property: Actor System


## Page 4

Forgetting to initialize the actor system, will result in a compile time error:
id is assigned by the actor system during the distributed actor’s initialization, and cannot be set 
mutated by the actor itself.
id is the effective identity of the actor, and is used in equality checks, as well as the actor’s
synthesized Codable conformance if the ID type conforms to Codable.
Every distributed actor conforms to the Hashable and Identifiable protocols. Its identity is
strictly driven by its id, and therefore hash and equality implementations directly delegate to the
id property.
Comparing a local distributed actor instance and a remote reference to it (both using the same id
always returns true, as they both conceptually point at the same distributed actor.
It is not possible to implement these protocols relying on the actual actor’s state, because it may
be remote and the state may not be available. In other words, since these protocols must be
implemented using nonisolated functions, only nonisolated id and actorSystem
properties are accessible for their implementations.
If created with an actor system whose ActorID is Codable, the compiler will synthesize code fo
the concrete distributed actor to conform to Codable as well.
Property: Distributed Actor Identity
Automatic Conformances
Hashable and Identifiable conformance
Implicit Codable conformance


## Page 5

This is necessary to support distributed calls where the SerializationRequirement is
Codable and thus users may want to pass actors as arguments to remote calls.
The synthesized implementations use a single SingleValueEncodingContainer to
encode/decode the id property of the actor. The Decoder required Decoder/init(from:) is
implemented by retrieving an actor system from the decoders’ userInfo, effectively like as
follows:
associatedtype ActorSystem : DistributedActorSystem
The type of transport used to communicate with actors of this type.
Required
associatedtype SerializationRequirement
The serialization requirement to apply to all distributed declarations inside the actor.
Required
init(from: any Decoder) throws
Initializes an instance of this distributed actor by decoding its id, and passing it to the
DistributedActorSystem obtained from decoder.userInfo[actorSystemKey].
var actorSystem: Self.ActorSystem
Topics
Associated Types
Initializers
Instance Properties


## Page 6

The DistributedActorSystem that is managing this distributed actor.
Required
var asLocalActor: any Actor
Produces an erased any Actor reference to this known to be local distributed actor.
var id: Self.ID
Logical identity of this distributed actor.
Required
var unownedExecutor: UnownedSerialExecutor
Retrieve the executor for this distributed actor as an optimized, unowned reference. This AP
is equivalent to Actor/unownedExecutor, however, by default, it intentionally returns nil
if this actor is a reference to a remote distributed actor, because the executor for remote
references is effectively never g
Required
func assertIsolated(@autoclosure () -> String, file: StaticString, line
UInt)
Stops program execution if the current task is not executing on this actor’s serial executor.
func assumeIsolated<T>((isolated Self) throws -> T, file: StaticString,
line: UInt) rethrows -> T
Assume that the current task is executing on this (local) distributed actor’s serial executor, o
stop program execution otherwise.
func encode(to: any Encoder) throws
Encodes the actor.id as a single value into the passed encoder.
func preconditionIsolated(@autoclosure () -> String, file: StaticString
line: UInt)
Stops program execution if the current task is not executing on this actor’s serial executor.
func whenLocal<T, E>((isolated Self) async throws(E) -> T) async throws
E) -> T?
Executes the passed ‘body’ only when the distributed actor is local instance.
static func resolve(id: Self.ID, using: Self.ActorSystem) throws -> Sel
Instance Methods
Type Methods


## Page 7

Resolves the passed in id against the system, returning either a local or remote actor
reference.
Required
Equatable
Hashable
Identifiable
Sendable
SendableMetatype
protocol DistributedActorSystem
A distributed actor system underpins and implements all functionality of distributed actors.
macro Resolvable()
Enables the attached to protocol to be resolved as remote distributed actor reference.
func buildDefaultDistributedRemoteActorExecutor<Act>(Act) -> Unowned
SerialExecutor
Obtain the unowned SerialExecutor that is used by by remote distributed actor
references. The executor is shared between all remote default executor remote distributed
actors, and it will crash if any job is enqueued on it.
Relationships
Inherits From
See Also
Distributed Actors


## Page 8

A DistributedActor is always initialized in association with some concrete actor system. That
actor system instance is then used to manage the identity of the actor, as well as handle all remot
interactions of the distributed actor.
From a library user’s perspective (e.g. someone using a ClusterSystem or SampleWebSocket
ActorSystem), the basic use of a distributed actor system is fairly opaque.
Any distributed actor must declare what actor system it is able to operate with. This is done eithe
by a typealias ActorSystem in the body of such distributed actor declaration, or a
module-wide global typealias DefaultDistributedActorSystem. Refer to the
DistributedActor documentation to learn more about the tradeoffs of these approaches.
Once an actor has declared the system it is able to work with, an instance of the system must be
provided at initialization time, in order for the system to be able to take over the actor’s identity
management.
For example, a simple distributed actor may look like this:
Overview
Using a DistributedActorSystem library
Distributed / DistributedActorSystem
Protocol
DistributedActorSystem
A distributed actor system underpins and implements all functionality of
distributed actors.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 9

Notice that every distributed actor initializer must initialize the synthesized actorSystem. This
property is later used for identity management and other remote interactions of the actor. For mo
details refer to DistributedActor which explains more about declaring distributed actors.
For more details about how the specific actor system implementation deals with remote message
transports and serialization, please refer to the specific system’s documentation.
Note
For example, you may refer to the Swift Distributed Actors cluster library documentation, which
is one example of such feature complete distributed actor system implementation.
This section is dedicated to distributed actor system library authors, and generally can be skipped
over by library users, as it explains the interactions of synthesized code and specific distributed
actor system methods and how they must be implemented.
Methods discussed in this section are generally not intended to be called directly, but instead will
have calls generated to them from distributed actor declarations in appropriate places (such as
initializers, distributed func calls, or distributed computed properties).
During a local distributed actor’s initialization (i.e. any init of a distributed actor), the acto
system will be invoked in order to assign an ActorID for this actor.
A call to assignID(_:) is made during the initialization of the distributed actor. The snippet
below showcases this, though no guarantees are made at this point about the exact placement of
this call.
Implementing a DistributedActorSystem
Assigning and Resigning Actor Identifiers


## Page 10

The result of assignID(_:) is then directly stored in the synthesized id property of the actor.
The actor system should assign globally unique identifiers to types, such that they may be proper
resolved from any process in the distributed actor system. The exact shape of the ActorID is lef
up to the library to decide. It can be as small as an integer based identifier, or as large as a series 
key-value pairs identifying the actor.
The actor system must retain a mapping from the ActorID to the specific actor instance which it
is given in actorReady(_:) in order to implement the resolve(id:using:) method, which 
how incoming and outgoing remote calls are made possible.
Users have no control over this assignment, nor are they allowed to set the id property explicitly.
The id is used to implement the distributed actor’s Hashable, Equatable, and even Codable
conformance (which is synthesized if and only if the ActorID is Codable itself).
Tip
Take note that throwing or failable initializers complicate this somewhat. Thankfully, the
compiler will always emit the right code such that every assignID(_:) is balanced with a
resignID(_:) call, when the actor either failed to initialize or deinitialize properly.
It is also possible that a throwing initializer throws before assigning the actorSystem and id
properties. In such case, no assignID nor resignID calls are made. There is no risk of the
compiler ever attempting to call a resignID(_:) without first having assigned given ID.
Manually invoking assignID and resignID is generally not recommended but isn’t strictly a
programmer error, and it is up to the actor system to decide how to deal with such calls.
Once the distributed actor deinitializes, a call to resignID(_:) will be made. Generally th
is made from the distributed actor’s deinit, however in the case of throwing initializers it may al
happen during such failed init, in order to release the ID that is no longer used.


## Page 11

After an ID is resigned, it technically could be used to identify another instance. For example, an
advanced actor system implementation could use such approach to implement actors which are
created “ad-hoc” and always contain the appropriate ID, and if one isn’t allocated yet for such ID, 
could then create one on demand and make sure it is assigned the required ID.
Once a distributed actor has been fully initialized during its initializer, a call to actor
Ready(_:) is synthesized. This call is made after the actor’s properties (including all user-
declared properties) have been initialized, but before other user-defined code in the initializer get
a chance to run.
Note
Generally due to actor initializer isolation rules, users will need to make their initializers async
in order to write code that safely performs extra actions after it has fully initialized.
The actorReady(_) call on the actor system is a signal to the actor system that this actor
instance is now ready and may be resolved and interacted with via the actor system. Generally, a
distributed actor system implementation will weakly retain the actors it has readied, because
retaining them strongly would mean that they will never be deallocated (and thus never resign the
ID’s).
Note
Generally actor systems should retain actors weakly in order to allow them be deinitialized
when no longer in use.
Sometimes though, it can be quite useful to have the system retain certain “well known”
actors, for example when it is expected that other nodes in the distributed system will need to
interact with them, even if end-user code no longer holds strong references to them. An
example of such “retain while actor system is active” distributed actors would be any kind of
actor which implements discovery or health check mechanisms between clustered nodes,
sometimes called “system actors”, i.e. actors that serve the actor system directly.
Next, we will discuss the just mentioned resolve method, which is closely tied to readying actor
An important aspect of any distributed actor system is being able to turn a DistributedActor
type and ActorID into a reference to an actor (instance), regardless where the actor is located.
Readying Distributed Actors
Resolving (potentially remote) Distributed Actors


## Page 12

The ID should have enough information stored to be able to make the decision of where the actor
located, without having to contact remote nodes. Specifically, the implementation of
resolve(id:as:) is not async and should not perform long running or blocking operations in
order to return.
Note
Currently only concrete distributed actors types can be resolved.
The actor system’s resolve(id:as:) method is called by the compiler whenever end-users ca
the DistributedActor‘s resolve(id:using:) method. The return types of those methods
differ, as the actor system’s return type is Act? (and it may throw if unable to resolve the Actor
ID).
The actor system’s resolve returning nil means that the ActorID passed to it refers to a
remote distributed actor. The Swift runtime reacts to this by creating a remote actor reference
(sometimes called a “proxy”).
Finally, calls on a remote distributed actor reference’s distributed methods are turned into
invocations of remoteCall(on:target:invocation:returning:throwing:) (or remot
CallVoid(on:target:invocation:throwing:) for Void returning methods).
Implementing the remote calls correctly and efficiently is the important task for a distributed acto
system library.
Implementations of remote calls generally will serialize actor.id, target and invocation int
some form of wire envelope, and send it over the network (or process boundary) using some
transport mechanism of their choice. As they do so, they need to suspend the remoteCall
function, and resume it once a reply to the call arrives. Unless the transport layer is also
async/await aware, this will often require making use of a CheckedContinuation.
While implementing remote calls please keep in mind any potential failure scenarios that may occ
such as message loss, connection failures and similar issues. Such situations should all be
surfaced by resuming the remoteCall by throwing an error conforming to DistributedActor
SystemError.
While it is not required to conform error thrown out of these methods to DistributedActor
SystemError, the general guideline about conforming errors to this protocol is that errors which
are outside of the user’s control, but are thrown because transport or actor system issues, should
conform to it. This is to simplify separating “business logic errors” from transport errors.
Handling remote calls
Further reading


## Page 13

For an even more in-depth explanation about the inner workings of a distributed actor system, yo
can refer to the following Swift Evolution proposals:
SE-0336: Distributed Actor Isolation
SE-0344: Distributed Actor Runtime
associatedtype ActorID : Hashable, Sendable
The type ID that will be assigned to any distributed actor managed by this actor system.
Required
associatedtype InvocationDecoder : DistributedTargetInvocationDecoder
Type of DistributedTargetInvocationDecoder that should be used when decoding
invocations during executeDistributedTarget(on:target:invocationDecoder:
handler:) calls.
Required
associatedtype InvocationEncoder : DistributedTargetInvocationEncoder
Type of DistributedTargetInvocationEncoder that should be used when the Swift
runtime needs to encode a distributed target call into an encoder, before passing it off to
remoteCall(...).
Required
associatedtype ResultHandler : DistributedTargetInvocationResultHandler
The type of the result handler which will be offered the results returned by a distributed
function invocation called via executeDistributedTarget(on:target:invocation
Decoder:handler:).
Required
associatedtype SerializationRequirement
The serialization requirement that will be applied to all distributed targets used with this
system.
Required
func actorReady<Act>(Act)
Invoked during a distributed actor’s initialization, as soon as it becomes fully initialized.
Topics
Associated Types
Instance Methods


## Page 14

Required
func assignID<Act>(Act.Type) -> Self.ActorID
Assign an ActorID for the passed actor type.
Required
func executeDistributedTarget<Act>(on: Act, target: RemoteCallTarget,
invocationDecoder: inout Self.InvocationDecoder, handler: Self.Result
Handler) async throws
Prepare and execute a call to the distributed function identified by the passed arguments, on
the passed actor, and collect its results using the ResultHandler.
func invokeHandlerOnReturn(handler: Self.ResultHandler, resultBuffer:
UnsafeRawPointer, metatype: any Any.Type) async throws
Implementation synthesized by the compiler. Not intended to be invoked explicitly from user
code!
Required
func makeInvocationEncoder() -> Self.InvocationEncoder
Invoked by the Swift runtime when a distributed remote call is about to be made.
Required
func remoteCall<Act, Err, Res>(on: Act, target: RemoteCallTarget,
invocation: inout Self.InvocationEncoder, throwing: Err.Type, returning
Res.Type) async throws -> Res
Invoked by the Swift runtime when making a remote call.
Required
func remoteCallVoid<Act, Err>(on: Act, target: RemoteCallTarget,
invocation: inout Self.InvocationEncoder, throwing: Err.Type) async 
throws
Invoked by the Swift runtime when making a remote call.
Required
func resignID(Self.ActorID)
Called during when a distributed actor is deinitialized, or fails to initialize completely (e.g. by
throwing out of an init that did not completely initialize all of the actors stored properties
yet).
Required
func resolve<Act>(id: Self.ActorID, as: Act.Type) throws -> Act?
Resolves a local or remote ActorID to a reference to given actor, or throws if unable to.
Required


## Page 15

Sendable, SendableMetatype
LocalTestingDistributedActorSystem
protocol DistributedActor
Common protocol to which all distributed actors conform implicitly.
macro Resolvable()
Enables the attached to protocol to be resolved as remote distributed actor reference.
func buildDefaultDistributedRemoteActorExecutor<Act>(Act) -> Unowned
SerialExecutor
Obtain the unowned SerialExecutor that is used by by remote distributed actor
references. The executor is shared between all remote default executor remote distributed
actors, and it will crash if any job is enqueued on it.
Relationships
Inherits From
Conforming Types
See Also
Distributed Actors


## Page 16

The attached to type must be a protocol that refines the DistributedActor protocol. It must
either specify a concrete ActorSystem or constrain it in such way that the system’s
SerializationRequirement is statically known.
protocol DistributedActor
Common protocol to which all distributed actors conform implicitly.
protocol DistributedActorSystem
A distributed actor system underpins and implements all functionality of distributed actors.
func buildDefaultDistributedRemoteActorExecutor<Act>(Act) -> Unowned
SerialExecutor
Obtain the unowned SerialExecutor that is used by by remote distributed actor
references. The executor is shared between all remote default executor remote distributed
Requirements
See Also
Distributed Actors
Distributed / Resolvable()
Macro
Resolvable()
Enables the attached to protocol to be resolved as remote distributed actor
reference.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 17

actors, and it will crash if any job is enqueued on it.


## Page 18

It is possible to obtain the executor e.g. for logging or general debugging, however attempting to
enqueue work on what might potentially be a remote actor is a programming error and therefore
will crash if the actor is potentially.
If one intends to use a distributed actor’s executor to schedule work on it, one should
programmatically ensure that that actor is local, e.g. using the whenLocal functionality of
distributed actors, or by other means (e.g. “knowing that it definitely must be local”)
protocol DistributedActor
Common protocol to which all distributed actors conform implicitly.
Discussion
See Also
Distributed Actors
Distributed / buildDefaultDistributedRemoteActorExecutor(_:)
Function
buildDefaultDistributedRemoteActor
Executor(_:)
Obtain the unowned SerialExecutor that is used by by remote distributed
actor references. The executor is shared between all remote default executor
remote distributed actors, and it will crash if any job is enqueued on it.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS
watchOS 10.0+


## Page 19

protocol DistributedActorSystem
A distributed actor system underpins and implements all functionality of distributed actors.
macro Resolvable()
Enables the attached to protocol to be resolved as remote distributed actor reference.


