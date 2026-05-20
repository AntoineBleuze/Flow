# 006_FullyConnectedNetworkRegressor.pdf

## Page 1

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


## Page 2

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


## Page 3

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


