# 001_ObjectDetectionAnnotation.pdf

## Page 1

The annotation consists of a list of bounding boxes and object labels for each image.
let imageFileName: String
The name of the image file.
let objects: [ObjectDetectionAnnotation<Label>.Annotation]
The list of object annotations in the image.
struct Annotation
The annotation represented by an object label and its bounding box.
let prominentObject: Label
The most prominent object in the image.
Overview
Topics
Getting the properties
Encoding and decoding
Create ML Components / ObjectDetectionAnnotation
Structure
ObjectDetectionAnnotation
An object detection annotation.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 2

enum CodingKeys
Coding keys for object detection annotations
Identifiable Implementations
Copyable
Decodable
Equatable
Identifiable
Sendable
SendableMetatype
struct DetectedObject
An item in a detection result.
struct ObjectDetectionMetrics
Metrics for object detection model.
Default Implementations
Relationships
Conforms To
See Also
Object detection components


