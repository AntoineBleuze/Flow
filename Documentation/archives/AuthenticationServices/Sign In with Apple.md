# Sign In with Apple.pdf

## Page 1

This sample app, Juice, uses the AuthenticationServices framework to provide users an interface 
set up accounts and sign in with their Apple ID. The app presents a form in which the user can
create and set up an account for the app, then authenticates the user’s Apple ID with Sign in with
Apple, and displays the user’s account data.
For more information about implementing Sign in with Apple on iOS 12 and earlier, see
Incorporating Sign in with Apple into Other Platforms.
To configure the sample code project, perform the following steps in Xcode:
1. On the Signing & Capabilities pane, set the bundle ID to a unique identifier (you must change th
bundle ID to proceed).
2. Add your Apple ID account and assign the target to a team so Xcode can enable the Sign in wit
Apple capability with your provisioning profile.
3. Choose a run destination from the scheme pop-up menu that you’re signed into with an Apple 
and that uses Two-Factor Authentication.
4. If necessary, click Register Device in the Signing & Capabilities pane to create the provisioning
profile.
Overview
Configure the Sample Code Project
Authentication Services / Implementing User Authentication with Sign in with Apple
Sample Code
Implementing User Authentication with
Sign in with Apple
Provide a way for users of your app to set up an account and start using your
services.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 11.3+


## Page 2

5. In the toolbar, click Run, or choose Product > Run (⌘R).
In the sample app, LoginViewController displays a login form and a Sign in with Apple butto
(ASAuthorizationAppleIDButton) in its view hierarchy. The view controller also adds itself a
the button’s target, and passes an action to be invoked when the button receives a touch-up even
For more information about which Sign in with Apple buttons are available on different Apple
platforms, see Displaying Sign in with Apple buttons in your app.
Important
When adding the Sign in with Apple button to your storyboard, you must also set the control’s
class value to ASAuthorizationAppleIDButton in Xcode’s Identity Inspector.
When the user taps the Sign in with Apple button, the view controller invokes the handle
AuthorizationAppleIDButtonPress() function, which starts the authentication flow by
performing an authorization request for the users’s full name and email address. The system then
checks whether the user is signed in with their Apple ID on the device. If the user is not signed in 
the system-level, the app presents an alert directing the user to sign in with their Apple ID in
Settings.
Add a Sign in with Apple Button
Request Authorization with Apple ID


## Page 3

Important
The user must enable Two-Factor Authentication to use Sign in with Apple so that access to
the account is secure.
The authorization controller calls the ASAuthorizationControllerPresentationContext
Providing.presentationAnchor(for:) function to get the window from the app where it
presents the Sign in with Apple content to the user in a modal sheet.
If the user is signed in at the system-level with their Apple ID, the sheet appears describing the
Sign in with Apple feature, followed by another sheet allowing the user to edit the information in
their account. The user can edit their first and last name, choose another email address as their
contact information, and hide their email address from the app. If the user chooses to hide their
email address from the app, Apple generates a proxy email address to forward email to the user’s
private email address. Lastly, the user enters the password for the Apple ID, then clicks Continue 
create the account.
If the authentication succeeds, the authorization controller invokes the ASAuthorization
ControllerDelegate.authorizationController(controller:didCompleteWith
Authorization:) delegate function, which the app uses to store the user’s data in the keycha
Handle User Credentials


## Page 4

Note
In your implementation, the ASAuthorizationControllerDelegate.authorization
Controller(controller:didCompleteWithAuthorization:) delegate function
should create an account in your system using the data contained in the user identifier.
If the authentication fails, the authorization controller invokes the ASAuthorization
ControllerDelegate.authorizationController(controller:didCompleteWith
Error:) delegate function to handle the error.
Once the system authenticates the user, the app displays the ResultViewController which
shows the user information requested from the framework, including the user-provided full name
and email address. The view controller also displays a Sign Out button and stores the user data in
the keychain. When the user taps the Sign Out button, the app deletes the user information from
the view controller and the keychain, and presents the LoginViewController to the user.
Request Existing Credentials


