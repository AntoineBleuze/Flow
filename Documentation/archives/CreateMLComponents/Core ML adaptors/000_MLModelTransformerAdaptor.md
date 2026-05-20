# 000_MLModelTransformerAdaptor.pdf

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


