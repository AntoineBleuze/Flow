# 005_MultivariateLinearRegressor_Model.pdf

## Page 1

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


## Page 2

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


## Page 3

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


