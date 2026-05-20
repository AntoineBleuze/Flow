# Core ML adaptors.pdf

## Page 1

init(model: MLModel) throws
Creates a model adaptor from an MLModel.
init(contentsOf: URL, configuration: MLModelConfiguration) throws
Creates a model adaptor from a CoreML model URL.
let model: MLModel
The CoreML model.
func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> MLShapedArray<Scalar>
Performs a transformation on a single input.
Topics
Creating an adaptor
Getting the model
Performing the transformation
Create ML Components / MLModelTransformerAdaptor
Structure
MLModelTransformerAdaptor
A transformer that uses a Core ML model.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Transformer
struct MLModelClassifierAdaptor
A transformer that uses a Core ML model as a classifier.
struct MLModelRegressorAdaptor
A transformer that uses a Core ML model as a regressor.
struct ModelMetadata
User info keys that specify useful information about a model.
Relationships
Conforms To
See Also
Core ML adaptors


## Page 3

init(model: MLModel) throws
Creates a MLModel classifier adaptor from a model.
init(contentsOf: URL, configuration: MLModelConfiguration) throws
Creates a model adaptor from a CoreML model URL.
let model: MLModel
The CoreML model.
func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> ClassificationDistribution<MLModelClassifierAdaptor<
Scalar>.Label>
Performs a prediction from a single input.
Topics
Creating a transformer
Getting the model
Performing the transformation
Create ML Components / MLModelClassifierAdaptor
Structure
MLModelClassifierAdaptor
A transformer that uses a Core ML model as a classifier.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 4

enum Label
The classifier label type.
Classifier, Transformer
struct MLModelTransformerAdaptor
A transformer that uses a Core ML model.
struct MLModelRegressorAdaptor
A transformer that uses a Core ML model as a regressor.
struct ModelMetadata
User info keys that specify useful information about a model.
Relationships
Conforms To
See Also
Core ML adaptors


## Page 5

init(model: MLModel) throws
Creates a MLModel regressor adaptor from a model.
init(contentsOf: URL, configuration: MLModelConfiguration) throws
Creates a model adaptor from a CoreML model URL.
let model: MLModel
The CoreML model.
func applied(to: MLShapedArray<Scalar>, eventHandler: EventHandler?)
async throws -> Double
Performs a prediction from a single input.
Topics
Creating an adaptor
Getting the model
Performing the prediction
Create ML Components / MLModelRegressorAdaptor
Structure
MLModelRegressorAdaptor
A transformer that uses a Core ML model as a regressor.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 6

Regressor, Transformer
struct MLModelTransformerAdaptor
A transformer that uses a Core ML model.
struct MLModelClassifierAdaptor
A transformer that uses a Core ML model as a classifier.
struct ModelMetadata
User info keys that specify useful information about a model.
Relationships
Conforms To
See Also
Core ML adaptors


## Page 7

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


## Page 8

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


