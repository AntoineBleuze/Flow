# Errors.pdf

## Page 1

case readerSessionInvalidationErrorFirstNDEFTagRead
The first NDEF tag read by this session is invalid.
case readerSessionInvalidationErrorSessionTerminatedUnexpectedly
The reader session terminated unexpectedly.
case readerSessionInvalidationErrorSessionTimeout
The reader session timed out.
case readerSessionInvalidationErrorSystemIsBusy
The reader session failed because the system is busy.
case readerSessionInvalidationErrorUserCanceled
The user canceled the reader session.
case readerSessionInvalidationErrorFirstNDEFTagRead
The first NDEF tag read by this session is invalid.
case readerSessionInvalidationErrorSessionTerminatedUnexpectedly
The reader session terminated unexpectedly.
Topics
Session Errors
Core NFC / NFCReaderError / NFCReaderError.Code
Enumeration
NFCReaderError.Code
Reader session and tag error codes.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

case readerSessionInvalidationErrorSessionTimeout
The reader session timed out.
case readerSessionInvalidationErrorSystemIsBusy
The reader session failed because the system is busy.
case readerSessionInvalidationErrorUserCanceled
The user canceled the reader session.
case ndefReaderSessionErrorTagNotWritable
The NDEF tag isn’t writable.
case ndefReaderSessionErrorTagSizeTooSmall
The NDEF tag memory size is too small to store the data.
case ndefReaderSessionErrorTagUpdateFailure
The reader session failed to update the NDEF tag.
case ndefReaderSessionErrorZeroLengthMessage
The NDEF tag doesn’t contain an NDEF message.
case ndefReaderSessionErrorTagNotWritable
The NDEF tag isn’t writable.
case ndefReaderSessionErrorTagSizeTooSmall
The NDEF tag memory size is too small to store the data.
case ndefReaderSessionErrorTagUpdateFailure
The reader session failed to update the NDEF tag.
case ndefReaderSessionErrorZeroLengthMessage
The NDEF tag doesn’t contain an NDEF message.
case readerTransceiveErrorRetryExceeded
Too many retries have occurred.
case readerTransceiveErrorTagConnectionLost
The reader lost the connection to the tag.
NDEF Tag Errors
Transceive Errors


## Page 3

case readerTransceiveErrorTagNotConnected
The tag isn’t in the connected state.
case readerTransceiveErrorTagResponseError
The tag has responded with an error.
case readerTransceiveErrorSessionInvalidated
The reader session is invalid.
case readerTransceiveErrorPacketTooLong
The packet length exceeds the limit supported by the tag.
case readerTransceiveErrorRetryExceeded
Too many retries have occurred.
case readerTransceiveErrorTagConnectionLost
The reader lost the connection to the tag.
case readerTransceiveErrorTagNotConnected
The tag isn’t in the connected state.
case readerTransceiveErrorTagResponseError
The tag has responded with an error.
case readerTransceiveErrorSessionInvalidated
The reader session is invalid.
case readerTransceiveErrorPacketTooLong
The packet length exceeds the limit supported by the tag.
case tagCommandConfigurationErrorInvalidParameters
The tag has been configured with invalid parameters.
case tagCommandConfigurationErrorInvalidParameters
The tag has been configured with invalid parameters.
case readerErrorUnsupportedFeature
The reader session does not support this feature.
Tag Command Configuration Error
Other Errors


## Page 4

case readerErrorInvalidParameter
An input parameter is invalid.
case readerErrorInvalidParameterLength
The length of an input parameter is invalid.
case readerErrorParameterOutOfBound
A parameter value is outside of the acceptable boundary.
case readerErrorRadioDisabled
The NFC wireless radio on the device is disabled.
case readerErrorSecurityViolation
A security violation associated with the reader session has occurred.
case readerErrorUnsupportedFeature
The reader session does not support this feature.
case readerErrorInvalidParameter
An input parameter is invalid.
case readerErrorInvalidParameterLength
The length of an input parameter is invalid.
case readerErrorParameterOutOfBound
A parameter value is outside of the acceptable boundary.
case readerErrorRadioDisabled
The NFC wireless radio on the device is disabled.
case readerErrorSecurityViolation
A security violation associated with the reader session has occurred.
case readerErrorAccessNotAccepted
case readerErrorIneligible
init?(rawValue: Int)
Enumeration Cases
Initializers


## Page 5

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct NFCReaderError
An error type that indicates problems with reader sessions or tags.
let NFCErrorDomain: String
The domain for errors associated with Core NFC APIs.
let NFCTagResponseUnexpectedLengthErrorKey: String
A user-information dictionary key that indicates an invalid received response packet length.
Relationships
Conforms To
See Also
Errors


