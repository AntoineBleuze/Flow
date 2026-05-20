# Text models.pdf

## Page 1

A text classifier is a machine learning model that’s been trained to recognize patterns in natural
language text, like the sentiment expressed by a sentence.
You train a text classifier by showing it lots of examples of text you’ve already labeled—for examp
movie reviews that you’ve already labeled as positive, negative, or neutral.
Start by gathering textual data and importing it into an MLDataTable instance. You can create a
data table from JSON and CSV formats. Or, if your textual data is in a collection of files, you can
sort them into folders, using the folder names as labels, similar to the image data source used in
Creating an Image Classifier Model.
As an example, consider a JSON file containing movie reviews that you’ve categorized by
sentiment. Each entry contains a pair of keys, the text and the label. The values of those keys
Overview
Import your data
Create ML / Creating a text classifier model
Article
Creating a text classifier model
Train a machine learning model to classify natural language text.


## Page 2

are the input samples used to train your model. The JSON snippet below shows three pairs of
sentences with their sentiment labels.
In a macOS playground, create a data frame using the TabularData framework.
The resulting data frame has two columns, named text and label, derived from the keys in the JSO
file. The column names can be anything, as long as they are meaningful to you, because you’ll use
them as parameters in other methods.
The data you use to train your model needs to be different from the data you use to evaluate your
model. Use the stratifiedSplit(on:by:randomSeed:) method to split your data into two
data frames, one for training and the other for testing. The training data frame contains the major
of your data, and the testing data frame contains the remaining 20 percent.
You can use model training parameters to control the learning process. Choose a classifier
algorithm type by specifying the MLTextClassifier.ModelAlgorithmType parameter. The
Prepare your data for training and evaluation
Choose model training parameters


## Page 3

MLTextClassifier.ModelAlgorithmType.maxEnt(revision:) algorithm trains quickly
and performs well for a wide variety of data. It’s a good starting point algorithm while you’re
exploring your data and models.
You can choose a transfer learning algorithm, MLTextClassifier.ModelAlgorithmType
.transferLearning(_:revision:). Transfer learning models use a pre-trained model as a
feature extractor, you specify the MLTextClassifier.FeatureExtractorType. Transfer
learning models can take longer to train, but can improve accuracy because the baseline model h
already been trained on a large amount of text in a specific language.
If your data contains multiple languages, choose either the maximum entropy algorithm MLText
Classifier.ModelAlgorithmType.maxEnt(revision:) or the transfer learning algorithm
MLTextClassifier.ModelAlgorithmType.transferLearning(_:revision:) and set
its MLTextClassifier.FeatureExtractorType to the Bidirectional Encoder Representation
from Transformers (BERT) embedding feature extractor MLTextClassifier.Feature
ExtractorType.bertEmbedding.
If your data contains a single language, use the conditional random fields algorithm MLText
Classifier.ModelAlgorithmType.crf(revision:) or the transfer learning algorithm
MLTextClassifier.ModelAlgorithmType.transferLearning(_:revision:) and set
its MLTextClassifier.FeatureExtractorType to the Embeddings from Language Models
(ELMo) embedding feature extractor MLTextClassifier.FeatureExtractorType.elmo
Embedding.
Use the MLTextClassifier.ModelParameters.ValidationData parameter to specify th
evaluation data that’s held out from training your model. During the training process, use the
validation data to estimate your model’s ability to correctly classify new examples. Depending on
the validation accuracy, the classifier algorithm might adjust values within the model — or stop the
training process, if the accuracy is high enough. Since the split of your data is random, you might
get a different result each time you train your model.
Create an instance of MLTextClassifier with your training data frame and the column names.
Create and train a text classifier


## Page 4

