# Image models.pdf

## Page 1

An image classifier is a machine learning model that recognizes images. When you give it an imag
it responds with a category label for that image.
You train an image classifier by showing it many examples of images you’ve already labeled. For
example, you can train an image classifier to recognize animals by gathering photos of elephants,
giraffes, lions, and so on.
After the image classifier finishes training, you assess its accuracy and, if it performs well enough
save it as a Core ML model file. You then import the model file into your Xcode project to use the
image classifier in your app.
Overview
Gather Your Data
Create ML / Creating an Image Classifier Model
Article
Creating an Image Classifier Model
Train a machine learning model to classify images, and add it to your Core ML app


## Page 2

Use at least 10 images per category, but keep in mind that an image classifier performs better wit
a more diverse set of images. Consider including images of each category from multiple angles an
in different lighting conditions.
Balance the number of images for each category. For example, don’t use 10 images for one
category and then 1000 images for another.
The images can be in any format you can open in the Quicktime Player, such as JPEG and PNG.
They don’t have to be a particular size, nor do they need to be the same size as each other.
However, it’s best to use images that are at least 299 x 299 pixels.
If possible, gather images that best represent what you expect the model to see when you use it i
your app. For example, if your app classifies images from a device’s camera in an outdoor setting
gather outdoor images from an identical or similar camera.
Note
By default, the image classifier uses the scene print feature extractor to accelerate the training
process and works best with real-world objects. For more information, see MLImage
Classifier.FeatureExtractorType.scenePrint(revision:).
Prepare a training dataset by sorting the images into subfolders. Give each subfolder a name for
the category of images contained within it. For example, you might use the label Cheetah for all
the images of cheetahs.
Testing your model with a testing dataset is a quick way to see how well your trained model might
perform in the real world.
If your dataset has enough images, say 25 or more per category, create a testing dataset by
duplicating the folder structure of the training dataset. Then move about 20 percent of the image
from each category into the equivalent category folder in the testing dataset.
Organize Your Training Data
Organize Your Testing Data


## Page 3

Use Create ML to create an image classifier project. With Xcode open, Control-click the Xcode ico
in the Dock and choose Open Developer Tool > Create ML. Or, from the Xcode menu, choose Ope
Developer Tool > Create ML.
In Create ML, choose File > New Project to see the list of model templates. Select Image
Classification and click Next.
Change the project’s default name to a more meaningful one. If applicable, enter additional
information for the models that come from this project, such as one or more authors and a short
description.
Create an Image Classifier Project


## Page 4

Drag the folder with your training dataset into the Training Data well in the project window.
If applicable, drag the folder with your testing dataset into the Testing Data well in the project
window.
Configure the Training Session


## Page 5

You can adjust the following parameters before training your image classifier:
Feature Extractor
A Feature Extractor is the underlying base model that extracts image features for image
classifier training session. There are 2 options for feature extraction. Image Feature Print V2
has a smaller output embedding size than Image Feature Print V1. This leads to faster training
times, reduces the memory needed to store the extracted features, and can also increase
accuracy. On the other hand, Image Feature Print V1 is compatible with older operating
systems, including macOS 10.14 or later and iOS 12 or later. Image Feature Print V2 is
compatible with macOS 14 or later and iOS 17 or later.
Iterations
If you know how many training iterations you’d like use in your training session, change the
default value. Include enough iterations for an accurate model; stopping too early may result 
a model that’s less accurate.
Augmentations
You can also turn on any or all of the image augmentations. Each augmentation copies the
dataset’s images and applies a transform or filter that effectively gives the dataset more
variety without gathering additional images.


## Page 6

Click the Train button to start the training session. Create ML begins the session by quickly
separating some of your training data into a validation dataset. Next, Create ML extracts features,
such as edges, corners, textures, and regions of color, from the remaining training images. Create
ML uses the images’ features to iteratively train the model and then checks its accuracy with the
validation dataset.
Create ML shows its progress in a graph, where the black and gray lines represent the model’s
accuracy with the training and validation datasets, respectively.
Train the Image Classifier


## Page 7

When Create ML finishes training the model, it tests the model using the testing dataset. When it’
finished testing the model, Create ML shows the training, validation, and testing accuracy scores 
the Evaluation tab. Models typically have higher accuracy scores on the training dataset because 
learned from those images. In this example, the image classifier model correctly identified:
100 percent of the training images
95 percent of the validation images
97 percent of the testing images
Precision is the number of true positives divided by the sum of true positives and false positives.
Recall is the number of true positives divided by the sum of true positives and false negatives.
If the evaluation performance isn’t good enough, you may need to train a new model with a datas
that has more variety. For example, you can gather additional images from new angles or in new
environments, or add one or more image augmentation options. For details about evaluating a
model, as well as strategies for improving the model’s performance, see Improving Your Model’s
Accuracy.
Assess the Model’s Accuracy
Preview the Model


## Page 8

