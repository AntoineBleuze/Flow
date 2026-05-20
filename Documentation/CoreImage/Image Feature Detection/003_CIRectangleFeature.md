# 003_CIRectangleFeature.pdf

## Page 1

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


## Page 2

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


## Page 3

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


