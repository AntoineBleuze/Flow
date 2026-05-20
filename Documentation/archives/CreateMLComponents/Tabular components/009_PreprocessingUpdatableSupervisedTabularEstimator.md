# 009_PreprocessingUpdatableSupervisedTabularEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed supervised estimator from a preprocessing transformer and a supervis
estimator.
var annotationColumnID: ColumnID<Estimator.Annotation>
The annotation column identifier.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
Topics
Creating an estimator
Getting the properties
Create ML Components / PreprocessingUpdatableSupervisedTabularEstimator
Structure
PreprocessingUpdatableSupervised
TabularEstimator
An updatable supervised estimator that composes a preprocessing transformer
and an updatable supervised estimator.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func encodeWithOptimizer(PreprocessingUpdatableSupervisedTabular
Estimator<Preprocessor, Estimator>.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
PreprocessingUpdatableSupervisedTabularEstimator<Preprocessor, Estimato
>.Transformer
Reads the encoded transformer and optimizer with a decoder.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> PreprocessingUpdatableSupervisedTabular
Estimator<Preprocessor, Estimator>.Transformer
Fits a composed transformer to a data frame of examples.
func fitted(toPreprocessed: DataFrame, validateOn: DataFrame?, event
Handler: EventHandler?) async throws -> PreprocessingUpdatableSupervise
TabularEstimator<Preprocessor, Estimator>.Transformer
Fits a composed transformer to a data frame of examples.
func makeTransformer() -> PreprocessingUpdatableSupervisedTabular
Estimator<Preprocessor, Estimator>.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func preprocessed(from: DataFrame, eventHandler: EventHandler?) async 
throws -> DataFrame
Preprocesses a data frame.
func update(inout PreprocessingUpdatableSupervisedTabularEstimator<
Preprocessor, Estimator>.Transformer, with: DataFrame, eventHandler:
EventHandler?) async throws
Updates a transformer with a new data frame of examples.
func update(inout PreprocessingUpdatableSupervisedTabularEstimator<
Preprocessor, Estimator>.Transformer, withPreprocessed: DataFrame, even
Handler: EventHandler?) async throws
Updates a transformer with a new data frame of preprocessed features.
Encoding and decoding
Preprocesing and fitting


## Page 3

typealias Annotation
The annotation type.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
typealias Output
The output type.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable
SendableMetatype
SupervisedTabularEstimator
UpdatableSupervisedTabularEstimator
protocol TabularTransformer
A tabular transformer that transforms a data frame.
protocol TabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
protocol SupervisedTabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
Relationships
Conforms To
See Also
Tabular components


## Page 4

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
struct PreprocessingUpdatableTabularEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.


