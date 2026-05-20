# 009_TreeRegressorModel.pdf

## Page 1

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


## Page 2

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


## Page 3

A linear optimization strategy.


