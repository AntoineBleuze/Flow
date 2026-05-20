# 001_MLModelMetadata.pdf

## Page 1

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


## Page 2

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


