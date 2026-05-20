# 001_MLClassifierMetrics.pdf

## Page 1

Creating a text classifier model
Creating an Image Classifier Model
Improving Your Model’s Accuracy
Use MLClassifierMetrics to evaluate your model’s ability to distinguish between different
categories when it’s classifying data.
You can determine the model’s accuracy using the classificationError metric. For
information about how your model is mislabeling or missing a certain category, use the precisio
Recall metric. To determine specific cases where your model is mistaking one label for another,
use the confusion property.
Accuracy can be a misleading metric if you use unbalanced data, which means the number of
examples for some categories are much larger than others. Instead, use precisionRecall or
confusion.
Mentioned in
Overview
Create ML / MLClassifierMetrics
Structure
MLClassifierMetrics
Metrics you use to evaluate a classifier’s performance.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.14+
tvOS 16.0+
visionOS 1.0+


## Page 2

Note
Each trained model contains different metrics for its various data sets (training, validation, and
testing). Improving Your Model’s Accuracy compares these metrics between different data
sets.
var classificationError: Double
The fraction of incorrectly labeled examples.
var precisionRecall: MLDataTable
A data table listing the precision and recall percentages for each class.
var confusion: MLDataTable
A table comparing the actual and predicted labels for each classification category.
var confusionDataFrame: DataFrame
A data frame comparing the actual and predicted labels for each class.
var precisionRecallDataFrame: DataFrame
A data frame listing the precision and recall percentages for each class.
var isValid: Bool
A Boolean value indicating whether the classifier model was able to calculate metrics.
var error: (any Error)?
The underlying error present when the metrics are invalid.
init(classificationError: Double, confusion: MLDataTable, precision
Recall: MLDataTable)
Creates empty classifier metrics.
Topics
Understanding the model
Handling errors
Creating metrics


## Page 3

var description: String
A text representation of the classifier metrics.
var debugDescription: String
A text representation of the classifier metrics that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the classifier metrics shown in a playground.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Improving Your Model’s Accuracy
Use metrics to tune the performance of your machine learning model.
struct MLRegressorMetrics
Describing metrics
Default Implementations
Relationships
Conforms To
See Also
Model accuracy


## Page 4

Metrics you use to evaluate a regressor’s performance.
struct MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
struct MLRecommenderMetrics
Metrics you use to evaluate a recommender’s performance.
struct MLObjectDetectorMetrics
Metrics you use to evaluate an object detector’s performance.


