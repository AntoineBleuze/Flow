# 000_DistributedActorCodingError.pdf

## Page 1

Also thrown when an attempt to decode DistributedActor is made, but no Distributed
ActorSystem is available in the Decoder’s userInfo[.actorSystemKey], as it is required t
perform the resolve call.
init(message: String)
let message: String
Overview
Topics
Initializers
Instance Properties
Type Methods
Distributed / DistributedActorCodingError
Structure
DistributedActorCodingError
Error thrown by distributed actor systems while encountering encoding/decoding
issues.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 2

static func missingActorSystemUserInfo<Act>(Act.Type) -> Distributed
ActorCodingError
DistributedActorSystemError
Error
Sendable
SendableMetatype
protocol DistributedActorSystemError
Error protocol to which errors thrown by any DistributedActorSystem should conform.
struct ExecuteDistributedTargetError
Error thrown by executeDistributedTarget(on:target:invocationDecoder:
handler:).
struct LocalTestingDistributedActorSystemError
Relationships
Conforms To
See Also
Errors


