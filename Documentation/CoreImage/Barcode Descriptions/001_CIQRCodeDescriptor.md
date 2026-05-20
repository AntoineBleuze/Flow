# 001_CIQRCodeDescriptor.pdf

## Page 1

ISO/IEC 18004 defines versions from 1 to 40, where a higher symbol version indicates a larger dat
carrying capacity. QR Codes can encode text, vCard contact information, or Uniform Resource
Identifiers (URI).
init?(payload: Data, symbolVersion: Int, maskPattern: UInt8, error
CorrectionLevel: CIQRCodeDescriptor.ErrorCorrectionLevel)
Initializes a QR code descriptor for the given payload and parameters.
var errorCorrectedPayload: Data
The error-corrected codeword payload that comprises the QR code symbol.
var symbolVersion: Int
Overview
Topics
Creating a Descriptor
Examining a Descriptor
Core Image / CIQRCodeDescriptor
Class
CIQRCodeDescriptor
A concrete subclass of the Core Image Barcode Descriptor that represents a
square QR code symbol.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 2

The version of the QR code which corresponds to the size of the QR code symbol.
var maskPattern: UInt8
The data mask pattern for the QR code symbol.
var errorCorrectionLevel: CIQRCodeDescriptor.ErrorCorrectionLevel
The error correction level of the QR code symbol.
enum ErrorCorrectionLevel
Constants indicating the percentage of the symbol that is dedicated to error correction.
CIBarcodeDescriptor
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CIBarcodeDescriptor
Error Correction Constants
Relationships
Inherits From
Conforms To
See Also
Barcode Descriptions


## Page 3

An abstract base class that represents a machine-readable code’s attributes.
class CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec code
symbol.
class CIPDF417CodeDescriptor
A concrete subclass of Core Image Barcode Descriptor that represents a PDF417 symbol.
class CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data Matrix code
symbol.


