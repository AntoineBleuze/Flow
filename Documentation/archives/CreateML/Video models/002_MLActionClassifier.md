# 002_MLActionClassifier.pdf

## Page 1

static func train(trainingData: MLActionClassifier.DataSource,
parameters: MLActionClassifier.ModelParameters, sessionParameters:
MLTrainingSessionParameters) throws -> MLJob<MLActionClassifier>
Begins an asynchronous action classifier training session.
static func makeTrainingSession(trainingData: MLActionClassifier.Data
Source, parameters: MLActionClassifier.ModelParameters, session
Parameters: MLTrainingSessionParameters) throws -> MLTrainingSession<
MLActionClassifier>
Creates an asynchronous training session for an action classifier.
static func resume(MLTrainingSession<MLActionClassifier>) throws ->
MLJob<MLActionClassifier>
Begins or continues an asynchronous action classifier training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLActionClassifier>
Creates an asynchronous training session for an action classifier by restoring an existing
training session’s state from its parameters.
Topics
Training an action classifier asynchronously
Create ML / MLActionClassifier
Structure
MLActionClassifier
A model you train with videos to classify a person’s body movements.
macOS 11.0+


## Page 2

init(checkpoint: MLCheckpoint) throws
Creates an action classifier from a training session checkpoint.
init(trainingData: MLActionClassifier.DataSource, parameters: MLAction
Classifier.ModelParameters) throws
Creates an action classifier with a training dataset represented by a data source.
func evaluation(on: MLActionClassifier.DataSource) throws ->
MLClassifierMetrics
Generates metrics describing the action classifier’s performance on labeled videos
represented by a data source.
var trainingMetrics: MLClassifierMetrics
Measurements of the action classifier’s performance on the training dataset.
var validationMetrics: MLClassifierMetrics
Measurements of the action classifier’s performance on the validation dataset.
func prediction(from: URL) throws -> [MLActionClassifier.Prediction]
Generates a prediction for each action the classifier recognizes in the video.
func predictions(from: [URL]) throws -> [[MLActionClassifier.Prediction
]]
Generates a sequence of predictions for each video input.
struct Prediction
A collection of predictions, each paired with its confidence, for a range of video frames.
func write(to: URL, metadata: MLModelMetadata?) throws
Creating an action classifier from a checkpoint
Training an action classifier synchronously
Evaluating an action classifier
Testing an action classifier
Saving an action classifier


## Page 3

Exports the action classifier as a Core ML model file to a location in the file system.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the action classifier as a Core ML model file to the file path.
var model: MLModel
The underlying Core ML model of the action classifier stored in memory.
let modelParameters: MLActionClassifier.ModelParameters
The model configuration parameters the action classifier used during its training session.
var description: String
A text representation of the action classifier.
var debugDescription: String
A text representation of the action classifier that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the action classifier shown in a playground.
enum DataSource
A data source for an action classifier.
struct ModelParameters
Parameters that affect the training process of an action classifier.
struct VideoAugmentationOptions
The video augmentations for an action classifier training session.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
Inspecting an action classifier model
Describing an action classifier
Supporting types
Default Implementations


## Page 4

CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating an Action Classifier Model
Train a machine learning model to recognize a person’s body movements.
Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to a
action-classification model.
struct MLHandActionClassifier
A task that creates a hand action classification model by training with videos of people’s han
movements that you provide.
struct MLStyleTransfer
A model you train to apply an image’s style to other images or videos.
Relationships
Conforms To
See Also
Video models


