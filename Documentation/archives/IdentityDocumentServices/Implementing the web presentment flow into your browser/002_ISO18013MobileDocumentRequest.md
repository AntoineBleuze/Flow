# 002_ISO18013MobileDocumentRequest.pdf

## Page 1

struct DocumentRequest
A request that contains information for requesting a mobile document.
struct DocumentRequestSet
A set of document requests defined in a PresentmentRequest.
struct ElementInfo
A type that contains request information about an element.
struct PresentmentRequest
A type that represents an individual presentment request.
struct RequestAuthentication
A type that contains information for authenticating the incoming request.
Topics
Structures
Initializers
IdentityDocumentServices / ISO18013MobileDocumentRequest
Structure
ISO18013MobileDocumentRequest
A type that represents an incoming ISO 18013-5 mobile document request.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

init(presentmentRequests: [ISO18013MobileDocumentRequest.Presentment
Request], requestAuthentications: [ISO18013MobileDocumentRequest.Reques
Authentication])
Initializes an ISO 18013-5 mobile document request.
var presentmentRequests: [ISO18013MobileDocumentRequest.Presentment
Request]
An array of the presentment requests that exist in the incoming mobile document request.
var requestAuthentications: [ISO18013MobileDocumentRequest.Request
Authentication]
An array that contains information about the authentication of the mobile document request
IdentityDocumentWebPresentmentRequest, Sendable, SendableMetatype
struct IdentityDocumentWebPresentmentRawRequestValidator
A type that contains functions for validating the incoming web presentment raw request.
protocol IdentityDocumentWebPresentmentRequest
A closed protocol that indicates that the system uses this object to perform an identity
document web presentment
protocol IdentityDocumentWebPresentmentResponse
A closed protocol that indicates that the system uses this object to represent a web
presentment response.
Instance Properties
Relationships
Conforms To
See Also
Implementing the web presentment flow into your browser


## Page 3

struct ISO18013MobileDocumentResponse
A type representing the document response from a web presentment request.
struct IdentityDocumentWebPresentmentRawRequest
A struct that defines the type that represents a raw web presentment request.


