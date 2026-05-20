# Classes.pdf

## Page 1

var contactIdentifier: ASContactIdentifier
The contact identifier provided by the user for the account.
var credentialRegistration: ASAuthorizationPlatformPublicKeyCredential
Registration
The registration response for the newly created passkey.
var name: PersonNameComponents?
Name shared by the user, if requested.
NSObject
Topics
Instance Properties
Relationships
Inherits From
Authentication Services / ASAuthorizationAccountCreationPlatformPublicKeyCredential
Class
ASAuthorizationAccountCreationPlatform
PublicKeyCredential
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

ASAuthorizationCredential
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Conforms To


## Page 3

let acceptedContactIdentifiers: [ASContactIdentifierRequest]
An ordered list of contact identifiers that the user can choose from during account creation.
The order of this list indicates preference. Exactly one contact identifier from this list will be
included in the response.
let challenge: Data
A single-use challenge to be signed by the created passkey.
let relyingPartyIdentifier: String
The Relying Party to register the passkey with, generally a domain name.
let shouldRequestName: Bool
Whether to request the user’s name.
let userID: Data
A stable, opaque identifier for the created account. This will be saved as the userID for the
created passkey.
Topics
Instance Properties
Authentication Services / ASAuthorizationAccountCreationPlatformPublicKeyCredentialRequest
Class
ASAuthorizationAccountCreationPlatform
PublicKeyCredentialRequest
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 4

func encode(with: NSCoder)
ASAuthorizationRequest
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Decodable
Encodable
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Instance Methods
Relationships
Inherits From
Conforms To


## Page 5

init()
func createPlatformPublicKeyCredentialRegistrationRequest(accepted
ContactIdentifiers: [ASContactIdentifierRequest], shouldRequestName:
Bool, relyingPartyIdentifier: String, challenge: Data, userID: Data) ->
ASAuthorizationAccountCreationPlatformPublicKeyCredentialRequest
Create a new account creation request backed by a platform public key credential, i.e. a
passkey.
NSObject
Topics
Initializers
Instance Methods
Relationships
Inherits From
Authentication Services / ASAuthorizationAccountCreationProvider
Class
ASAuthorizationAccountCreationProvider
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 6

ASAuthorizationProvider
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Conforms To


## Page 7

Configuring authentication with the identity provider (IdP)
Registering devices and users
init(loginUserName: String)
var loginUserName: String
func setCustomAssertionRequestBodyClaims([String : Any]) throws
func setCustomAssertionRequestHeaderClaims([String : Any]) throws
func setCustomLoginRequestBodyClaims([String : Any]) throws
Mentioned in
Topics
Initializers
Instance Properties
Instance Methods
Authentication Services / ASAuthorizationProviderExtensionUserLoginConfiguration
Class
ASAuthorizationProviderExtensionUser
LoginConfiguration
macOS 14.0+


## Page 8

func setCustomLoginRequestHeaderClaims([String : Any]) throws
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To


## Page 9

By informing credential managers of new, updated, removed, or revoked credentials, they can sta
synchronized with the credential information of the person using the device.
In order to protect the user’s privacy, ASCredentialDataManager does not indicate whether
the operation succeeded. A successful call only indicates that the parameters passed were well
formed.
init()
func reportAllAcceptedPublicKeyCredentials(relyingPartyIdentifier:
String, userHandle: Data, acceptedCredentialIDs: [Data]) async throws
Report a snapshot of all the credentialIDs that will be accepted for a userHandle.
Credentials not present in the acceptedCredentialIDs may be removed or hidden by a
Overview
Topics
Initializers
Instance Methods
Authentication Services / ASCredentialDataManager
Class
ASCredentialDataManager
This class allows submitting credentials and events to any credential manager
enabled on the system.
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
macOS 26.2+
visionOS 26.2+


