# 001_LogisticRegressionClassifier.pdf

## Page 1

init(labels: Set<Label>, configuration: LogisticRegressionClassifier<
Scalar, Label>.Configuration)
Creates a logistic regression classifier.
struct Configuration
A logistic regression classifier configuration.
var configuration: LogisticRegressionClassifier<Scalar, Label>.
Configuration
The logistic regression classifier configuration.
var labels: Set<Label>
The set of possible labels.
Topics
Creating a classifier
Getting the properties
Encoding and decoding
Create ML Components / LogisticRegressionClassifier
Structure
LogisticRegressionClassifier
A logistic regression classifier.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func encodeWithOptimizer(LogisticRegressionClassifier<Scalar, Label>.
Transformer, to: inout any EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
LogisticRegressionClassifier<Scalar, Label>.Transformer
Reads the encoded transformer and optimizer with a decoder.
func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> LogisticRegressionClassifier<Scalar, Label>.Transformer
Fits a logistic regression classifier model to a sequence of examples while validating with a
validation sequence.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> LogisticRegressionClassifier
Model<Scalar, Label>
Fits a logistic regression classifier model to a sequence of examples.
typealias Annotation
The annotation type.
typealias Transformer
The transformer type created by this estimator.
UpdatableSupervisedEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedEstimator
UpdatableSupervisedEstimator
Fitting
Default Implementations
Relationships
Conforms To


## Page 3

Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
protocol Classifier
An estimator that predicts classification probabilities.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
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
A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
See Also
Classifiers


## Page 4

The configuration for a time-series classifier.


