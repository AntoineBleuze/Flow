# 007_PreprocessingSupervisedTabularEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed supervised tabular estimator from a preprocessing transformer and a
supervised tabular estimator.
var annotationColumnID: ColumnID<Estimator.Annotation>
The annotation column identifier.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
Topics
Creating an estimator
Getting the properties
Create ML Components / PreprocessingSupervisedTabularEstimator
Structure
PreprocessingSupervisedTabular
Estimator
A supervised tabular estimator that composes a preprocessing transformer and a
supervised tabular estimator.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func preprocessed(from: DataFrame, eventHandler: EventHandler?) async 
throws -> DataFrame
Preprocesses a data frame of examples.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> PreprocessingSupervisedTabularEstimator<
Preprocessor, Estimator>.Transformer
Fits a transformer to a data frame
func fitted(toPreprocessed: DataFrame, validateOn: DataFrame?, event
Handler: EventHandler?) async throws -> PreprocessingSupervisedTabular
Estimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a data frame of preprocessed examples while validating.
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
Sendable, SendableMetatype, SupervisedTabularEstimator
Preprocesing and fitting
Relationships
Conforms To


## Page 3

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
struct ColumnConcatenator
A transformer that concatenates every numerical column in a dataframe into to a shaped arr
for each row.
struct PreprocessingTabularEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingUpdatableSupervisedTabularEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableTabularEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.
See Also
Tabular components


