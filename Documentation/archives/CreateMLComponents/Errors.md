# Errors.pdf

## Page 1

case incompatibleTargetFormatForConversion(inputFormat: AVAudioFormat,
targetFormat: AVAudioFormat)
An error that indicates that the input and output formats are incompatible for creating an
audio converter.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Topics
Analyzing the error
Getting the debug description
Default Implementations
Relationships
Create ML Components / AudioPreprocessingError
Enumeration
AudioPreprocessingError
Audio preprocessing errors.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
SendableMetatype
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
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum ModelUpdateError
An updatable model error.
enum OptimizationError
An optimization error.
enum PipelineDataError
Conforms To
See Also
Errors


## Page 3

Errors related to pipeline data affinity problems.
enum SerializationError
A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 4

case microphoneAuthorizationDenied
An error that indicates that the microphone authorization status is denied. The user has
explicitly denied permission for audio capture.
case microphoneAuthorizationRestricted
An error that indicates that the microphone authorization status is restricted. The user is not
allowed to access audio capture devices.
case sourceDeviceNotAvailable
An error that indicates that no source devices are available.
var debugDescription: String
A text representation of the error.
Topics
Analyzing the error
Getting the debug description
Default Implementations
Create ML Components / AudioReaderError
Enumeration
AudioReaderError
Audio reader errors.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 5

CustomDebugStringConvertible Implementations
Copyable
CustomDebugStringConvertible
Equatable
Error
Hashable
LocalizedError
Sendable
SendableMetatype
enum AudioPreprocessingError
Audio preprocessing errors.
enum CompatibilityError
A compatibility error.
enum ConcatenationError
Errors thrown when concatenating numeric values.
enum DatasetError
Dataset processing errors.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
Relationships
Conforms To
See Also
Errors


## Page 6

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
Video loader errors.


## Page 7

case unsupportedRevision(Int)
An error that indicates that the revision is not supported.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Topics
Analyzing the Error
Getting the debug description
Default Implementations
Relationships
Conforms To
Create ML Components / CompatibilityError
Enumeration
CompatibilityError
A compatibility error.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 8

Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
SendableMetatype
enum AudioPreprocessingError
Audio preprocessing errors.
enum AudioReaderError
Audio reader errors.
enum ConcatenationError
Errors thrown when concatenating numeric values.
enum DatasetError
Dataset processing errors.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum ModelUpdateError
An updatable model error.
enum OptimizationError
An optimization error.
enum PipelineDataError
Errors related to pipeline data affinity problems.
enum SerializationError
See Also
Errors


## Page 9

A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 10

case mismatchedShapes
Shaped arrays across columns have mismatched shapes and can’t be concatenated.
case nonUniformShapes(columnName: String)
A column contains arrays or shaped arrays with non-uniform shapes.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Topics
Analyzing the error
Getting the debug description
Default Implementations
Relationships
Create ML Components / ConcatenationError
Enumeration
ConcatenationError
Errors thrown when concatenating numeric values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 11

Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
SendableMetatype
enum AudioPreprocessingError
Audio preprocessing errors.
enum AudioReaderError
Audio reader errors.
enum CompatibilityError
A compatibility error.
enum DatasetError
Dataset processing errors.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum ModelUpdateError
An updatable model error.
enum OptimizationError
An optimization error.
enum PipelineDataError
Conforms To
See Also
Errors


## Page 12

Errors related to pipeline data affinity problems.
enum SerializationError
A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 13

case incompatibleDataFormat(URL, debugDescription: String)
An error that indicates that a resource doesn’t have the expected data format.
case incorrectName(URL, debugDescription: String)
An error that indicates that a resource has incorrect name format.
case missingResource(URL)
An error that indicates that a resource is missing.
case unreadableResource(URL)
An error that indicates that a resource is unreadable.
var debugDescription: String
A text representation of the error.
Topics
Analyzing the error
Getting the debug description
Default Implementations
Create ML Components / DatasetError
Enumeration
DatasetError
Dataset processing errors.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 14

CustomDebugStringConvertible Implementations
Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
SendableMetatype
enum AudioPreprocessingError
Audio preprocessing errors.
enum AudioReaderError
Audio reader errors.
enum CompatibilityError
A compatibility error.
enum ConcatenationError
Errors thrown when concatenating numeric values.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum ModelUpdateError
Relationships
Conforms To
See Also
Errors


## Page 15

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
Video loader errors.


## Page 16

case invalidState(debugDescription: String)
An error that indicates that an estimator cannot perform encoding from its current state.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Topics
Analyzing the error
Getting the debug description
Default Implementations
Relationships
Conforms To
Create ML Components / EstimatorEncodingError
Enumeration
EstimatorEncodingError
An estimator encoding error.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 17

Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
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
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum ModelUpdateError
An updatable model error.
enum OptimizationError
An optimization error.
enum PipelineDataError
Errors related to pipeline data affinity problems.
enum SerializationError
See Also
Errors


## Page 18

A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

Video loader errors.


## Page 23

case invalidState(debugDescription: String)
An error that indicates that a default initialized transformer suitable for fitting cannot perform
apply before performing an update.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Topics
Analyzing the error
Getting the debug description
Default Implementations
Relationships
Conforms To
Create ML Components / ModelUpdateError
Enumeration
ModelUpdateError
An updatable model error.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 24

Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
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
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum OptimizationError
An optimization error.
enum PipelineDataError
Errors related to pipeline data affinity problems.
enum SerializationError
See Also
Errors


