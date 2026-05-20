# 004_rootMeanSquaredError____.pdf

## Page 1

annotatedPredictions
An AnnotatedPrediction object.
The root mean squared error.
If an empty AnnotatedPrediction is supplied, the result will be NaN.
struct Classification
Parameters
Return Value
Discussion
See Also
Metrics
Create ML Components / rootMeanSquaredError(_:)
Function
rootMeanSquaredError(_:)
Computes the root mean squared error between predicted and ground truth
values.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

An item in a classification result.
struct ClassificationDistribution
A classification distribution that contains a probability for each classification label.
struct ClassificationMetrics
Classification metrics.
struct MultiLabelClassificationMetrics
Multi-label classification metrics.
func rootMeanSquaredError<T>(some Collection, some Collection) -> T
Computes the root mean squared error between predicted and ground truth values.
func maximumAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the maximum absolute error between predicted and ground truth values.
func maximumAbsoluteError<T>(some Collection, some Collection) -> T
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


