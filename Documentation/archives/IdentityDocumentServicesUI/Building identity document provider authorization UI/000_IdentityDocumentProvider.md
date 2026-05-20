# 000_IdentityDocumentProvider.pdf

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


