# 000_NFCNDEFMessage.pdf

## Page 1

init(records: [NFCNDEFPayload])
Creates an NDEF message with the specified records.
convenience init?(data: Data)
Creates an NDEF message from raw data representing the message.
var records: [NFCNDEFPayload]
An array of records for the message.
var length: Int
The length, in bytes, of the NDEF message when stored on an NFC tag.
Topics
Creating an NDEF Message
Accessing NDEF Records
Getting the Message Length
Core NFC / NFCNDEFMessage
Class
NFCNDEFMessage
An NFC NDEF message consisting of an array of payload records.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class NFCNDEFPayload
A payload record in an NFC NDEF message.
Relationships
Inherits From
Conforms To
See Also
NDEF messages and payloads


