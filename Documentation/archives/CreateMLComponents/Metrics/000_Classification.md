# 000_Classification.pdf

## Page 1

init(label: Label, probability: Float)
Creates a classification with label and probability.
var label: Label
The classification label.
var probability: Float
The classification probability. A value between 0 and 1.
Copyable
Topics
Creating the item
Getting the properties
Relationships
Conforms To
Create ML Components / Classification
Structure
Classification
An item in a classification result.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
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
func maximumAbsoluteError<T>(some Collection, some Collection) -> T
Computes the maximum absolute error between predicted and ground truth values.
func meanAbsoluteError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute error between predicted and ground truth values.
func meanAbsoluteError<T>(some Collection, some Collection) -> T
Computes the mean absolute error between predicted and ground truth values.
func meanAbsolutePercentageError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the mean absolute percentage error between predicted and ground truth values.
See Also
Metrics


## Page 3

func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.


