# 003_IdentityDocumentPresentmentControllerPresentationContextProviding.pdf

## Page 1

func presentationAnchorForPresentmentController(any IdentityDocument
PresentmentControlling) -> IdentityDocumentPresentationAnchor?
Indicates the presentation anchor within which the system presents the controller’s UI to the
presentment controller.
Required
func presentationAnchorForPresentmentController(any IdentityDocument
PresentmentControlling) -> IdentityDocumentPresentationAnchor?
Indicates the presentation anchor within which the system presents the controller’s UI to the
presentment controller.
Required
Topics
Instance Methods
See Also
IdentityDocumentServic… / IdentityDocumentPresentmentControllerPresentationContextProviding
Protocol
IdentityDocumentPresentmentController
PresentationContextProviding
An interface the controller uses to receive a presentation context.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

Implementing as an identity document provider
Add your app as an option for mobile document web presentment.
class IdentityDocumentWebPresentmentController
A controller that performs identity document requests originating from the web.
protocol IdentityDocumentWebPresentmentControllerDelegate
Defines a delegate that the system uses in conjunction with a web presentment controller.
typealias IdentityDocumentPresentationAnchor
The presentation anchor the system uses to present your app UI.
protocol IdentityDocumentPresentmentControlling
A closed protocol that indicates this object is a controller that the system uses for identity
document presentment.
Implementing the web presentment flow into your browser


