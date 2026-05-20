# 002_ClassificationMetrics.pdf

## Page 1

init<Predicted, Correct>(Predicted, Correct)
Creates classification metrics for predicted and ground truth labels.
init()
Creates empty classification metrics.
init(_:)
Creates classification metrics for a sequence of predicted and ground truth label pairs.
init(some Sequence<(predicted: Label, label: Label)>, labels: Set<Label
>)
Creates classification metrics for a sequence of predicted and ground truth label pairs.
init<Predicted, Correct>(predicted: Predicted, groundTruth: Correct,
labels: Set<Label>)
Creates classification metrics for predicted and ground truth labels.
Topics
Creating the distribution
Getting the properties
Create ML Components / ClassificationMetrics
Structure
ClassificationMetrics
Classification metrics.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

var accuracy: Double
The number of correctly classified examples out of the total number of examples.
var exampleCount: Int
The number of examples used to compute the metrics.
var labels: Set<Label>
The set of labels.
var restrictToKnownLabels: Bool
A Boolean value indicating whether to restrict metrics to labels in the labels set.
func makeConfusionMatrix() -> MLShapedArray<Float>
Computes the confusion matrix.
func precisionScore(label: Label) -> Double
Computes the precision score for a class label.
func recallScore(label: Label) -> Double
Computes the recall score for a class label.
func count(label: Label) -> Int
Returns the number of times a label appeared in the ground truth collection.
func count(predicted: Label) -> Int
Returns the number of times a label appeared in the predicted collection.
func count(predicted: Label, label: Label) -> Int
Returns the number of times a predicted, true label pair appeared in the label collections.
func trueNegativeCount(of: Label) -> Int
Returns the number of times a label was not in the predicted or ground truth collections.
func truePositiveCount(of: Label) -> Int
Returns the number of times the predicted label matched the true label.
func falseNegativeCount(of: Label) -> Int
Returns the number of times a true label was not predicted.
func falsePositiveCount(of: Label) -> Int
Returns the number of times the predicted label did not match the true label.
Computing and scoring


## Page 3

func f1Score(label: Label) -> Double
Computes the F1 score for a class label.
func mapLabels<T>((Label) throws -> T) rethrows -> ClassificationMetric
<T>
Returns new classification metrics where the labels are the result of applying a transformatio
func add(some Sequence<(predicted: Label, label: Label)>)
Updates the metrics with more predicted and ground truth label pairs.
func add(predicted: some Sequence<Label>, groundTruth: some Sequence<
Label>)
Updates the metrics with more predicted and ground truth labels.
Sendable, SendableMetatype
struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
func rootMeanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Updating the metrics
Relationships
Conforms To
See Also
Metrics


## Page 4

Computes the root mean squared error between predicted and ground truth values.
func rootMeanSquaredError<T>(some Collection, some Collection) -> T
Computes the root mean squared error between predicted and ground truth values.
func maximumAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the maximum absolute error between predicted and ground truth values.
func maximumAbsoluteError<T>(some Collection, some Collection) -> T
Computes the maximum absolute error between predicted and ground truth values.
func meanAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute error between predicted and ground truth values.
func meanAbsoluteError<T>(some Collection, some Collection) -> T
Computes the mean absolute error between predicted and ground truth values.
func meanAbsolutePercentageError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute percentage error between predicted and ground truth values.
func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.


