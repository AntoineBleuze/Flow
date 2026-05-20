# 010_ImageFlipper.pdf

## Page 1

init(orientation: ImageFlipper.Orientation)
Creates an image flipper.
enum Orientation
The orientation to flip the image.
var orientation: ImageFlipper.Orientation
The orientation to flip the image.
func applied(to: CIImage, eventHandler: EventHandler?) -> CIImage
Performs the image flipper operation on the input image.
Topics
Creating a transformer
Getting the orientation
Performing the transformation
Create ML Components / ImageFlipper
Structure
ImageFlipper
An image flipper transformer.
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
struct ImageBlur
An image blurring transformer.
struct ImageColorTransformer
An image color transformer.
struct ImageExposureAdjuster
Relationships
Conforms To
See Also
Image components


## Page 3

An image exposure adjusting transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


