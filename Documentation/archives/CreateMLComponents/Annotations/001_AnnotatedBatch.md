# 001_AnnotatedBatch.pdf

## Page 1

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


## Page 2

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


