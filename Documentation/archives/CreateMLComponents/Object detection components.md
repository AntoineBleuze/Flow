# Object detection components.pdf

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


## Page 3

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


## Page 4

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


## Page 5

init()
var defaultConfidenceThreshold: Float
The default confidence threshold. It is used as the confidence threshold for any label which
does not have an explicit confidence threshold, while calculating averagePrecision and
meanAveragePrecision.
var labels: Set<Label>
A set of labels present in the dataset.
func averageOfAveragePrecisionAtVariedThresholds<Scalar>(predictions: [
DetectedObject<Label>]], annotations: [ObjectDetectionAnnotation<Label
>], confidenceThresholds: [Label : Float]) -> [Label : Scalar]
Calculates average of average precision for all the labels, computed at varied bounding box
overlap thresholds. The overlap thresholds range is from [0.05, 0.95] with a stride of 0
Topics
Creating a metrics object
Getting the properties Properties
Calculating the precision
Create ML Components / ObjectDetectionMetrics
Structure
ObjectDetectionMetrics
Metrics for object detection model.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 6

.05.
func averageOfMeanAveragePrecisionAtVariedThresholds<Scalar>(prediction
: [[DetectedObject<Label>]], annotations: [ObjectDetectionAnnotation<
Label>], confidenceThresholds: [Label : Float]) -> Scalar
Calculates the average of mean average precision, computed at varied bounding box overlap
thresholds. The overlap thresholds range is from [0.05, 0.95] with a stride of 0.05.
func averagePrecision<Scalar>(predictions: [[DetectedObject<Label>]],
annotations: [ObjectDetectionAnnotation<Label>], confidenceThresholds: 
Label : Float], overlapThreshold: Double) -> [Label : Scalar]
Calculates average precision for all the labels at the bounding box overlap threshold.
func meanAveragePrecision<Scalar>(predictions: [[DetectedObject<Label
>]], annotations: [ObjectDetectionAnnotation<Label>], confidence
Thresholds: [Label : Float], overlapThreshold: Double) -> Scalar
Calculates the mean average precision at the bounding box overlap threshold.
static func extractLabels(from: [ObjectDetectionAnnotation<Label>]) ->
Set<Label>
Extracts all the labels from a list of annotations.
Sendable, SendableMetatype
struct DetectedObject
An item in a detection result.
Extracting labels
Relationships
Conforms To
See Also
Object detection components


## Page 7

struct ObjectDetectionAnnotation
An object detection annotation.


