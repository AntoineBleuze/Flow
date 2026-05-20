# 008_BoostedTreeRegressor.pdf

## Page 1

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


## Page 2

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


## Page 3

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


