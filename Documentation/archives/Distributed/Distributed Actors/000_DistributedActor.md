# 000_DistributedActor.pdf

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


