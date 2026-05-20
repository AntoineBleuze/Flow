# 003_MultiLabelClassificationMetrics.pdf

## Page 1

init(some Sequence<(classification: ClassificationDistribution<Label>,
labels: Set<Label>)>, strategy: MultiLabelClassificationMetrics<Label>.
ThresholdSelectionStrategy) throws
Creates multi-label classification metrics for classifications and ground truth labels.
init(some Sequence<(classification: ClassificationDistribution<Label>,
labels: Set<Label>)>, strategy: MultiLabelClassificationMetrics<Label>.
ThresholdSelectionStrategy, labels: Set<Label>) throws
Creates multi-label classification metrics for classifications and ground truth labels.
init(classifications: some Sequence<ClassificationDistribution<Label>>,
groundTruth: some Sequence<Set<Label>>, strategy: MultiLabel
ClassificationMetrics<Label>.ThresholdSelectionStrategy) throws
Creates multi-label classification metrics for classifications and ground truth labels.
init(classifications: some Sequence<ClassificationDistribution<Label>>,
groundTruth: some Sequence<Set<Label>>, strategy: MultiLabel
ClassificationMetrics<Label>.ThresholdSelectionStrategy, labels: Set<
Label>) throws
Creates multi-label classification metrics for classifications and ground truth labels.
Topics
Creating the distribution
Create ML Components / MultiLabelClassificationMetrics
Structure
MultiLabelClassificationMetrics
Multi-label classification metrics.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

init(confidenceThresholds: [Label : Float])
Creates empty multi-label classification metrics.
enum ThresholdSelectionStrategy
A strategy for selecting a confidence threshold.
var confidenceThresholds: [Label : Float]
A dictionary of label and confidence thresholds.
var exampleCount: Int
The number of examples used to compute the metrics.
var labels: Set<Label>
The classifier labels.
var meanAveragePrecision: Float
The mean average precision.
func count(of: Label) -> Int
Returns the number of times a label appeared in the ground truth collection.
func f1Score(for: Label) -> Float
Computes the F1 score from predicted and ground truth values.
func falseNegativeCount(of: Label) -> Int
Returns the number of times a true label was not predicted.
func falsePositiveCount(of: Label) -> Int
Returns the number of times the predicted label did not match the true label.
func precisionScore(for: Label) -> Float
Computes the precision score for a class label.
func recallScore(for: Label) -> Float
Computes the recall score for a class label.
func trueNegativeCount(of: Label) -> Int
Returns the number of times a label was not in the predicted or ground truth collections.
Getting the properties
Computing and scoring


## Page 3

func truePositiveCount(of: Label) -> Int
Returns the number of times the predicted label matched the true label.
func add(some Sequence<(classification: ClassificationDistribution<Labe
>, labels: Set<Label>)>)
Updates the metrics with more pairs of classifications and ground truth labels.
func add(classifications: some Sequence<ClassificationDistribution<Labe
>>, groundTruth: some Sequence<Set<Label>>)
Updates the metrics with more classifications and ground truth labels.
static func meanAveragePrecisionScore(some Sequence<(classification:
ClassificationDistribution<Label>, labels: Set<Label>)>) -> Float
Computes the mean average precision.
static func meanAveragePrecisionScore(some Sequence<(classification:
ClassificationDistribution<Label>, labels: Set<Label>)>, labels: Set<
Label>) -> Float
Computes the mean average precision.
static func meanAveragePrecisionScore(classifications: some Sequence<
ClassificationDistribution<Label>>, groundTruth: some Sequence<Set<Labe
>>) -> Float
Computes the mean average precision.
static func meanAveragePrecisionScore(classifications: some Sequence<
ClassificationDistribution<Label>>, groundTruth: some Sequence<Set<Labe
>>, labels: Set<Label>) -> Float
Computes the mean average precision.
Updating the metrics
Computing the precision
Relationships
Conforms To


## Page 4

Sendable, SendableMetatype
struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
func rootMeanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
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
See Also
Metrics


## Page 5

Computes the mean squared error between predicted and ground truth values.


