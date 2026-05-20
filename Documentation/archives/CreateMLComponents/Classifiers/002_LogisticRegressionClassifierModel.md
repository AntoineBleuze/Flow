# 002_LogisticRegressionClassifierModel.pdf

## Page 1

init(coefficients: some Sequence<Scalar>, labels: Set<Label>)
Creates a logistic regression model.
var coefficients: [Scalar]
The linear coefficients.
var featureCount: Int
The number of features expected in the input.
func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> ClassificationDistribution<Label>
Topics
Creating a regression model
Getting the properties
Performing the classification
Create ML Components / LogisticRegressionClassifierModel
Structure
LogisticRegressionClassifierModel
A trained logistic regression classifier model.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Performs a classification on a single input.
Classifier
Sendable
SendableMetatype
Transformer
protocol Classifier
An estimator that predicts classification probabilities.
struct LogisticRegressionClassifier
A logistic regression classifier.
struct BoostedTreeClassifier
A gradient boosted decision tree classifier.
struct BoostedTreeConfiguration
A boosted tree configuration.
struct FullyConnectedNetworkClassifier
A classifier that uses a fully connected network.
struct FullyConnectedNetworkClassifierModel
A classifier model that uses a fully connected network.
struct FullyConnectedNetworkMultiLabelClassifier
A classifier that uses a multi-label fully-connected network.
struct FullyConnectedNetworkMultiLabelClassifierModel
Relationships
Conforms To
See Also
Classifiers


## Page 3

A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


