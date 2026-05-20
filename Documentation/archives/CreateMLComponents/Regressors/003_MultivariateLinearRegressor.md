# 003_MultivariateLinearRegressor.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


