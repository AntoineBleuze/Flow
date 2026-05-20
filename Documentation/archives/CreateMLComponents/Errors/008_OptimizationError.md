# 008_OptimizationError.pdf

## Page 1

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


## Page 2

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


## Page 3

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


