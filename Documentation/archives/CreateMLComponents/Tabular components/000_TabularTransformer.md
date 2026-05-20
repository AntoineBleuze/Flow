# 000_TabularTransformer.pdf

## Page 1

Tabular transformers represent operations on data frames. They modify and operate on values on
one or more columns.
func appending(_:)
Composes this tabular transformer with another tabular transformer.
func adaptedAsEstimator() -> TabularTransformerToEstimatorAdaptor<Self>
Exposes this tabular transformer as a trivial tabular estimator.
func adaptedAsUpdatableEstimator() -> TabularTransformerToUpdatable
EstimatorAdaptor<Self>
Exposes this tabular transformer as an updatable tabular estimator.
Overview
Topics
Appending
Adapting
Create ML Components / TabularTransformer
Protocol
TabularTransformer
A tabular transformer that transforms a data frame.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func callAsFunction(DataFrame, eventHandler: EventHandler?) async throw
-> DataFrame
Performs the transformation on a single input.
func export(to: URL) throws
Exports this transformer as a CoreML model.
func export(to: URL, metadata: ModelMetadata) throws
Exports this tabular transformer as a CoreML model with userInfo.
Transformer
ColumnConcatenator
ColumnSelectorTransformer
ComposedTabularTransformer
TreeClassifierModel
TreeRegressorModel
protocol TabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
Transforming
Exporting
Relationships
Inherits From
Conforming Types
See Also
Tabular components


## Page 3

protocol SupervisedTabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
struct ColumnSelector
An operation that applies an estimator to a selection of columns.
struct ColumnSelectorTransformer
A transformer that applies a base transformer to specific columns in a data frame.
enum ColumnSelection
A selection of columns from a data frame.
struct ColumnConcatenator
A transformer that concatenates every numerical column in a dataframe into to a shaped arr
for each row.
struct PreprocessingSupervisedTabularEstimator
A supervised tabular estimator that composes a preprocessing transformer and a supervised
tabular estimator.
struct PreprocessingTabularEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingUpdatableSupervisedTabularEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableTabularEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.