To measure how accurately the model (sentimentClassifier) performs on the training and
validation data, use the classificationError properties of the model’s trainingMetrics
and validationMetrics properties.
Next, evaluate your trained model’s performance by testing it against sentences it’s never seen
before. Pass your testing data frame to the evaluation(on:) method, which returns an
MLClassifierMetrics instance.
To get the evaluation accuracy, use the classificationError property of the returned
MLClassifierMetrics instance.
If the evaluation performance isn’t good enough, you may need to retrain with more data or make
other adjustments. For information about improving model performance, see Improving Your
Model’s Accuracy.
When your model is performing well enough, you’re ready to save it so you can use it in your app.
Use the write(to:metadata:) method to write the Core ML model file to disk. Provide any
information about the model, like its author, version, or description in an MLModelMetadata
instance.
Evaluate a classifier’s accuracy
Save a Core ML model


## Page 5

Specify the file name using the fileURLWithPath: parameter, in the above code, Sentiment
Classifier.mlmodel.
With your app open in Xcode, drag the SentimentClassifier.mlmodel file into the navigatio
pane. Xcode compiles the model and generates a SentimentClassifier class for use in your
app. Select the SentimentClassifier.mlmodel file in Xcode to view additional information
about the model.
Create an NLModel in the Natural Language framework from the SentimentClassifier to
ensure that the tokenization is consistent between training and deployment. Then use predicte
Label(for:) to generate predictions on new text inputs.
Creating a word tagger model
Train a machine learning model to tag individual words in natural language text.
struct MLTextClassifier
A model you train to classify natural language text.
struct MLWordTagger
Add a Core ML model to your app
See Also
Text models


## Page 6

A word-tagging model you train to classify natural language text at the word level.
struct MLGazetteer
A collection of terms and their labels, which augments a tagger that analyzes natural langua
text.
struct MLWordEmbedding
A map of strings in a vector space that enable your app to find similar strings by looking at a
string’s neighbors.


## Page 7

A word tagger is a machine learning model that’s been trained to classify natural language text at
the word level.
You train a word tagger by showing it multiple examples of sentences containing words you’ve
already tagged — for example, Apple product names like iPad and iPhone.
Start by gathering textual data and importing it into an MLDataTable instance. You can create a
data table from JSON and CSV formats.
As an example, consider a JSON file containing sentences with words that you’ve tagged. Each
entry contains a pair of keys—tokens and labels:
The value for the tokens key is an array of words and punctuation in an individual sentence.
The value for labels is an array of corresponding labels, or tags, for each of those tokens.
The arrays are the same length, resulting in a one-to-one mapping between each token and its
corresponding label.
The JSON snippet below shows three pairs of tokenized sentences with their associated labels.
Overview
Import your data
Create ML / Creating a word tagger model
Article
Creating a word tagger model
Train a machine learning model to tag individual words in natural language text.


## Page 8

In a macOS playground, create the data table using the init(contentsOf:options:) metho
of MLDataTable.
The resulting data table has two columns, named tokens and labels, derived from the keys in
the JSON file. The column names can be anything, as long as they’re meaningful to you, because
you’ll use them as parameters in other methods.
You’ll use the data you gathered for two critical tasks: model training and evaluation.
After you train your word tagger model, you need to evaluate how good it’s at its tagging task. To
test the model’s performance, set aside part of your data in a testing dataset. Training and testing
data must be entirely separate, with no overlap. This way, the metrics you calculate based on you
testing data tell you how well the classifier performs on examples it hasn’t already seen.
Generally, the testing dataset is significantly smaller than the training dataset. You might want to
use about 80 percent of your overall data to train the model, and 20 percent to test it. However, it
more important that the testing data is high-quality: as close as possible to real-world examples,
well-distributed, and balanced. Use your best data for your testing data.
One way to generate training and testing data from your dataset is to use the randomSplit(by
seed:) method of MLDataTable. This method splits your data into two tables, one for training
and the other for testing. Specify a 0.8 split to create a training data table that contains 80 perce
of your data, and a testing data table that contains the remaining 20 percent.
Prepare your data for training and evaluation


## Page 9

