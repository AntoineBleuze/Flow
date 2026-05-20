# 000_MLCreateError.pdf

## Page 1

case cancelled
An error that indicates you canceled the training session.
case incompatibleParameters(parameter: String, originalValue: String,
newValue: String)
An error that indicates the training session parameters are incompatible.
case modifiedTrainingData
An error that indicates the training data is different from the data when you created the
session.
case io(reason: String)
An error that indicates an I/O failure.
case type(reason: String)
An error that indicates a missing or incorrect type.
case generic(reason: String)
An error that indicates a failure not covered by one of the other errors.
Topics
Identifying errors
Create ML / MLCreateError
Enumeration
MLCreateError
The errors Create ML throws while performing various operations, such as training
models, making predictions, writing models to a file system, and so on.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.14+
tvOS 16.0+
visionOS 1.0+


## Page 2

let MLCreateErrorDomain: String
A global constant that defines the domain for Create ML errors.
var description: String
A human-readable description of the error.
var debugDescription: String
A human-readable description of the error that’s suitable for output during debugging.
var errorCode: Int
The numeric code of this error.
var errorUserInfo: [String : Any]
A dictionary that provides additional information about the error.
var errorDescription: String?
A localized, human-readable description of the error and why it occurred, if applicable.
var failureReason: String?
A localized, human-readable reason behind the failure, if applicable.
CustomDebugStringConvertible Implementations
CustomNSError Implementations
CustomStringConvertible Implementations
LocalizedError Implementations
Copyable
Describing errors
Describing errors in a user interface
Default Implementations
Relationships
Conforms To


## Page 3

CustomDebugStringConvertible
CustomNSError
CustomStringConvertible
Error
LocalizedError
Sendable
SendableMetatype
struct MLModelMetadata
Information about a model that’s stored in a Core ML model file.
enum MLSplitStrategy
Data partitioning approaches, typically for creating a validation dataset from a training
dataset.
See Also
Supporting types


