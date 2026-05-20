# Local Testing.pdf

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


## Page 3

init(id: String)
init(parse: String)
Deprecated
var address: String
Deprecated
let id: String
Decodable
Encodable
Equatable
Hashable
Sendable
Topics
Initializers
Instance Properties
Relationships
Conforms To
Distributed / LocalTestingActorID
Structure
LocalTestingActorID
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 4

SendableMetatype
class LocalTestingDistributedActorSystem
A DistributedActorSystem designed for local only testing.
typealias LocalTestingActorAddress
Deprecated
struct LocalTestingInvocationEncoder
class LocalTestingInvocationDecoder
struct LocalTestingInvocationResultHandler
See Also
Local Testing


## Page 5

class LocalTestingDistributedActorSystem
A DistributedActorSystem designed for local only testing.
struct LocalTestingActorID
struct LocalTestingInvocationEncoder
class LocalTestingInvocationDecoder
struct LocalTestingInvocationResultHandler
See Also
Local Testing
Distributed / LocalTestingActorAddress
Type Alias
LocalTestingActorAddress
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 6

DistributedTargetInvocationEncoder
class LocalTestingDistributedActorSystem
A DistributedActorSystem designed for local only testing.
struct LocalTestingActorID
typealias LocalTestingActorAddress
Deprecated
class LocalTestingInvocationDecoder
struct LocalTestingInvocationResultHandler
Relationships
Conforms To
See Also
Local Testing
Distributed / LocalTestingInvocationEncoder
Structure
LocalTestingInvocationEncoder
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 7

DistributedTargetInvocationDecoder
class LocalTestingDistributedActorSystem
A DistributedActorSystem designed for local only testing.
struct LocalTestingActorID
typealias LocalTestingActorAddress
Deprecated
struct LocalTestingInvocationEncoder
struct LocalTestingInvocationResultHandler
Relationships
Conforms To
See Also
Local Testing
Distributed / LocalTestingInvocationDecoder
Class
LocalTestingInvocationDecoder
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 8

DistributedTargetInvocationResultHandler
class LocalTestingDistributedActorSystem
A DistributedActorSystem designed for local only testing.
struct LocalTestingActorID
typealias LocalTestingActorAddress
Deprecated
struct LocalTestingInvocationEncoder
class LocalTestingInvocationDecoder
Relationships
Conforms To
See Also
Local Testing
Distributed / LocalTestingInvocationResultHandler
Structure
LocalTestingInvocationResultHandler
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


