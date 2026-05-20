# 002_IdentityDocumentWebPresentmentControllerDelegate.pdf

## Page 1

func rawRequestsForWebPresentmentController(IdentityDocumentWeb
PresentmentController) async -> [IdentityDocumentWebPresentmentRaw
Request]
A method that allows the calling app to provide the incoming raw web presentment requests
to the web presentment controller.
Required
Implementing as an identity document provider
Add your app as an option for mobile document web presentment.
Topics
Instance Methods
See Also
Implementing the web presentment flow into your browser
IdentityDocumentServic… / IdentityDocumentWebPresentmentControllerDelegate
Protocol
IdentityDocumentWebPresentment
ControllerDelegate
Defines a delegate that the system uses in conjunction with a web presentment
controller.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

class IdentityDocumentWebPresentmentController
A controller that performs identity document requests originating from the web.
protocol IdentityDocumentPresentmentControllerPresentationContext
Providing
An interface the controller uses to receive a presentation context.
typealias IdentityDocumentPresentationAnchor
The presentation anchor the system uses to present your app UI.
protocol IdentityDocumentPresentmentControlling
A closed protocol that indicates this object is a controller that the system uses for identity
document presentment.


