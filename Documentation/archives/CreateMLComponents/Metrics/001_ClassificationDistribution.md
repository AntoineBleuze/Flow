# 001_ClassificationDistribution.pdf

## Page 1

init<C>(C)
Creates a classification distribution.
var endIndex: Int
The index of the final element in the classification distribution.
var labelsSortedByProbability: [Label]
The labels sorted by decreasing probability.
var mostLikelyLabel: Label?
The label with the highest probability.
var startIndex: Int
The index of the initial element in the classification distribution.
Topics
Creating the distribution
Getting the properties
Getting the index
Create ML Components / ClassificationDistribution
Structure
ClassificationDistribution
A classification distribution that contains a probability for each classification labe
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func index(after: Int) -> Int
Returns the index immediately after an element index.
func index(before: Int) -> Int
Returns the index immediately before an element index.
func topLabels(Int) -> [Label]
Computes the most likely labels in the classification set.
func map<T>((Classification<Label>) throws -> Classification<T>)
rethrows -> ClassificationDistribution<T>
Creates a new classification distribution by applying a transformation to every element.
subscript(_:)
Accesses a contiguous range of elements.
Collection
Copyable
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
Sequence
Labeling and mapping
Accessing by subscript
Relationships
Conforms To
See Also


## Page 3

struct Classification
An item in a classification result.
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
func meanSquaredError<T>([AnnotatedPrediction<T, T>]) -> T
Computes the root mean squared error between predicted and ground truth values.
func meanSquaredError<T>(some Collection, some Collection) -> T
Computes the mean squared error between predicted and ground truth values.
Metrics


