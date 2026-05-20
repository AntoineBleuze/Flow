# 004_BoostedTreeConfiguration.pdf

## Page 1

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


## Page 2

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


## Page 3

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


