# 003_MLHandPoseClassifier.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


