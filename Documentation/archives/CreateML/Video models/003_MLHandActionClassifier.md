# 003_MLHandActionClassifier.pdf

## Page 1

static func train(trainingData: MLHandActionClassifier.DataSource,
parameters: MLHandActionClassifier.ModelParameters, sessionParameters:
MLTrainingSessionParameters) throws -> MLJob<MLHandActionClassifier>
Begins an asynchronous hand action classifier’s training session.
static func makeTrainingSession(trainingData: MLHandActionClassifier.
DataSource, parameters: MLHandActionClassifier.ModelParameters, session
Parameters: MLTrainingSessionParameters) throws -> MLTrainingSession<
MLHandActionClassifier>
Creates an asynchronous hand action classifier’s training session.
static func resume(MLTrainingSession<MLHandActionClassifier>) throws ->
MLJob<MLHandActionClassifier>
Begins or continues an asynchronous hand action classifier’s training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLHandActionClassifier>
Recreates an asynchronous hand action classifier’s training session by restoring its saved
state from the file system.
Topics
Training a hand action classifier asynchronously
Create ML / MLHandActionClassifier
Structure
MLHandActionClassifier
A task that creates a hand action classification model by training with videos of
people’s hand movements that you provide.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
visionOS 1.0+


## Page 2

init(checkpoint: MLCheckpoint) throws
Creates a hand action classifier from a training session checkpoint.
init(trainingData: MLHandActionClassifier.DataSource, parameters: MLHan
ActionClassifier.ModelParameters) throws
Creates a hand action classifier by starting a synchronous training session.
func evaluation(on: MLHandActionClassifier.DataSource) throws ->
MLClassifierMetrics
Generates metrics describing the hand action classifier’s performance on labeled videos.
var trainingMetrics: MLClassifierMetrics
Measurements of the hand action classifier’s performance on the training dataset.
var validationMetrics: MLClassifierMetrics
Measurements of the hand action classifier’s performance on the validation dataset.
func prediction(from: URL) throws -> [MLHandActionClassifier.Prediction
Generates a hand action prediction for a video.
func predictions(from: [URL]) throws -> [[MLHandActionClassifier.
Prediction]]
Generates an array of hand action predictions for each video in a URL array.
struct Prediction
A collection of predictions, each paired with its confidence, for a range of video frames.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the hand action classifier as a CoreML model file.
Creating a hand action classifier from a checkpoint
Training a hand action classifier synchronously
Evaluating a hand action classifier
Testing a hand action classifier
Saving a hand action classifier


## Page 3

func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the hand action classifier as a Core ML model file.
var model: MLModel
The underlying Core ML model of the hand action classifier stored in memory.
let modelParameters: MLHandActionClassifier.ModelParameters
The hand action model’s configuration parameters.
var description: String
A text representation of the hand action classifier.
var debugDescription: String
A text representation of the hand action classifier suitable for debugging.
var playgroundDescription: Any
A description of the hand action classifier that’s viewable in a playground.
enum DataSource
A hand action classifier dataset that contains annotated videos or hand joint location data.
struct ModelParameters
A set of parameters that affect the training process of a hand action classifier task.
struct VideoAugmentationOptions
Options a hand action classification training session can use to generate additional training
data from the videos you provide.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
Inspecting a hand action classifier model
Describing a hand action classifier
Supporting types
Default Implementations


## Page 4

CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Creating an Action Classifier Model
Train a machine learning model to recognize a person’s body movements.
Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to a
action-classification model.
struct MLActionClassifier
A model you train with videos to classify a person’s body movements.
struct MLStyleTransfer
A model you train to apply an image’s style to other images or videos.
Relationships
Conforms To
See Also
Video models


