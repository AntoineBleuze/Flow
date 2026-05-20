# 008_ASSavePasswordRequest.pdf

## Page 1

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


## Page 2

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


