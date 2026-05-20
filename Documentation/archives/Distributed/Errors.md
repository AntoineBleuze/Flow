# Errors.pdf

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


## Page 3

Error, Sendable, SendableMetatype
DistributedActorCodingError, ExecuteDistributedTargetError, 
LocalTestingDistributedActorSystemError
struct DistributedActorCodingError
Error thrown by distributed actor systems while encountering encoding/decoding issues.
struct ExecuteDistributedTargetError
Relationships
Inherits From
Conforming Types
See Also
Errors
Distributed / DistributedActorSystemError
Protocol
DistributedActorSystemError
Error protocol to which errors thrown by any DistributedActorSystem shou
conform.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 4

Error thrown by executeDistributedTarget(on:target:invocationDecoder:
handler:).
struct LocalTestingDistributedActorSystemError


## Page 5

Inspect the errorCode for details about the underlying reason this error was thrown.
init(message: String)
init(message: String, errorCode: ExecuteDistributedTargetError.ErrorCod
)
let errorCode: ExecuteDistributedTargetError.ErrorCode
let message: String
Overview
Topics
Initializers
Instance Properties
Enumerations
Distributed / ExecuteDistributedTargetError
Structure
ExecuteDistributedTargetError
Error thrown by executeDistributedTarget(on:target:invocation
Decoder:handler:).
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 6

enum ErrorCode
DistributedActorSystemError
Error
Sendable
SendableMetatype
struct DistributedActorCodingError
Error thrown by distributed actor systems while encountering encoding/decoding issues.
protocol DistributedActorSystemError
Error protocol to which errors thrown by any DistributedActorSystem should conform.
struct LocalTestingDistributedActorSystemError
Relationships
Conforms To
See Also
Errors


## Page 7

init(message: String)
let message: String
DistributedActorSystemError
Error
Sendable
SendableMetatype
Topics
Initializers
Instance Properties
Relationships
Conforms To
See Also
Distributed / LocalTestingDistributedActorSystemError
Structure
LocalTestingDistributedActorSystemError
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS
watchOS 9.0+


## Page 8

struct DistributedActorCodingError
Error thrown by distributed actor systems while encountering encoding/decoding issues.
protocol DistributedActorSystemError
Error protocol to which errors thrown by any DistributedActorSystem should conform.
struct ExecuteDistributedTargetError
Error thrown by executeDistributedTarget(on:target:invocationDecoder:
handler:).
Errors


