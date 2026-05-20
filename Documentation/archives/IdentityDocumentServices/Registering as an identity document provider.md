# Registering as an identity document provider.pdf

## Page 1

Implementing as an identity document provider
The system uses the information you register with this store to appropriately surface your app as
an option during a presentment. When a person registers a document, the authorization UI you
provide through the app’s IdentityDocumentProvider extension needs to handle incoming
requests for that specific document. The app needs to only register documents that are active an
that it can successfully present. If a document becomes inactive, you need to unregister it from th
store.
Note
This API requires the Digital Credentials API - Mobile Document Provider
entitlement for online web presentment.
Mentioned in
Discussion
IdentityDocumentServices / IdentityDocumentProviderRegistrationStore
Class
IdentityDocumentProviderRegistration
Store
A store that notifies the system which documents an app has available for
presentment.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst


## Page 2

init()
Initializes an identity document provider registration store.
func addRegistration(some IdentityDocumentRegistration) async throws
Register a document with the system.
var registrations: [any IdentityDocumentRegistration]
A list of all documents registered with the system.
func removeRegistration(forDocumentIdentifier: String) async throws
Unregister a specific document with the system.
var status: IdentityDocumentProviderRegistrationStore.Status
The status of the registration store.
enum Status
Defines a status for the registration store.
enum RegistrationError
An error type that the identity document registration store and associated types throw.
Actor, Sendable, SendableMetatype
Topics
Registering and removing mobile documents
Defining and getting the status of the mobile document
Errors
Relationships
Conforms To


## Page 3

protocol IdentityDocumentRegistration
A protocol that defines an identity document registration.
struct MobileDocumentRegistration
A type you use to register mobile documents.
See Also
Registering as an identity document provider


## Page 4

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


## Page 5

MobileDocumentRegistration
actor IdentityDocumentProviderRegistrationStore
A store that notifies the system which documents an app has available for presentment.
struct MobileDocumentRegistration
A type you use to register mobile documents.
Conforming Types
See Also
Registering as an identity document provider


## Page 6

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


## Page 7

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


