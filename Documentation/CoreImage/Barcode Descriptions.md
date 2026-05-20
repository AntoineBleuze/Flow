# Barcode Descriptions.pdf

## Page 1

Subclasses encapsulate the formal specification and fields specific to a code type. Each subclass
is sufficient to recreate the unique symbol exactly as seen or used with a custom parser.
NSObject
CIAztecCodeDescriptor
CIDataMatrixCodeDescriptor
CIPDF417CodeDescriptor
CIQRCodeDescriptor
CVarArg
CustomDebugStringConvertible
Overview
Relationships
Inherits From
Inherited By
Conforms To
Core Image / CIBarcodeDescriptor
Class
CIBarcodeDescriptor
An abstract base class that represents a machine-readable code’s attributes.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 2

CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CIQRCodeDescriptor
A concrete subclass of the Core Image Barcode Descriptor that represents a square QR cod
symbol.
class CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec code
symbol.
class CIPDF417CodeDescriptor
A concrete subclass of Core Image Barcode Descriptor that represents a PDF417 symbol.
class CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data Matrix code
symbol.
See Also
Barcode Descriptions


## Page 3

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


## Page 4

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


## Page 5

An abstract base class that represents a machine-readable code’s attributes.
class CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec code
symbol.
class CIPDF417CodeDescriptor
A concrete subclass of Core Image Barcode Descriptor that represents a PDF417 symbol.
class CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data Matrix code
symbol.


## Page 6

An Aztec code symbol is a 2D barcode format defined by the ISO/IEC 24778:2008 standard. It
encodes data in concentric square rings around a central bullseye pattern.
init?(payload: Data, isCompact: Bool, layerCount: Int, dataCodewordCoun
: Int)
Initializes an Aztec code descriptor for the given payload and parameters.
var errorCorrectedPayload: Data
The error-corrected payload that comprises the the Aztec code symbol.
var isCompact: Bool
A Boolean value telling if the Aztec code is compact.
Overview
Topics
Creating a Descriptor
Examining a Descriptor
Core Image / CIAztecCodeDescriptor
Class
CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec
code symbol.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 7

var layerCount: Int
The number of data layers in the Aztec code symbol.
var dataCodewordCount: Int
The number of non-error-correction codewords carried by the Aztec code symbol.
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
An abstract base class that represents a machine-readable code’s attributes.
class CIQRCodeDescriptor
A concrete subclass of the Core Image Barcode Descriptor that represents a square QR cod
symbol.
class CIPDF417CodeDescriptor
A concrete subclass of Core Image Barcode Descriptor that represents a PDF417 symbol.
Relationships
Inherits From
Conforms To
See Also
Barcode Descriptions


## Page 8

class CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data Matrix code
symbol.


## Page 9

PDF417 is a stacked linear barcode symbol format used predominantly in transport, ID cards, and
inventory management. Each pattern in the code comprises 4 bars and spaces, 17 units long.
Refer to the ISO/IEC 15438:2006(E) for the PDF417 symbol specification.
init?(payload: Data, isCompact: Bool, rowCount: Int, columnCount: Int)
Initializes an PDF417 code descriptor for the given payload and parameters.
var errorCorrectedPayload: Data
The error-corrected payload containing the data encoded in the PDF417 code symbol.
var isCompact: Bool
Overview
Topics
Creating a Descriptor
Examining a Descriptor
Core Image / CIPDF417CodeDescriptor
Class
CIPDF417CodeDescriptor
A concrete subclass of Core Image Barcode Descriptor that represents a PDF417
symbol.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 10

A boolean value telling if the PDF417 code is compact.
var rowCount: Int
The number of rows in the PDF417 code symbol.
var columnCount: Int
The number of columns in the PDF417 code symbol.
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
An abstract base class that represents a machine-readable code’s attributes.
class CIQRCodeDescriptor
A concrete subclass of the Core Image Barcode Descriptor that represents a square QR cod
symbol.
Relationships
Inherits From
Conforms To
See Also
Barcode Descriptions


## Page 11

class CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec code
symbol.
class CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data Matrix code
symbol.


## Page 12

A Data Matrix code symbol is a 2D barcode format defined by the ISO/IEC 16022:2006(E) standar
It encodes data in square or rectangular symbol with solid lines on the left and bottom sides
init?(payload: Data, rowCount: Int, columnCount: Int, eccVersion: CIDat
MatrixCodeDescriptor.ECCVersion)
Initializes a Data Matrix code descriptor for the given payload and parameters.
var errorCorrectedPayload: Data
The error-corrected payload containing the data encoded in the Data Matrix code symbol.
var rowCount: Int
The number of rows in the Data Matrix code symbol.
Overview
Topics
Creating a Descriptor
Examining a Descriptor
Core Image / CIDataMatrixCodeDescriptor
Class
CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data
Matrix code symbol.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+


## Page 13

var columnCount: Int
The number of columns in the Data Matrix code symbol.
var eccVersion: CIDataMatrixCodeDescriptor.ECCVersion
The error correction version of the Data Matrix code symbol.
enum ECCVersion
Constants indicating the Data Matrix code ECC version.
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
An abstract base class that represents a machine-readable code’s attributes.
Error Correction Constants
Relationships
Inherits From
Conforms To
See Also
Barcode Descriptions


## Page 14

class CIQRCodeDescriptor
A concrete subclass of the Core Image Barcode Descriptor that represents a square QR cod
symbol.
class CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec code
symbol.
class CIPDF417CodeDescriptor
A concrete subclass of Core Image Barcode Descriptor that represents a PDF417 symbol.


