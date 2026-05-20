# 002_MLTextClassifier.pdf

## Page 1

Creating a text classifier model
Use a text classifier to train a machine learning model you can include in your app to classify
natural language text. The model learns to associate labels with features of the input text, which
can be sentences, paragraphs, or even entire documents.
After you train a text classifier, you save it to a Core ML model file. You then use an instance of the
NLModel class from the Natural Language framework to read the model file into your app.
init(trainingData:parameters:)
Creates a text classifier.
init(trainingData:textColumn:labelColumn:parameters:)
Creates a text classifier.
Mentioned in
Overview
Topics
Creating and training a text classifier
Create ML / MLTextClassifier
Structure
MLTextClassifier
A model you train to classify natural language text.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 10.14+
visionOS 1.0+


## Page 2

enum DataSource
A data source for a text classifier.
struct ModelParameters
Parameters that specify model training parameters and validation data.
let modelParameters: MLTextClassifier.ModelParameters
The configuration parameters that the text classifier used for training during initialization.
func evaluation(on:)
Computes evaluation metrics.
func evaluation(on:textColumn:labelColumn:)
Computes evaluation metrics.
let trainingMetrics: MLClassifierMetrics
Measurements of the classifier’s performance on the training data set.
let validationMetrics: MLClassifierMetrics
Measurements of the classifier’s performance on the validation data set.
func prediction(from: String) throws -> String
Classifies a string with a label.
func predictions(from:)
Classifies an array of strings with labels.
func predictionWithConfidence(from: String) throws -> [String : Double]
Predicts multiple possible labels and their confidence scores for the specified string.
func predictionsWithConfidence(from:)
Predicts multiple possible labels and their confidence scores for each string in the specified
array.
func write(to: URL, metadata: MLModelMetadata?) throws
Evaluating a text classifier
Testing a text classifier
Saving a text classifier


## Page 3

Exports the text classifier as a Core ML model file at the specified URL.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the text classifier as a Core ML model file at the specified file path.
var model: MLModel
The underlying Core ML model of the text classifier.
var description: String
A text representation of the text classifier.
var debugDescription: String
A text representation of the text classifier that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the text classifier in a playground.
enum FeatureExtractorType
The text feature extractor type.
enum ModelAlgorithmType
The type of algorithm that a text classifier uses.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
Describing a text classifier
Supporting types
Default Implementations
Relationships
Conforms To


## Page 4

CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating a text classifier model
Train a machine learning model to classify natural language text.
Creating a word tagger model
Train a machine learning model to tag individual words in natural language text.
struct MLWordTagger
A word-tagging model you train to classify natural language text at the word level.
struct MLGazetteer
A collection of terms and their labels, which augments a tagger that analyzes natural langua
text.
struct MLWordEmbedding
A map of strings in a vector space that enable your app to find similar strings by looking at a
string’s neighbors.
See Also
Text models


