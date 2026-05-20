# 001_AuthorizationController.pdf

## Page 1

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


## Page 2

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


## Page 3

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