Although randomSplit(by:seed:) provides a quick way to split your dataset, consider creatin
separate training and testing datasets manually. That way, you can ensure that your testing data i
high quality.
Create an instance of MLWordTagger with your training data table and the names of your
columns. Training begins immediately.
Word tagger training requires setting aside a small subset of the training data as a validation
dataset, to help keep track of training progress. The validation data allows the training process to
gauge the model’s performance on examples the model hasn’t been trained on. Depending on the
validation accuracy, the training algorithm could adjust values within the model or even stop the
training process, if the accuracy is high enough.
Training and validation data must be entirely separate, with no overlap. If you want to make this
split yourself, you can set aside around 5 to 10 percent of your training data as your validation dat
and provide that data by setting custom model parameters. If you don’t do the split yourself, Crea
ML automatically sets aside a small percentage of the training data to use for validating the mode
progress during the training phase. Because the data is split randomly, you might get a different
result each time you train the model.
To see how accurately the model performed on the training and validation data, use the tagging
Error property of the model’s trainingMetrics and validationMetrics properties.
Next, evaluate your trained model’s performance by testing it against sentences it’s never seen
before. Pass your testing data table to the evaluation(on:tokenColumn:labelColumn:)
method, which returns an MLWordTaggerMetrics instance.
Create and train the word tagger
Evaluate the tagger’s accuracy


## Page 10

To get the evaluation accuracy, use the taggingError property of the returned MLWordTagger
Metrics instance.
If the evaluation performance isn’t good enough, you may need to retrain with more data or make
other adjustments. For information about improving model performance, see Improving Your
Model’s Accuracy.
When your model is performing well enough, you’re ready to save it so you can use it in your app.
Use the write(to:metadata:) method to write the Core ML model file (in this example, Appl
Tagger.mlmodel) to disk. Provide any information about the model, like its author, version, or
description, in an MLModelMetadata instance.
With your app open in Xcode, drag the AppleTagger.mlmodel file into the navigation pane.
Xcode compiles the model and generates an AppleTagger class for use in your app. Select the
AppleTagger.mlmodel file in Xcode to view additional information about the model.
Create an NLModel in the Natural Language framework from the AppleTagger to ensure that th
tokenization is consistent between training and deployment. Attach the model to an NLTagger to
tag sentences or paragraphs, using an existing or custom NLTagScheme.
Save the Core ML model
Add the model to your app


## Page 11

Creating a text classifier model
Train a machine learning model to classify natural language text.
struct MLTextClassifier
A model you train to classify natural language text.
struct MLWordTagger
A word-tagging model you train to classify natural language text at the word level.
struct MLGazetteer
A collection of terms and their labels, which augments a tagger that analyzes natural langua
text.
struct MLWordEmbedding
See Also
Text models


## Page 12

A map of strings in a vector space that enable your app to find similar strings by looking at a
string’s neighbors.


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

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


## Page 21

Use an MLGazetteer to configure a gazetteer and save it to a file, which you then add to your ap
in Xcode. Your app uses the gazetteer file at runtime to create an instance of NLGazetteer, whi
augments an NLTagger to tag specific terms with a label.
You configure a gazetteer with a dictionary, keyed by labels. Each value in the dictionary is an arra
of terms (words or phrases) for each label. For example, you can store the names of real and
fictional planets in a gazetteer.
Once you’ve configured an MLGazetteer, save it to an .mlmodel file to include in your app.
A gazetteer file can efficiently store many labels, and many terms for each label.
Overview
Create ML / MLGazetteer
Structure
MLGazetteer
A collection of terms and their labels, which augments a tagger that analyzes
natural language text.
macOS 10.15+


## Page 22

init(dictionary: [String : [String]], parameters: MLGazetteer.Model
Parameters) throws
Creates a gazetteer from a dictionary of labels and terms.
init(labeledData: MLDataTable, textColumn: String, labelColumn: String,
parameters: MLGazetteer.ModelParameters) throws
Creates a gazetteer from a table of labels and terms.
Deprecated
struct ModelParameters
The model configuration parameters.
let modelParameters: MLGazetteer.ModelParameters
The model configuration parameters.
func prediction(from: String) throws -> String
Predicts the label for the given term.
func predictions(from:)
Predicts the labels for the given terms.
func predictions(from: [String]) throws -> [String]
Predicts the labels for the given terms.
func predictions(from: MLDataColumn<String>) throws -> MLDataColumn<
String>
Predicts the labels for the given terms in the table column.
Deprecated
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the gazetteer as a Core ML model file at the specified URL.
Topics
Creating a gazetteer
Testing a gazetteer
Saving a gazetteer


