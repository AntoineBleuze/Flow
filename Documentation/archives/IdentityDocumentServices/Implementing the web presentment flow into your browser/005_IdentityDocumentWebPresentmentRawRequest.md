# 005_IdentityDocumentWebPresentmentRawRequest.pdf

## Page 1

The system passes this type to the document provider app that the person selects to respond to
the request.
init(requestType: IdentityDocumentWebPresentmentRawRequest.RequestType,
requestData: Data)
Initializes a web presentment raw request.
var requestData: Data
The request data blob for the web presentment raw request.
var requestType: IdentityDocumentWebPresentmentRawRequest.RequestType
The request type for the current request that the system uses to help the document provide
deserialize the request.
Discussion
Topics
Creating an identity document web presentment raw request
IdentityDocumentServices / IdentityDocumentWebPresentmentRawRequest
Structure
IdentityDocumentWebPresentmentRaw
Request
A struct that defines the type that represents a raw web presentment request.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

struct IdentityDocumentWebPresentmentRawRequestValidator
A type that contains functions for validating the incoming web presentment raw request.
enum RequestType
Defines the types of request formats supported by the system.
Sendable, SendableMetatype
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
struct ISO18013MobileDocumentResponse
Validating a web presentment raw request
Enumerations
Relationships
Conforms To
See Also
Implementing the web presentment flow into your browser


## Page 3

A type representing the document response from a web presentment request.


