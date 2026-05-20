# 007_FullyConnectedNetworkMultiLabelClassifier.pdf

## Page 1

Creating a multi-label image classifier
init(labels: Set<Label>, configuration: FullyConnectedNetwork
Configuration)
Creates a full-connected network multi-label classifier.
var configuration: FullyConnectedNetworkConfiguration
The fully-connected network configuration.
Mentioned in
Topics
Creating a classifier
Getting the properties
Create ML Components / FullyConnectedNetworkMultiLabelClassifier
Structure
FullyConnectedNetworkMultiLabel
Classifier
A classifier that uses a multi-label fully-connected network.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 2

static var defaultConfiguration: FullyConnectedNetworkConfiguration
The default fully-connected network configration.
var labels: Set<Label>
The set of possible labels.
func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> FullyConnectedNetworkMultiLabelClassifierModel<Scalar, Label>
Fits a fully-connected network multi-label classifier model to a sequence of examples.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> FullyConnectedNetworkMultiLabel
ClassifierModel<Scalar, Label>
Fits a fully-connected network multi-label classifier model to a sequence of examples.
typealias Annotation
The annotation type.
typealias Transformer
The transformer type created by this estimator.
SupervisedEstimator Implementations
UpdatableSupervisedEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedEstimator
UpdatableSupervisedEstimator
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Scalar conforms to Decodable, Scalar conforms to Encodable, Label conforms to Comparable, Label
Fitting a classifier
Default Implementations
Relationships
Conforms To


## Page 3

conforms to Decodable, Label conforms to Encodable, and Label conforms to Hashable.
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
struct FullyConnectedNetworkClassifierModel
A classifier model that uses a fully connected network.
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


