# Errors.pdf

## Page 1

static var unknown: CBError.Code
An unknown error occurred.
static var invalidParameters: CBError.Code
The specified parameters are invalid.
static var invalidHandle: CBError.Code
The specified attribute handle is invalid.
static var notConnected: CBError.Code
The device isn’t currently connected.
static var outOfSpace: CBError.Code
The device has run out of space to complete the intended operation.
static var operationCancelled: CBError.Code
The error represents a canceled operation.
static var connectionTimeout: CBError.Code
The connection timed out.
Topics
Error Codes
Core Bluetooth / CBError
Structure
CBError
An error that Core Bluetooth returns during Bluetooth transactions.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

static var peripheralDisconnected: CBError.Code
The peripheral disconnected.
static var uuidNotAllowed: CBError.Code
The specified UUID isn’t permitted.
static var alreadyAdvertising: CBError.Code
The peripheral is already advertising.
static var connectionFailed: CBError.Code
The connection failed.
static var connectionLimitReached: CBError.Code
The device already has the maximum number of connections.
static var operationNotSupported: CBError.Code
The operation isn’t supported.
static var unknownDevice: CBError.Code
The device is unknown.
static var unkownDevice: CBError.Code
A misspelled version of the unknown device error code.
Deprecated
static var encryptionTimedOut: CBError.Code
static var leGattExceededBackgroundNotificationLimit: CBError.Code
static var leGattNearBackgroundNotificationLimit: CBError.Code
static var peerRemovedPairingInformation: CBError.Code
static var tooManyLEPairedDevices: CBError.Code
static var errorDomain: String
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
Type Properties
Enumerations


## Page 3

CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
let CBErrorDomain: String
The domain for Core Bluetooth errors.
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
let CBATTErrorDomain: String
The domain for Core Bluetooth ATT errors.
enum Code
The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
Relationships
Conforms To
See Also
Errors


## Page 4

This value identifies Core Bluetooth errors when used as the domain of an NSError instance.
struct CBError
An error that Core Bluetooth returns during Bluetooth transactions.
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
let CBATTErrorDomain: String
The domain for Core Bluetooth ATT errors.
enum Code
Discussion
See Also
Errors
Core Bluetooth / CBErrorDomain
Global Variable
CBErrorDomain
The domain for Core Bluetooth errors.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 5

The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).


## Page 6

case unknown
An unknown error occurred.
case invalidParameters
The specified parameters are invalid.
case invalidHandle
The specified attribute handle is invalid.
case notConnected
The device isn’t currently connected.
case outOfSpace
The device has run out of space to complete the intended operation.
case operationCancelled
The error represents a canceled operation.
case connectionTimeout
The connection timed out.
Topics
Error Codes
Core Bluetooth / CBError / CBError.Code
Enumeration
CBError.Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 7

case peripheralDisconnected
The peripheral disconnected.
case uuidNotAllowed
The specified UUID isn’t permitted.
case alreadyAdvertising
The peripheral is already advertising.
case connectionFailed
The connection failed.
case connectionLimitReached
The device already has the maximum number of connections.
case operationNotSupported
The operation isn’t supported.
static var unknownDevice: CBError.Code
The device is unknown.
case unkownDevice
A misspelled version of the unknown device error code.
Deprecated
case encryptionTimedOut
case leGattExceededBackgroundNotificationLimit
case leGattNearBackgroundNotificationLimit
case peerRemovedPairingInformation
case tooManyLEPairedDevices
init?(rawValue: Int)
Enumeration Cases
Initializers
Relationships


## Page 8

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
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
let CBATTErrorDomain: String
The domain for Core Bluetooth ATT errors.
enum Code
The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
Conforms To
See Also
Errors


## Page 9

static var success: CBATTError.Code
The ATT command or request successfully completed.
static var invalidHandle: CBATTError.Code
The attribute handle is invalid on this peripheral.
static var readNotPermitted: CBATTError.Code
The permissions prohibit reading the attribute’s value.
static var writeNotPermitted: CBATTError.Code
The permissions prohibit writing the attribute’s value.
static var invalidPdu: CBATTError.Code
The attribute Protocol Data Unit (PDU) is invalid.
static var insufficientAuthentication: CBATTError.Code
Reading or writing the attribute’s value failed for lack of authentication.
static var requestNotSupported: CBATTError.Code
The attribute server doesn’t support the request received from the client.
Topics
Error Codes
Core Bluetooth / CBATTError
Structure
CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 10

