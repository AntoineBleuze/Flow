# 005_DCAppAttestService.pdf

## Page 1

Establishing your app’s integrity
Validating apps that connect to your server
Use the shared instance of the DCAppAttestService class to assert the legitimacy of a
particular instance of your app to your server. After ensuring service availability by reading the is
Supported property, you use the service to:
Create a cryptographic key in the Secure Enclave by calling the generateKey(completion
Handler:) method.
Ask Apple to certify the key by calling the attestKey(_:clientDataHash:completion
Handler:) method. - Prepare an assertion of your app’s integrity to accompany any or all
server requests using the generateAssertion(_:clientDataHash:completion
Handler:) method.
For more information about how to support App Attest in your app, see Establishing your app’s
integrity. For information about the complementary procedures you implement on your server, see
Validating apps that connect to your server.
Mentioned in
Overview
DeviceCheck / DCAppAttestService
Class
DCAppAttestService
A service that you use to validate the instance of your app running on a device.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 15.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Note
To use the App Attest service, your app must have an app ID that you register on the Apple
Developer website.
class var shared: DCAppAttestService
The shared App Attest service that you use to validate your app.
var isSupported: Bool
A Boolean value that indicates whether a particular device provides the App Attest service.
func generateKey(completionHandler: (String?, (any Error)?) -> Void)
Creates a new cryptographic key for use with the App Attest service.
func attestKey(String, clientDataHash: Data, completionHandler: (Data?,
(any Error)?) -> Void)
Asks Apple to attest to the validity of a generated cryptographic key.
func generateAssertion(String, clientDataHash: Data, completionHandler:
(Data?, (any Error)?) -> Void)
Creates a block of data that demonstrates the legitimacy of an instance of your app running
on a device.
NSObject
Topics
Accessing the service
Preparing a key
Validating the app instance
Relationships
Inherits From


## Page 3

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Establishing your app’s integrity
Ensure that requests your server receives come from legitimate instances of your app.
Validating apps that connect to your server
Verify that connections to your server come from legitimate instances of your app.
Assessing fraud risk
Request and analyze risk data using server-to-server calls.
Preparing to use the app attest service
Test your implementation in a development environment and onboard users gradually.
Attestation Object Validation Guide
Use this guide to validate your implementation of verifying the attestation object verification
process.
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.
Conforms To
See Also
App Attest


