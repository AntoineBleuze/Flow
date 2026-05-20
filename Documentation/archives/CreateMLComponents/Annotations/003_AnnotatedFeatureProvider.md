# 003_AnnotatedFeatureProvider.pdf

## Page 1

Tabular estimators use multiple features columns as input. When there is a single column of
features, you may use a non-tabular estimator. Do this by combining multiple columns with a
ColumnConcatenator transformer. Once there is a single column of features, use Annotated
FeatureProvider to specify which column contains the features, which column contains the
annotations, and which column should hold the results.
When using AnnotatedFeatureProvider, make sure to handle missing values before using a
non-tabular estimator that takes non-optional values. This example includes an Optional
Unwrapper transformer.
Overview
Create ML Components / AnnotatedFeatureProvider
Structure
AnnotatedFeatureProvider
An adaptor that converts a regular estimator to a tabular estimator by selecting
features and annotations from columns.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

init(Base, annotationsColumnName: String, featuresColumnName: String,
resultsColumnName: String)
Creates an adaptor that converts a regular estimator to a tabular estimator.
var annotationColumnID: ColumnID<AnnotatedFeatureProvider<Base,
UnwrappedInput>.Annotation>
The annotation column identifier.
typealias Annotation
The annotation type.
var base: Base
The base estimator.
var featuresColumnName: String
The features column name.
var resultsColumnName: String
The results column name.
func encode(AnnotatedFeatureProvider<Base, UnwrappedInput>.Transformer,
to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> AnnotatedFeatur
Provider<Base, UnwrappedInput>.Transformer
Decodes a previously fitted transformer.
Topics
Creating the provider
Getting the properties
Encoding and decoding
Fitting


## Page 3

func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> ColumnSelectorTransformer<Base.Transformer,
UnwrappedInput>
Fits a transformer to a data frame
typealias Transformer
The transformer type created by this estimator.
UpdatableSupervisedTabularEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedTabularEstimator
UpdatableSupervisedTabularEstimator
Conforms when Base conforms to UpdatableSupervisedEstimator, UnwrappedInput conforms to
Copyable, UnwrappedInput conforms to Escapable, and Base.Transformer.Input is UnwrappedInput
struct AnnotatedFiles
An annotated files collection.
struct AnnotatedBatch
A batch of annotated examples for fitting a supervised estimator.
struct AnnotatedFeature
An annotated example for fitting a supervised estimator.
Default Implementations
Relationships
Conforms To
See Also
Annotations


## Page 4

struct AnnotatedPrediction
An annotated prediction.
struct DataFrameTemporalAnnotationParameters
Annotation parameters for the dataframe containing temporal annotations.


