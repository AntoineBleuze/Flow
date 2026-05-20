# 000_LocalTestingDistributedActorSystem.pdf

## Page 1

It will crash on any attempt of remote communication, but can be useful for learning about
distributed actor isolation, as well as early prototyping stages of development where a real
system is not necessary yet.
init()
DistributedActorSystem, Sendable, SendableMetatype
Overview
Topics
Initializers
Relationships
Conforms To
Distributed / LocalTestingDistributedActorSystem
Class
LocalTestingDistributedActorSystem
A DistributedActorSystem designed for local only testing.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 2

struct LocalTestingActorID
typealias LocalTestingActorAddress
Deprecated
struct LocalTestingInvocationEncoder
class LocalTestingInvocationDecoder
struct LocalTestingInvocationResultHandler
See Also
Local Testing


