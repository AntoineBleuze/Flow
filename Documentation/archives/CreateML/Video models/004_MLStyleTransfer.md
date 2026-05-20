# 004_MLStyleTransfer.pdf

## Page 1

static func train(trainingData: MLStyleTransfer.DataSource, parameters:
MLStyleTransfer.ModelParameters, sessionParameters: MLTrainingSession
Parameters) throws -> MLJob<MLStyleTransfer>
Begins an asynchronous style transfer model-training session.
static func makeTrainingSession(trainingData: MLStyleTransfer.DataSourc
, parameters: MLStyleTransfer.ModelParameters, sessionParameters:
MLTrainingSessionParameters) throws -> MLTrainingSession<MLStyleTransfe
>
Creates an asynchronous training session for a style transfer model.
static func resume(MLTrainingSession<MLStyleTransfer>) throws -> MLJob<
MLStyleTransfer>
Begins or continues an asynchronous style transfer model-training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLStyleTransfer>
Creates an asynchronous training session for a style transfer model by restoring an existing
training session’s state from its parameters.
Topics
Training a style transfer model asynchronously
Create ML / MLStyleTransfer
Structure
MLStyleTransfer
A model you train to apply an image’s style to other images or videos.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 11.0+
visionOS 1.0+


## Page 2

init(checkpoint: MLCheckpoint) throws
Creates a style transfer model from a training session checkpoint.
init(trainingData: MLStyleTransfer.DataSource, parameters: MLStyle
Transfer.ModelParameters) throws
Creates a style transfer model with a training dataset represented by a data source.
func stylize(image: CGImage) throws -> CGImage?
Applies the style the model learned to an image.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the style transfer model as a Core ML model file to a location in the file system.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the style transfer model as a Core ML model file to the file path.
static func downloadAssets() throws
Initiates a download of the mlmodel assets required for Style Transfer training. This will be
performed automatically if needed at training time, but can be run independently prior to
training.
var description: String
A text representation of the style transfer model.
var debugDescription: String
A text representation of the style transfer model that’s suitable for output during debugging.
Creating a style transfer model from a checkpoint
Training a style transfer model synchronously
Stylizing an image
Saving a style transfer model
Downloading model assets
Describing a style transfer model


## Page 3

var playgroundDescription: Any
A description of the style transfer model shown in a playground.
enum DataSource
A data source for a style transfer model.
struct ModelParameters
Parameters that affect the training process of a style transfer model.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating an Action Classifier Model
Train a machine learning model to recognize a person’s body movements.
Supporting types
Default Implementations
Relationships
Conforms To
See Also
Video models


## Page 4

Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to a
action-classification model.
struct MLActionClassifier
A model you train with videos to classify a person’s body movements.
struct MLHandActionClassifier
A task that creates a hand action classification model by training with videos of people’s han
movements that you provide.


