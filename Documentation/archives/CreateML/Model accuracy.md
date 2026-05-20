# Model accuracy.pdf

## Page 1

Evaluating and improving your model starts with looking at its performance across different data
sets. Metrics from each dataset inform which changes have the most impact on your model’s
accuracy.
No single metric can tell you everything about your model’s performance. To improve your model,
you compare the metrics (MLClassifierMetrics or MLRegressorMetrics depending on
your model type) among your training, validation, and testing data sets. For example, the accurac
discussed in the Creating an Image Classifier Model article is derived from the classification
Error metric for each data set.
You can also access these values programmatically after creating a model and loading your testin
data:
In this case, you see output for several different metrics, including classificationError,
precisionRecall, and confusion for classifiers and maximumError and rootMeanSquare
Error for regressors. Use these values from each data set to determine where your model needs
to improve.
Overview
Improve Your Model’s Training Accuracy
Create ML / Improving Your Model’s Accuracy
Article
Improving Your Model’s Accuracy
Use metrics to tune the performance of your machine learning model.


## Page 2

If the training accuracy of your model is low, it’s an indication that your current model configuratio
can’t capture the complexity of your data.
Try adjusting the training parameters. When working with image data, double the maximum numb
of iterations in the MLImageClassifierBuilder playground UI (the default value is 10).
For natural language data, try a different underlying algorithm (see MLTextClassifier.Model
AlgorithmType). For more general tasks, use a different underlying model than the type
determined by MLClassifier (see Supporting Classifier Types) or MLRegressor (see
Supporting Regressor Types).
If your model’s accuracy on the validation set is low or fluctuates between low and high each time
you train the model, you need more data. You can generate more input data from the examples yo
already collected, a technique known as data augmentation. For image data, you can combine
operations like cropping, rotation, blurring, and exposure adjustment to make one image into man
examples.
Improve Your Model’s Validation Accuracy


## Page 3

It’s also possible for you to have lots of data and validation accuracy that is still significantly lower
than your training accuracy. In this case, your model is _overfitting, _meaning that it’s learning too
many specific details about your training set that don’t generally apply to other examples. In this
case, you need to reduce the number of training iterations to prevent the model from learning too
much about your training data.
If your model’s accuracy on your testing data is lower than your training or validation accuracy, it
usually indicates that there are meaningful differences between the kind of data you trained the
model on and the testing data you’re providing for evaluation.
For example, suppose you train your MLImageClassifier on many images of indoor cats, but
then test only on images of outdoor cats. Because of the differences in lighting, exposure, and
background, it’s unlikely that your testing data will yield good results. Differences between image
that seem obvious to humans can be difficult for a model to resolve without sufficient training dat
To correct for this, provide more diverse data in your training set. In general, more examples lead 
higher performance, but it’s also important to show your model examples that are as varied your
testing data.
struct MLClassifierMetrics
Improve Your Model’s Evaluation Accuracy
See Also
Model accuracy


## Page 4

Metrics you use to evaluate a classifier’s performance.
struct MLRegressorMetrics
Metrics you use to evaluate a regressor’s performance.
struct MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
struct MLRecommenderMetrics
Metrics you use to evaluate a recommender’s performance.
struct MLObjectDetectorMetrics
Metrics you use to evaluate an object detector’s performance.


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

Metrics you use to evaluate a regressor’s performance.
struct MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
struct MLRecommenderMetrics
Metrics you use to evaluate a recommender’s performance.
struct MLObjectDetectorMetrics
Metrics you use to evaluate an object detector’s performance.


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

let excludingObserved: Bool
A Boolean value that indicates whether the recommender omitted training data from the
recommendations.
var precisionRecall: MLDataTable
A data table with the recall and precision for each item.
Deprecated
var precisionRecallDataFrame: DataFrame
A data table with the recall and precision for each item.
var isValid: Bool
A Boolean value indicating whether the recommender model was able to calculate metrics.
let error: (any Error)?
The underlying error present when the metrics are invalid.
Topics
Assessing the model
Handling errors
Create ML / MLRecommenderMetrics
Structure
MLRecommenderMetrics
Metrics you use to evaluate a recommender’s performance.
macOS 10.15+


## Page 16

init(precisionRecall: MLDataTable, excludingObserved: Bool)
Creates metrics for a recommender, given a data table with precision and recall metric
columns, and whether the recommender omitted training data.
Deprecated
Improving Your Model’s Accuracy
Use metrics to tune the performance of your machine learning model.
struct MLClassifierMetrics
Metrics you use to evaluate a classifier’s performance.
struct MLRegressorMetrics
Metrics you use to evaluate a regressor’s performance.
struct MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
struct MLObjectDetectorMetrics
Metrics you use to evaluate an object detector’s performance.
Creating metrics
See Also
Model accuracy


## Page 17

An object detector generates intersection-over-union (IoU) metrics, which is a way to measure th
similarity of two bounding boxes. The IoU metric is the overlapping area divided by the area of the
union of the bounding boxes.
For example, two bounding boxes that overlap perfectly have an IoU of 1.0, because their overla
is the same area as the union. Two bounding boxes that have no overlap have an IoU of 0.0.
Anything between 0.0 and 1.0 either means the two bounding boxes partially overlap or one box
completely encases the other.
init(averagePrecision: (variedIoU: [String : Double], IoU50: [String :
Double]), meanAveragePrecision: (variedIoU: Double, IoU50: Double))
Creates metrics for an object detector given an average precision and a mean average
precision.
Overview
Topics
Creating metrics
Assessing the model
Create ML / MLObjectDetectorMetrics
Structure
MLObjectDetectorMetrics
Metrics you use to evaluate an object detector’s performance.
macOS 10.15+


## Page 18

var averagePrecision: (variedIoU: [String : Double], IoU50: [String :
Double])
Two dictionaries of average precisions at different thresholds.
var meanAveragePrecision: (variedIoU: Double, IoU50: Double)
Two mean-average precisions at different thresholds.
var isValid: Bool
A Boolean value indicating whether the object detector model was able to calculate metrics.
var error: (any Error)?
The underlying error present when the metrics are invalid.
var description: String
A text representation of the object detector metrics.
var debugDescription: String
A text representation of the object detector metrics that’s suitable for output during
debugging.
var playgroundDescription: Any
A description of the object detector metrics shown in a playground.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Handling errors
Describing metrics
Default Implementations
Relationships
Conforms To


## Page 19

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
struct MLRegressorMetrics
Metrics you use to evaluate a regressor’s performance.
struct MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
struct MLRecommenderMetrics
Metrics you use to evaluate a recommender’s performance.
See Also
Model accuracy