## Page 5

The LoginViewController.performExistingAccountSetupFlows() function checks if
the user has an existing account by requesting both an Apple ID and an iCloud keychain password
Similar to handleAuthorizationAppleIDButtonPress(), the authorization controller sets
its presentation content provider and delegate to the LoginViewController object.
The authorizationController(controller:didCompleteWithAuthorization:)
delegate function checks whether the credential is an Apple ID (ASAuthorizationApple
IDCredential) or a password credential (ASPasswordCredential). If the credential is a
password credential, the system displays an alert allowing the user to authenticate with the existin
account.
The sample app only shows the Sign in with Apple user interface when necessary. The app
delegate checks the status of the saved user credentials immediately after launch in the App
Delegate.application(_:didFinishLaunchingWithOptions:) function.
The ASAuthorizationAppleIDProvider.getCredentialState() function retrieves the
state of the user identifier saved in the keychain. If the user granted authorization for the app (for
example, the user is signed into the app with their Apple ID on the device), then the app continue
executing. If the user revoked authorization for the app, or the user’s credential state not found, t
app displays the log in form by invoking the showLoginViewController() function.
Check User Credentials at Launch


## Page 6

Simplifying User Authentication in a tvOS App
Build a fluid sign-in experience for your tvOS apps using AuthenticationServices.
struct SignInWithAppleButton
A SwiftUI view that creates the Sign in with Apple button for display.
Sign in with Apple Entitlement
An entitlement that lets your app use Sign in with Apple.
class ASAuthorizationAppleIDProvider
A mechanism for generating requests to authenticate users based on their Apple ID.
class ASAuthorizationAppleIDCredential
A credential that results from a successful Apple ID authentication.
See Also
Sign In with Apple


## Page 7

Note
This sample code project is associated with WWDC21 session 10279: Simplify sign in for your
tvOS apps.
To configure the sample code project, perform the following steps in Xcode:
1. Add your Apple ID account and assign the target to a team so Xcode can enable the
Associated Domains capability with your provisioning profile.
2. Configure your web credentials domain in the Associated Domains capability and your
website’s associated domains file.
3. Set up an Apple TV running tvOS 15 and an iPhone or iPad running iOS 15 or iPadOS 15.
4. Add the same Apple ID to both devices. Alternatively, you may pair the iPhone or iPad with the
Apple TV.
5. Set the Apple TV as the run destination in the scheme pop-up menu.
6. In the toolbar, click Run, or choose Product > Run.
Overview
Configure the Sample Code Project
Authentication Services / Simplifying User Authentication in a tvOS App
Sample Code
Simplifying User Authentication in a tvOS
App
Build a fluid sign-in experience for your tvOS apps using AuthenticationServices.
Download
tvOS 15.0+
Xcode 13.0+


## Page 8

Implementing User Authentication with Sign in with Apple
Provide a way for users of your app to set up an account and start using your services.
struct SignInWithAppleButton
A SwiftUI view that creates the Sign in with Apple button for display.
Sign in with Apple Entitlement
An entitlement that lets your app use Sign in with Apple.
class ASAuthorizationAppleIDProvider
A mechanism for generating requests to authenticate users based on their Apple ID.
class ASAuthorizationAppleIDCredential
A credential that results from a successful Apple ID authentication.
See Also
Sign In with Apple


## Page 9

For more information about which Sign in with Apple buttons are available on different Apple
platforms, see Displaying Sign in with Apple buttons in your app.
init(SignInWithAppleButton.Label, onRequest: (ASAuthorizationApple
IDRequest) -> Void, onCompletion: (Result<ASAuthorization, any Error>) 
> Void)
Creates a Sign in with Apple button.
struct Label
The label that appears on the button.
struct Style
Discussion
Topics
Creating a button
Authentication Services / SignInWithAppleButton
Structure
SignInWithAppleButton
A SwiftUI view that creates the Sign in with Apple button for display.
AuthenticationServices
SwiftUI
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 10

