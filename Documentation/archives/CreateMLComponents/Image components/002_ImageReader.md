# 002_ImageReader.pdf

## Page 1

init()
Creates an image reader.
static func read(url: URL) throws -> CIImage
Reads an image URL as a CIImage.
func applied(to: URL, eventHandler: EventHandler?) throws -> CIImage
Reads an image URL as a CIImage.
Topics
Creating the transformer
Reading an image
Performing the transformation
Relationships
Create ML Components / ImageReader
Structure
ImageReader
An image file reader.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
Transformer
Augmenting images to expand your training data
Improve your model by using transformed versions of your training images.
Creating a multi-label image classifier
Train a machine learning model to assign multiple labels to an image.
protocol ImageFeatureExtractor
A transformer that takes an image and outputs image features.
struct ImageCropper
An image crop transformer.
struct ImageScaler
An image scaling transformer.
struct ImageFeaturePrint
ImageFeaturePrint image feature extractor.
struct ImageBlur
An image blurring transformer.
struct ImageColorTransformer
An image color transformer.
struct ImageExposureAdjuster
An image exposure adjusting transformer.
Conforms To
See Also
Image components


## Page 3

struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


