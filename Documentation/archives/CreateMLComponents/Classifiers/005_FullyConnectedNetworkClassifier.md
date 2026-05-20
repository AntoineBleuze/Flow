# 005_FullyConnectedNetworkClassifier.pdf

## Page 1

Creating a multi-label image classifier
init(labels: Set<Label>, configuration: FullyConnectedNetwork
Configuration)
Creates a fully connected network classifier.
var labels: Set<Label>
The set of possible labels.
var configuration: FullyConnectedNetworkConfiguration
The fully-connected-network configuration.
Mentioned in
Topics
Creating the classifier
Getting the properties
Create ML Components / FullyConnectedNetworkClassifier
Structure
FullyConnectedNetworkClassifier
A classifier that uses a fully connected network.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func encodeWithOptimizer(FullyConnectedNetworkClassifier<Scalar, Label>
Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer with an optimizer.
func decode(from: inout any EstimatorDecoder) throws -> FullyConnected
NetworkClassifierModel<Scalar, Label>
Decodes the estimator.
func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> FullyConnectedNetworkClassifierModel<Scalar, Label>
Fits a fully connected network classifier model to a sequence of examples.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> FullyConnectedNetworkClassifier
Model<Scalar, Label>
Fits a fully connected network classifier model to a sequence of examples.
typealias Annotation
The annotation type.
typealias Transformer
The transformer type created by this estimator.
SupervisedEstimator Implementations
UpdatableSupervisedEstimator Implementations
Copyable
Encoding and decoding
Fitting a classifier
Default Implementations
Relationships
Conforms To


## Page 3

Sendable
SendableMetatype
SupervisedEstimator
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
UpdatableSupervisedEstimator
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
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
struct FullyConnectedNetworkClassifierModel
A classifier model that uses a fully connected network.
struct FullyConnectedNetworkMultiLabelClassifier
A classifier that uses a multi-label fully-connected network.
struct FullyConnectedNetworkMultiLabelClassifierModel
A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
See Also
Classifiers


## Page 4

struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


