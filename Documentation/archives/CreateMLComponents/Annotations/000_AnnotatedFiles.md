# 000_AnnotatedFiles.pdf

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


