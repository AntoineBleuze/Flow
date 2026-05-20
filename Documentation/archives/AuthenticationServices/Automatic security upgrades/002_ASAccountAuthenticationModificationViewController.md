# 002_ASAccountAuthenticationModificationViewController.pdf

## Page 1

Upgrading Account Security With an Account Authentication Modification Extension
Adding an account modification extension lets your app seamlessly upgrade user passwords to
strong passwords, or convert from using passwords to using Sign in with Apple. The entire proces
can be automatic, requiring no user interaction, or you can include interactions, such as two-facto
authentication confirmation.
Note
This class ignores calls from Mac apps built with Mac Catalyst.
Mentioned in
Overview
Topics
Authentication Services / ASAccountAuthenticationModificationViewController
Class
ASAccountAuthenticationModification
ViewController
A view controller that can upgrade user passwords to strong passwords, or conve
accounts to use Sign in with Apple.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
visionOS 1.0+


## Page 2

func convertAccountToSignInWithAppleWithoutUserInteraction(for:
ASCredentialServiceIdentifier, existingCredential: ASPasswordCredential
userInfo: [AnyHashable : Any]?)
Converts an account’s authentication mechanism from using passwords to using Sign in with
Apple.
func prepareInterfaceToConvertAccountToSignInWithApple(for: ASCredentia
ServiceIdentifier, existingCredential: ASPasswordCredential, userInfo: 
AnyHashable : Any]?)
Prepares the view controller’s interface that displays when converting an account that uses
password authentication to use Sign in with Apple.
ASAccountAuthenticationModificationSupportsUpgradeToSignInWithApple
A Boolean value that indicates whether the extension supports upgrading from using
password authentication to using Sign in with Apple.
func changePasswordWithoutUserInteraction(for: ASCredentialService
Identifier, existingCredential: ASPasswordCredential, newPassword:
String, userInfo: [AnyHashable : Any]?)
Upgrades a user’s weak password to a strong password.
func prepareInterfaceToChangePassword(for: ASCredentialServiceIdentifie
, existingCredential: ASPasswordCredential, newPassword: String, user
Info: [AnyHashable : Any]?)
Prepares the view controller’s interface that displays when upgrading from a weak password
to a strong password.
ASAccountAuthenticationModificationSupportsStrongPasswordChange
A Boolean value that indicates whether the extension supports upgrading a user’s password
to a strong password.
ASAccountAuthenticationModificationPasswordGenerationRequirements
The rules the system satisfies when generating a strong password for your extension during
an automatic upgrade.
ASAccountAuthenticationModificationOptOutOfSecurityPromptsOnSignIn
Upgrading to Sign in with Apple
Upgrading to Strong Passwords


## Page 3

A Boolean value that indicates the system shouldn’t show security recommendation prompts
when users sign in using the app.
func cancelRequest()
Cancels a request that the user initiated.
protocol ASAccountAuthenticationModificationControllerDelegate
An interface you implement for receiving success and failure statuses about modification of 
account’s authentication properties.
protocol ASAccountAuthenticationModificationControllerPresentation
ContextProviding
An interface you implement to coordinate presentation of the user interface when modifying
an account’s authentication properties.
var extensionContext: ASAccountAuthenticationModificationExtension
Context
The context your account authentication modification extension uses to provide information 
the system.
UIViewController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
Handling Modification Requests
Getting the Extension Context
Relationships
Inherits From
Conforms To


## Page 4

NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
Upgrading Account Security With an Account Authentication Modification Extension
Automatically and transparently convert accounts to Sign in with Apple or to use strong
passwords for improved security.
class ASAccountAuthenticationModificationController
An object that performs a request to modify an account’s authentication properties.
class ASAccountAuthenticationModificationExtensionContext
An object that you interact with to change an account’s password or to upgrade to Sign in w
Apple.
See Also
Automatic security upgrades


