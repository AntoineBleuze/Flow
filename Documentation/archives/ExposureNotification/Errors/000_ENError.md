# 000_ENError.pdf

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


