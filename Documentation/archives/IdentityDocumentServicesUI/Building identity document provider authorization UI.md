# Building identity document provider authorization UI.pdf

## Page 1

Your extension indicates which request types it supports through the provided Identity
DocumentRequestScene concrete types. Based on the request types used by the requesting
party, the system presents the UI provided through your app extension to the user when they sele
your app to respond to a presentment request.
associatedtype Body : IdentityDocumentRequestScene
The type for this provider’s body.
Required
var body: Self.Body
A body containing an identity document scene for each request type the app supports.
Required
Overview
Topics
Associated Types
Instance Properties
IdentityDocumentServic… / IdentityDocumentProvider
Protocol
IdentityDocumentProvider
An app extension that provides an identity document.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 2

func performRegistrationUpdates() async
A function that allows the current app to perform updates to document registrations to ensu
consistency with documents stored in the app.
Required
AppExtension
protocol IdentityDocumentRequestScene
A scene that indicates support for a specific document request type.
struct ISO18013MobileDocumentRequestScene
struct ISO18013MobileDocumentRequestContext
An object that contains details about the ISO 18013 mobile document request.
struct IdentityDocumentRequestSceneBuilder
A result builder that combines one or more IdentityDocumentRequestScenes into a
single scene.
Instance Methods
Relationships
Inherits From
See Also
Building identity document provider authorization UI


## Page 3

The framework provides concrete types for this protocol.
AppExtensionScene
ISO18013MobileDocumentRequestScene
Overview
Relationships
Inherits From
Conforming Types
See Also
Building identity document provider authorization UI
IdentityDocumentServic… / IdentityDocumentRequestScene
Protocol
IdentityDocumentRequestScene
A scene that indicates support for a specific document request type.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 4

protocol IdentityDocumentProvider
An app extension that provides an identity document.
struct ISO18013MobileDocumentRequestScene
struct ISO18013MobileDocumentRequestContext
An object that contains details about the ISO 18013 mobile document request.
struct IdentityDocumentRequestSceneBuilder
A result builder that combines one or more IdentityDocumentRequestScenes into a
single scene.


## Page 5

init(content: (ISO18013MobileDocumentRequestContext) -> Content)
Initialize an ISO 18013 mobile document raw request scene.
AppExtensionScene
IdentityDocumentRequestScene
Sendable
SendableMetatype
Topics
Initializers
Relationships
Conforms To
See Also
IdentityDocumentServic… / ISO18013MobileDocumentRequestScene
Structure
ISO18013MobileDocumentRequestScene
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 6

protocol IdentityDocumentProvider
An app extension that provides an identity document.
protocol IdentityDocumentRequestScene
A scene that indicates support for a specific document request type.
struct ISO18013MobileDocumentRequestContext
An object that contains details about the ISO 18013 mobile document request.
struct IdentityDocumentRequestSceneBuilder
A result builder that combines one or more IdentityDocumentRequestScenes into a
single scene.
Building identity document provider authorization UI


## Page 7

request
requestingWebsiteOrigin
sendResponse(_:)
cancel()
let request: ISO18013MobileDocumentRequest
The incoming ISO 18013 mobile document request.
let requestingWebsiteOrigin: URL?
The origin of the requesting website, if present.
Managing the context
Topics
Instance Properties
Instance Methods
IdentityDocumentServic… / ISO18013MobileDocumentRequestContext
Structure
ISO18013MobileDocumentRequest
Context
An object that contains details about the ISO 18013 mobile document request.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 8

func cancel()
Cancels the current request from the relying party.
func sendResponse((IdentityDocumentWebPresentmentRawRequest) async 
throws -> ISO18013MobileDocumentResponse) async throws
Builds and sends an ISO 18013 mobile document response.
Sendable, SendableMetatype
protocol IdentityDocumentProvider
An app extension that provides an identity document.
protocol IdentityDocumentRequestScene
A scene that indicates support for a specific document request type.
struct ISO18013MobileDocumentRequestScene
struct IdentityDocumentRequestSceneBuilder
A result builder that combines one or more IdentityDocumentRequestScenes into a
single scene.
Relationships
Conforms To
See Also
Building identity document provider authorization UI


## Page 9

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


## Page 10

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


