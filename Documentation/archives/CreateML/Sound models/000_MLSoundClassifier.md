# 000_MLSoundClassifier.pdf

## Page 1

A sound classifier is a machine learning model that identifies and categorizes sounds in an app.
Create a sound classifier by gathering a dataset of audio files and use them to train a model with
MLSoundClassifier.
Assemble an audio dataset by recording or gathering audio files that best represent the sounds y
want your app to identify. Additionally, create a negative class — a group of related noises the
sound classifier might hear but aren’t relevant — by collecting or recording example sounds.
For example, say you’re creating a sound classifier to identify laughter and applause. In addition t
gathering audio examples of people laughing and clapping, you can add an additional category fo
background noise. By adding recordings from various settings, such as theaters and
amphitheaters, your sound classifier can distinguish the sounds of interest from environmental
noises. In other words, the sound classifier won’t predict “Applause” when there isn’t any. Like an
classifier, when you request a prediction, a sound classifier always returns one of the categories it
learned from a training dataset.
Gather at least 10 audio examples of each sound category you want the sound classifier to learn,
plus at least one negative class for background noise. The audio examples can be in any file form
that Core Audio supports, including:
M4A
MP3
AIFF
Overview
Create ML / MLSoundClassifier
Structure
MLSoundClassifier
A machine learning model you train with audio files to recognize and identify
sounds on a device.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.15+
visionOS 1.0+


## Page 2

WAV
Tip
Use single-channel audio files with a sample rate of 16 kHz or higher for best results.
Reduce a sound classifier’s bias — which can adversely affect its performance — by gathering
audio files that use a consistent bit depth and sample rate.
Train, evaluate, and export your sound classifier by following similar steps to creating any other
Create ML model type. For more information about the Create ML training workflow, see:
Creating an Image Classifier Model
Creating an Action Classifier Model
Add the sound classifier’s Core ML model to an Xcode project and use it to create an SNClassif
SoundRequest at runtime. Your app uses the sound request to identify sounds in an audio file o
audio stream by following the steps in the following articles, respectively:
Classifying Sounds in an Audio File
Classifying Sounds in an Audio Stream
static train(trainingData:parameters:sessionParameters:)
Begins an asynchronous sound classifier training session with a training dataset represented
by a data source.
static func makeTrainingSession(trainingData: MLSoundClassifier.Data
Source, parameters: MLSoundClassifier.ModelParameters, sessionParameter
: MLTrainingSessionParameters) throws -> MLTrainingSession<MLSound
Classifier>
Creates an asynchronous training session for a sound classifier.
static func resume(MLTrainingSession<MLSoundClassifier>) throws -> MLJo
<MLSoundClassifier>
Begins or continues an asynchronous training session for a sound classifier.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLSoundClassifier>
Topics
Training a sound classifier asynchronously


## Page 3

Creates an asynchronous training session for a sound classifier by restoring an existing
training session’s state from its parameters.
static func extractFeatures(trainingData: MLSoundClassifier.DataSource,
parameters: MLSoundClassifier.FeatureExtractionParameters, session
Parameters: MLTrainingSessionParameters) throws -> MLJob<MLSound
Classifier.DataSource>
Begins an asynchronous session that extracts sound features from a data source of sound
files.
struct FeatureExtractionParameters
Parameters that affect the process of extracting sound features from audio files.
init(checkpoint: MLCheckpoint) throws
Creates a sound classifier from a training session checkpoint.
init(trainingData:parameters:)
Creates a sound classifier with a training dataset represented by a data source.
func evaluation(on:)
Generates metrics by evaluating the sound classifier’s performance on a dataset represente
by a data source.
var trainingMetrics: MLClassifierMetrics
Measurements of the classifier’s performance on the training data set.
var validationMetrics: MLClassifierMetrics
Measurements of the image classifier’s performance on the validation dataset.
func predictions(from: [URL]) throws -> [String]
Generates predictions for an array of audio files.
Creating a sound classifier from a checkpoint
Training a sound classifier synchronously
Evaluating a sound classifier
Testing a sound classifier


## Page 4

func predictions(from: [URL], overlapFactor: Double, predictionTime
WindowSize: TimeInterval) throws -> [String]
Generates predictions that use an overlap factor and time window size for an array of audio
files.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the sound classifier as a model file to a location in the file system.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the sound classifier as a model file to a path in the file system.
var model: MLModel
The underlying model instance of the sound classifier stored in memory.
let modelParameters: MLSoundClassifier.ModelParameters
The model configuration parameters the sound classifier used during its training session.
var description: String
A text representation of the sound classifier.
var debugDescription: String
A text representation of the sound classifier that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the sound classifier in a playground.
enum DataSource
A representation of a sound-classifier dataset located in the file system or in a data table.
struct ModelParameters
Parameters that affect the process of training a sound-classifier model.
Saving a sound classifier
Inspecting a sound classifier model
Describing a sound classifier
Supporting types


## Page 5

CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Default Implementations
Relationships
Conforms To


