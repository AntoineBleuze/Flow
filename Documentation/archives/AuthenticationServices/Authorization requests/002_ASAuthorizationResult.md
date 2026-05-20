# 002_ASAuthorizationResult.pdf

## Page 1

case appleID(ASAuthorizationAppleIDCredential)
A credential from an Apple ID authentication.
case customMethod(ASAuthorizationCustomMethod)
A chosen custom authorization method.
case passkeyAssertion(ASAuthorizationPlatformPublicKeyCredential
Assertion)
A passkey credential from an assertion request.
case passkeyRegistration(ASAuthorizationPlatformPublicKeyCredential
Registration)
A new passkey credential from a registration request.
case password(ASPasswordCredential)
A password credential.
case securityKeyAssertion(ASAuthorizationSecurityKeyPublicKeyCredential
Assertion)
Topics
Authorization results
Authentication Services / ASAuthorizationResult
Enumeration
ASAuthorizationResult
Describes the outcome of a successful authorization request.
AuthenticationServices
SwiftUI
iOS 16.4+
iPadOS 16.4+
Mac Catalyst 16.4+
macOS 13.3+
tvOS 16.4+
visionOS 1.0+
watchOS 9.4+


## Page 2

A security key credential from an assertion request.
case securityKeyRegistration(ASAuthorizationSecurityKeyPublicKey
CredentialRegistration)
A new security key credential from a registration request.
case passkeyAccountCreation(ASAuthorizationAccountCreationPlatformPubli
KeyCredential)
A newly created passkey credential and associated user information resulting from an accou
creation request.
Sendable, SendableMetatype
class ASAuthorizationController
A controller that manages authorization requests that a provider creates.
struct AuthorizationController
A SwiftUI environment value that views use to perform authorization requests.
Enumeration Cases
Relationships
Conforms To
See Also
Authorization requests