static var invalidOffset: CBATTError.Code
The specified offset value was past the end of the attribute’s value.
static var insufficientAuthorization: CBATTError.Code
Reading or writing the attribute’s value failed for lack of authorization.
static var prepareQueueFull: CBATTError.Code
The prepare queue is full, as a result of there being too many write requests in the queue.
static var attributeNotFound: CBATTError.Code
The attribute wasn’t found within the specified attribute handle range.
static var attributeNotLong: CBATTError.Code
The ATT read blob request can’t read or write the attribute.
static var insufficientEncryptionKeySize: CBATTError.Code
The encryption key size used for encrypting this link is insufficient.
static var invalidAttributeValueLength: CBATTError.Code
The length of the attribute’s value is invalid for the intended operation.
static var unlikelyError: CBATTError.Code
The ATT request encountered an unlikely error and wasn’t completed.
static var insufficientEncryption: CBATTError.Code
Reading or writing the attribute’s value failed for lack of encryption.
static var unsupportedGroupType: CBATTError.Code
The attribute type isn’t a supported grouping attribute as defined by a higher-layer
specification.
static var insufficientResources: CBATTError.Code
Resources are insufficient to complete the ATT request.
enum Code
The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
Enumerations
Type Properties


## Page 11

static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct CBError
An error that Core Bluetooth returns during Bluetooth transactions.
let CBErrorDomain: String
The domain for Core Bluetooth errors.
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
let CBATTErrorDomain: String
The domain for Core Bluetooth ATT errors.
enum Code
The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
Relationships
Conforms To
See Also
Errors


## Page 12

This value identifies Core Bluetooth Attribute Protocol (ATT) errors when used as the domain of a
NSError instance.
struct CBError
An error that Core Bluetooth returns during Bluetooth transactions.
let CBErrorDomain: String
The domain for Core Bluetooth errors.
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
enum Code
Discussion
See Also
Errors
Core Bluetooth / CBATTErrorDomain
Global Variable
CBATTErrorDomain
The domain for Core Bluetooth ATT errors.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 13

The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

An error that Core Bluetooth returns while using Attribute Protocol (ATT).


## Page 18

static var success: CBATTError.Code
The ATT command or request successfully completed.
static var invalidHandle: CBATTError.Code
The attribute handle is invalid on this peripheral.
static var readNotPermitted: CBATTError.Code
The permissions prohibit reading the attribute’s value.
static var writeNotPermitted: CBATTError.Code
The permissions prohibit writing the attribute’s value.
static var invalidPdu: CBATTError.Code
The attribute Protocol Data Unit (PDU) is invalid.
static var insufficientAuthentication: CBATTError.Code
Reading or writing the attribute’s value failed for lack of authentication.
static var requestNotSupported: CBATTError.Code
The attribute server doesn’t support the request received from the client.
Topics
Error Codes
Core Bluetooth / CBATTError
Structure
CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 19

static var invalidOffset: CBATTError.Code
The specified offset value was past the end of the attribute’s value.
static var insufficientAuthorization: CBATTError.Code
Reading or writing the attribute’s value failed for lack of authorization.
static var prepareQueueFull: CBATTError.Code
The prepare queue is full, as a result of there being too many write requests in the queue.
static var attributeNotFound: CBATTError.Code
The attribute wasn’t found within the specified attribute handle range.
static var attributeNotLong: CBATTError.Code
The ATT read blob request can’t read or write the attribute.
static var insufficientEncryptionKeySize: CBATTError.Code
The encryption key size used for encrypting this link is insufficient.
static var invalidAttributeValueLength: CBATTError.Code
The length of the attribute’s value is invalid for the intended operation.
static var unlikelyError: CBATTError.Code
The ATT request encountered an unlikely error and wasn’t completed.
static var insufficientEncryption: CBATTError.Code
Reading or writing the attribute’s value failed for lack of encryption.
static var unsupportedGroupType: CBATTError.Code
The attribute type isn’t a supported grouping attribute as defined by a higher-layer
specification.
static var insufficientResources: CBATTError.Code
Resources are insufficient to complete the ATT request.
enum Code
The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
Enumerations
Type Properties


## Page 20

static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct CBError
An error that Core Bluetooth returns during Bluetooth transactions.
let CBErrorDomain: String
The domain for Core Bluetooth errors.
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
let CBATTErrorDomain: String
The domain for Core Bluetooth ATT errors.
enum Code
The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
Relationships
Conforms To
See Also
Errors


