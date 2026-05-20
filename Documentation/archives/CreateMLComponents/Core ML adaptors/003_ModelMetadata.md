# 003_ModelMetadata.pdf

## Page 1

init(description: String, version: String, author: String, license:
String, creatorDefined: [String : String])
Creates model metadata.
var author: String
The author of this model.
var creatorDefined: [String : String]
Creator-defined custom metadata.
var description: String
A short description of what the model does and/or its purpose.
var license: String
License information for the model.
var version: String
Topics
Creating a model
Getting the properties
Create ML Components / ModelMetadata
Structure
ModelMetadata
User info keys that specify useful information about a model.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

A version number encoded as a string.
Equatable
Hashable
Sendable
SendableMetatype
struct MLModelTransformerAdaptor
A transformer that uses a Core ML model.
struct MLModelClassifierAdaptor
A transformer that uses a Core ML model as a classifier.
struct MLModelRegressorAdaptor
A transformer that uses a Core ML model as a regressor.
Relationships
Conforms To
See Also
Core ML adaptors


