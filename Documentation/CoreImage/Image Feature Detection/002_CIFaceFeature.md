# 002_CIFaceFeature.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

class CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.


