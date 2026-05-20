# 013_MLModelImageFeatureExtractor.pdf

## Page 1

init(model: MLModel, inputName: String, outputName: String, context:
CIContext) throws
Creates an image feature extractor from a CoreML model.
init(contentsOf: URL, configuration: MLModelConfiguration, inputName:
String, outputName: String, context: CIContext) async throws
Creates an image feature extractor from a CoreML model URL.
let inputName: String
The model’s input feature name.
let model: MLModel
The CoreML model with .mlmodel extension.
let outputName: String
The model’s output feature name.
Topics
Creating the extractor
Getting the properties
Create ML Components / MLModelImageFeatureExtractor
Structure
MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

func applied(to: CIImage, eventHandler: EventHandler?) async throws ->
MLShapedArray<Float>
Uses the CoreML model to create image features from the input pixel buffer.
enum Error
CoreML Extraction error.
ImageFeatureExtractor, Transformer
Augmenting images to expand your training data
Improve your model by using transformed versions of your training images.
Creating a multi-label image classifier
Train a machine learning model to assign multiple labels to an image.
struct ImageReader
An image file reader.
protocol ImageFeatureExtractor
A transformer that takes an image and outputs image features.
struct ImageCropper
An image crop transformer.
struct ImageScaler
An image scaling transformer.
Applying
Relationships
Conforms To
See Also
Image components


## Page 3

struct ImageFeaturePrint
ImageFeaturePrint image feature extractor.
struct ImageBlur
An image blurring transformer.
struct ImageColorTransformer
An image color transformer.
struct ImageExposureAdjuster
An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.


