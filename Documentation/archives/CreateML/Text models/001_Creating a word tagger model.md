# 001_Creating a word tagger model.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

A map of strings in a vector space that enable your app to find similar strings by looking at a
string’s neighbors.


