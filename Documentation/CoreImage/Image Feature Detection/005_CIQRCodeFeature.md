# 005_CIQRCodeFeature.pdf

## Page 1

Note
In macOS 10.13, iOS 11, and tvOS 11 or later, the Vision framework replaces these classes for
identifying and analyzing image features. See VNDetectBarcodesRequest)
A QR code is a two-dimensional barcode using the ISO/IEC 18004:2006 standard. The properties
of a CIQRCodeFeature object identify the corners of the barcode in the image perspective and
provide the decoded message.
To detect QR codes in an image or video, choose CIDetectorTypeQRCode type when initializin
a CIDetector object.
var bounds: CGRect
A rectangle that indicates the position and extent of the QR code feature in image
coordinates.
Overview
Topics
Locating a Detected Feature
Core Image / CIQRCodeFeature
Class
CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+


## Page 2

var messageString: String?
The string decoded from the detected barcode.
var symbolDescriptor: CIQRCodeDescriptor?
An abstract representation of a QR Code symbol.
var bottomLeft: CGPoint
The image coordinate of the lower-left corner of the detected QR code.
var bottomRight: CGPoint
The image coordinate of the lower-right corner of the detected QR code.
var topLeft: CGPoint
The image coordinate of the upper-left corner of the detected QR code.
var topRight: CGPoint
The image coordinate of the upper-right corner of the detected QR code.
CIFeature
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Decoding a Detected Barcode
Identifying the Corners of a Detected Barcode
Relationships
Inherits From
Conforms To


## Page 3

NSSecureCoding
class CIDetector
An image processor that identifies notable features, such as faces and barcodes, in a still
image or video.
class CIFeature
The abstract superclass for objects representing notable features detected in an image.
class CIFaceFeature
Information about a face detected in a still or video image.
class CIRectangleFeature
Information about a rectangular region detected in a still or video image.
class CITextFeature
Information about a text that was detected in a still or video image.
See Also
Image Feature Detection


