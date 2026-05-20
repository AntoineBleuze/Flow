# 000_DetectedObject.pdf

## Page 1

init(boundingBox: CGRect, label: Label, probability: Float)
Creates a detected object with bounding box, object label and confidence.
var boundingBox: CGRect
The bounding box of the detected object.
var confidence: Float
The detection confidence. The value will always be between 0.0 and 1.0.
var label: Label
The detected object label.
Topics
Creating a detected object
Getting the properties
Relationships
Create ML Components / DetectedObject
Structure
DetectedObject
An item in a detection result.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 2

Copyable
Decodable
Encodable
Equatable
Sendable
SendableMetatype
struct ObjectDetectionAnnotation
An object detection annotation.
struct ObjectDetectionMetrics
Metrics for object detection model.
Conforms To
See Also
Object detection components


