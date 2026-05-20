# Errors.pdf

## Page 1

enum Code
Codes that identify errors that can occur during the framework’s use.
static var success: DDError.Code
An error that indicates an operation succeeds.
static var unknown: DDError.Code
An error that indicates an uncategorized problem.
static var badParameter: DDError.Code
An error that indicates the framework doesn’t support a parameter that the extension
provides.
static var unsupported: DDError.Code
An error that indicates an unsupported configuration.
static var timeout: DDError.Code
An error that indicates a timeout occurs.
static var `internal`: DDError.Code
Topics
Identifying an error cause
DeviceDiscoveryExtension / DDError
Structure
DDError
An error that the framework reports.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 2

An error that indicates a problem of internal origin.
static var missingEntitlement: DDError.Code
An error that indicates that the app extension lacks a required entitlement.
static var permission: DDError.Code
An error that indicates the app extension lacks necessary permissions.
static var next: DDError.Code
An error the framework reserves for future use.
static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
enum Code
Codes that identify errors that can occur during the framework’s use.
typealias DDErrorHandler
A function that executes code you provide when an operation returns an error or completes
successfully.
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 3

typealias DDErrorOutType
A type for framework functions that return error references.
let DDErrorDomain: String
A unique error domain for the framework.


## Page 4

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


## Page 5

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


## Page 6

typealias DDErrorHandler
A function that executes code you provide when an operation returns an error or completes
successfully.
typealias DDErrorOutType
A type for framework functions that return error references.
let DDErrorDomain: String
A unique error domain for the framework.


## Page 7

inError
A reference that the framework assigns an error object when the operation fails. When the
operation succeeds, the value may be nil or DDError.Code.success.
struct DDError
An error that the framework reports.
enum Code
Codes that identify errors that can occur during the framework’s use.
typealias DDErrorOutType
A type for framework functions that return error references.
let DDErrorDomain: String
Parameters
See Also
Errors
DeviceDiscoveryExtension / DDErrorHandler
Type Alias
DDErrorHandler
A function that executes code you provide when an operation returns an error or
completes successfully.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 8

A unique error domain for the framework.


## Page 9

struct DDError
An error that the framework reports.
enum Code
Codes that identify errors that can occur during the framework’s use.
typealias DDErrorHandler
A function that executes code you provide when an operation returns an error or completes
successfully.
let DDErrorDomain: String
A unique error domain for the framework.
See Also
Errors
DeviceDiscoveryExtension / DDErrorOutType
Type Alias
DDErrorOutType
A type for framework functions that return error references.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 10

DeviceDiscoveryExtension / DDErrorDomain
Global Variable
DDErrorDomain
A unique error domain for the framework.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS
visionOS 1.0+


## Page 11

For more information, see Error domains.
struct DDError
An error that the framework reports.
enum Code
Codes that identify errors that can occur during the framework’s use.
typealias DDErrorHandler
A function that executes code you provide when an operation returns an error or completes
successfully.
typealias DDErrorOutType
A type for framework functions that return error references.
Discussion
See Also
Errors


