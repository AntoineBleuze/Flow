# 003_ASAccountAuthenticationModificationExtensionContext.pdf

## Page 1

Note
This class ignores calls from Mac apps built with Mac Catalyst.
func completeUpgradeToSignInWithApple(userInfo: [AnyHashable : Any]?)
Completes the process of upgrading an account’s authentication credentials from using
passwords to using Sign in with Apple.
func completeChangePasswordRequest(updatedCredential: ASPassword
Credential, userInfo: [AnyHashable : Any]?)
Completes a request to update an account’s authentication credentials from using a weak
password to using a strong password.
Overview
Topics
Handling Requests
Authentication Services / ASAccountAuthenticationModificationExtensionContext
Class
ASAccountAuthenticationModification
ExtensionContext
An object that you interact with to change an account’s password or to upgrade to
Sign in with Apple.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
visionOS 1.0+


## Page 2

func getSignInWithAppleUpgradeAuthorization(state: String?, nonce:
String?, completionHandler: (ASAuthorizationAppleIDCredential?, (any
Error)?) -> Void)
Retrieves the user’s current Sign in with Apple authorization credentials.
func cancelRequest(withError: any Error)
Cancels a request with an error.
let ASExtensionLocalizedFailureReasonErrorKey: String
A key that specifies a string value to show to the user when a request fails.
NSExtensionContext
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Upgrading Account Security With an Account Authentication Modification Extension
Automatically and transparently convert accounts to Sign in with Apple or to use strong
passwords for improved security.
class ASAccountAuthenticationModificationController
Relationships
Inherits From
Conforms To
See Also
Automatic security upgrades


## Page 3

An object that performs a request to modify an account’s authentication properties.
class ASAccountAuthenticationModificationViewController
A view controller that can upgrade user passwords to strong passwords, or convert account
to use Sign in with Apple.


