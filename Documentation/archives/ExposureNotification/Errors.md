# Errors.pdf

## Page 1

Important
This structure is available in iOS 12.5, and in iOS 13.5 and later.
static var apiMisuse: ENError.Code
The API use is incorrect.
static var badFormat: ENError.Code
A file is formated incorrectly.
static var badParameter: ENError.Code
The parameter is missing or incorrect.
static var bluetoothOff: ENError.Code
Bluetooth is turned off.
Overview
Topics
Error Codes
Exposure Notification / ENError
Structure
ENError
Errors that the exposure notification framework issues.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 2

static var insufficientMemory: ENError.Code
The memory is insufficient to perform the operation.
static var insufficientStorage: ENError.Code
The storage is insufficient to enable notifications.
static var `internal`: ENError.Code
A bug in the internal notification framework.
static var invalidated: ENError.Code
A call to invalidate before the operation completes normally.
static var notAuthorized: ENError.Code
The user has denied access to the notification framework.
static var notEnabled: ENError.Code
Notification is not enabled.
static var notEntitled: ENError.Code
Process of calling is not entitled.
static var rateLimited: ENError.Code
API calls are too frequent.
static var restricted: ENError.Code
Exposure notification is disabled due to system policies.
static var unknown: ENError.Code
Failure has an unknown cause.
static var unsupported: ENError.Code
Operation is not supported.
static var dataInaccessible: ENError.Code
The user must unlock the device before it can access data.
static var travelStatusNotAvailable: ENError.Code
The system can’t determine whether the user is traveling.
enum Code
Error codes that the exposure notification framework issues.
Type Properties


## Page 3

static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
enum Code
Error codes that the exposure notification framework issues.
let ENErrorDomain: String
The domain for an error.
typealias ENErrorHandler
The handler for error conditions.
Relationships
Conforms To
See Also
Errors


## Page 4

Important
This enumeration is available in iOS 12.5, and in iOS 13.5 and later.
case apiMisuse
The API use is incorrect.
case badFormat
A file is formated incorrectly.
case badParameter
The parameter is missing or incorrect.
case restricted
Exposure notification is disabled due to system policies.
Overview
Topics
Error Codes
Exposure Notification / ENError / ENError.Code
Enumeration
ENError.Code
Error codes that the exposure notification framework issues.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 5

case bluetoothOff
Bluetooth is turned off.
case insufficientMemory
The memory is insufficient to perform the operation.
case insufficientStorage
The storage is insufficient to enable notifications.
case `internal`
A bug in the internal notification framework.
case invalidated
A call to invalidate before the operation completes normally.
case notAuthorized
The user has denied access to the notification framework.
case notEnabled
Notification is not enabled.
case notEntitled
Process of calling is not entitled.
case rateLimited
API calls are too frequent.
case unknown
Failure has an unknown cause.
case unsupported
Operation is not supported.
case dataInaccessible
The user must unlock the device before it can access data.
case travelStatusNotAvailable
The system can’t determine whether the user is traveling.
init?(rawValue: Int)
Initializers


## Page 6

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct ENError
Errors that the exposure notification framework issues.
let ENErrorDomain: String
The domain for an error.
typealias ENErrorHandler
The handler for error conditions.
Relationships
Conforms To
See Also
Errors


## Page 7

Important
This property is available in iOS 12.5, and in iOS 13.5 and later.
struct ENError
Errors that the exposure notification framework issues.
enum Code
Error codes that the exposure notification framework issues.
typealias ENErrorHandler
The handler for error conditions.
Discussion
See Also
Errors
Exposure Notification / ENErrorDomain
Global Variable
ENErrorDomain
The domain for an error.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 8

Important
This type is available in iOS 12.5, and in iOS 13.5 and later.
struct ENError
Errors that the exposure notification framework issues.
enum Code
Error codes that the exposure notification framework issues.
let ENErrorDomain: String
The domain for an error.
Discussion
See Also
Errors
Exposure Notification / ENErrorHandler
Type Alias
ENErrorHandler
The handler for error conditions.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


