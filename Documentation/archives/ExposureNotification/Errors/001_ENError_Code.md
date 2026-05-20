# 001_ENError_Code.pdf

## Page 1

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


## Page 2

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


## Page 3

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


