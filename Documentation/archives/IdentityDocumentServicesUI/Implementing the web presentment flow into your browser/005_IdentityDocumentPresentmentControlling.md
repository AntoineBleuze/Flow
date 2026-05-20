# 005_IdentityDocumentPresentmentControlling.pdf

## Page 1

IdentityDocumentWebPresentmentController
Implementing as an identity document provider
Add your app as an option for mobile document web presentment.
class IdentityDocumentWebPresentmentController
A controller that performs identity document requests originating from the web.
protocol IdentityDocumentWebPresentmentControllerDelegate
Defines a delegate that the system uses in conjunction with a web presentment controller.
Relationships
Conforming Types
See Also
Implementing the web presentment flow into your browser
IdentityDocumentServic… / IdentityDocumentPresentmentControlling
Protocol
IdentityDocumentPresentmentControlling
A closed protocol that indicates this object is a controller that the system uses for
identity document presentment.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

protocol IdentityDocumentPresentmentControllerPresentationContext
Providing
An interface the controller uses to receive a presentation context.
typealias IdentityDocumentPresentationAnchor
The presentation anchor the system uses to present your app UI.


