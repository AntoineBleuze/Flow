# Image components.pdf

## Page 1

Training a good image model requires a variety of training images with different characteristics. If
you’re training an image classifier to recognize flowers you can improve classification accuracy by
providing flower photos with a variety of lighting conditions, angles, and backgrounds. However,
collecting and labeling images is a time-consuming process.
To maximize the potential impact of your data you can use image augmentations. Augmenting
images is the process of applying transformations such as flipping, cropping, resizing, adjusting
brightness, adding noise, and so on. Image augmentations are not a replacement for a good imag
data set, but they help maximize the data set’s effectiveness. Each augmentation has the potentia
to multiply the size of your training data which is helpful when your training sample size is small.
Keep in mind that performing augmentations has some drawbacks. You can’t reuse extracted
features across training iterations because each iteration produces a new set of augmented
images. This increase in training time can be significant. Augmentations have the most impact
when your dataset is small relative to the number of parameters in your model.
Overview
Create ML Components / Augmenting images to expand your training data
Article
Augmenting images to expand your
training data
Improve your model by using transformed versions of your training images.


## Page 2

You can use Augmenter to create a custom augmentation. The augmenter applies each
transformer to each image in sequence. For example, this augmenter randomly flips (with 50%
probability) and then randomly crops images:
To generate a random number each time, use UniformRandomFloatingPointParameter. Yo
can use the random number with any transformer. For instance, to perform a slight rotation using
ImageRotator:
After you create an augmenter, you can use it to augment your training data. You do this with the
applied(to:) method:
Because augmentations are usually random, it makes sense to do more than one pass over your
training data. Each pass results in a different set of images, for instance with different scale facto
You can control the number of passes by using the applied(to:upsampledBy:) method. For
instance, to get 10 times the number of images:
Write an augmentation
Apply augmentations to your training data


## Page 3

Note
The result of the augmentations is an asynchronous sequence. The augmenter doesn’t
perform augmentations until you request them to avoid the memory overhead.
You can now use your augmented data set to train an image classifier. Because augmentations ta
images, not URLs, you may need to read your files first.
Now that you have annotated images, the next step is to create your pipeline. For an image
classifier, create a feature extractor and a classifier.
Next, create the augmenter that transforms the training images.
Finally, create a model, apply the augmenter to the training data, and progressively train the mode
using update(_:with:eventHandler:). The following example applies the augmenter to th
trainingImages and updates the model up to 100 times:
Train an image classifier


## Page 4

The example above applies the augmenter to shuffled images. Shuffling images creates more
variation, which helps prevent over-fitting. The example breaks the data into batches after each
augmentation, and updates the model with each batch. Using a smaller batch size typically
produces a better model, while using a larger batch size can speed up training.
Tip
A batch size of 32 is often a good starting point.
Training your model progressively using the update(_:with:eventHandler:) method lets y
control when to stop training. Stop training when the validation accuracy stops improving, for
example:
Stop training


## Page 5

struct Augmenter
An augmenter.
struct ApplyEachRandomly
Applies each transformer randomly given a probability.
struct ApplyRandomly
Randomly applies the transformer with the given probability.
struct ChooseRandomly
Apply single transformation randomly chosen from a list of transformers.
struct RandomImageCropper
Crops an image at a random location.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
struct ShuffleRandomly
Apply transformations in a random order.
struct UniformRandomFloatingPointParameter
Applies the transformer with a randomly generated input parameter.
class UniformRandomIntegerParameter
Applies the transformer with a randomly generated input parameter.
See Also
Related Documentation
Image components


## Page 6

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
An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 7

