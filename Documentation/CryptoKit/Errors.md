# Errors.pdf

## Page 1

case incorrectKeySize
The key size is incorrect.
case invalidParameter
The parameter is invalid.
case incorrectParameterSize
The parameter size is incorrect.
case underlyingCoreCryptoError(error: Int32)
The underlying corecrypto library is unable to complete the requested action.
case authenticationFailure
The authentication tag or signature is incorrect.
case wrapFailure
The framework can’t wrap the specified key.
case unwrapFailure
Topics
Reporting errors
Apple CryptoKit / CryptoKitError
Enumeration
CryptoKitError
General cryptography errors used by CryptoKit.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

The framework can’t unwrap the specified key.
Copyable
Equatable
Error
Hashable
Sendable
SendableMetatype
enum CryptoKitASN1Error
Errors from decoding ASN.1 content.
Relationships
Conforms To
See Also
Errors


## Page 3

case invalidASN1IntegerEncoding
An ASN.1 integer doesn’t use the minimum number of bytes for its encoding.
case invalidASN1Object
The format of the parsed ASN.1 object doesn’t match the format required for the data type
being decoded.
case invalidFieldIdentifier
The ASN.1 tag for this field is invalid or unsupported.
case invalidObjectIdentifier
An ASN.1 object identifier is invalid.
case invalidPEMDocument
The string doesn’t parse as a PEM document.
case truncatedASN1Field
An ASN.1 field is truncated.
case unexpectedFieldType
Topics
Reporting errors
Apple CryptoKit / CryptoKitASN1Error
Enumeration
CryptoKitASN1Error
Errors from decoding ASN.1 content.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 4

The ASN.1 tag for the parsed field doesn’t match the required format.
case unsupportedFieldLength
The encoding used for the field length is unsupported.
Equatable
Error
Hashable
Sendable
SendableMetatype
enum CryptoKitError
General cryptography errors used by CryptoKit.
Relationships
Conforms To
See Also
Errors


