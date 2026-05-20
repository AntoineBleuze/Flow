# 004_ISO18013MobileDocumentResponse.pdf

## Page 1

init(responseData: Data)
Create an ISO 18013 mobile document response.
let responseData: Data
The presentment response data that has a format based on request type.
IdentityDocumentWebPresentmentResponse, Sendable, SendableMetatype
Topics
Initializers
Instance Properties
Relationships
Conforms To
IdentityDocumentServices / ISO18013MobileDocumentResponse
Structure
ISO18013MobileDocumentResponse
A type representing the document response from a web presentment request.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

struct IdentityDocumentWebPresentmentRawRequestValidator
A type that contains functions for validating the incoming web presentment raw request.
protocol IdentityDocumentWebPresentmentRequest
A closed protocol that indicates that the system uses this object to perform an identity
document web presentment
struct ISO18013MobileDocumentRequest
A type that represents an incoming ISO 18013-5 mobile document request.
protocol IdentityDocumentWebPresentmentResponse
A closed protocol that indicates that the system uses this object to represent a web
presentment response.
struct IdentityDocumentWebPresentmentRawRequest
A struct that defines the type that represents a raw web presentment request.
See Also
Implementing the web presentment flow into your browser


