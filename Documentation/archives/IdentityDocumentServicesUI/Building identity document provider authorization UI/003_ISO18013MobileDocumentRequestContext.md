# 003_ISO18013MobileDocumentRequestContext.pdf

## Page 1

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


## Page 2

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


