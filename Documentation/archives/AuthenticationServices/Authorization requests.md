# Authorization requests.pdf

## Page 1

Authenticating people by using passkeys in browser apps
Create authorization requests for the credential types your app supports, such as
ASAuthorizationAppleIDRequest for Sign in with Apple, or ASAuthorizationPassword
Request for password credentials. Create an authorization controller using
init(authorizationRequests:), supplying the authorization requests you create. Set the
authorization controller’s delegate to receive responses when requests succeed or fail, and set
its presentationContextProvider so that the authorization controller can present UI.
Call performAutoFillAssistedRequests() to present inline UI to request credentials, or
performRequests() or performRequests(options:) to request credentials using modal 
ASAuthorizationController calls your delegate’s methods when the request completes.
Set the content type of text fields in your app’s login UI so that ASAuthorizationController
can detect when to offer AutoFill suggestions. Use username as the content type for user name
text fields, and password for password fields.
Mentioned in
Overview
Topics
Authentication Services / ASAuthorizationController
Class
ASAuthorizationController
A controller that manages authorization requests that a provider creates.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

init(authorizationRequests: [ASAuthorizationRequest])
Creates a controller from a collection of authorization requests.
class ASAuthorizationRequest
A base class for different kinds of authorization requests.
var authorizationRequests: [ASAuthorizationRequest]
The authorization requests that the controller manages.
var customAuthorizationMethods: [ASAuthorizationCustomMethod]
An array of custom authorization methods for the user to choose.
var presentationContextProvider: (any ASAuthorizationController
PresentationContextProviding)?
A delegate that provides a display context in which the system can present an authorization
interface to the user.
protocol ASAuthorizationControllerPresentationContextProviding
An interface the controller uses to ask a delegate for a presentation context.
func performRequests()
Starts the specified authorization flows during controller initialization.
func performRequests(options: ASAuthorizationController.RequestOptions)
Starts the specified authorization flows during controller initialization.
func performAutoFillAssistedRequests()
Initiates the authorization flows for requests that support AutoFill presentation.
func cancel()
Cancels any active authorization requests.
Creating a controller
Inspecting requests
Presenting requests
Executing requests


## Page 3

struct RequestOptions
Options that modify how a controller performs authorization requests.
var delegate: (any ASAuthorizationControllerDelegate)?
A delegate that the authorization controller informs about the success or failure of an
authorization attempt.
func authorizationController(ASAuthorizationController, didCompleteWith
CustomMethod: ASAuthorizationCustomMethod)
Informs the delegate when authorization completes, and specifies the custom method the
user selected.
protocol ASAuthorizationControllerDelegate
An interface for providing information about the outcome of an authorization request.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Responding to request completion
Relationships
Inherits From
Conforms To
See Also
Authorization requests


## Page 4

struct AuthorizationController
A SwiftUI environment value that views use to perform authorization requests.
enum ASAuthorizationResult
Describes the outcome of a successful authorization request.


## Page 5

To access an instance of this type, use the SwiftUI Environment property wrapper and specify
authorizationController as the environment value, as the following example shows:
Overview
Authentication Services / AuthorizationController
Structure
AuthorizationController
A SwiftUI environment value that views use to perform authorization requests.
AuthenticationServices
SwiftUI
iOS 16.4+
iPadOS 16.4+
Mac Catalyst 16.4+
macOS 13.3+
tvOS 16.4+
visionOS 1.0+
watchOS 9.4+


## Page 6

func performRequest(ASAuthorizationRequest) async throws ->
ASAuthorizationResult
Performs the specified authorization request.
func performRequests([ASAuthorizationRequest]) async throws ->
ASAuthorizationResult
Performs an authorization request from the provided array.
func performRequest(ASAuthorizationRequest, options: ASAuthorization
Controller.RequestOptions) async throws -> ASAuthorizationResult
Performs the specified authorization request with explicit options.
func performRequests([ASAuthorizationRequest], options: ASAuthorization
Controller.RequestOptions) async throws -> ASAuthorizationResult
Performs an authorization request, with explicit options, from the provided array.
func performRequest(ASAuthorizationRequest, customMethods: [
ASAuthorizationCustomMethod]) async throws -> ASAuthorizationResult
Performs the authorization request using a custom authorization method.
func performRequests([ASAuthorizationRequest], customMethods: [
ASAuthorizationCustomMethod]) async throws -> ASAuthorizationResult
Performs an authorization request from the provided array using a custom authorization
method.
func performAutoFillAssistedRequest(ASAuthorizationRequest) async throw
-> ASAuthorizationResult
Performs an AutoFill-assisted authorization request.
Topics
Performing requests
Performing assisted requests


## Page 7

func performAutoFillAssistedRequests([ASAuthorizationRequest]) async 
throws -> ASAuthorizationResult
Performs an AutoFill-assisted authorization request from the provided array.
Sendable, SendableMetatype
class ASAuthorizationController
A controller that manages authorization requests that a provider creates.
enum ASAuthorizationResult
Describes the outcome of a successful authorization request.
Relationships
Conforms To
See Also
Authorization requests


## Page 8

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


## Page 9

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


