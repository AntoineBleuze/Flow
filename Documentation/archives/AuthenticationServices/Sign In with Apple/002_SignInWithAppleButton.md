# 002_SignInWithAppleButton.pdf

## Page 1

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


## Page 2

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


