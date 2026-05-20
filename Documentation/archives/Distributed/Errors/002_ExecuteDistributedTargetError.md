# 002_ExecuteDistributedTargetError.pdf

## Page 1

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


## Page 2

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


