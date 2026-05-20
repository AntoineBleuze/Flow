# Metrics.pdf

## Page 1

init(label: Label, probability: Float)
Creates a classification with label and probability.
var label: Label
The classification label.
var probability: Float
The classification probability. A value between 0 and 1.
Copyable
Topics
Creating the item
Getting the properties
Relationships
Conforms To
Create ML Components / Classification
Structure
Classification
An item in a classification result.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
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
See Also
Metrics


## Page 3

func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.


## Page 4

init<C>(C)
Creates a classification distribution.
var endIndex: Int
The index of the final element in the classification distribution.
var labelsSortedByProbability: [Label]
The labels sorted by decreasing probability.
var mostLikelyLabel: Label?
The label with the highest probability.
var startIndex: Int
The index of the initial element in the classification distribution.
Topics
Creating the distribution
Getting the properties
Getting the index
Create ML Components / ClassificationDistribution
Structure
ClassificationDistribution
A classification distribution that contains a probability for each classification labe
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 5

func index(after: Int) -> Int
Returns the index immediately after an element index.
func index(before: Int) -> Int
Returns the index immediately before an element index.
func topLabels(Int) -> [Label]
Computes the most likely labels in the classification set.
func map<T>((Classification<Label>) throws -> Classification<T>)
rethrows -> ClassificationDistribution<T>
Creates a new classification distribution by applying a transformation to every element.
subscript(_:)
Accesses a contiguous range of elements.
Collection
Copyable
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Sequence
Labeling and mapping
Accessing by subscript
Relationships
Conforms To
See Also


## Page 6

struct Classification
An item in a classification result.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
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
Computes the mean squared error between predicted and ground truth values.
Metrics


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

Computes the mean squared error between predicted and ground truth values.


## Page 16

annotatedPredictions
An AnnotatedPrediction object.
The root mean squared error.
If an empty AnnotatedPrediction is supplied, the result will be NaN.
struct Classification
Parameters
Return Value
Discussion
See Also
Metrics
Create ML Components / rootMeanSquaredError(_:)
Function
rootMeanSquaredError(_:)
Computes the root mean squared error between predicted and ground truth
values.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 17

An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
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


## Page 18

predicted
The predicted values.
groundTruth
The ground truth values. The collection must have same number of elements as the predicte
values.
The root mean squared error.
Empty collections of predicted and ground truth values will return a value of NaN.
Parameters
Return Value
Discussion
Create ML Components / rootMeanSquaredError(_:_:)
Function
rootMeanSquaredError(_:_:)
Computes the root mean squared error between predicted and ground truth
values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 19

struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
func rootMeanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
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
See Also
Metrics


## Page 20

annotatedPredictions
An AnnotatedPrediction object.
The maximum absolute error.
If an empty AnnotatedPrediction is supplied, the result will be NaN.
struct Classification
Parameters
Return Value
Discussion
See Also
Metrics
Create ML Components / maximumAbsoluteError(_:)
Function
maximumAbsoluteError(_:)
Computes the maximum absolute error between predicted and ground truth
values.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 21

An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
func rootMeanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func rootMeanSquaredError<T>(some Collection, some Collection) -> T
Computes the root mean squared error between predicted and ground truth values.
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


## Page 22

predicted
The predicted values.
groundTruth
The ground truth values. The collection must have same number of elements as the predicte
values.
The maximum absolute error.
Empty collections of predicted and ground truth values will return a value of NaN.
Parameters
Return Value
Discussion
Create ML Components / maximumAbsoluteError(_:_:)
Function
maximumAbsoluteError(_:_:)
Computes the maximum absolute error between predicted and ground truth
values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 23

struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
func rootMeanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func rootMeanSquaredError<T>(some Collection, some Collection) -> T
Computes the root mean squared error between predicted and ground truth values.
func maximumAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
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
See Also
Metrics


## Page 24

annotatedPredictions
An AnnotatedPrediction object.
The mean absolute error.
If an empty AnnotatedPrediction is supplied, the result will be NaN.
struct Classification
An item in a classification result.
Parameters
Return Value
Discussion
See Also
Metrics
Create ML Components / meanAbsoluteError(_:)
Function
meanAbsoluteError(_:)
Computes the mean absolute error between predicted and ground truth values.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 25

struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
func rootMeanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func rootMeanSquaredError<T>(some Collection, some Collection) -> T
Computes the root mean squared error between predicted and ground truth values.
func maximumAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the maximum absolute error between predicted and ground truth values.
func maximumAbsoluteError<T>(some Collection, some Collection) -> T
Computes the maximum absolute error between predicted and ground truth values.
func meanAbsoluteError<T>(some Collection, some Collection) -> T
Computes the mean absolute error between predicted and ground truth values.
func meanAbsolutePercentageError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute percentage error between predicted and ground truth values.
func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.


## Page 26

predicted
The predicted values.
groundTruth
The ground truth values. The collection must have same number of elements as the predicte
values.
The mean absolute error.
Empty collections of predicted and ground truth values will return a value of NaN.
Parameters
Return Value
Discussion
Create ML Components / meanAbsoluteError(_:_:)
Function
meanAbsoluteError(_:_:)
Computes the mean absolute error between predicted and ground truth values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 27

struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
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
func meanAbsolutePercentageError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute percentage error between predicted and ground truth values.
func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.
See Also
Metrics


## Page 28

annotatedPredictions
An AnnotatedPrediction object.
The mean absolute percentage error as a decimal value.
If an empty AnnotatedPrediction is supplied, the result will be NaN.
struct Classification
Parameters
Return Value
Discussion
See Also
Metrics
Create ML Components / meanAbsolutePercentageError(_:)
Function
meanAbsolutePercentageError(_:)
Computes the mean absolute percentage error between predicted and ground
truth values.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 29

An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
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
func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.


## Page 30

annotatedPredictions
An AnnotatedPrediction object.
The root mean squared error.
If an empty AnnotatedPrediction is supplied, the result will be NaN.
Parameters
Return Value
Discussion
See Also
Metrics
Create ML Components / meanSquaredError(_:)
Function
meanSquaredError(_:)
Computes the root mean squared error between predicted and ground truth
values.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 31

struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
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
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.


## Page 32

predicted
The predicted values.
groundTruth
The ground truth values. The collection must have same number of elements as the predicte
values.
The mean squared error.
Empty collections of predicted and ground truth values will return a value of NaN.
Parameters
Return Value
Discussion
Create ML Components / meanSquaredError(_:_:)
Function
meanSquaredError(_:_:)
Computes the mean squared error between predicted and ground truth values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 33

struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
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
See Also
Metrics


