# 006_ModelCompatibilityError.pdf

## Page 1

case incompatibleInputCount(expected: Int, actual: Int)
An error that indicates that the number of model inputs is wrong.
case incompatibleInputDataFormat(expected: MLFeatureType, actual:
MLFeatureType)
An error that indicates that the input data has the wrong format.
case incompatibleInputMultiArrayDataType(MLMultiArrayDataType)
An error that indicates that the input multi array has the wrong value type.
case incompatibleLabelType
An error that indicates that the label has the wrong type.
case incompatibleMetadataKey(name: String)
An error that indicates that the metadata key has the wrong type.
case incompatibleOutputCount(expected: Int, actual: Int)
An error that indicates that the number of model outputs is wrong.
Topics
Analyzing the error
Create ML Components / ModelCompatibilityError
Enumeration
ModelCompatibilityError
Errors related to CoreML model compatibility.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

case incompatibleOutputDataFormat(expected: MLFeatureType, actual:
MLFeatureType)
An error that indicates that the output data has the wrong format.
case missingInput(name: String)
An error that indicates that the input is missing from the model.
case missingLabel
An error that indicates that the label output is missing from the model.
case missingLabelProbabilities
An error that indicates that the label probabilities output is missing from the model.
case missingOutput(name: String)
An error that indicates that the output is missing from the model.
case missingPredictedFeature
An error that indicates that the regressor model output is missing.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
Getting the debug description
Default Implementations
Relationships
Conforms To


## Page 3

SendableMetatype
enum AudioPreprocessingError
Audio preprocessing errors.
enum AudioReaderError
Audio reader errors.
enum CompatibilityError
A compatibility error.
enum ConcatenationError
Errors thrown when concatenating numeric values.
enum DatasetError
Dataset processing errors.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelUpdateError
An updatable model error.
enum OptimizationError
An optimization error.
enum PipelineDataError
Errors related to pipeline data affinity problems.
enum SerializationError
A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
See Also
Errors


## Page 4

Video loader errors.