## Page 23

func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the gazetteer as a Core ML model file at the specified file path.
var model: MLModel
The gazetteer contained within a Core ML model file stored in memory.
var description: String
A text representation of the gazetteer.
var debugDescription: String
A text representation of the gazetteer that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the gazetteer shown in a playground.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Describing a gazetteer
Default Implementations
Relationships
Conforms To
See Also
Text models


## Page 24

Creating a text classifier model
Train a machine learning model to classify natural language text.
Creating a word tagger model
Train a machine learning model to tag individual words in natural language text.
struct MLTextClassifier
A model you train to classify natural language text.
struct MLWordTagger
A word-tagging model you train to classify natural language text at the word level.
struct MLWordEmbedding
A map of strings in a vector space that enable your app to find similar strings by looking at a
string’s neighbors.


## Page 25

Use an MLWordEmbedding to configure and save a word embedding to a file, which you then ad
to your project in Xcode. Your project uses that word embedding file at runtime to create an
NLEmbedding instance, which finds similar strings based on the proximity of their vectors.
You configure a word embedding with a dictionary, keyed by strings which make up the vocabular
of the word embedding. The value for each string is an array of doubles, which represents a vecto
The length of the arrays is arbitrary but all arrays in a word embedding must be the same length.
The length of the arrays determine the number of dimensions in the vector space. For example, th
following listing creates a word embedding with four dimensions and a vocabulary of two strings.
Once you’ve configured an MLWordEmbedding, save it to an .mlmodel file to include in your ap
A word embedding file can efficiently store many strings and their vectors.
Overview
Create ML / MLWordEmbedding
Structure
MLWordEmbedding
A map of strings in a vector space that enable your app to find similar strings by
looking at a string’s neighbors.
macOS 10.15+


## Page 26

init(dictionary: [String : [Double]], parameters: MLWordEmbedding.Model
Parameters) throws
Creates a word embedding.
struct ModelParameters
The model configuration parameters.
let modelParameters: MLWordEmbedding.ModelParameters
The model configuration parameters.
func prediction(from: String, maxCount: Int, maxDistance: Double,
distanceType: NLDistanceType) throws -> [(text: String, distance: Doubl
)]
Predicts neighbors.
func distance(between: String, and: String, distanceType: NLDistanceTyp
) -> Double
Calculates the distance between two strings in the vocabulary space.
enum NLDistanceType
The means of calculating a distance between two locations in a text embedding.
func contains(String) -> Bool
Returns a Boolean value indicating whether the vocabulary contains the given string.
func vector(for: String) -> [Double]?
Accesses the vector associated with the given string in the vocabulary.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the word embedding as a Core ML model file at the specified URL.
func write(toFile: String, metadata: MLModelMetadata?) throws
Topics
Creating a word embedding
Testing a word embedding
Saving a word embedding


## Page 27

Exports the word embedding as a Core ML model file at the specified file path.
let dimension: Int
The number of dimensions in the vocabulary embedding space.
let vocabularySize: Int
The number of strings in the vocabulary.
var model: MLModel
The word embedding contained within a Core ML model file.
var description: String
A text representation of the word embedding.
var debugDescription: String
A text representation of the word embedding that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the word embedding shown in a playground.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Describing a word embedding
Default Implementations
Relationships
Conforms To


## Page 28

Creating a text classifier model
Train a machine learning model to classify natural language text.
Creating a word tagger model
Train a machine learning model to tag individual words in natural language text.
struct MLTextClassifier
A model you train to classify natural language text.
struct MLWordTagger
A word-tagging model you train to classify natural language text at the word level.
struct MLGazetteer
A collection of terms and their labels, which augments a tagger that analyzes natural langua
text.
See Also
Text models