Click the Preview tab to try out the model with images it hasn’t seen before. To see the model’s
predictions, drag image files to the column below the Train button.
When you’re satisfied with the model’s performance, save it to the file system (in a Core ML
format). From the Output tab, save the model using any of these options:
Click the Save button to save the model to the file system.
Click the Export button to open the model in Xcode.
Click the Share button to send the model to someone else, such as through Mail or Messages.
Drag the model’s icon anywhere that accepts a file.
The last step is to add your trained model to an Xcode project. For example, your image classifier
model can replace the model in the Classifying Images with Vision and Core ML sample.
Download the sample and open the project in Xcode. Drag your model file into the navigation pan
Xcode adds the model to your project and shows you the model’s metadata, operating system
availability, class labels, and so on.
To use your model in code, you only need to change one line. The project instantiates the
MobileNet model in exactly one place in the ImagePredictor class.
Change this line to use your image classification model class instead:
These models are interchangeable because both take an image as input, and both output a label
string. With your model substitution, the sample app classifies images as before, except now it
uses your model and its associated labels.
Save the Model
Add the Model to Your App


## Page 9

You can use Create ML to train a useful image classifier with very little code or machine learning
expertise, as described in the sections above. However, you can also use an MLImage
Classifier instance to script the model training process. The general tasks are the same:
prepare data, train a model, assess performance, and save the Core ML model file. The difference
is that you do everything programmatically.
For example, you can initialize two MLImageClassifier.DataSource instances, one for the
training dataset and another for the testing dataset. Use the training data source to initialize an
image classifier with init(trainingData:parameters:). Then use the testing data source
with its evaluation(on:) method, and assess the values in the MLClassifierMetrics
instance it returns.
struct MLImageClassifier
A model you train to classify images.
struct MLObjectDetector
A model you train to classify one or more objects within an image.
struct MLHandPoseClassifier
A task that creates a hand pose classification model by training with images of people’s hand
that you provide.
Automate Model Training and Assessment
See Also
Image models


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

Creating an Image Classifier Model
Train a machine learning model to classify images, and add it to your Core ML app.
struct MLObjectDetector
A model you train to classify one or more objects within an image.
struct MLHandPoseClassifier
A task that creates a hand pose classification model by training with images of people’s hand
that you provide.
See Also
Image models


## Page 15

Building an object detector data source
Use an MLObjectDetector task to train a machine learning model that can identify items, or
objects, within an image. For example, you can train an object detector to recognize breakfast
items on a table, such as bananas, croissants, and beverages.
You create an object detector training it with a combination of images and annotations for each
object within an image. Then save it as a Core ML model and use it in your app to recognize simila
items.
Building an object detector data source
Arrange your training data for an object detector in one of several different structured ways.
Mentioned in
Overview
Topics
Creating a data source
Create ML / MLObjectDetector
Structure
MLObjectDetector
A model you train to classify one or more objects within an image.
macOS 10.15+


## Page 16

