# 004_ColumnSelectorTransformer.pdf

## Page 1

init(transformers: [String : Base], columnMapping: [String : String])
Creates a select transformer.
var columnMapping: [String : String]
A mapping of input column names to output column names.
var transformers: [String : Base]
A dictionary of column names to transformers.
func applied(to: DataFrame, eventHandler: EventHandler?) async throws -
DataFrame
Performs the transformation on selected columns of the data frame.
Topics
Creating the transformer
Getting the properties
Applying a transformation
Create ML Components / ColumnSelectorTransformer
Structure
ColumnSelectorTransformer
A transformer that applies a base transformer to specific columns in a data frame
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Copyable
CustomDebugStringConvertible
Decodable
Encodable
Sendable
SendableMetatype
TabularTransformer
Transformer
protocol TabularTransformer
A tabular transformer that transforms a data frame.
protocol TabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
protocol SupervisedTabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
struct ColumnSelector
An operation that applies an estimator to a selection of columns.
enum ColumnSelection
A selection of columns from a data frame.
struct ColumnConcatenator
A transformer that concatenates every numerical column in a dataframe into to a shaped arr
for each row.
struct PreprocessingSupervisedTabularEstimator
Relationships
Conforms To
See Also
Tabular components


## Page 3

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