## Page 25

A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 26

case numericOverflow
Numerical overflow. Step size parameter may be too large.
case numericUnderflow
Numerical underflow (not enough progress).
case unsupportedPlatform
The optimization operation is not supported on this platform.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Topics
Analyzing the error
Getting the debug description
Default Implementations
Create ML Components / OptimizationError
Enumeration
OptimizationError
An optimization error.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 27

Copyable
CustomDebugStringConvertible
Equatable
Error
Hashable
LocalizedError
Sendable
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
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
Relationships
Conforms To
See Also
Errors


## Page 28

enum ModelUpdateError
An updatable model error.
enum PipelineDataError
Errors related to pipeline data affinity problems.
enum SerializationError
A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 29

case emptyInput(operation: String)
An error that indicates that the input to fit is empty.
case incompatibleConfiguration(operation: String, debugDescription:
String)
An error that indicates that an input is not compatible with an operation’s configuration.
case incompatibleDataFormat(operation: String, debugDescription: String
An error that indicates that an input doesn’t have the expected data format.
case incompatibleShape([Int], debugDescription: String)
An error that indicates that an input’s doesn’t have the expected shape for the operation.
case missingAnnotation(operation: String)
An error that indicates that an expected annotation is missing.
case missingValue(operation: String)
An error that indicates that an expected value is missing.
case unrecognizedCategory(operation: String, category: String)
Topics
Analyzing the error
Create ML Components / PipelineDataError
Enumeration
PipelineDataError
Errors related to pipeline data affinity problems.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 30

An error that indicates that a new category was encountered after fitting.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
SendableMetatype
enum AudioPreprocessingError
Audio preprocessing errors.
enum AudioReaderError
Audio reader errors.
enum CompatibilityError
A compatibility error.
Getting the debug description
Default Implementations
Relationships
Conforms To
See Also
Errors


## Page 31

enum ConcatenationError
Errors thrown when concatenating numeric values.
enum DatasetError
Dataset processing errors.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum ModelUpdateError
An updatable model error.
enum OptimizationError
An optimization error.
enum SerializationError
A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 32

case notRepresentableAsCoreML(debugDescription: String)
An error that indicates that the transformer cannot be represented as a CoreML model.
case packageAlreadyExists(URL)
An error that indicates that the package already exists at the URL.
case packageNotFound(URL)
An error that indicates that the package at specified URL was not found.
var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Topics
Analyzing the error
Getting the debug description
Default Implementations
Create ML Components / SerializationError
Enumeration
SerializationError
A serialization error.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 33

Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
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
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
enum ModelUpdateError
Relationships
Conforms To
See Also
Errors


## Page 34

An updatable model error.
enum OptimizationError
An optimization error.
enum PipelineDataError
Errors related to pipeline data affinity problems.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


## Page 35

case incorrectType(operation: String, columnName: String, actual: Strin
, expected: String)
A column has an incorrect type.
case missingColumn(operation: String, columnName: String)
A column is missing from the data frame.
case missingValues(operation: String, columnName: String)
The selected column has missing values.
var debugDescription: String
A text representation of the error.
Topics
Getting the cases
Getting the debug description
Default Implementations
Create ML Components / TabularPipelineDataError
Enumeration
TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 36

CustomDebugStringConvertible Implementations
Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
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
enum ModelCompatibilityError
Relationships
Conforms To
See Also
Errors


## Page 37

Errors related to CoreML model compatibility.
enum ModelUpdateError
An updatable model error.
enum OptimizationError
An optimization error.
enum PipelineDataError
Errors related to pipeline data affinity problems.
enum SerializationError
A serialization error.
enum VideoReaderError
Video loader errors.


## Page 38

case cameraAuthorizationDenied
An error that indicates that the camera authorization status is denied. The user has explicitly
denied permission for media capture.
case cameraAuthorizationRestricted
An error that indicates that the camera authorization status is restricted. The user is not
allowed to access media capture devices.
case frameRateNotSupported(Double)
An error that indicates that the frame rate is not supported by the input camera.
case missingVideoTrack(URL)
An error that indicates that the VideoReader cannot find a video track.
case sourceCameraNotAvailable
An error that indicates that no cameras are available.
case captureSessionStopped
An error that indicates that the capture session stopped.
Topics
Analyzing the error
Create ML Components / VideoReaderError
Enumeration
VideoReaderError
Video loader errors.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 39

var debugDescription: String
A text representation of the error.
CustomDebugStringConvertible Implementations
Copyable
CustomDebugStringConvertible
Equatable
Error
LocalizedError
Sendable
SendableMetatype
enum AudioPreprocessingError
Audio preprocessing errors.
enum AudioReaderError
Audio reader errors.
enum CompatibilityError
A compatibility error.
enum ConcatenationError
Getting the debug description
Default Implementations
Relationships
Conforms To
See Also
Errors


## Page 40

Errors thrown when concatenating numeric values.
enum DatasetError
Dataset processing errors.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelCompatibilityError
Errors related to CoreML model compatibility.
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