static func train(trainingData: MLObjectDetector.DataSource, annotation
Type: MLObjectDetector.AnnotationType, parameters: MLObjectDetector.
ModelParameters, sessionParameters: MLTrainingSessionParameters) throws
-> MLJob<MLObjectDetector>
Begins an asynchronous object-detector training session.
static func makeTrainingSession(trainingData: MLObjectDetector.Data
Source, annotationType: MLObjectDetector.AnnotationType, parameters:
MLObjectDetector.ModelParameters, sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLObjectDetector>
Creates an asynchronous object-detector training session.
static func resume(MLTrainingSession<MLObjectDetector>) throws -> MLJob
MLObjectDetector>
Begins or continues an asynchronous object-detector training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLObjectDetector>
Creates an asynchronous training session for an object detector by restoring an existing
training session’s state from its parameters.
init(checkpoint: MLCheckpoint) throws
Creates an object detector from a training session checkpoint.
init(trainingData: MLObjectDetector.DataSource, parameters: MLObject
Detector.ModelParameters, annotationType: MLObjectDetector.Annotation
Type) throws
Creates an object detector with a data source.
init(trainingData: MLDataTable, imageColumn: String, annotationColumn:
String, annotationType: MLObjectDetector.AnnotationType, parameters:
MLObjectDetector.ModelParameters) throws
Creates an object detector with a data table.
Deprecated
Training an object detector asynchronously
Creating an object detector from a checkpoint
Training an object detector synchronously


## Page 17

func evaluation(on: MLObjectDetector.DataSource) -> MLObjectDetector
Metrics
Generates metrics by evaluating the object detector’s performance using annotated images
a data source.
func evaluation(on: MLDataTable, imageColumn: String, annotationColumn:
String) -> MLObjectDetectorMetrics
Generates metrics by evaluating the object detector’s performance using annotated images
a data table.
Deprecated
var trainingMetrics: MLObjectDetectorMetrics
Measurements of the object detector’s performance on the training dataset.
var validationMetrics: MLObjectDetectorMetrics
Measurements of the object detector’s performance on the validation dataset.
func prediction(from: URL) throws -> MLObjectDetector.DetectedObjects
Locates objects in an image and generates an annotation for each object it detects.
func predictions(from: [URL]) throws -> [MLObjectDetector.Detected
Objects]
Locates objects in an array of images and generates an array of annotation collections, one f
each input image.
typealias DetectedObjects
An array of annotations that represent the items an object detector found in an image.
struct ObjectAnnotation
The label, location, and confidence score of an item the object detector found in an image.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the object detector as a Core ML model file.
Evaluating an object detector
Testing an object detector
Saving an object detector


## Page 18

func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the object detector as a Core ML model file.
var model: MLModel
The object detector’s underlying Core ML model instance.
let modelParameters: MLObjectDetector.ModelParameters
The model configuration parameters the object detector used during its training session.
var description: String
A text representation of the object detector.
var debugDescription: String
A text representation of the object detector that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the object detector within a playground.
enum DataSource
A data source for an object detector.
enum AnnotationType
The available types of image annotations.
struct ModelParameters
Parameters that affect the process of training an object detection model.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Inspecting an object detector model
Describing an object detector
Supporting types
Default Implementations


## Page 19

Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating an Image Classifier Model
Train a machine learning model to classify images, and add it to your Core ML app.
struct MLImageClassifier
A model you train to classify images.
struct MLHandPoseClassifier
A task that creates a hand pose classification model by training with images of people’s hand
that you provide.
Relationships
Conforms To
See Also
Image models


## Page 20

static func train(trainingData: MLHandPoseClassifier.DataSource,
parameters: MLHandPoseClassifier.ModelParameters, sessionParameters:
MLTrainingSessionParameters) throws -> MLJob<MLHandPoseClassifier>
Begins an asynchronous hand pose classifier’s training session.
static func makeTrainingSession(trainingData: MLHandPoseClassifier.Data
Source, parameters: MLHandPoseClassifier.ModelParameters, session
Parameters: MLTrainingSessionParameters) throws -> MLTrainingSession<
MLHandPoseClassifier>
Creates an asynchronous hand pose classifier’s training session.
static func resume(MLTrainingSession<MLHandPoseClassifier>) throws ->
MLJob<MLHandPoseClassifier>
Begins or continues an asynchronous hand pose classifier’s training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLHandPoseClassifier>
Recreates an asynchronous hand pose classifier’s training session by restoring its saved sta
from the file system.
Topics
Training a hand pose classifier asynchronously
Create ML / MLHandPoseClassifier
Structure
MLHandPoseClassifier
A task that creates a hand pose classification model by training with images of
people’s hands that you provide.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
visionOS 1.0+


## Page 21

init(checkpoint: MLCheckpoint) throws
Creates a hand pose classifier from a training session checkpoint.
init(trainingData: MLHandPoseClassifier.DataSource, parameters: MLHand
PoseClassifier.ModelParameters) throws
Creates a hand pose classifier by starting a synchronous training session.
func evaluation(on: MLHandPoseClassifier.DataSource) throws ->
MLClassifierMetrics
Generates metrics that describe the hand pose classifier’s performance with a dataset of
labeled images.
var trainingMetrics: MLClassifierMetrics
Measurements of the hand pose classifier’s performance on the training dataset.
var validationMetrics: MLClassifierMetrics
Measurements of the hand pose classifier’s performance on the validation dataset.
func prediction(from: URL) throws -> [(label: String, confidence: Doubl
)]
Generates a hand pose prediction for an image.
func predictions(from: [URL]) throws -> [[(label: String, confidence:
Double)]]
Generates an array of hand pose predictions for each image in a URL array.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the hand pose classifier as a CoreML model file.
Creating a hand pose classifier from a checkpoint
Training a hand pose classifier synchronously
Evaluating a hand pose classifier
Testing a hand pose classifier
Saving a hand pose classifier


## Page 22

func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the hand pose classifier as a Core ML model file.
var model: MLModel
The underlying Core ML model of the hand pose classifier stored in memory.
let modelParameters: MLHandPoseClassifier.ModelParameters
The hand pose model’s configuration parameters.
var description: String
A text representation of the hand pose classifier.
var debugDescription: String
A text representation of the hand pose classifier suitable for debugging.
var playgroundDescription: Any
A description of the hand pose classifier that’s viewable in a playground.
enum DataSource
A hand pose classifier dataset that contains annotated images or hand joint location data.
struct ModelParameters
A set of parameters that affect the training process of a hand pose classifier task.
struct ImageAugmentationOptions
Options a hand pose classification training session can use to generate additional training
data from the images you provide.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
Inspecting a hand pose classifier model
Describing a hand pose classifier
Supporting types
Default Implementations


## Page 23

CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Creating an Image Classifier Model
Train a machine learning model to classify images, and add it to your Core ML app.
struct MLImageClassifier
A model you train to classify images.
struct MLObjectDetector
A model you train to classify one or more objects within an image.
Relationships
Conforms To
See Also
Image models


