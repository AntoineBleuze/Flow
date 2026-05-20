# 002_ObjectDetectionMetrics.pdf

## Page 1

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


## Page 2

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


## Page 3

struct ObjectDetectionAnnotation
An object detection annotation.


