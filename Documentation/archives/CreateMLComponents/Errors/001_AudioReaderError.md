# 001_AudioReaderError.pdf

## Page 1

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


## Page 2

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


## Page 3

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


