# Errors.pdf

## Page 1

case dataRestricted(FinanceStore.DataType)
The data is in a restricted state.
case historyTokenInvalid
case unknown
An unknown error occurred.
var errorCode: Int
The error code within the given domain.
var errorDescription: String?
A localized message that describes what error occurred.
var errorUserInfo: [String : Any]
The user-info dictionary that contains additional information about the error.
var failureReason: String?
Topics
Enumeration Cases
Instance Properties
FinanceKit / FinanceError
Enumeration
FinanceError
Values that describe errors that may occur when accessing financial data.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+


## Page 2

A localized message that describes the reason for the failure.
static var errorDomain: String
The domain of the error.
CustomNSError
Equatable
Error
LocalizedError
Sendable
SendableMetatype
Type Properties
Relationships
Conforms To


