# 001_authorizationController___didCompleteWithCustomMethod__.pdf

## Page 1

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


## Page 2

struct ASAuthorizationCustomMethod
The custom authorization method.


