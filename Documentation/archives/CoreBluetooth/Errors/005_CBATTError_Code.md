# 005_CBATTError_Code.pdf

## Page 1

These error constants derive from the Bluetooth ATT error codes, defined in the Bluetooth 4.0
specification. For more information, see the Bluetooth 4.0 specification, Volume 3, Part F, Section
3.4.1.1.
case success
The ATT command or request successfully completed.
case invalidHandle
The attribute handle is invalid on this peripheral.
case readNotPermitted
The permissions prohibit reading the attribute’s value.
case writeNotPermitted
The permissions prohibit writing the attribute’s value.
Overview
Topics
Error Codes
Core Bluetooth / CBATTError / CBATTError.Code
Enumeration
CBATTError.Code
The possible errors returned by a GATT server (a remote peripheral) during
Bluetooth low energy ATT transactions.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

case invalidPdu
The attribute Protocol Data Unit (PDU) is invalid.
case insufficientAuthentication
Reading or writing the attribute’s value failed for lack of authentication.
case requestNotSupported
The attribute server doesn’t support the request received from the client.
case invalidOffset
The specified offset value was past the end of the attribute’s value.
case insufficientAuthorization
Reading or writing the attribute’s value failed for lack of authorization.
case prepareQueueFull
The prepare queue is full, as a result of there being too many write requests in the queue.
case attributeNotFound
The attribute wasn’t found within the specified attribute handle range.
case attributeNotLong
The ATT read blob request can’t read or write the attribute.
case insufficientEncryptionKeySize
The encryption key size used for encrypting this link is insufficient.
case invalidAttributeValueLength
The length of the attribute’s value is invalid for the intended operation.
case unlikelyError
The ATT request encountered an unlikely error and wasn’t completed.
case insufficientEncryption
Reading or writing the attribute’s value failed for lack of encryption.
case unsupportedGroupType
The attribute type isn’t a supported grouping attribute as defined by a higher-layer
specification.
case insufficientResources
Resources are insufficient to complete the ATT request.


## Page 3

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct CBError
An error that Core Bluetooth returns during Bluetooth transactions.
let CBErrorDomain: String
The domain for Core Bluetooth errors.
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
let CBATTErrorDomain: String
The domain for Core Bluetooth ATT errors.
struct CBATTError
Initializers
Relationships
Conforms To
See Also
Errors


## Page 4

An error that Core Bluetooth returns while using Attribute Protocol (ATT).


