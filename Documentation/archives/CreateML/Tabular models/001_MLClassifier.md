# 001_MLClassifier.pdf

## Page 1

Improving Your Model’s Accuracy
Use an MLClassifier to train a general-purpose model to recognize categories.
For example, you can create a classifier that predicts whether a sports team is likely to win or lose
its next game by training it with these inputs:
The team’s win-loss ratio
The team’s game locations
Important
When working with image or natural language data, don’t use MLClassifier. Instead, use
the MLImageClassifierBuilder or one of the Natural Language models (MLText
Classifier or MLWordTagger).
When you create an MLClassifier, Create ML inspects your data and automatically chooses a
specific classifier (see Supporting Classifier Types).
Mentioned in
Overview
Create ML / MLClassifier
Enumeration
MLClassifier
A model you train to classify data into discrete categories.
macOS 10.14+


## Page 2

init(trainingData:targetColumn:featureColumns:)
Creates a classifier.
var targetColumn: String
The name of the column you selected at initialization to define which categories the classifie
predicts.
var featureColumns: [String]
The names of the columns you selected at initialization to train the classifier.
func evaluation(on:)
Evaluates the classifier on the provided labeled data.
var trainingMetrics: MLClassifierMetrics
Measurements of the classifier’s performance on the training data set.
var validationMetrics: MLClassifierMetrics
Measurements of the classifier’s performance on the validation data set.
func predictions(from:)
func write(to: URL, metadata: MLModelMetadata?) throws
Exports a Core ML model file for use in your app.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports a Core ML model file for use in your app.
Topics
Creating and training a classifier
Evaluating a classifier
Testing a classifier
Saving a classifier
Describing a model


## Page 3

var model: MLModel
The underlying Core ML model stored in memory.
var description: String
A text representation of the classifier.
var debugDescription: String
A text representation of the classifier that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the classifier shown in a playground.
case decisionTree(MLDecisionTreeClassifier)
A classifier that predicts the target by creating rules to split the data.
case randomForest(MLRandomForestClassifier)
A classifier based on a collection of decision trees trained on subsets of the data.
case boostedTree(MLBoostedTreeClassifier)
A classifier based on a collection of decision trees combined with gradient boosting.
case logisticRegression(MLLogisticRegressionClassifier)
A classifier that predicts a discrete target value as a function of data features.
case supportVector(MLSupportVectorClassifier)
A classifier that predicts a binary target value by maximizing the separation between
categories.
Deprecated
struct MLDecisionTreeClassifier
A classifier that predicts the target by creating rules to split the data.
struct MLRandomForestClassifier
A classifier based on a collection of decision trees trained on subsets of the data.
struct MLBoostedTreeClassifier
A classifier based on a collection of decision trees combined with gradient boosting.
Classifier cases
Supporting classifier types


## Page 4

struct MLLogisticRegressionClassifier
A classifier that predicts a discrete target value as a function of data features.
struct MLSupportVectorClassifier
A classifier that predicts a binary target value by maximizing the separation between
categories.
Deprecated
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating a model from tabular data
Train a machine learning model by using Core ML to import and manage tabular data.
enum MLRegressor
A model you train to estimate continuous values.
Default Implementations
Relationships
Conforms To
See Also
Tabular models


## Page 5

struct MLRecommender
A model you train to make recommendations based on item similarity, grouping, and,
optionally, item ratings.


