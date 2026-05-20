# 001_DDError_Code.pdf

## Page 1

The system returns one of these codes to describe a completed operation by invoking a DDError
Handler that the client provides.
case success
An error that indicates an operation succeeds.
case unknown
An error that indicates an uncategorized problem.
case badParameter
An error that indicates the framework doesn’t support a parameter that the extension
provides.
case unsupported
An error that indicates an unsupported configuration.
Overview
Topics
Errors
DeviceDiscoveryExtension / DDError / DDError.Code
Enumeration
DDError.Code
Codes that identify errors that can occur during the framework’s use.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 2

case timeout
An error that indicates a timeout occurs.
case `internal`
An error that indicates a problem of internal origin.
case missingEntitlement
An error that indicates that the app extension lacks a required entitlement.
case permission
An error that indicates the app extension lacks necessary permissions.
case next
An error the framework reserves for future use.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct DDError
An error that the framework reports.
Initializers
Relationships
Conforms To
See Also
Errors


## Page 3

typealias DDErrorHandler
A function that executes code you provide when an operation returns an error or completes
successfully.
typealias DDErrorOutType
A type for framework functions that return error references.
let DDErrorDomain: String
A unique error domain for the framework.


