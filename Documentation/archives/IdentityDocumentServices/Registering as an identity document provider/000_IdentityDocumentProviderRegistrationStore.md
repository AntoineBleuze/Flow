# 000_IdentityDocumentProviderRegistrationStore.pdf

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


