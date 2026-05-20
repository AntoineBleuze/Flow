# Regressors.pdf

## Page 1

func prediction(from:)
Performs a prediction from a single input.
Transformer
FullyConnectedNetworkRegressorModel, LinearRegressorModel, 
MLModelRegressorAdaptor
Topics
Performing the prediction
Relationships
Inherits From
Conforming Types
Create ML Components / Regressor
Protocol
Regressor
A transformer that predicts a float value.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.
See Also
Regressors


## Page 3

init(configuration: LinearRegressor<Scalar>.Configuration)
Creates a linear regressor.
struct Configuration
A linear regressor configuration.
var configuration: LinearRegressor<Scalar>.Configuration
The linear regressor configuration.
func encodeWithOptimizer(LinearRegressorModel<Scalar>, to: inout any
EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
Topics
Creating a regressor
Getting the configuration
Encoding and decoding
Create ML Components / LinearRegressor
Structure
LinearRegressor
A linear regressor.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 4

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
LinearRegressorModel<Scalar>
Reads the encoded transformer and optimizer with a decoder.
func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> LinearRegressorModel<Scalar>
Fits a linear regressor model to a sequence of examples.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> LinearRegressorModel<Scalar>
Fits a linear regressor model to a sequence of examples.
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
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
Fitting
Default Implementations
Relationships
Conforms To
See Also


## Page 5

protocol Regressor
A transformer that predicts a float value.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.
Regressors


## Page 6

init(coefficients: some Sequence<Scalar>)
Creates a linear regression model.
var featureCount: Int
The number of features expected in the input.
var coefficients: [Scalar]
The linear coefficients.
func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> Scalar
Performs a regression on a single input.
Topics
Creating a regressor model
Getting the properties
Performing the regression
Create ML Components / LinearRegressorModel
Structure
LinearRegressorModel
A trained linear regressor model.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 7

Regressor
Sendable
SendableMetatype
Transformer
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
A linear regressor.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
Relationships
Conforms To
See Also
Regressors


## Page 8

A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


## Page 9

Unlike a LinearRegressor, a MultivariateLinearRegressor supports shaped array
outputs with any number of elements. It also provides a wider range of training options better
suited for large multi-dimensional regression.
Note
Only Float and Double are currently supported as the Scalar type. You may get faster
training when using Float.
init(configuration: MultivariateLinearRegressor<Scalar>.Configuration)
Creates a multivariate linear regressor.
Overview
Topics
Creating a regressor
Getting the configuration
Create ML Components / MultivariateLinearRegressor
Structure
MultivariateLinearRegressor
A multivariate linear regressor.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 10

var configuration: MultivariateLinearRegressor<Scalar>.Configuration
The linear regressor configuration.
func fitted(to: some Sequence<AnnotatedFeature<MLShapedArray<Scalar>,
MLShapedArray<Scalar>>>, eventHandler: EventHandler?) async throws ->
MultivariateLinearRegressor<Scalar>.Model
Fits a linear regressor model to a sequence of annotated features.
func fitted(to:validateOn:eventHandler:)
Fits a linear regressor model to shaped arrays of features and annotations.
func makeTransformer() -> MultivariateLinearRegressor<Scalar>.Model
Creates a default-initialized model suitable for incremental fitting.
func update(inout MultivariateLinearRegressor<Scalar>.Model, with: some
Sequence<AnnotatedFeature<MLShapedArray<Scalar>, MLShapedArray<Scalar
>>>, eventHandler: EventHandler?) async throws
Updates a model with a new sequence of examples.
func update(inout MultivariateLinearRegressor<Scalar>.Model, with:
AnnotatedBatch<Scalar>) async throws -> Scalar
Updates a model with a new shaped array of examples.
func encodeWithOptimizer(MultivariateLinearRegressor<Scalar>.Model, to:
inout any EstimatorEncoder) throws
Encodes the model and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
MultivariateLinearRegressor<Scalar>.Model
Reads the encoded model and optimizer with a decoder.
struct Model
A trained multivariate linear regressor model.
Fitting
Fitting Progressively
Encoding and decoding
Supporting types


## Page 11

typealias Annotation
The annotation type.
typealias Configuration
typealias Feature
The feature type.
typealias Transformer
The transformer type created by this estimator.
UpdatableSupervisedEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedEstimator
UpdatableSupervisedEstimator
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
Default Implementations
Relationships
Conforms To
See Also
Regressors


## Page 12

A trained linear regressor model.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


## Page 13

init()
Creates a default linear regressor configuration.
var batchSize: Int
The number of examples in each training batch.
var maximumIterationCount: Int
The maximum number of allowed passes through the data.
var earlyStoppingTolerance: Float
The early-stopping tolerance.
var earlyStoppingIterationCount: Int
The number of iterations to use when evaluating whether to stop early.
var learningRate: Float
The optimizer learning rate.
Topics
Creating a configuration
Getting the properties
Create ML Components / MultivariateLinearRegressorConfiguration
Structure
MultivariateLinearRegressorConfiguration
A linear regressor configuration.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 14

var randomSeed: Int?
A seed to generate reproducible results from random operations.
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
Relationships
Conforms To
See Also
Regressors


## Page 15

A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


## Page 16

Note
Only Float and Double are currently supported as the Scalar type.
init(weight: MLShapedArray<Scalar>, bias: MLShapedArray<Scalar>?)
Creates a multivariate linear regressor.
var inputSize: Int
The input size.
Overview
Topics
Creating a regressor model
Getting the properties
Create ML Components / MultivariateLinearRegressor / MultivariateLinearRegressor.Model
Structure
MultivariateLinearRegressor.Model
A trained multivariate linear regressor model.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+
Available when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.


## Page 17

var outputSize: Int
The output size.
var weight: MLShapedArray<Scalar>
The linear coefficients.
var bias: MLShapedArray<Scalar>?
The bias coefficients.
func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> MLShapedArray<Scalar>
Performs a prediction on a shaped array.
Sendable, SendableMetatype, Transformer
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
Performing the regression
Relationships
Conforms To
See Also
Regressors


## Page 18

struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


## Page 19

init(configuration: FullyConnectedNetworkConfiguration)
Creates a fully connected network regressor.
var configuration: FullyConnectedNetworkConfiguration
The fully-connected-network configuration.
func decode(from: inout any EstimatorDecoder) throws -> FullyConnected
NetworkRegressorModel<Scalar>
Decodes the estimator.
Topics
Creating the regressor
Getting the configuration
Decoding a regressor
Fitting a regressor
Create ML Components / FullyConnectedNetworkRegressor
Structure
FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 20

func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> FullyConnectedNetworkRegressor<Scalar>.Transformer
Fits a fully connected network regressor model to a sequence of examples.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> FullyConnectedNetworkRegressor
Model<Scalar>
Fits a fully connected network regressor model to a sequence of examples.
protocol Transformer
A transformer that takes an input and produces an output.
SupervisedEstimator Implementations
UpdatableSupervisedEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedEstimator
UpdatableSupervisedEstimator
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
Default Implementations
Relationships
Conforms To
See Also
Regressors


## Page 21

A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


## Page 22

func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> FullyConnectedNetworkRegressorModel<Scalar>.Target
Performs regression on a shaped array.
typealias Target
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Regressor
Topics
Performing a regression
Relationships
Conforms To
Create ML Components / FullyConnectedNetworkRegressorModel
Structure
FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 23

Transformer
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.
See Also
Regressors


## Page 24

init(annotationColumnName: String, featureColumnNames: [String],
configuration: BoostedTreeConfiguration)
Creates a boosted tree regressor.
var annotationColumnID: ColumnID<Annotation>
The annotation column identifier.
var configuration: BoostedTreeConfiguration
Boosted tree configuration.
var featureColumnNames: [String]
The names of the columns containing feature values.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> TreeRegressorModel
Topics
Creating a regressor
Getting the properties
Fitting a regressor model
Create ML Components / BoostedTreeRegressor
Structure
BoostedTreeRegressor
A gradient boosted decision tree regressor.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 25

Fits a boosted tree regressor model to a collection of examples.
typealias Transformer
The transformer type created by this estimator.
func encodeWithOptimizer(TreeRegressorModel, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
TreeRegressorModel
Reads the encoded transformer and optimizer with a decoder.
UpdatableSupervisedTabularEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedTabularEstimator
UpdatableSupervisedTabularEstimator
Conforms when Annotation conforms to Copyable and Escapable.
protocol Regressor
A transformer that predicts a float value.
Encoding and decoding a regressor
Default Implementations
Relationships
Conforms To
See Also
Regressors


## Page 26

struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


## Page 27

var featureColumnNames: [String]
The names of the columns containing feature values.
var predictionColumnName: String
The name of the column containing the predicted values.
func applied(to: DataFrame, eventHandler: EventHandler?) async throws -
DataFrame
Performs a regression on a data frame.
Topics
Getting the column names
Applying
Relationships
Conforms To
Create ML Components / TreeRegressorModel
Structure
TreeRegressorModel
A trained tree regressor model.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 28

Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
TabularTransformer
Transformer
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
enum OptimizationStrategy
See Also
Regressors


## Page 29

A linear optimization strategy.


## Page 30

case automatic
Chooses the best optimization strategy based on the problem size and configuration.
case fast
An optimization strategy that minimizes computation time.
case lowMemory
An optimization strategy that minimizes memory use.
case nonSmooth
An optimization strategy that can handle non-smooth problems.
Decodable
Topics
Optimization strategies
Relationships
Conforms To
Create ML Components / OptimizationStrategy
Enumeration
OptimizationStrategy
A linear optimization strategy.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 31

Encodable
Equatable
Hashable
Sendable
SendableMetatype
protocol Regressor
A transformer that predicts a float value.
struct LinearRegressor
A linear regressor.
struct LinearRegressorModel
A trained linear regressor model.
struct MultivariateLinearRegressor
A multivariate linear regressor.
struct MultivariateLinearRegressorConfiguration
A linear regressor configuration.
struct Model
A trained multivariate linear regressor model.
struct FullyConnectedNetworkRegressor
A regressor that uses a fully connected network.
struct FullyConnectedNetworkRegressorModel
A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
See Also
Regressors


## Page 32



