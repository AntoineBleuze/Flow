# 002_MLRegressorMetrics.pdf

## Page 1

Improving Your Model’s Accuracy
To understand what performance you can expect from the regressor, you start by looking at its
maximumError. This high-level metric indicates your model’s worst-case performance. To get a
sense for how your model performs on average, look at the rootMeanSquaredError. In both
cases, you want to minimize the value and therefore the error.
Note
Each trained model contains different metrics for its various data sets (training, validation, and
testing). Improving Your Model’s Accuracy compares these metrics among different data sets.
Mentioned in
Overview
Topics
Understanding the model
Create ML / MLRegressorMetrics
Structure
MLRegressorMetrics
Metrics you use to evaluate a regressor’s performance.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.14+
tvOS 16.0+
visionOS 1.0+


## Page 2

var maximumError: Double
The largest absolute difference between the expected values and the model’s predicted
values during testing or training.
var rootMeanSquaredError: Double
A common metric used to determine the deviation between correct and predicted values.
var isValid: Bool
A Boolean value indicating whether the regressor model was able to calculate metrics.
var error: (any Error)?
The underlying error present when the metrics are invalid.
init(maximumError: Double, rootMeanSquaredError: Double)
Creates regressor metrics describing the quality of your model.
var description: String
A text representation of the regressor metrics.
var debugDescription: String
A text representation of the regressor metrics that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the regressor metrics shown in a playground.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Handling errors
Creating metrics
Describing metrics
Default Implementations


## Page 3

Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Improving Your Model’s Accuracy
Use metrics to tune the performance of your machine learning model.
struct MLClassifierMetrics
Metrics you use to evaluate a classifier’s performance.
struct MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
struct MLRecommenderMetrics
Metrics you use to evaluate a recommender’s performance.
struct MLObjectDetectorMetrics
Metrics you use to evaluate an object detector’s performance.
Relationships
Conforms To
See Also
Model accuracy


