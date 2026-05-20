# 001_Creating a multi-label image classifier.pdf

## Page 1

A single-label image classifier takes an input image and assigns one label, which helps identify th
most relevant subject in the image. However, there’s often additional information and context in a
image that identifying the most relevant subject doesn’t consider. A multi-label image classifier
takes an input image and assigns multiple labels. A multi-label classifier is better at describing an
image where there are multiple subjects, or when the environment is relevant.
Training a multi-label image classifier is similar to training a single-label image classifier. You colle
and label images, build an estimator pipeline, train and evaluate the model, and export the model 
use with Vision. For more information about single-label image classifiers, see Creating an Image
Classifier Model.
First, collect images and assign labels. Put all images in a folder and create a JSON file in the sam
folder. For example if you have two images, then your folder contains three files: image1.jpg,
image2.jpg, and annotations.json. The JSON file contains the labels for each image. The
following example includes possible labels for two images: image1.jpg is an image of a potted
aloe plant on a window sill and image2.jpg is an image of a potted cactus with a person standin
next to it.
Overview
Prepare your training data
Create ML Components / Creating a multi-label image classifier
Article
Creating a multi-label image classifier
Train a machine learning model to assign multiple labels to an image.


## Page 2

Create a Decodable structure and populate it with the file names and labels from your JSON file
Then, convert them to an AnnotatedFeature structure.
After preparing your training data, you can create your estimator pipeline. When using Create ML
Components, you compose estimators and transformers into pipelines that you can train to
produce models. As with a single-label image classifier, use an image reader and a feature
extractor. But the last component is a FullyConnectedNetworkMultiLabelClassifier
instead of a FullyConnectedNetworkClassifier.
Build a multi-label estimator pipeline


## Page 3

When you validate as you train, you can stop training when the validation metrics stop improving.
So set aside some of the images for validation. Then, call the fitted(to:validateOn:event
Handler:) method to train.
After training the model, evaluate it using test images. The mean-average precision (MAP) is a
good measure for a multi-label classifier.
After you train the model, you can export it as a Core ML model.
Then, use Vision to classify images in your app.
Train and evaluate the model
Export the model to use with Vision


## Page 4

The observations include all labels and their probabilities. This includes labels for which the mode
predicted a low probability. Including all observations results in high recall but low precision, in
other words, your model prioritizes predicting additional labels. To balance the precision and reca
include only the labels that have a high probability. To do this you can choose a probability
threshold for each label, or use one of the methods from Vision. The hasMinimumPrecision(_
forRecall:) and hasMinimumRecall(_:forPrecision:) methods allow you to choose
only observations that strike a specific balance between precision and recall.
Augmenting images to expand your training data
Improve your model by using transformed versions of your training images.
struct ImageReader
An image file reader.
protocol ImageFeatureExtractor
A transformer that takes an image and outputs image features.
struct ImageCropper
An image crop transformer.
struct ImageScaler
An image scaling transformer.
struct ImageFeaturePrint
ImageFeaturePrint image feature extractor.
struct ImageBlur
See Also
Image components


## Page 5

An image blurring transformer.
struct ImageColorTransformer
An image color transformer.
struct ImageExposureAdjuster
An image exposure adjusting transformer.
struct ImageFlipper
An image flipper transformer.
struct ImageRotator
An image rotating transformer.
struct RandomImageNoiseGenerator
A transformer that adds random noise to an image.
struct MLModelImageFeatureExtractor
An image feature extractor provided by an MLModel.


