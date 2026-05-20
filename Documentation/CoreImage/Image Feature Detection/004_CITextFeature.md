# 004_CITextFeature.pdf

## Page 1

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


## Page 2

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


## Page 3

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


