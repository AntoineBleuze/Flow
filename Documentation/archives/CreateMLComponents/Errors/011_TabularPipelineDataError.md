# 011_TabularPipelineDataError.pdf

## Page 1

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
enum DatasetError
Dataset processing errors.
enum EstimatorEncodingError
An estimator encoding error.
enum ModelCompatibilityError
Relationships
Conforms To
See Also
Errors


## Page 3

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


