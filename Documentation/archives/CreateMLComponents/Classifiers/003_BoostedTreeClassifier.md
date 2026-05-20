# 003_BoostedTreeClassifier.pdf

## Page 1

init(labels: Set<Label?>, annotationColumnName: String, featureColumn
Names: [String], configuration: BoostedTreeConfiguration)
Creates a boosted tree classifier.
var annotationColumnID: ColumnID<Label>
The annotation column identifier.
var featureColumnNames: [String]
The names of the columns containing feature values.
var configuration: BoostedTreeConfiguration
Boosted tree configuration.
var labels: Set<Label?>
The set of possible labels.
Topics
Creating a classifier
Getting the properties
Fitting the classifier
Create ML Components / BoostedTreeClassifier
Structure
BoostedTreeClassifier
A gradient boosted decision tree classifier.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> TreeClassifierModel<Label>
Fits a boosted tree classifier model to a collection of examples.
typealias Annotation
The annotation type.
typealias Transformer
The transformer type created by this estimator.
func encodeLabels(some Collection<Optional<Label>>) throws -> (labels: 
String?], encoded: [Int])
UpdatableSupervisedTabularEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedTabularEstimator
UpdatableSupervisedTabularEstimator
Conforms when Label conforms to Comparable, Decodable, Encodable, and Hashable.
protocol Classifier
An estimator that predicts classification probabilities.
Encoding the classifier labels
Default Implementations
Relationships
Conforms To
See Also
Classifiers


## Page 3

struct LogisticRegressionClassifier
A logistic regression classifier.
struct LogisticRegressionClassifierModel
A trained logistic regression classifier model.
struct BoostedTreeConfiguration
A boosted tree configuration.
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


