# 004_AnnotatedPrediction.pdf

## Page 1

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


## Page 2

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


