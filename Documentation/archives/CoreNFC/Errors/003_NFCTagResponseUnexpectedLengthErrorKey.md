# 003_NFCTagResponseUnexpectedLengthErrorKey.pdf

## Page 1

Core NFC / NFCTagResponseUnexpectedLengthErrorKey
Global Variable
NFCTagResponseUnexpectedLengthError
Key
A user-information dictionary key that indicates an invalid received response
packet length.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 2

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


