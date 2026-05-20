# Tabular components.pdf

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


## Page 4

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
associatedtype Transformer : TabularTransformer
The transformer type created by this estimator.
Required
func appending(_:)
Composes this tabular estimator with a supervised tabular estimator.
Topics
Reading and writing
Appending
Adapting and fitting
Create ML Components / TabularEstimator
Protocol
TabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data
frame.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 5

func adaptedAsSupervised<Annotation>(annotationColumnID: ColumnID<
Annotation>) -> TabularEstimatorToSupervisedAdaptor<Self, Annotation>
Exposes this tabular estimator as a supervised tabular estimator.
func fitted(to: DataFrame, eventHandler: EventHandler?) async throws ->
Self.Transformer
Fits a transformer to a data frame
Required
func fitted(to:)
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required Default implementation provided.
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required Default implementation provided.
UpdatableTabularEstimator
ColumnSelector
PreprocessingTabularEstimator
PreprocessingUpdatableTabularEstimator
TabularTransformerToEstimatorAdaptor
TabularTransformerToUpdatableEstimatorAdaptor
Encoding and decoding
Relationships
Inherited By
Conforming Types
See Also


## Page 6

protocol TabularTransformer
A tabular transformer that transforms a data frame.
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
Tabular components


## Page 7

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
associatedtype Annotation
The annotation type.
Required
var annotationColumnID: ColumnID<Self.Annotation>
The annotation column identifier.
Required
associatedtype Transformer : TabularTransformer
The transformer type created by this estimator.
Required
Topics
Reading and writing
Create ML Components / SupervisedTabularEstimator
Protocol
SupervisedTabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data
frame.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 8

func appending(_:)
Composes this supervised tabular estimator with another supervised tabular estimator.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> Self.Transformer
Fits a transformer to a data frame
Required
func fitted(to: DataFrame, validateOn: DataFrame?) async throws -> Self
Transformer
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required Default implementation provided.
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required Default implementation provided.
UpdatableSupervisedTabularEstimator
AnnotatedFeatureProvider
BoostedTreeClassifier
BoostedTreeRegressor
PreprocessingSupervisedTabularEstimator
PreprocessingUpdatableSupervisedTabularEstimator
Appending
Fitting
Encoding and decoding
Relationships
Inherited By
Conforming Types


## Page 9

TabularEstimatorToSupervisedAdaptor
UpdatableTabularEstimatorToSupervisedAdaptor
protocol TabularTransformer
A tabular transformer that transforms a data frame.
protocol TabularEstimator
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
See Also
Tabular components


## Page 10

An updatable estimator that composes a preprocessing transformer and an updatable
estimator.


## Page 11

This estimator applies a non-tabular estimator to a selection of columns. Here’s an example of
normalizing numeric values within each column using a StandardScaler:
In most cases, an inputer must handle missing values.
init(columns: [String], estimator: Estimator)
Creates a select operation with an estimator.
Overview
Topics
Creating the selection
Create ML Components / ColumnSelector
Structure
ColumnSelector
An operation that applies an estimator to a selection of columns.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 12