The structure that defines styles that you use to control the button’s appearance.
Sendable, SendableMetatype, View
Implementing User Authentication with Sign in with Apple
Provide a way for users of your app to set up an account and start using your services.
Simplifying User Authentication in a tvOS App
Build a fluid sign-in experience for your tvOS apps using AuthenticationServices.
Sign in with Apple Entitlement
An entitlement that lets your app use Sign in with Apple.
class ASAuthorizationAppleIDProvider
A mechanism for generating requests to authenticate users based on their Apple ID.
class ASAuthorizationAppleIDCredential
A credential that results from a successful Apple ID authentication.
Relationships
Conforms To
See Also
Sign In with Apple


## Page 11

Key
com.apple.developer.applesignin
Type
Array of strings
Default
The value used for normal operation.
To add this entitlement to your app with the correct associated value, enable the Sign in with App
capability in Xcode. For information about letting users log into your apps and services with their
Apple ID, see ASAuthorizationAppleIDProvider.
Account Creation Requires Phone Number
Details
Possible Values
Discussion
See Also
Authentication
Bundle Resources / Entitlements / Sign in with Apple Entitlement
Property List Key
Sign in with Apple Entitlement
An entitlement that lets your app use Sign in with Apple.
iOS 13.0+
iPadOS 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 12

A Boolean value that indicates whether an app requires someone to provide a phone numbe
to create an account.
Key: com.apple.developer.authentication-services.account-creation-requires-phone-numbe
AutoFill Credential Provider Entitlement
A Boolean value that indicates whether the app may, with user permission, provide user
names and passwords for AutoFill in Safari and other apps.
Key: com.apple.developer.authentication-services.autofill-credential-provider


## Page 13

You use a provider to create a request (ASAuthorizationAppleIDRequest), which you then
use to initialize a controller (ASAuthorizationController) that performs the request:
On success, the controller’s delegate receives an authorization (ASAuthorization) containing 
credential (ASAuthorizationAppleIDCredential) that has an opaque user identifier. You
can use that identifier to later check the user’s credential state—for example, to see if authorizatio
has been revoked—by calling the getCredentialState(forUserID:completion:) metho
Overview
Topics
Authentication Services / ASAuthorizationAppleIDProvider
Class
ASAuthorizationAppleIDProvider
A mechanism for generating requests to authenticate users based on their Apple
ID.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 14

class ASAuthorizationAppleIDButton
A control you add to your interface that enables users to initiate the Sign In with Apple flow.
class WKInterfaceAuthorizationAppleIDButton
A button that you can use to trigger a Sign in with Apple request.
func createRequest() -> ASAuthorizationAppleIDRequest
Creates a new Apple ID authorization request.
class ASAuthorizationAppleIDRequest
An OpenID authorization request that relies on the user’s Apple ID.
class ASAuthorizationOpenIDRequest
An OpenID authorization request.
func getCredentialState(forUserID: String, completion: (ASAuthorization
AppleIDProvider.CredentialState, (any Error)?) -> Void)
Returns the credential state for the given user in a completion handler.
enum CredentialState
Possible values for the credential state of a user.
class let credentialRevokedNotification: NSNotification.Name
A notification that indicates the user’s credentials have been revoked and they should be
signed out.
NSObject
Offering Sign In with Apple
Creating Requests
Getting State
Relationships
Inherits From


## Page 15

ASAuthorizationProvider
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Implementing User Authentication with Sign in with Apple
Provide a way for users of your app to set up an account and start using your services.
Simplifying User Authentication in a tvOS App
Build a fluid sign-in experience for your tvOS apps using AuthenticationServices.
struct SignInWithAppleButton
A SwiftUI view that creates the Sign in with Apple button for display.
Sign in with Apple Entitlement
An entitlement that lets your app use Sign in with Apple.
class ASAuthorizationAppleIDCredential
A credential that results from a successful Apple ID authentication.
Conforms To
See Also
Sign In with Apple


## Page 16

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


## Page 17

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


## Page 18

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


