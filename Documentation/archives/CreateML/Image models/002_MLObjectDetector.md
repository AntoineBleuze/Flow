# 002_MLObjectDetector.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