init(ColumnSelection, estimator: Estimator)
Creates a select operation with an estimator.
init<T>(ColumnSelection, transformer: T)
Creates a select operation with a transformer.
var columnSelection: ColumnSelection
The column selection strategy.
var estimator: Estimator
The estimator to use on each column.
func encode(ColumnSelector<Estimator, UnwrappedInput>.Transformer, to:
inout any EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> ColumnSelector<
Estimator, UnwrappedInput>.Transformer
Decodes a previously fitted transformer.
func fitted(to: DataFrame, eventHandler: EventHandler?) async throws ->
ColumnSelector<Estimator, UnwrappedInput>.Transformer
Fits a transformer to a data frame
typealias Input
typealias Output
protocol Transformer
A transformer that takes an input and produces an output.
UpdatableTabularEstimator Implementations
Getting the properties
Encoding and decoding
Fitting a transformer
Default Implementations


## Page 13

Copyable
Sendable
SendableMetatype
TabularEstimator
UpdatableTabularEstimator
Conforms when Estimator conforms to UpdatableEstimator, UnwrappedInput conforms to Copyable,
UnwrappedInput conforms to Escapable, and Estimator.Transformer.Input is UnwrappedInput?.
protocol TabularTransformer
A tabular transformer that transforms a data frame.
protocol TabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
protocol SupervisedTabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
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
Relationships
Conforms To
See Also
Tabular components


## Page 14

struct PreprocessingTabularEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingUpdatableSupervisedTabularEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableTabularEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

case all
Select all columns in the data frame.
case exclude(columnNames: [String])
Selects all columns except the specified columns.
case include(columnNames: [String])
Selects only the specified columns.
case numeric
Select all numeric columns in the data frame.
Decodable
Topics
Column selection types
Relationships
Conforms To
Create ML Components / ColumnSelection
Enumeration
ColumnSelection
A selection of columns from a data frame.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 19

Encodable
Sendable
SendableMetatype
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
See Also
Tabular components


## Page 20

An updatable estimator that composes a preprocessing transformer and an updatable
estimator.


## Page 21

The resulting concatenated column contains MLShapedArray<Scalar> elements. For example
would be concatenated as:
Overview
Create ML Components / ColumnConcatenator
Structure
ColumnConcatenator
A transformer that concatenates every numerical column in a dataframe into to a
shaped array for each row.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 22

Non-numerical columns are left in the data frame unchanged. Supported numeric types are Int,
UInt8, Float, and Double. Arrays and shaped arrays of those types as supported, but every
array in a given column must have the same shape and shaped arrays across columns must have
the same shape except for the last dimension.
init(columnSelection: ColumnSelection, concatenatedColumnName: String)
Creates a concatenator that concatenates numeric columns into a new column of ML shaped
array.
var columnSelection: ColumnSelection
The selection of columns to concatenate.
var concatenatedColumnName: String
The name of the concatenated column containing the shaped arrays.
func applied(to: DataFrame, eventHandler: EventHandler?) throws -> Data
Frame
Combines every numerical column in a data frame into to a shaped array for each row.
Copyable
CustomDebugStringConvertible
Topics
Creating the concatenator
Getting the properties
Applying
Relationships
Conforms To


## Page 23

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
struct ColumnSelectorTransformer
A transformer that applies a base transformer to specific columns in a data frame.
enum ColumnSelection
A selection of columns from a data frame.
struct PreprocessingSupervisedTabularEstimator
A supervised tabular estimator that composes a preprocessing transformer and a supervised
tabular estimator.
struct PreprocessingTabularEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingUpdatableSupervisedTabularEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableTabularEstimator
See Also
Tabular components


## Page 24

An updatable estimator that composes a preprocessing transformer and an updatable
estimator.


## Page 25

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


## Page 26

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


## Page 27

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


## Page 28

init(Preprocessor, Estimator)
Creates a composed estimator from a preprocessing transformer and an estimator.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
func preprocessed(from: DataFrame, eventHandler: EventHandler?) async 
throws -> DataFrame
Preprocesses a data frame of examples.
Topics
Creating an estimator
Getting the properties
Preprocesing and fitting
Create ML Components / PreprocessingTabularEstimator
Structure
PreprocessingTabularEstimator
An estimator that composes a preprocessing transformer and an estimator.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 29

func fitted(to: DataFrame, eventHandler: EventHandler?) async throws ->
PreprocessingTabularEstimator<Preprocessor, Estimator>.Transformer
Fits a composed transformer to a data frame of examples.
func fitted(toPreprocessed: DataFrame, eventHandler: EventHandler?)
async throws -> PreprocessingTabularEstimator<Preprocessor, Estimator>.
Transformer
Fits a transformer to a data frame of preprocessed features.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
typealias Output
The output type.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable, SendableMetatype, TabularEstimator
protocol TabularTransformer
A tabular transformer that transforms a data frame.
protocol TabularEstimator
A tabular estimator that creates a transformer by fitting to a data set in a data frame.
Relationships
Conforms To
See Also
Tabular components


## Page 30

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
struct PreprocessingUpdatableSupervisedTabularEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableTabularEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.


## Page 31

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


## Page 32

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


## Page 33

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


## Page 34

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


## Page 35

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


## Page 36

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


## Page 37

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


## Page 38

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


