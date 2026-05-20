# 007_ImageBlur.pdf

## Page 1

init(radius: Double)
Creates a transformer that blurs an image.
var radius: Double
The radius determines how many pixels are used to create the blur. The larger the radius, the
blurrier the result.
func applied(to: CIImage, eventHandler: EventHandler?) -> CIImage
Blurs an image using a disc-shaped convolution kernel.
Topics
Creating an image blur
Getting the radius
Applying the blur
Relationships
Create ML Components / ImageBlur
Structure
ImageBlur
An image blurring transformer.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 2

Sendable, SendableMetatype, Transformer
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
struct ImageFeaturePrint
ImageFeaturePrint image feature extractor.
struct ImageColorTransformer
An image color transformer.
struct ImageExposureAdjuster
An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
Conforms To
See Also
Image components


## Page 3

An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