## Page 6

static var readerSessionInvalidationErrorFirstNDEFTagRead: NFCReader
Error.Code
The first NDEF tag read by this session is invalid.
static var readerSessionInvalidationErrorSessionTerminatedUnexpectedly:
NFCReaderError.Code
The reader session terminated unexpectedly.
static var readerSessionInvalidationErrorSessionTimeout: NFCReaderError
Code
The reader session timed out.
static var readerSessionInvalidationErrorSystemIsBusy: NFCReaderError.
Code
The reader session failed because the system is busy.
static var readerSessionInvalidationErrorUserCanceled: NFCReaderError.
Code
The user canceled the reader session.
Topics
Session Errors
Core NFC / NFCReaderError
Structure
NFCReaderError
An error type that indicates problems with reader sessions or tags.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 7

static var ndefReaderSessionErrorTagNotWritable: NFCReaderError.Code
The NDEF tag isn’t writable.
static var ndefReaderSessionErrorTagSizeTooSmall: NFCReaderError.Code
The NDEF tag memory size is too small to store the data.
static var ndefReaderSessionErrorTagUpdateFailure: NFCReaderError.Code
The reader session failed to update the NDEF tag.
static var ndefReaderSessionErrorZeroLengthMessage: NFCReaderError.Code
The NDEF tag doesn’t contain an NDEF message.
static var readerTransceiveErrorRetryExceeded: NFCReaderError.Code
Too many retries have occurred.
static var readerTransceiveErrorTagConnectionLost: NFCReaderError.Code
The reader lost the connection to the tag.
static var readerTransceiveErrorTagNotConnected: NFCReaderError.Code
The tag isn’t in the connected state.
static var readerTransceiveErrorTagResponseError: NFCReaderError.Code
The tag has responded with an error.
static var readerTransceiveErrorSessionInvalidated: NFCReaderError.Code
The reader session is invalid.
static var readerTransceiveErrorPacketTooLong: NFCReaderError.Code
The packet length exceeds the limit supported by the tag.
static var tagCommandConfigurationErrorInvalidParameters: NFCReaderErro
.Code
The tag has been configured with invalid parameters.
NDEF Tag Errors
Transceive Errors
Tag Command Configuration Error


## Page 8

static var readerErrorUnsupportedFeature: NFCReaderError.Code
The reader session does not support this feature.
static var readerErrorInvalidParameter: NFCReaderError.Code
An input parameter is invalid.
static var readerErrorInvalidParameterLength: NFCReaderError.Code
The length of an input parameter is invalid.
static var readerErrorParameterOutOfBound: NFCReaderError.Code
A parameter value is outside of the acceptable boundary.
static var readerErrorRadioDisabled: NFCReaderError.Code
The NFC wireless radio on the device is disabled.
static var readerErrorSecurityViolation: NFCReaderError.Code
A security violation associated with the reader session has occurred.
let NFCErrorDomain: String
The domain for errors associated with Core NFC APIs.
static var errorDomain: String
static var readerErrorAccessNotAccepted: NFCReaderError.Code
static var readerErrorIneligible: NFCReaderError.Code
CustomNSError
Equatable
Other Errors
Error Domain
Type Properties
Relationships
Conforms To


## Page 9

Error
Hashable
Sendable
SendableMetatype
enum Code
Reader session and tag error codes.
let NFCErrorDomain: String
The domain for errors associated with Core NFC APIs.
let NFCTagResponseUnexpectedLengthErrorKey: String
A user-information dictionary key that indicates an invalid received response packet length.
See Also
Errors


## Page 10

enum Code
Reader session and tag error codes.
struct NFCReaderError
An error type that indicates problems with reader sessions or tags.
let NFCTagResponseUnexpectedLengthErrorKey: String
A user-information dictionary key that indicates an invalid received response packet length.
See Also
Errors
Core NFC / NFCErrorDomain
Global Variable
NFCErrorDomain
The domain for errors associated with Core NFC APIs.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 11

Core NFC / NFCTagResponseUnexpectedLengthErrorKey
Global Variable
NFCTagResponseUnexpectedLengthError
Key
A user-information dictionary key that indicates an invalid received response
packet length.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 12

If an error object’s userInfo dictionary contains this key, the received response packet length is
invalid.
enum Code
Reader session and tag error codes.
struct NFCReaderError
An error type that indicates problems with reader sessions or tags.
let NFCErrorDomain: String
The domain for errors associated with Core NFC APIs.
Discussion
See Also
Errors


