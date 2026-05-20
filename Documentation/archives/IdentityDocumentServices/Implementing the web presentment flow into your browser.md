# Implementing the web presentment flow into your browser.pdf

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


## Page 3

Sendable, SendableMetatype
ISO18013MobileDocumentRequest
struct IdentityDocumentWebPresentmentRawRequestValidator
A type that contains functions for validating the incoming web presentment raw request.
struct ISO18013MobileDocumentRequest
Relationships
Inherits From
Conforming Types
See Also
Implementing the web presentment flow into your browser
IdentityDocumentServices / IdentityDocumentWebPresentmentRequest
Protocol
IdentityDocumentWebPresentment
Request
A closed protocol that indicates that the system uses this object to perform an
identity document web presentment
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 4

A type that represents an incoming ISO 18013-5 mobile document request.
protocol IdentityDocumentWebPresentmentResponse
A closed protocol that indicates that the system uses this object to represent a web
presentment response.
struct ISO18013MobileDocumentResponse
A type representing the document response from a web presentment request.
struct IdentityDocumentWebPresentmentRawRequest
A struct that defines the type that represents a raw web presentment request.


## Page 5

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


## Page 6

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


## Page 7

struct ISO18013MobileDocumentResponse
A type representing the document response from a web presentment request.
struct IdentityDocumentWebPresentmentRawRequest
A struct that defines the type that represents a raw web presentment request.


## Page 8

Sendable, SendableMetatype
ISO18013MobileDocumentResponse
struct IdentityDocumentWebPresentmentRawRequestValidator
A type that contains functions for validating the incoming web presentment raw request.
protocol IdentityDocumentWebPresentmentRequest
Relationships
Inherits From
Conforming Types
See Also
Implementing the web presentment flow into your browser
IdentityDocumentServices / IdentityDocumentWebPresentmentResponse
Protocol
IdentityDocumentWebPresentment
Response
A closed protocol that indicates that the system uses this object to represent a
web presentment response.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 9

A closed protocol that indicates that the system uses this object to perform an identity
document web presentment
struct ISO18013MobileDocumentRequest
A type that represents an incoming ISO 18013-5 mobile document request.
struct ISO18013MobileDocumentResponse
A type representing the document response from a web presentment request.
struct IdentityDocumentWebPresentmentRawRequest
A struct that defines the type that represents a raw web presentment request.


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

A type representing the document response from a web presentment request.


