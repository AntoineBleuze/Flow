# Image Feature Detection.pdf

## Page 1

Note
In macOS 10.13, iOS 11, and tvOS 11 or later, the Vision framework replaces these classes for
identifying and analyzing image features. See VNRequest.
A CIDetector object uses image processing to search for and identify notable features (faces,
rectangles, and barcodes) in a still image or video. Detected features are represented by
CIFeature objects that provide more information about each feature.
This class can maintain many state variables that can impact performance. So for best
performance, reuse CIDetector instances instead of creating new ones.
init?(ofType: String, context: CIContext?, options: [String : Any]?)
Creates and returns a configured detector.
Overview
Topics
Creating a Detector Object
Core Image / CIDetector
Class
CIDetector
An image processor that identifies notable features, such as faces and barcodes, 
a still image or video.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS
visionOS 1.0+


## Page 2

func features(in: CIImage) -> [CIFeature]
Searches for features in an image.
func features(in: CIImage, options: [String : Any]?) -> [CIFeature]
Searches for features in an image based on the specified image orientation.
Detector Types
Strings used to declare the detector for which you are interested.
Detector Configuration Keys
Keys used in the options dictionary to configure a detector.
Detector Accuracy Options
Value options used to specify the desired accuracy of the detector.
Feature Detection Keys
Keys used in the options dictionary for features(in:options:).
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Using a Detector Object to Find Features
Constants
Relationships
Inherits From
Conforms To


## Page 3

class CIFeature
The abstract superclass for objects representing notable features detected in an image.
class CIFaceFeature
Information about a face detected in a still or video image.
class CIRectangleFeature
Information about a rectangular region detected in a still or video image.
class CITextFeature
Information about a text that was detected in a still or video image.
class CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.
See Also
Image Feature Detection


## Page 4

Note
In macOS 10.13, iOS 11, and tvOS 11 or later, the Vision framework replaces these classes for
identifying and analyzing image features. See VNObservation)
A CIFeature object represents a portion of an image that a detector believes matches its criteri
Subclasses of CIFeature holds additional information specific to the detector that discovered the
feature.
var bounds: CGRect
The rectangle that holds discovered feature.
var type: String
Overview
Topics
Feature Properties
Core Image / CIFeature
Class
CIFeature
The abstract superclass for objects representing notable features detected in an
image.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS
visionOS 1.0+


## Page 5

The type of feature that was discovered.
let CIFeatureTypeFace: String
A Core Image feature type for person’s face.
let CIFeatureTypeRectangle: String
A Core Image feature type for rectangular object.
let CIFeatureTypeQRCode: String
A Core Image feature type for QR code object.
let CIFeatureTypeText: String
A Core Image feature type for text.
NSObject
CIFaceFeature
CIQRCodeFeature
CIRectangleFeature
CITextFeature
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Feature Types
Relationships
Inherits From
Inherited By
Conforms To


## Page 6

class CIDetector
An image processor that identifies notable features, such as faces and barcodes, in a still
image or video.
class CIFaceFeature
Information about a face detected in a still or video image.
class CIRectangleFeature
Information about a rectangular region detected in a still or video image.
class CITextFeature
Information about a text that was detected in a still or video image.
class CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.
See Also
Image Feature Detection


## Page 7

Note
In macOS 10.13, iOS 11, and tvOS 11 or later, the Vision framework replaces this class for
identifying and analyzing image features. See VNDetectFaceRectanglesRequest. See
VNDetectFaceRectanglesRequest)
The properties of a CIFaceFeature object provide information about the face’s eyes and mouth
A face object in a video can also have properties that track its location over time, tracking ID and
frame count.
var bounds: CGRect
A rectangle indicating the position and extent of the face feature in image coordinates.
var hasFaceAngle: Bool
Overview
Topics
Locating Faces
Core Image / CIFaceFeature
Class
CIFaceFeature
Information about a face detected in a still or video image.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS
visionOS 1.0+


## Page 8

A Boolean value that indicates whether information about face rotation is available.
var faceAngle: Float
The rotation of the face.
var hasLeftEyePosition: Bool
A Boolean value that indicates whether the detector found the face’s left eye.
var hasRightEyePosition: Bool
A Boolean value that indicates whether the detector found the face’s right eye.
var hasMouthPosition: Bool
A Boolean value that indicates whether the detector found the face’s mouth.
var leftEyePosition: CGPoint
The image coordinate of the center of the left eye.
var rightEyePosition: CGPoint
The image coordinate of the center of the right eye.
var mouthPosition: CGPoint
The image coordinate of the center of the mouth.
var hasSmile: Bool
A Boolean value that indicates whether a smile is detected in the face.
var leftEyeClosed: Bool
A Boolean value that indicates whether a closed left eye is detected in the face.
var rightEyeClosed: Bool
A Boolean value that indicates whether a closed right eye is detected in the face.
var hasTrackingID: Bool
A Boolean value that indicates whether the face object has a tracking ID.
var trackingID: Int32
The tracking identifier of the face object.
Identifying Facial Features
Tracking Distinct Faces in Video


