# 003_CIPDF417CodeDescriptor.pdf

## Page 1

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


## Page 2

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


## Page 3

class CIAztecCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Aztec code
symbol.
class CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data Matrix code
symbol.