A single-label image classifier takes an input image and assigns one label, which helps identify th
most relevant subject in the image. However, there’s often additional information and context in a
image that identifying the most relevant subject doesn’t consider. A multi-label image classifier
takes an input image and assigns multiple labels. A multi-label classifier is better at describing an
image where there are multiple subjects, or when the environment is relevant.
Training a multi-label image classifier is similar to training a single-label image classifier. You colle
and label images, build an estimator pipeline, train and evaluate the model, and export the model 
use with Vision. For more information about single-label image classifiers, see Creating an Image
Classifier Model.
First, collect images and assign labels. Put all images in a folder and create a JSON file in the sam
folder. For example if you have two images, then your folder contains three files: image1.jpg,
image2.jpg, and annotations.json. The JSON file contains the labels for each image. The
following example includes possible labels for two images: image1.jpg is an image of a potted
aloe plant on a window sill and image2.jpg is an image of a potted cactus with a person standin
next to it.
Overview
Prepare your training data
Create ML Components / Creating a multi-label image classifier
Article
Creating a multi-label image classifier
Train a machine learning model to assign multiple labels to an image.


## Page 8

Create a Decodable structure and populate it with the file names and labels from your JSON file
Then, convert them to an AnnotatedFeature structure.
After preparing your training data, you can create your estimator pipeline. When using Create ML
Components, you compose estimators and transformers into pipelines that you can train to
produce models. As with a single-label image classifier, use an image reader and a feature
extractor. But the last component is a FullyConnectedNetworkMultiLabelClassifier
instead of a FullyConnectedNetworkClassifier.
Build a multi-label estimator pipeline


## Page 9

When you validate as you train, you can stop training when the validation metrics stop improving.
So set aside some of the images for validation. Then, call the fitted(to:validateOn:event
Handler:) method to train.
After training the model, evaluate it using test images. The mean-average precision (MAP) is a
good measure for a multi-label classifier.
After you train the model, you can export it as a Core ML model.
Then, use Vision to classify images in your app.
Train and evaluate the model
Export the model to use with Vision


## Page 10

The observations include all labels and their probabilities. This includes labels for which the mode
predicted a low probability. Including all observations results in high recall but low precision, in
other words, your model prioritizes predicting additional labels. To balance the precision and reca
include only the labels that have a high probability. To do this you can choose a probability
threshold for each label, or use one of the methods from Vision. The hasMinimumPrecision(_
forRecall:) and hasMinimumRecall(_:forPrecision:) methods allow you to choose
only observations that strike a specific balance between precision and recall.
Augmenting images to expand your training data
Improve your model by using transformed versions of your training images.
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
See Also
Image components


## Page 11

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
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 12

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


## Page 13

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


## Page 14

struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 15

Transformer
ImageFeaturePrint, MLModelImageFeatureExtractor
Augmenting images to expand your training data
Improve your model by using transformed versions of your training images.
Creating a multi-label image classifier
Train a machine learning model to assign multiple labels to an image.
Relationships
Inherits From
Conforming Types
See Also
Image components
Create ML Components / ImageFeatureExtractor
Protocol
ImageFeatureExtractor
A transformer that takes an image and outputs image features.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 16

struct ImageReader
An image file reader.
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
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 17

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


## Page 18

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


## Page 19

An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 20

init(targetSize: CGSize)
Creates an image scaler transformer. This transformer is used to scale an image to the
targetSize.
init(targetHeight: Double)
Creates an image scaler transformer that preserves the aspect ratio.
init(targetWidth: Double)
Creates an image scaler transformer that preserves the aspect ratio.
var targetSize: CGSize
The target image size.
func applied(to: CIImage, eventHandler: EventHandler?) throws -> CIImag
Topics
Creating a transformer
Getting the target image size
Performing the transformation
Create ML Components / ImageScaler
Structure
ImageScaler
An image scaling transformer.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 21

Perform the image scaler operation on the input pixelBuffer.
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
struct ImageCropper
An image crop transformer.
struct ImageFeaturePrint
ImageFeaturePrint image feature extractor.
struct ImageBlur
Relationships
Conforms To
See Also
Image components


## Page 22

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
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 23

