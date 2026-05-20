# 000_customAuthorizationMethods.pdf

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


