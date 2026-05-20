# 010_PreprocessingUpdatableTabularEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed updatable estimator from a preprocessing transformer and an estimato
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
func encodeWithOptimizer(PreprocessingUpdatableTabularEstimator<
Preprocessor, Estimator>.Transformer, to: inout any EstimatorEncoder)
throws
Topics
Creating an estimator
Getting the properties
Encoding and decoding
Create ML Components / PreprocessingUpdatableTabularEstimator
Structure
PreprocessingUpdatableTabularEstimator
An updatable estimator that composes a preprocessing transformer and an
updatable estimator.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
PreprocessingUpdatableTabularEstimator<Preprocessor, Estimator>.
Transformer
Reads the encoded transformer and optimizer.
func preprocessed(from: DataFrame, eventHandler: EventHandler?) async 
throws -> DataFrame
Preprocesses a data frame of examples.
func fitted(to: DataFrame, eventHandler: EventHandler?) async throws ->
PreprocessingUpdatableTabularEstimator<Preprocessor, Estimator>.
Transformer
Fits a composed transformer to a data frame of examples.
func fitted(toPreprocessed: DataFrame, eventHandler: EventHandler?)
async throws -> PreprocessingUpdatableTabularEstimator<Preprocessor,
Estimator>.Transformer
Fits a transformer to a data frame of preprocessed features.
func update(inout PreprocessingUpdatableTabularEstimator<Preprocessor,
Estimator>.Transformer, with: DataFrame, eventHandler: EventHandler?)
async throws
Updates a transformer with a new data frame of examples.
func update(inout PreprocessingUpdatableTabularEstimator<Preprocessor,
Estimator>.Transformer, withPreprocessed: DataFrame, eventHandler: Even
Handler?) async throws
Updates a transformer with a new data frame of preprocessed features.
func makeTransformer() -> PreprocessingUpdatableTabularEstimator<
Preprocessor, Estimator>.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
Preprocesing and fitting


## Page 3

typealias Output
The output type.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable
SendableMetatype
TabularEstimator
UpdatableTabularEstimator
protocol TabularTransformer
A tabular transformer that transforms a data frame.
protocol TabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
protocol SupervisedTabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
struct ColumnSelector
An operation that applies an estimator to a selection of columns.
struct ColumnSelectorTransformer
A transformer that applies a base transformer to specific columns in a data frame.
enum ColumnSelection
A selection of columns from a data frame.
Relationships
Conforms To
See Also
Tabular components


## Page 4

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


