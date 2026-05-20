# 004_DatasetError.pdf

## Page 1

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


## Page 2

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


## Page 3

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


