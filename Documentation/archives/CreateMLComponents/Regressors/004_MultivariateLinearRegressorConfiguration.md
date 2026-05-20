# 004_MultivariateLinearRegressorConfiguration.pdf

## Page 1

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


## Page 2

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


## Page 3

A regressor model that uses a fully connected network.
struct BoostedTreeRegressor
A gradient boosted decision tree regressor.
struct TreeRegressorModel
A trained tree regressor model.
enum OptimizationStrategy
A linear optimization strategy.


