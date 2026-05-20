# 002_MobileDocumentRegistration.pdf

## Page 1

Mobile documents, or “mdocs”, are a document format defined in ISO 18013-5.
init(mobileDocumentType: String, supportedAuthorityKeyIdentifiers: [Dat
], documentIdentifier: String, invalidationDate: Date?)
Initializes a mobile document registration.
var invalidationDate: Date?
A date that indicates when the system needs to invalidate this registration.
var mobileDocumentType: String
The type of the mobile document.
var supportedAuthorityKeyIdentifiers: [Data]
Overview
Topics
Initializers
Instance Properties
IdentityDocumentServices / MobileDocumentRegistration
Structure
MobileDocumentRegistration
A type you use to register mobile documents.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 2

A list of authority key identifiers that correspond to relying party authorizers that are trusted
by the document provider app.
IdentityDocumentRegistration, Sendable, SendableMetatype
actor IdentityDocumentProviderRegistrationStore
A store that notifies the system which documents an app has available for presentment.
protocol IdentityDocumentRegistration
A protocol that defines an identity document registration.
Relationships
Conforms To
See Also
Registering as an identity document provider


