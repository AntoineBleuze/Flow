# 001_IdentityDocumentRegistration.pdf

## Page 1

Each kind of document format needs its own concrete type that conforms to this protocol.
var documentIdentifier: String
An identifier that uniquely refers to the required document.
Required
Sendable, SendableMetatype
Discussion
Topics
Instance Properties
Relationships
Inherits From
IdentityDocumentServices / IdentityDocumentRegistration
Protocol
IdentityDocumentRegistration
A protocol that defines an identity document registration.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 2

MobileDocumentRegistration
actor IdentityDocumentProviderRegistrationStore
A store that notifies the system which documents an app has available for presentment.
struct MobileDocumentRegistration
A type you use to register mobile documents.
Conforming Types
See Also
Registering as an identity document provider


