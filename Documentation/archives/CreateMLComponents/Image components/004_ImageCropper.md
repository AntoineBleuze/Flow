# 004_ImageCropper.pdf

## Page 1

init(cropRectangle: CGRect)
Creates an image crop transformer. This transformer is used to crop an image to the crop
Rectangle.
var cropRectangle: CGRect
The crop rectangle within the image bounds.
func applied(to: CIImage, eventHandler: EventHandler?) throws -> CIImag
Perform the image crop operation on the input pixelBuffer.
Topics
Creating the transformer
Getting the properties
Performing the transformation
Relationships
Create ML Components / ImageCropper
Structure
ImageCropper
An image crop transformer.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

Copyable
CustomDebugStringConvertible
Decodable
Encodable
Sendable
SendableMetatype
Transformer
Augmenting images to expand your training data
Improve your model by using transformed versions of your training images.
Creating a multi-label image classifier
Train a machine learning model to assign multiple labels to an image.
struct ImageReader
An image file reader.
protocol ImageFeatureExtractor
A transformer that takes an image and outputs image features.
struct ImageScaler
An image scaling transformer.
struct ImageFeaturePrint
ImageFeaturePrint image feature extractor.
struct ImageBlur
An image blurring transformer.
struct ImageColorTransformer
An image color transformer.
struct ImageExposureAdjuster
Conforms To
See Also
Image components


## Page 3

An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


