# 000_CIBarcodeDescriptor.pdf

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


