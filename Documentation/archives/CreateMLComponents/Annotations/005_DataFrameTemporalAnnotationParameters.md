# 005_DataFrameTemporalAnnotationParameters.pdf

## Page 1

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


## Page 2

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


