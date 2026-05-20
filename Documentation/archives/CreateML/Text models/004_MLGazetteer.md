# 004_MLGazetteer.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


