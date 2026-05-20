# 008_FullyConnectedNetworkMultiLabelClassifierModel.pdf

## Page 1

func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
throws -> ClassificationDistribution<Label>
Performs a classification on a shaped array.
func evaluation(on: some Collection<AnnotatedFeature<MLShapedArray<
Scalar>, Set<Label>>>, confidenceThresholds: [Label : Float]) throws ->
MultiLabelClassificationMetrics<Label>
Computes evaluation metrics on annotated examples.
func prediction(from:confidenceThresholds:)
Topics
Performing a classification
Computing evaluation metrics
Performing a prediction
Create ML Components / FullyConnectedNetworkMultiLabelClassifierModel
Structure
FullyConnectedNetworkMultiLabel
ClassifierModel
A multi-label classifier model that uses a fully-connected network.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 2

Performs a prediction and keeps label-confidence pairs that are greater than or equal to the
provided confidence thresholds.
func updatePrecisionRecallCurves(some Collection<AnnotatedFeature<
MLShapedArray<Scalar>, Set<Label>>>) async throws
Updates the per-label precision-recall curve using the input data.
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Sendable
SendableMetatype
Transformer
protocol Classifier
An estimator that predicts classification probabilities.
struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
struct BoostedTreeClassifier
A gradient boosted decision tree classifier.
Updating the precision recall curve
Relationships
Conforms To
See Also
Classifiers


## Page 3

struct BoostedTreeConfiguration
A boosted tree configuration.
struct FullyConnectedNetworkClassifier
A classifier that uses a fully connected network.
struct FullyConnectedNetworkClassifierModel
A classifier model that uses a fully connected network.
struct FullyConnectedNetworkMultiLabelClassifier
A classifier that uses a multi-label fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


