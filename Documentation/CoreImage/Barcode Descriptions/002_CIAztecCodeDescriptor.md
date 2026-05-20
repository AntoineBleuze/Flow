# 002_CIAztecCodeDescriptor.pdf

## Page 1

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


## Page 2

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


## Page 3

class CIDataMatrixCodeDescriptor
A concrete subclass the Core Image Barcode Descriptor that represents an Data Matrix code
symbol.


