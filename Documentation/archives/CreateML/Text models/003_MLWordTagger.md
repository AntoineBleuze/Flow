# 003_MLWordTagger.pdf

## Page 1

Creating a word tagger model
Use an MLWordTagger to create a custom word tagger to identify content that’s relevant for you
app, like product names and points of interest.
To use your custom word tagger in the Natural Language framework, save it to a model file and
import it into an NLModel. Then add your custom NLModel to an NLTagger with its set
Models(_:forTagScheme:) method.
init(trainingData: [(tokens: [MLWordTagger.Token], labels: [String])],
parameters: MLWordTagger.ModelParameters) throws
Creates a word tagger.
init(trainingData:tokenColumn:labelColumn:parameters:)
Mentioned in
Overview
Topics
Creating and training a word tagger
Create ML / MLWordTagger
Structure
MLWordTagger
A word-tagging model you train to classify natural language text at the word level
macOS 10.14+


## Page 2

Creates a word tagger.
typealias Token
The token type of a word tagger, which is a string.
struct ModelParameters
Parameters that specify model training parameters and validation data.
let modelParameters: MLWordTagger.ModelParameters
The configuration parameters that the word tagger used for training during initialization.
func evaluation(on:tokenColumn:labelColumn:)
Computes evaluation metrics.
func evaluation(on: [(tokens: [MLWordTagger.Token], labels: [String])])
-> MLWordTaggerMetrics
Computes evaluation metrics.
let trainingMetrics: MLWordTaggerMetrics
Measurements of the tagger’s performance on the training data set.
let validationMetrics: MLWordTaggerMetrics
Measurements of the tagger’s performance on the validation data set.
struct MLWordTaggerMetrics
Metrics you use to evaluate a word tagger’s performance.
func prediction(from:)
Predicts a tag for the input string.
func predictions(from:)
Predicts sequences of labels, token locations, and token lengths from the input strings.
func predictionWithConfidence(from:)
Predicts tags and confidence scores for the input string. Predicts tags and confidence score
for the input string.
Evaluating a word tagger
Testing a word tagger
Saving a word tagger


## Page 3

func write(to: URL, metadata: MLModelMetadata?) throws
Exports the word tagger as a Core ML model file at the specified URL.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the word tagger as a Core ML model file at the specified file path.
var model: MLModel
The underlying Core ML model of the word tagger.
var description: String
A text representation of the word tagger.
var debugDescription: String
A text representation of the word tagger that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the word tagger in a playground.
enum FeatureExtractorType
The feature extractors that are available to train a word tagger using with the transfer-learnin
algorithm option.
enum ModelAlgorithmType
The algorithm type.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Describing a word tagger
Supporting types
Default Implementations
Relationships


## Page 4

Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating a text classifier model
Train a machine learning model to classify natural language text.
Creating a word tagger model
Train a machine learning model to tag individual words in natural language text.
struct MLTextClassifier
A model you train to classify natural language text.
struct MLGazetteer
A collection of terms and their labels, which augments a tagger that analyzes natural langua
text.
struct MLWordEmbedding
A map of strings in a vector space that enable your app to find similar strings by looking at a
string’s neighbors.
Conforms To
See Also
Text models


