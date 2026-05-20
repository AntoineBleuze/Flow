# 006_FullyConnectedNetworkClassifierModel.pdf

## Page 1

func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> ClassificationDistribution<Label>
Performs a classification on a shaped array.
Classifier
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Topics
Applying a classification
Relationships
Conforms To
Create ML Components / FullyConnectedNetworkClassifierModel
Structure
FullyConnectedNetworkClassifierModel
A classifier model that uses a fully connected network.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Transformer
protocol Classifier
An estimator that predicts classification probabilities.
struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
struct BoostedTreeClassifier
A gradient boosted decision tree classifier.
struct BoostedTreeConfiguration
A boosted tree configuration.
struct FullyConnectedNetworkClassifier
A classifier that uses a fully connected network.
struct FullyConnectedNetworkMultiLabelClassifier
A classifier that uses a multi-label fully-connected network.
struct FullyConnectedNetworkMultiLabelClassifierModel
A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
See Also
Classifiers


## Page 3

The configuration for a time-series classifier.


