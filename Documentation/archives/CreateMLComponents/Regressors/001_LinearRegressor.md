# 001_LinearRegressor.pdf

## Page 1

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


## Page 2

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


## Page 3

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


