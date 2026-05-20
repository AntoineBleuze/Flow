# 003_MLWordTaggerMetrics.pdf

## Page 1

Creating a word tagger model
var taggingError: Double
The fraction of incorrectly tagged examples.
var precisionRecall: MLDataTable
A data table listing the precision and recall percentages for each category.
Deprecated
var confusion: MLDataTable
A table comparing the actual and predicted labels for each tagging category.
Deprecated
Mentioned in
Topics
Analyzing the tagger’s performance
Handling errors
Create ML / MLWordTaggerMetrics
Structure
MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
macOS 10.14+


## Page 2

var isValid: Bool
A Boolean value indicating whether the metrics were calculated.
var error: (any Error)?
The underlying error present when the metrics are invalid.
var description: String
A text representation of the word tagger metrics.
var debugDescription: String
A text representation of the word tagger metrics that’s suitable for output during debugging
var playgroundDescription: Any
A description of the word tagger metrics shown in a playground.
var confusionDataFrame: DataFrame
A data frame comparing the actual and predicted labels for each class.
var precisionRecallDataFrame: DataFrame
A data frame listing the precision and recall percentages for each class.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Describing metrics
Default Implementations
Relationships
Conforms To


## Page 3

Improving Your Model’s Accuracy
Use metrics to tune the performance of your machine learning model.
struct MLClassifierMetrics
Metrics you use to evaluate a classifier’s performance.
struct MLRegressorMetrics
Metrics you use to evaluate a regressor’s performance.
struct MLRecommenderMetrics
Metrics you use to evaluate a recommender’s performance.
struct MLObjectDetectorMetrics
Metrics you use to evaluate an object detector’s performance.
See Also
Model accuracy


