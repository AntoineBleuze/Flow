# 000_IdentityDocumentPresentmentError.pdf

## Page 1

let code: IdentityDocumentPresentmentError.Code
The code of the current error.
let debugDescription: String
A debug description that provides additional context about the current error.
static let cancelled: IdentityDocumentPresentmentError.Code
An error that indicates that the current request has been cancelled.
static let invalidRequest: IdentityDocumentPresentmentError.Code
An error that is thrown when an invalid request is provided.
static let notEntitled: IdentityDocumentPresentmentError.Code
An error that indicates the caller is not entitled.
static let requestInProgress: IdentityDocumentPresentmentError.Code
Topics
Instance Properties
Type Properties
IdentityDocumentServices / IdentityDocumentPresentmentError
Structure
IdentityDocumentPresentmentError
An error type that is thrown from the identity document web presentment
controller.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+


## Page 2

An error that indicates that there is currently a request in progress.
static let unknown: IdentityDocumentPresentmentError.Code
An error that indicates that the framework encountered an unknown problem.
enum Code
Specific error codes for identity document web presentment errors.
Error
LocalizedError
Sendable
SendableMetatype
Enumerations
Relationships
Conforms To


