# 002_LinearRegressorModel.pdf

## Page 1

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


## Page 2

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


## Page 3

A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


