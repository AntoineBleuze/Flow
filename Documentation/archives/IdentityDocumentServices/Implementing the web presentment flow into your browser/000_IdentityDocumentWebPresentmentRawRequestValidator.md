# 000_IdentityDocumentWebPresentmentRawRequestValidator.pdf

## Page 1

init()
Initializes a raw request validator.
func validateISO18013MobileDocumentRequest(Data, origin: URL) throws ->
ISO18013MobileDocumentRequest
Validates an incoming raw ISO 18013-5 request.
Topics
Initializers
Instance Methods
See Also
Implementing the web presentment flow into your browser
IdentityDocumentServices / IdentityDocumentWebPresentmentRawRequestValidator
Structure
IdentityDocumentWebPresentmentRaw
RequestValidator
A type that contains functions for validating the incoming web presentment raw
request.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

protocol IdentityDocumentWebPresentmentRequest
A closed protocol that indicates that the system uses this object to perform an identity
document web presentment
struct ISO18013MobileDocumentRequest
A type that represents an incoming ISO 18013-5 mobile document request.
protocol IdentityDocumentWebPresentmentResponse
A closed protocol that indicates that the system uses this object to represent a web
presentment response.
struct ISO18013MobileDocumentResponse
A type representing the document response from a web presentment request.
struct IdentityDocumentWebPresentmentRawRequest
A struct that defines the type that represents a raw web presentment request.


