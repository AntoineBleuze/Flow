# Classifiers.pdf

## Page 1

associatedtype Label : Hashable
The classification label type.
Required
Transformer
FullyConnectedNetworkClassifierModel, LogisticRegressionClassifierModel, 
MLModelClassifierAdaptor
Topics
Getting the properties
Relationships
Inherits From
Conforming Types
Create ML Components / Classifier
Protocol
Classifier
An estimator that predicts classification probabilities.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

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
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.
See Also
Classifiers


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

The configuration for a time-series classifier.


## Page 7

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


## Page 8

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


## Page 9

A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


## Page 10

init(labels: Set<Label?>, annotationColumnName: String, featureColumn
Names: [String], configuration: BoostedTreeConfiguration)
Creates a boosted tree classifier.
var annotationColumnID: ColumnID<Label>
The annotation column identifier.
var featureColumnNames: [String]
The names of the columns containing feature values.
var configuration: BoostedTreeConfiguration
Boosted tree configuration.
var labels: Set<Label?>
The set of possible labels.
Topics
Creating a classifier
Getting the properties
Fitting the classifier
Create ML Components / BoostedTreeClassifier
Structure
BoostedTreeClassifier
A gradient boosted decision tree classifier.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 11

func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> TreeClassifierModel<Label>
Fits a boosted tree classifier model to a collection of examples.
typealias Annotation
The annotation type.
typealias Transformer
The transformer type created by this estimator.
func encodeLabels(some Collection<Optional<Label>>) throws -> (labels: 
String?], encoded: [Int])
UpdatableSupervisedTabularEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedTabularEstimator
UpdatableSupervisedTabularEstimator
Conforms when Label conforms to Comparable, Decodable, Encodable, and Hashable.
protocol Classifier
An estimator that predicts classification probabilities.
Encoding the classifier labels
Default Implementations
Relationships
Conforms To
See Also
Classifiers


## Page 12

struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
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
The configuration for a time-series classifier.


## Page 13

init()
Creates a default boosted tree configuration.
var columnSubsample: Double
Subsample ratio of the columns in each iteration of tree construction.
var earlyStoppingIterationCount: Int?
Stops training after this number of iterations where the validation metric does not improve.
var learningRate: Double
The learning rate.
var maximumDepth: Int
Maximum tree depth.
var maximumIterations: Int
Maximum number of iterations.
Topics
Creating a configuration
Inspecting the configuration
Create ML Components / BoostedTreeConfiguration
Structure
BoostedTreeConfiguration
A boosted tree configuration.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 14

var minimumChildWeight: Double
The minimum weight of each leaf node.
var minimumLossReduction: Double
Minimum loss reduction required to further split a node during the tree learning phase.
var parallelTreeCount: Int
The number of parallel trees constructed during each iteration.
var randomSeed: Int
A seed to generate reproducible results from random operations such as column and row
subsampling.
var rowSubsample: Double
Subsample ratio of the training set in each iteration of tree construction.
var stepSize: Double
The step size shrinking.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
protocol Classifier
An estimator that predicts classification probabilities.
Relationships
Conforms To
See Also
Classifiers


## Page 15

struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
struct BoostedTreeClassifier
A gradient boosted decision tree classifier.
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
The configuration for a time-series classifier.


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


## Page 20

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


## Page 21

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


## Page 22

The configuration for a time-series classifier.


## Page 23

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


## Page 24

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


## Page 25

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


## Page 26

The configuration for a time-series classifier.


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

init()
Creates a default fully-connected-network configuration.
var batchSize: Int
The number of examples to use per mini-batch.
var dropoutProbability: Float
The dropout probability.
var earlyStopIterationCount: Int
The number of iterations to use when evaluating whether to stop early.
var earlyStoppingTolerance: Double
The early-stopping tolerance.
var hiddenUnitCounts: [Int]
The number of neurons in each hidden layer.
Topics
Creating a network configuration
Getting the properties
Create ML Components / FullyConnectedNetworkConfiguration
Structure
FullyConnectedNetworkConfiguration
A fully connected network configuration.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 31

var learningRate: Float
The learning rate.
var maximumIterations: Int
The maximum number of iterations.
var randomSeed: Int
A seed to generate reproducible results from random operations such as column and row
subsampling.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
protocol Classifier
An estimator that predicts classification probabilities.
struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
struct BoostedTreeClassifier
A gradient boosted decision tree classifier.
Relationships
Conforms To
See Also
Classifiers


## Page 32

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
struct TreeClassifierModel
A trained tree classifier model.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


## Page 33

var classCount: Int
The number of classes.
var featureColumnNames: [String]
The names of the columns containing feature values.
var predictionColumnName: String
The name of the column containing the predicted labels.
func buildDataFrame([ClassificationDistribution<Label>]) -> DataFrame
Builds a data frame containing a labels column and a probability distribution column.
func applied(to: DataFrame, eventHandler: EventHandler?) async throws -
DataFrame
Topics
Getting the properties
Building a data frame
Applying
Create ML Components / TreeClassifierModel
Structure
TreeClassifierModel
A trained tree classifier model.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 34

Performs a classification on a data frame.
Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
TabularTransformer
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
struct FullyConnectedNetworkClassifierModel
A classifier model that uses a fully connected network.
Relationships
Conforms To
See Also
Classifiers


## Page 35

struct FullyConnectedNetworkMultiLabelClassifier
A classifier that uses a multi-label fully-connected network.
struct FullyConnectedNetworkMultiLabelClassifierModel
A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


## Page 36

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


## Page 37

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


## Page 38

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


## Page 39

init()
Creates a configuration.
var batchSize: Int
The number of examples in each training batch.
var earlyStoppingIterationCount: Int
The number of iterations to use when evaluating whether to stop early.
var earlyStoppingTolerance: Float
The early-stopping tolerance.
var learningRate: Float
The starting learning rate.
var maximumIterationCount: Int
The maximum number of allowed passes through the data.
Topics
Creating a time series classifier configuration
Inspecting a time series classifier configuration
Create ML Components / TimeSeriesClassifierConfiguration
Structure
TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+


## Page 40

var maximumSequenceLength: Int
The maximum number of samples that can be classified.
var minimumSequenceLength: Int
The minimum number of samples required to produce a classification.
var randomSeed: Int?
A seed to generate reproducible results from random operations.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
protocol Classifier
An estimator that predicts classification probabilities.
struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
struct BoostedTreeClassifier
A gradient boosted decision tree classifier.
struct BoostedTreeConfiguration
Relationships
Conforms To
See Also
Classifiers


## Page 41

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


