# Annotations.pdf

## Page 1

init(labeledBySubdirectoryNamesAt: URL, type: UTType, continueOnFailure
Bool) throws
Reads training examples from a directory containing files in labeled sub-directories.
init(labeledByNamesAt: URL, separator: Character, index: Int, type:
UTType, continueOnFailure: Bool) throws
Reads training examples from a directory containing files having their labels in the name. The
name can contain multiple words separated by a separator. So the index tells the positio
of the label in the file name. Files with incorrect name format are ignored.
Collection
Copyable
Decodable
Topics
Creating the feature
Relationships
Conforms To
Create ML Components / AnnotatedFiles
Structure
AnnotatedFiles
An annotated files collection.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Encodable
Equatable
Hashable
Sendable
SendableMetatype
Sequence
struct AnnotatedBatch
A batch of annotated examples for fitting a supervised estimator.
struct AnnotatedFeature
An annotated example for fitting a supervised estimator.
struct AnnotatedFeatureProvider
An adaptor that converts a regular estimator to a tabular estimator by selecting features and
annotations from columns.
struct AnnotatedPrediction
An annotated prediction.
struct DataFrameTemporalAnnotationParameters
Annotation parameters for the dataframe containing temporal annotations.
See Also
Annotations


## Page 3

init(features: MLShapedArray<Scalar>, annotations: MLShapedArray<Scalar
>)
Creates an annotated batch.
var annotations: MLShapedArray<Scalar>
The shaped array of annotations.
var count: Int
The number of examples in the batch.
var features: MLShapedArray<Scalar>
The shaped array of features.
Topics
Creating an annotated batch
Inspecting an annotated batch
Relationships
Create ML Components / AnnotatedBatch
Structure
AnnotatedBatch
A batch of annotated examples for fitting a supervised estimator.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 4

Copyable
Decodable
Encodable
Equatable
Sendable
SendableMetatype
struct AnnotatedFiles
An annotated files collection.
struct AnnotatedFeature
An annotated example for fitting a supervised estimator.
struct AnnotatedFeatureProvider
An adaptor that converts a regular estimator to a tabular estimator by selecting features and
annotations from columns.
struct AnnotatedPrediction
An annotated prediction.
struct DataFrameTemporalAnnotationParameters
Annotation parameters for the dataframe containing temporal annotations.
Conforms To
See Also
Annotations


## Page 5

Creating a multi-label image classifier
init(feature: Feature, annotation: Annotation)
Creates an example with a feature and an annotation.
var annotation: Annotation
The annotation.
var feature: Feature
The feature value.
Mentioned in
Topics
Creating the feature
Getting the properties
Create ML Components / AnnotatedFeature
Structure
AnnotatedFeature
An annotated example for fitting a supervised estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 6

Copyable
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
struct AnnotatedFiles
An annotated files collection.
struct AnnotatedBatch
A batch of annotated examples for fitting a supervised estimator.
struct AnnotatedFeatureProvider
An adaptor that converts a regular estimator to a tabular estimator by selecting features and
annotations from columns.
struct AnnotatedPrediction
An annotated prediction.
struct DataFrameTemporalAnnotationParameters
Annotation parameters for the dataframe containing temporal annotations.
Relationships
Conforms To
See Also
Annotations


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

struct AnnotatedPrediction
An annotated prediction.
struct DataFrameTemporalAnnotationParameters
Annotation parameters for the dataframe containing temporal annotations.


## Page 11

init(prediction: Prediction, annotation: Annotation)
Creates an annotated preditction.
var annotation: Annotation
The ground truth annotation.
var prediction: Prediction
The predicted value.
Copyable
Topics
Creating an annotated prediction
Getting the properties
Relationships
Conforms To
Create ML Components / AnnotatedPrediction
Structure
AnnotatedPrediction
An annotated prediction.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 12

Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
struct AnnotatedFiles
An annotated files collection.
struct AnnotatedBatch
A batch of annotated examples for fitting a supervised estimator.
struct AnnotatedFeature
An annotated example for fitting a supervised estimator.
struct AnnotatedFeatureProvider
An adaptor that converts a regular estimator to a tabular estimator by selecting features and
annotations from columns.
struct DataFrameTemporalAnnotationParameters
Annotation parameters for the dataframe containing temporal annotations.
See Also
Annotations


## Page 13

init()
Creates a DataFrameTemporalAnnotationParameters by using default options.
var annotationColumnID: ColumnID<Annotation>
The column id that contains the annotation. The default value is “annotation” with
Annotation type.
var endTimeColumnID: ColumnID<Double>?
The column id that contains the end time. The default value is nil.
var filePathColumnID: ColumnID<String>
The column id that contains the file path. The default value is “filePath” with String type.
var filePathType: DataFrameTemporalAnnotationParameters<Annotation>.Fil
PathType
The file path type in the annotation file. The default value is .absolute.
Topics
Creating the parameters
Getting the properties
Create ML Components / DataFrameTemporalAnnotationParameters
Structure
DataFrameTemporalAnnotation
Parameters
Annotation parameters for the dataframe containing temporal annotations.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 14

var startTimeColumnID: ColumnID<Double>?
The column id that contains the start time. The default value is nil.
enum FilePathType
The file path type to be used.
Sendable, SendableMetatype
struct AnnotatedFiles
An annotated files collection.
struct AnnotatedBatch
A batch of annotated examples for fitting a supervised estimator.
struct AnnotatedFeature
An annotated example for fitting a supervised estimator.
struct AnnotatedFeatureProvider
An adaptor that converts a regular estimator to a tabular estimator by selecting features and
annotations from columns.
struct AnnotatedPrediction
An annotated prediction.
Specifying the path type
Relationships
Conforms To
See Also
Annotations


