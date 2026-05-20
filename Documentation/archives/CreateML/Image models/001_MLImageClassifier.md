# 001_MLImageClassifier.pdf

## Page 1

Creating an Image Classifier Model
Improving Your Model’s Accuracy
Use an image classifier to train a machine learning model that you can include in your app to
categorize images.
When you create the model, you give it a training dataset made up of labeled images, along with
parameters that control the training process. For example, you can provide the model with images
of elephants and giraffes, in two folders labeled Elephant and Giraffe, to train it to recognize
these animals.
After training completes, you evaluate the trained model by showing it a testing dataset containin
labeled images that the model hasn’t seen before. The metrics that come from this evaluation tell
you whether the model performs well enough. For example, you can see how often the elephant
and giraffe classifier mistakes a giraffe for an elephant. When the model makes too many mistake
you can add more or better training data, or change the parameters, and try again.
When your model does perform well enough, you save it as a Core ML model file with the mlmode
extension. You can then import this model file into an app—like the Classifying Images with Vision
and Core ML sample code project—that uses a Core ML model file to classify images.
Mentioned in
Overview
Create ML / MLImageClassifier
Structure
MLImageClassifier
A model you train to classify images.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.14+
visionOS 1.0+


## Page 2

static func makeTrainingSession(trainingData: MLImageClassifier.Data
Source, parameters: MLImageClassifier.ModelParameters, sessionParameter
: MLTrainingSessionParameters) throws -> MLTrainingSession<MLImage
Classifier>
Creates or restores a training session.
static func train(trainingData: MLImageClassifier.DataSource, parameter
: MLImageClassifier.ModelParameters, sessionParameters: MLTraining
SessionParameters) throws -> MLJob<MLImageClassifier>
Begins an asynchronous image classifier training session with a training dataset represented
by a data source.
static func resume(MLTrainingSession<MLImageClassifier>) throws -> MLJo
<MLImageClassifier>
Begins or continues an asynchronous image classifier training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLImageClassifier>
Creates an asynchronous training session for an image classifier by restoring an existing
training session’s state from its parameters.
init(checkpoint: MLCheckpoint) throws
Creates an image classifier from a training session checkpoint.
init(trainingData:parameters:)
Creates an image classifier with a training dataset represented by a data source.
func evaluation(on:)
Topics
Training an image classifier asynchronously
Creating an image classifier from a checkpoint
Training an image classifier synchronously
Evaluating an image classifier


## Page 3

Generates metrics describing the image classifier’s performance on labeled images
represented by a data source.
var trainingMetrics: MLClassifierMetrics
Measurements of the classifier’s performance on the training data set.
var validationMetrics: MLClassifierMetrics
Measurements of the image classifier’s performance on the validation dataset.
func prediction(from:)
Generates a prediction for an image.
func predictions(from: [URL]) throws -> [String]
Generates predictions for an array of images.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the image classifier as a Core ML model file to a location in the file system.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the image classifier as a Core ML model file to the file path.
var model: MLModel
The underlying Core ML model of the image classifier stored in memory.
let modelParameters: MLImageClassifier.ModelParameters
The model configuration parameters the image classifier used during its training session.
var description: String
A text representation of the image classifier.
var debugDescription: String
A text representation of the image classifier that’s suitable for output during debugging.
Testing an image classifier
Saving an image classifier
Inspecting an image classifier model
Describing an image classifier


## Page 4

var playgroundDescription: Any
A description of the image classifier shown in a playground.
enum DataSource
A data source for an image classifier.
struct ModelParameters
Parameters that affect the process of training an image classifier model.
enum FeatureExtractorType
The underlying base model that extracts image features for image classifier training session
struct CustomFeatureExtractor
A custom feature extractor a training session uses to train an image classifier.
struct ImageAugmentationOptions
The variations that the training process can use to generate more training data from the
training data you provide.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Supporting types
Default Implementations
Relationships
Conforms To


## Page 5

Creating an Image Classifier Model
Train a machine learning model to classify images, and add it to your Core ML app.
struct MLObjectDetector
A model you train to classify one or more objects within an image.
struct MLHandPoseClassifier
A task that creates a hand pose classification model by training with images of people’s hand
that you provide.
See Also
Image models


