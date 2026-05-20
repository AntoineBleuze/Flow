# 004_CIDataMatrixCodeDescriptor.pdf

## Page 1

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


## Page 2

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


## Page 3

class CIQRCodeDescriptor
A concrete subclass of the Core Image Barcode Descriptor that represents a square QR cod
symbol.
class CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec code
symbol.
class CIPDF417CodeDescriptor
A concrete subclass of Core Image Barcode Descriptor that represents a PDF417 symbol.


