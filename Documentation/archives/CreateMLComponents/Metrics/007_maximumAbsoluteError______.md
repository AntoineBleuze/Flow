# 007_maximumAbsoluteError______.pdf

## Page 1

predicted
The predicted values.
groundTruth
The ground truth values. The collection must have same number of elements as the predicte
values.
The maximum absolute error.
Empty collections of predicted and ground truth values will return a value of NaN.
Parameters
Return Value
Discussion
Create ML Components / maximumAbsoluteError(_:_:)
Function
maximumAbsoluteError(_:_:)
Computes the maximum absolute error between predicted and ground truth
values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

struct Classification
An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
func rootMeanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func rootMeanSquaredError<T>(some Collection, some Collection) -> T
Computes the root mean squared error between predicted and ground truth values.
func maximumAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the maximum absolute error between predicted and ground truth values.
func meanAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute error between predicted and ground truth values.
func meanAbsoluteError<T>(some Collection, some Collection) -> T
Computes the mean absolute error between predicted and ground truth values.
func meanAbsolutePercentageError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute percentage error between predicted and ground truth values.
func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.
See Also
Metrics