## Page 10

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
func reportUnusedPasswordCredential(domain: String, userName: String)
async throws
Report an unused password credential for a given domain and username. Password manage
may remove or hide the password credential. This information is shared with all password
managers enabled in the system.
func save(password: ASPasswordCredential, for: ASAutoFillURLScope, titl
: String?, anchor: ASPresentationAnchor) async throws
Save or update a password credential to the user’s preferred password manager in the
system.


## Page 11

init(serviceIdentifier: ASCredentialServiceIdentifier, passwordField
PasswordRules: String?, confirmPasswordFieldPasswordRules: String?,
passwordRulesFromQuirks: String?)
var confirmPasswordFieldPasswordRules: String?
Developer provided password rules for a “confirm password” field.
var passwordFieldPasswordRules: String?
Developer provided password rules.
var passwordRulesFromQuirks: String?
Password rules from https://github.com/apple/password-manager-resources
var serviceIdentifier: ASCredentialServiceIdentifier
The identifier of the service for which the the credential would be associated.
Topics
Initializers
Instance Properties
Relationships
Authentication Services / ASGeneratePasswordsRequest
Class
ASGeneratePasswordsRequest
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
visionOS 26.2+


## Page 12

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Inherits From
Conforms To


## Page 13

struct Kind
init(kind: ASGeneratedPassword.Kind, value: String)
var kind: ASGeneratedPassword.Kind
The kind of password that this represents.
var localizedName: String
The user-visible description of this password, derived from the kind.
var value: String
The value of the password.
Topics
Structures
Initializers
Instance Properties
Relationships
Authentication Services / ASGeneratedPassword
Class
ASGeneratedPassword
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
visionOS 26.2+


## Page 14

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Inherits From
Conforms To


## Page 15

An ASOneTimeCodeCredentialIdentity is used to describe an identity that can use a service upon
successful one time code based authentication. Use this class to save entries into
ASCredentialIdentityStore.
init(serviceIdentifier: ASCredentialServiceIdentifier, label: String,
recordIdentifier: String?)
var label: String
Overview
Topics
Initializers
Instance Properties
Relationships
Inherits From
Authentication Services / ASOneTimeCodeCredentialIdentity
Class
ASOneTimeCodeCredentialIdentity
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
visionOS 2.0+


## Page 16

NSObject
ASCredentialIdentity
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Conforms To


## Page 17

init(serviceIdentifier: ASCredentialServiceIdentifier, credential:
ASPasswordCredential, sessionID: String, event: ASSavePasswordRequest.
Event)
init(serviceIdentifier: ASCredentialServiceIdentifier, credential:
ASPasswordCredential, sessionID: String, event: ASSavePasswordRequest.
Event, passwordKind: ASGeneratedPassword.Kind?)
init(serviceIdentifier: ASCredentialServiceIdentifier, credential:
ASPasswordCredential, title: String?, sessionID: String, event: ASSave
PasswordRequest.Event)
init(serviceIdentifier: ASCredentialServiceIdentifier, credential:
ASPasswordCredential, title: String?, sessionID: String, event: ASSave
PasswordRequest.Event, passwordKind: ASGeneratedPassword.Kind?)
var credential: ASPasswordCredential
The credential to save.
var event: ASSavePasswordRequest.Event
The type of event that the save request represents.
Topics
Initializers
Instance Properties
Authentication Services / ASSavePasswordRequest
Class
ASSavePasswordRequest
iOS 26.2+
iPadOS 26.2+
Mac Catalyst 26.2+
visionOS 26.2+


## Page 18

var passwordKind: ASGeneratedPassword.Kind?
For passwordFilled events, this is the kind of password that was created.
var serviceIdentifier: ASCredentialServiceIdentifier
The identifier of the service for which the the credential should be associated.
var sessionID: String
An ID that represents a form’s session.
var title: String?
A user-displayable name for the password credential to be saved.
enum Event
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Enumerations
Relationships
Inherits From
Conforms To


