# 009_PipelineDataError.pdf

## Page 1

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


## Page 2

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


## Page 3

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