## Page 9

var hasTrackingFrameCount: Bool
A Boolean value that indicates the face object has a tracking frame count.
var trackingFrameCount: Int32
The tracking frame count of the face.
CIFeature
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CIDetector
An image processor that identifies notable features, such as faces and barcodes, in a still
image or video.
class CIFeature
The abstract superclass for objects representing notable features detected in an image.
class CIRectangleFeature
Information about a rectangular region detected in a still or video image.
class CITextFeature
Information about a text that was detected in a still or video image.
Relationships
Inherits From
Conforms To
See Also
Image Feature Detection


## Page 10

class CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.


## Page 11

Note
In macOS 10.13, iOS 11, and tvOS 11 or later, the Vision framework replaces these classes for
identifying and analyzing image features. See VNDetectFaceRectanglesRequest)
A detected rectangle feature is not necessarily rectangular in the plane of the image; rather, the
feature identifies a shape that may be rectangular in space (for example a book on a desk) but
which appears as a four-sided polygon in the image. The properties of a CIRectangleFeature
object identify its four corners in image coordinates.
You can use rectangle feature detection together with the CIPerspectiveCorrection filter to
transform the feature to a normal orientation.
To detect rectangles in an image or video, choose CIDetectorTypeRectangle when initializin
a CIDetector object, and use the CIDetectorAspectRatio and CIDetectorFocalLengt
options to specify the approximate shape of rectangular features to search for. The detector
returns at most one rectangle feature, the most prominent found in the image.
Overview
Topics
Core Image / CIRectangleFeature
Class
CIRectangleFeature
Information about a rectangular region detected in a still or video image.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+


## Page 12

var bounds: CGRect
A rectangle indicating the position and extent of the feature in image coordinates.
var bottomLeft: CGPoint
The lower-left corner of the detected rectangle, in image coordinates.
var bottomRight: CGPoint
The lower-right corner of the detected rectangle, in image coordinates.
var topLeft: CGPoint
The upper-left corner of the detected rectangle, in image coordinates.
var topRight: CGPoint
The upper-right corner of the detected rectangle, in image coordinates.
CIFeature
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Locating a Detected Feature
Identifying the Corners of a Detected Rectangle
Relationships
Inherits From
Conforms To
See Also


## Page 13

class CIDetector
An image processor that identifies notable features, such as faces and barcodes, in a still
image or video.
class CIFeature
The abstract superclass for objects representing notable features detected in an image.
class CIFaceFeature
Information about a face detected in a still or video image.
class CITextFeature
Information about a text that was detected in a still or video image.
class CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.
Image Feature Detection


## Page 14

Note
In macOS 10.13, iOS 11, and tvOS 11 or later, the Vision framework replaces these classes for
identifying and analyzing image features. See VNRecognizeTextRequest)
A detected text feature is not necessarily rectangular in the plane of the image; rather, the feature
identifies a shape that may be rectangular in space (for example a text on a sign) but which
appears as a four-sided polygon in the image. The properties of a CITextFeature object identi
its four corners in image coordinates.
To detect text in an image or video, choose the CIDetectorTypeText type when initializing a
CIDetector object, and use the CIDetectorImageOrientation option to specify the desire
orientation for finding upright text.
var bounds: CGRect
Overview
Topics
Locating a Detected Feature
Core Image / CITextFeature
Class
CITextFeature
Information about a text that was detected in a still or video image.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+


## Page 15

A rectangle that indicates the position and extent of the text feature in image coordinates.
var subFeatures: [Any]?
An array containing additional features detected within the feature.
var bottomLeft: CGPoint
The image coordinate of the lower-left corner of the detected text.
var bottomRight: CGPoint
The image coordinate of the lower-right corner of the detected text.
var topLeft: CGPoint
The image coordinate of the upper-left corner of the detected text.
var topRight: CGPoint
The image coordinate of the upper-right corner of the detected text.
CIFeature
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Locating Features Within a Detected Region
Identifying the Corners of a Detected Text Region
Relationships
Inherits From
Conforms To


## Page 16

class CIDetector
An image processor that identifies notable features, such as faces and barcodes, in a still
image or video.
class CIFeature
The abstract superclass for objects representing notable features detected in an image.
class CIFaceFeature
Information about a face detected in a still or video image.
class CIRectangleFeature
Information about a rectangular region detected in a still or video image.
class CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.
See Also
Image Feature Detection


## Page 17

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


## Page 18

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


## Page 19

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