init(cropAndScale: VNImageCropAndScaleOption, context: CIContext)
Creates a FeaturePrint feature extractor.
init(revision: Int, cropAndScale: VNImageCropAndScaleOption, context:
CIContext)
Creates a FeaturePrint feature extractor.
let cropAndScale: VNImageCropAndScaleOption
The crop and scale options.
var revision: Int
The feature extractor revision number.
static let latestRevision: Int
The latest feature extractor revision.
Topics
Creating the extractor
Getting the properties
Performing the transformation
Create ML Components / ImageFeaturePrint
Structure
ImageFeaturePrint
ImageFeaturePrint image feature extractor.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 24

func applied(to: CIImage, eventHandler: EventHandler?) async throws ->
MLShapedArray<Float>
Extracts image features from an image.
Copyable
CustomDebugStringConvertible
Decodable
Encodable
ImageFeatureExtractor
Transformer
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
Relationships
Conforms To
See Also
Image components


## Page 25

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
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 26

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


## Page 27

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


## Page 28

An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 29

init(brightness: Float?, contrast: Float?, hue: Float?, saturation:
Float?)
Creates an image color transformer.
var brightness: Float?
The brightness adjustment, between 0.0 and 1.0.
var contrast: Float?
The contrast adjustment, between 0.0 and 1.0.
var hue: Float?
The hue adjustment, between 0.0 and 1.0.
var saturation: Float?
The saturation adjustment, between 0.0 and 1.0.
Topics
Creating a color transformer
Getting the properties
Applying the transformation
Create ML Components / ImageColorTransformer
Structure
ImageColorTransformer
An image color transformer.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 30

func applied(to: CIImage, eventHandler: EventHandler?) -> CIImage
Performs the image color transformation operation on the input image.
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
Relationships
Conforms To
See Also
Image components


## Page 31

struct ImageExposureAdjuster
An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 32

init(amount: Double)
Creates an image exposure adjusting transformer.
var amount: Double
The amount to adjust the exposure of the image. The larger the value, the brighter the
exposure.
func applied(to: CIImage, eventHandler: EventHandler?) -> CIImage
Adjusts the exposure of the input image.
Topics
Creating an exposure adjuster
Getting the amount
Performing the transformation
Relationships
Create ML Components / ImageExposureAdjuster
Structure
ImageExposureAdjuster
An image exposure adjusting transformer.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 33

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
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
Conforms To
See Also
Image components


## Page 34

An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 35

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


## Page 36

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


## Page 37

An image exposure adjusting transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 38

Augmenting images to expand your training data
init(angle: Double)
Creates a transformer that rotates an image by a specified angle.
var angle: Double
The angle, in radians, by which to rotate the coordinate space of the specified context.
Positive values rotate counterclockwise and negative values rotate clockwise.
func applied(to: CIImage, eventHandler: EventHandler?) -> CIImage
Mentioned in
Topics
Creating the transformer
Getting the angle
Performing the transformation
Create ML Components / ImageRotator
Structure
ImageRotator
An image rotating transformer.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 39

Rotates the image and then scales and crops the rotated image to fit the extent of the input
image.
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
Relationships
Conforms To
See Also
Image components


## Page 40

struct ImageColorTransformer
An image color transformer.
struct ImageExposureAdjuster
An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 41

init(intensity: Double)
Creates transformer that generates random noise to apply to an image.
var intensity: Double
The intensity of the random noise to add to the image.
func applied(to: CIImage, eventHandler: EventHandler?) -> CIImage
Adds random noise to the input image.
Topics
Creating a noise generator
Getting the intensity
Performing the transformation
Relationships
Create ML Components / RandomImageNoiseGenerator
Structure
RandomImageNoiseGenerator
A transformer that adds random noise to an image.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+


## Page 42

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
An image exposure adjusting transformer.
struct ImageFlipper
Conforms To
See Also
Image components


## Page 43

An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


## Page 44

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


## Page 45

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


## Page 46

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


