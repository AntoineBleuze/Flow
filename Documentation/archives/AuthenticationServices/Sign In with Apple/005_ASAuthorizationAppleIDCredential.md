# 005_ASAuthorizationAppleIDCredential.pdf

## Page 1

var identityToken: Data?
A JSON Web Token (JWT) that securely communicates information about the user to the ap
var authorizationCode: Data?
A token that the app uses to interact with the server.
var state: String?
An arbitrary string that your app provides to the request that generates the credential.
var user: String
An identifier for the authenticated user.
var authorizedScopes: [ASAuthorization.Scope]
The contact information the user authorized your app to access.
var fullName: PersonNameComponents?
Topics
Identifying a User
Getting Contact Information
Authentication Services / ASAuthorizationAppleIDCredential
Class
ASAuthorizationAppleIDCredential
A credential that results from a successful Apple ID authentication.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

The user’s full name from their Apple ID or a user-submitted value provided from the Sign in
with Apple UI.
var email: String?
The user’s email address.
var realUserStatus: ASUserDetectionStatus
A value that indicates whether the user appears to be a real person.
enum ASUserDetectionStatus
Possible values for the real user indicator.
var userAgeRange: ASUserAgeRange
NSObject
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
Detecting User Characteristics
Instance Properties
Relationships
Inherits From
Conforms To


## Page 3

Implementing User Authentication with Sign in with Apple
Provide a way for users of your app to set up an account and start using your services.
Simplifying User Authentication in a tvOS App
Build a fluid sign-in experience for your tvOS apps using AuthenticationServices.
struct SignInWithAppleButton
A SwiftUI view that creates the Sign in with Apple button for display.
Sign in with Apple Entitlement
An entitlement that lets your app use Sign in with Apple.
class ASAuthorizationAppleIDProvider
A mechanism for generating requests to authenticate users based on their Apple ID.
See Also
Sign In with Apple


