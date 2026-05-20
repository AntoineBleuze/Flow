# 011_TimeSeriesClassifier.pdf

## Page 1

init(labels: Set<Label>, configuration: TimeSeriesClassifier
Configuration)
Creates a time series classifier.
var configuration: TimeSeriesClassifierConfiguration
The configuration.
var labels: Set<Label>
The set of possible labels.
func fitted(to: some Sequence<AnnotatedFeature<MLShapedArray<Scalar>,
Label>>, eventHandler: EventHandler?) async throws -> TimeSeries
Classifier<Scalar, Label>.Model
Fits a time series classifier model to a sequence of examples.
Topics
Creating a time series classifier
Inspecting a time series classifier
Fitting a time series classifier
Create ML Components / TimeSeriesClassifier
Structure
TimeSeriesClassifier
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 2

func fitted(to: some Sequence<AnnotatedFeature<MLShapedArray<Scalar>,
Label>>, validateOn: some Sequence<AnnotatedFeature<MLShapedArray<Scala
>, Label>>, eventHandler: EventHandler?) async throws -> TimeSeries
Classifier<Scalar, Label>.Model
Fits a time series classifier model to a sequence of examples.
typealias Configuration
struct Model
A time-series classifier model.
UpdatableSupervisedEstimator Implementations
Copyable
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
Supporting types
Default Implementations
Relationships
Conforms To
See Also
Classifiers


## Page 3

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
struct FullyConnectedNetworkMultiLabelClassifier
A classifier that uses a multi-label fully-connected network.
struct FullyConnectedNetworkMultiLabelClassifierModel
A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


