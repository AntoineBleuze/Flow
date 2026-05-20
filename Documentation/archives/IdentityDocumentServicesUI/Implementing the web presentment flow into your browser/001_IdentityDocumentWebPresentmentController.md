# 001_IdentityDocumentWebPresentmentController.pdf

## Page 1

init()
Initialize a web presentment controller.
var delegate: (any IdentityDocumentWebPresentmentControllerDelegate)?
A delegate that provides information for the controller to perform a web presentment.
var presentationContextProvider: (any IdentityDocumentPresentment
ControllerPresentationContextProviding)?
A delegate that provides a display context in which the system can present an authorization
interface to the user.
Topics
Initializers
Instance Properties
Instance Methods
IdentityDocumentServic… / IdentityDocumentWebPresentmentController
Class
IdentityDocumentWebPresentment
Controller
A controller that performs identity document requests originating from the web.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

func performRequests([any IdentityDocumentWebPresentmentRequest], origi
: URL) async throws -> any IdentityDocumentWebPresentmentResponse
Performs an identity document request.
IdentityDocumentPresentmentControlling, Sendable, SendableMetatype
Implementing as an identity document provider
Add your app as an option for mobile document web presentment.
protocol IdentityDocumentWebPresentmentControllerDelegate
Defines a delegate that the system uses in conjunction with a web presentment controller.
protocol IdentityDocumentPresentmentControllerPresentationContext
Providing
An interface the controller uses to receive a presentation context.
typealias IdentityDocumentPresentationAnchor
The presentation anchor the system uses to present your app UI.
protocol IdentityDocumentPresentmentControlling
A closed protocol that indicates this object is a controller that the system uses for identity
document presentment.
Relationships
Conforms To
See Also
Implementing the web presentment flow into your browser


