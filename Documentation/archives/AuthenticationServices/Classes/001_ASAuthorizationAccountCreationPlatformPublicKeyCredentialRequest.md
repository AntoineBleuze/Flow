# 001_ASAuthorizationAccountCreationPlatformPublicKeyCredentialRequest.pdf

## Page 1

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


## Page 2

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


