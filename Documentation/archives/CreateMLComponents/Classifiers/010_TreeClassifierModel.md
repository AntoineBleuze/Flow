# 010_TreeClassifierModel.pdf

## Page 1

var classCount: Int
The number of classes.
var featureColumnNames: [String]
The names of the columns containing feature values.
var predictionColumnName: String
The name of the column containing the predicted labels.
func buildDataFrame([ClassificationDistribution<Label>]) -> DataFrame
Builds a data frame containing a labels column and a probability distribution column.
func applied(to: DataFrame, eventHandler: EventHandler?) async throws -
DataFrame
Topics
Getting the properties
Building a data frame
Applying
Create ML Components / TreeClassifierModel
Structure
TreeClassifierModel
A trained tree classifier model.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Performs a classification on a data frame.
Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
TabularTransformer
Transformer
protocol Classifier
An estimator that predicts classification probabilities.
struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
struct BoostedTreeClassifier
A gradient boosted decision tree classifier.
struct BoostedTreeConfiguration
A boosted tree configuration.
struct FullyConnectedNetworkClassifier
A classifier that uses a fully connected network.
struct FullyConnectedNetworkClassifierModel
A classifier model that uses a fully connected network.
Relationships
Conforms To
See Also
Classifiers


## Page 3

struct FullyConnectedNetworkMultiLabelClassifier
A classifier that uses a multi-label fully-connected network.
struct FullyConnectedNetworkMultiLabelClassifierModel
A multi-label classifier model that uses a fully-connected network.
struct FullyConnectedNetworkConfiguration
A fully connected network configuration.
struct TimeSeriesClassifier
struct TimeSeriesClassifierConfiguration
The configuration for a time-series classifier.


