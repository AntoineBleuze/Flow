# 003_ConcatenationError.pdf

## Page 1

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


## Page 2

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


## Page 3

Errors related to pipeline data affinity problems.
enum SerializationError
A serialization error.
enum TabularPipelineDataError
Errors related to tabular pipeline data affinity problems.
enum VideoReaderError
Video loader errors.


