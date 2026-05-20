# 000_MLActivityClassifier.pdf

## Page 1

An activity classifier is a machine-learning model that your app can use to categorize user
activities, based on the motion of the user’s device.
You create an activity classifier by gathering a training dataset of a device’s motion sensors, such
as the accelerometer and gyroscope on an Apple Watch. For example, you can create an activity
classifier that recognizes a person waving, shaking hands, or throwing a ball by gathering the
motion-sensor data from people performing those activities.
Evaluate your trained activity classifier by calling evaluation(on:featureColumns:label
Column:recordingFileColumn:) evaluation(on:) with a dataset that’s completely
distinct from the training and validation datasets. Inspect the metrics the method returns and
decide whether the activity classifier performs with enough accuracy. For example, you can asses
how often the activity classifier confuses a person waving for shaking hands, or vice versa. If the
classifier makes too many mistakes, you can train another classifier with different parameters, or
with a training dataset that has more or better motion-sensor examples.
When you’re satisfied with an activity classifier, save it as a Core ML model file, and add it to your
Xcode project. Use it to predict the user’s activity based on the motion-sensor data your app
captures from the user’s device.
Overview
Topics
Create ML / MLActivityClassifier
Structure
MLActivityClassifier
A model you train to classify motion sensor data.
macOS 10.15+


## Page 2

static train(trainingData:featureColumns:labelColumn:recordingFileColum
:parameters:sessionParameters:)
Begins an asynchronous activity classifier training session with a training dataset represente
by a data source.
static makeTrainingSession(trainingData:featureColumns:labelColumn:
recordingFileColumn:parameters:sessionParameters:)
Creates an asynchronous training session for an activity classifier.
static func resume(MLTrainingSession<MLActivityClassifier>) throws ->
MLJob<MLActivityClassifier>
Begins or continues an asynchronous activity classifier training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLActivityClassifier>
Creates an asynchronous training session for an activity classifier by restoring an existing
training session’s state from its parameters.
init(checkpoint: MLCheckpoint) throws
Creates an activity classifier from a training session checkpoint.
init(trainingData:featureColumns:labelColumn:recordingFileColumn:
parameters:)
Creates an activity classifier with a training dataset represented by a data source.
func evaluation(on:featureColumns:labelColumn:recordingFileColumn:)
Generates metrics describing the activity classifier’s performance on labeled activities in a
data source.
var trainingMetrics: MLClassifierMetrics
Measurements of the activity classifier’s performance on the training dataset.
Training an activity classifier asynchronously
Creating an activity classifier from a checkpoint
Training an activity classifier synchronously
Evaluating an activity classifier


## Page 3

var validationMetrics: MLClassifierMetrics
Measurements of the activity classifier’s performance on the validation dataset.
func evaluation(on:featureColumns:labelColumn:recordingFileColumn:)
Generates metrics describing the activity classifier’s performance on labeled activities in a
data source.
func predictions(from:perWindowPrediction:)
Predict activities from new observations.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the activity classifier as a Core ML model file.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the activity classifier as a Core ML model file.
var model: MLModel
The underlying Core ML model of the activity classifier stored in memory.
let modelParameters: MLActivityClassifier.ModelParameters
The model configuration parameters the activity classifier used during its training session.
var featureColumns: [String]
The names of the feature columns the activity classifier used during its training session.
var labelColumn: String
The name of the label column the activity classifier used during its training session.
var recordingFileColumn: String
The name of the column that contains the data files the activity classifier used during its
training session.
var description: String
Testing an activity classifier
Saving an activity classifier
Inspecting an activity classifier model
Describing an activity classifier


## Page 4

A text representation of the activity classifier.
var debugDescription: String
A text representation of the activity classifier that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the activity classifier shown in a playground.
enum DataSource
A data source for an activity classifier.
struct ModelParameters
Model training parameters that direct the training process for an activity classifier model.
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


