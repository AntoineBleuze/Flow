# Apple TV authentication.pdf

## Page 1

Custom authorization methods provide a unified interface for signing in to apps, while allowing th
developer to customize the login experience. For example, use other to display a username and
password field, a web-based flow, or a custom user interface.
func authorizationController(ASAuthorizationController, didCompleteWith
CustomMethod: ASAuthorizationCustomMethod)
Informs the delegate when authorization completes, and specifies the custom method the
user selected.
struct ASAuthorizationCustomMethod
The custom authorization method.
Discussion
See Also
Apple TV authentication
Authentication Services / ASAuthorizationController / customAuthorizationMethods
Instance Property
customAuthorizationMethods
An array of custom authorization methods for the user to choose.
tvOS 15.0+


## Page 2

controller
The controller performing the authorization attempt.
method
The custom method the user selected. For a list of custom methods, see ASAuthorizatio
CustomMethod.
var customAuthorizationMethods: [ASAuthorizationCustomMethod]
An array of custom authorization methods for the user to choose.
Parameters
See Also
Apple TV authentication
Authentication Servi… / ASAuthorizationControllerDelegate/ authorizationController(_:didCompleteWithCustomMet
Instance Method
authorizationController(_:didComplete
WithCustomMethod:)
Informs the delegate when authorization completes, and specifies the custom
method the user selected.
tvOS 15.0+


## Page 3

struct ASAuthorizationCustomMethod
The custom authorization method.


## Page 4

Use ASAuthorizationCustomMethod to specify a type of custom sign-in in tvOS, like enablin
the user to sign in manually or by restoring a purchase.
init(rawValue: String)
Initializes the object with a custom authorization method.
static let videoSubscriberAccount: ASAuthorizationCustomMethod
A type of authorization that uses a TV provider account to sign in.
static let restorePurchase: ASAuthorizationCustomMethod
A type of authorization that restores an in-app purchase to sign in.
static let other: ASAuthorizationCustomMethod
Discussion
Topics
Creating the Structure
Getting the Properties
Authentication Services / ASAuthorizationCustomMethod
Structure
ASAuthorizationCustomMethod
The custom authorization method.
tvOS 15.0+


## Page 5

A type of authorization that uses a custom sign-in method.
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
var customAuthorizationMethods: [ASAuthorizationCustomMethod]
An array of custom authorization methods for the user to choose.
func authorizationController(ASAuthorizationController, didCompleteWith
CustomMethod: ASAuthorizationCustomMethod)
Informs the delegate when authorization completes, and specifies the custom method the
user selected.
Relationships
Conforms To
See Also
Apple TV authentication


