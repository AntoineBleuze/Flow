# 002_ASAuthorizationCustomMethod.pdf

## Page 1

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


## Page 2

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


