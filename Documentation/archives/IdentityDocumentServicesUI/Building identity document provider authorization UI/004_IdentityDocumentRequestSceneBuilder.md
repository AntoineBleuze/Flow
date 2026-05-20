# 004_IdentityDocumentRequestSceneBuilder.pdf

## Page 1

static func buildBlock(some IdentityDocumentRequestScene) -> some 
IdentityDocumentRequestScene
A result builder that combines one or more identity document request scene`s into a single
scene.
static func buildBlock(some IdentityDocumentRequestScene, some Identity
DocumentRequestScene) -> some IdentityDocumentRequestScene
A result builder that combines one or more identity document request scene`s into a single
scene.
static func buildLimitedAvailability(some IdentityDocumentRequestScene)
-> some IdentityDocumentRequestScene
static func buildOptional((some IdentityDocumentRequestScene)?) -> some
IdentityDocumentRequestScene
Topics
Type Methods
IdentityDocumentServic… / IdentityDocumentRequestSceneBuilder
Structure
IdentityDocumentRequestSceneBuilder
A result builder that combines one or more IdentityDocumentRequest
Scenes into a single scene.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 2

Sendable, SendableMetatype
protocol IdentityDocumentProvider
An app extension that provides an identity document.
protocol IdentityDocumentRequestScene
A scene that indicates support for a specific document request type.
struct ISO18013MobileDocumentRequestScene
struct ISO18013MobileDocumentRequestContext
An object that contains details about the ISO 18013 mobile document request.
Relationships
Conforms To
See Also
Building identity document provider authorization UI


