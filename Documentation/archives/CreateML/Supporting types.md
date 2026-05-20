# Supporting types.pdf

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


## Page 4

Creating a text classifier model
Creating a word tagger model
Create a metadata instance and store it as part of your model when you export a Core ML model.
You can examine this metadata in Xcode when you import the model into your app.
init(author: String, shortDescription: String, license: String?, versio
: String, additional: [String : String]?)
Creates a new metadata instance for a machine learning model.
Mentioned in
Overview
Topics
Creating metadata
Accessing metadata
Create ML / MLModelMetadata
Structure
MLModelMetadata
Information about a model that’s stored in a Core ML model file.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.14+
tvOS 16.0+
visionOS 1.0+


## Page 5

var author: String
The author of the model.
var shortDescription: String
A short text description of the model.
var license: String?
The license governing the use of the model.
var version: String
The model version.
var additional: [String : String]?
A dictionary that encodes key value pairs to hold additional information about the model.
Sendable, SendableMetatype
enum MLCreateError
The errors Create ML throws while performing various operations, such as training models,
making predictions, writing models to a file system, and so on.
enum MLSplitStrategy
Data partitioning approaches, typically for creating a validation dataset from a training
dataset.
Relationships
Conforms To
See Also
Supporting types


## Page 6

case automatic
Create ML automatically decides how much of your training dataset it uses for a validation
dataset.
case fixed(ratio: Double, seed: Int?)
Create ML uses a portion of your training dataset to create a validation dataset based on the
ratio.
func resolve(count: Int) -> (ratio: Double, seed: Int)
Resolves this split strategy for a specific element count.
func timestampSeed() -> Int
Returns a number based on the current system time.
Topics
Partitioning data
Creating a random seed
Create ML / MLSplitStrategy
Enumeration
MLSplitStrategy
Data partitioning approaches, typically for creating a validation dataset from a
training dataset.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.15+
tvOS 16.0+
visionOS 1.0+


## Page 7

Sendable, SendableMetatype
enum MLCreateError
The errors Create ML throws while performing various operations, such as training models,
making predictions, writing models to a file system, and so on.
struct MLModelMetadata
Information about a model that’s stored in a Core ML model file.
Relationships
Conforms To
See Also
Supporting types


