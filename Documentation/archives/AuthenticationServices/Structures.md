# Structures.pdf

## Page 1

init(NSNumber)
init(rawValue: NSNumber)
static let ecdhe_A256GCM: ASAuthorizationProviderExtensionEncryption
Algorithm
A encryption algorithm that uses NIST P-256 elliptic curve key agreement, ConcatKDF key
derivation with a 256-bit digest, and the Advanced Encryption Standard cipher in
Galois/Counter Mode with a key length of 256 bits.
static let hpke_Curve25519_SHA256_ChachaPoly: ASAuthorizationProvider
ExtensionEncryptionAlgorithm
A cipher suite for HPKE that uses X25519 elliptic curve key agreement, SHA-2 key derivation
with a 256-bit digest, and the ChaCha20 stream cipher with the Poly1305 message
authentication code.
static let hpke_P256_SHA256_AES_GCM_256: ASAuthorizationProvider
ExtensionEncryptionAlgorithm
Topics
Initializers
Type Properties
Authentication Services / ASAuthorizationProviderExtensionEncryptionAlgorithm
Structure
ASAuthorizationProviderExtension
EncryptionAlgorithm
macOS 15.0+


## Page 2

A cipher suite for HPKE that uses NIST P-256 elliptic curve key agreement, SHA-2 key
derivation with a 256-bit digest, and the Advanced Encryption Standard cipher in
Galois/Counter Mode with a key length of 256 bits.
static let hpke_P384_SHA384_AES_GCM_256: ASAuthorizationProvider
ExtensionEncryptionAlgorithm
A cipher suite that you use for HPKE using NIST P-384 elliptic curve key agreement, SHA-2
key derivation with a 384-bit digest, and the Advanced Encryption Standard cipher in
Galois/Counter Mode with a key length of 256 bits.
RawRepresentable, Sendable, SendableMetatype
Relationships
Conforms To


## Page 3

Authentication Services / ASAuthorizationProviderExtensionSigningAlgorithm
Structure
ASAuthorizationProviderExtensionSigning
Algorithm
macOS 15.0+


## Page 4

init(NSNumber)
init(rawValue: NSNumber)
static let ed25519: ASAuthorizationProviderExtensionSigningAlgorithm
static let es256: ASAuthorizationProviderExtensionSigningAlgorithm
static let es384: ASAuthorizationProviderExtensionSigningAlgorithm
RawRepresentable, Sendable, SendableMetatype
Topics
Initializers
Type Properties
Relationships
Conforms To


## Page 5

init(scheme: ASAutoFillURLScope.Scheme, host: String, port: Int?, path:
String)
Creates a URL components instance
init?(url: URL)
Initialize with the components of a URL.
var host: String
The host subcomponent.
var path: String
The path subcomponent.
var port: Int?
The port subcomponent.
Topics
Initializers
Instance Properties
Authentication Services / ASAutoFillURLScope
Structure
ASAutoFillURLScope
This structure represents the subset of URL components supported for the AutoF
of credentials.
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
macOS 26.2+
visionOS 26.2+


## Page 6

var scheme: ASAutoFillURLScope.Scheme
The scheme subcomponent of the URL.
var url: URL?
A URL created from the components.
enum Scheme
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Enumerations
Relationships
Conforms To


## Page 7

var value: String
The string representation of the email address.
Sendable, SendableMetatype
Topics
Instance Properties
Relationships
Conforms To
Authentication Services / ASEmailIdentifier
Structure
ASEmailIdentifier
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 8

struct AndroidAppCertificationFingerprint
struct AndroidAppID
An identifier for an Android app.
init(urls: [URL], androidApps: [ASImportableCredentialScope.AndroidAppI
])
var androidApps: [ASImportableCredentialScope.AndroidAppID]
Android apps that are associated with this credential.
var urls: [URL]
URLs where that are associated with this credential.
Topics
Structures
Initializers
Instance Properties
Authentication Services / ASImportableCredentialScope
Structure
ASImportableCredentialScope
The scope for where a credential should be usable.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 9

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Relationships
Conforms To


## Page 10

Examples of editable fields include ASImportableCredential/Basic
Authentication/username and password in ASImportableCredential.Basic
Authentication.
This type is a representation of EditableField as defined in the Credential Exchange Format
(CXF) specification. You can supply a JSON representation of a CXF EditableField to initialize
an instance of this struct by using a JSONDecoder and calling decode(_:from:).
init(id: Data?, fieldType: ASImportableEditableField.FieldType, value:
String, label: String?)
Creates an editable field instance.
var id: Data?
A unique identifier for this editable field.
Overview
Topics
Creating an editable field
Accessing field properties
Authentication Services / ASImportableEditableField
Structure
ASImportableEditableField
A field that someone can edit within a credential.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 11

var fieldType: ASImportableEditableField.FieldType
The type of this editable field.
enum FieldType
An enumeration of editable field types.
var value: String
The value stored in this editable field.
var label: String?
A value describing the field, if any.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
var password: ASImportableEditableField?
The password associated with the credential.
Relationships
Conforms To
See Also
Accessing authentication properties


## Page 12

var value: String
The string representation of the phone number.
Sendable, SendableMetatype
Topics
Instance Properties
Relationships
Conforms To
Authentication Services / ASPhoneNumberIdentifier
Structure
ASPhoneNumberIdentifier
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 13

init(challenge: Data, origin: String, topOrigin: String?, crossOrigin:
ASPublicKeyCredentialClientData.CrossOriginValue?)
var challenge: Data
var crossOrigin: ASPublicKeyCredentialClientData.CrossOriginValue?
var origin: String
var topOrigin: String?
enum CrossOriginValue
Topics
Initializers
Instance Properties
Enumerations
Relationships
Authentication Services / ASPublicKeyCredentialClientData
Structure
ASPublicKeyCredentialClientData
iOS 17.4+
iPadOS 17.4+
Mac Catalyst 16.6+
macOS 13.5+


## Page 14

Sendable, SendableMetatype
Conforms To


## Page 15

func reportAllAcceptedPublicKeyCredentials(relyingPartyIdentifier:
String, userHandle: Data, acceptedCredentialIDs: [Data]) async throws
Report a snapshot of all the credentialIDs that will be accepted for a userHandle.
Credentials not present in the acceptedCredentialIDs may be removed or hidden by a
password manager. Relying party may choose to perform this periodically, e.g. on every sign
in. This information is shared with all password managers enabled in the system.
func reportPublicKeyCredentialUpdate(relyingPartyIdentifier: String,
userHandle: Data, newName: String) async throws
Report an update to a credential’s name, such as when changing the user name on an
account. This information is shared with all password managers enabled in the system.
func reportUnknownPublicKeyCredential(relyingPartyIdentifier: String,
credentialID: Data) async throws
Report that a specific credential is unknown or no longer accepted. The credential may be
removed or hidden by a password manager. This information is shared with all password
managers enabled in the system.
Topics
Instance Methods
Authentication Services / CredentialDataManager
Structure
CredentialDataManager
AuthenticationServices
SwiftUI
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
macOS 26.2+
visionOS 26.2+


## Page 16

func reportUnusedPasswordCredential(domain: String, userName: String)
async throws
Report an unused password credential for a given domain and username. Password manage
may remove or hide the password credential. This information is shared with all password
managers enabled in the system.
func save(password: ASPasswordCredential, for: ASAutoFillURLScope, titl
: String?) async throws
Save or update a password credential to the user’s preferred password manager in the
system.
Sendable, SendableMetatype
Relationships
Conforms To


