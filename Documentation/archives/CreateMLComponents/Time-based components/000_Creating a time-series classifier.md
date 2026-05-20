# 000_Creating a time-series classifier.pdf

## Page 1

Some signals have patterns that repeat over time or have clear trends. For example, the
accelerometer data from an Apple Watch while the wearer is exercising. It’s common practice to
refer to these signals as time-series data. Other examples of time-series data are:
The temperature of a machine in a factory.
Your heart rate during a gym session.
The audio signal in a song.
Even though there are patterns to the data, these patterns aren’t trivial to classify. You can perfor
classification on these data by training an ML model. For example, you can classify hand gestures
from the accelerometer data from an Apple Watch.
Training a time-series classifier with the Create ML Components framework shares common
training behavior with other model types.
The first step to begin classifying the throwing movement of a baseball is to prepare the data. The
model predicts the baseball throw as fastball, breaking ball, or changeup. Organize the data by
using the following directory structure:
Overview
Prepare your training data
Create ML Components / Creating a time-series classifier
Article
Creating a time-series classifier
Train a machine learning model to predict the class label of time-series signals.


## Page 2

Each move contains a subdirectory with CSV files that contains information about a throw.
Each data file represents one throw and uses the following structure:
accelerometerAccelerationX(G)
accelerometerAccelerationY(G)
accelerometerAccelera
0.031036
0.056931
-1.005661
0.02655
0.04863
-0.996994
0.023743
0.045242
-1.004333
The table shows the acceleration and rotation rate for a thrown baseball. You use these data poin
to identify the trajectory of the object that helps the model learn the throwing pattern. Each colum
denotes a feature for the model. Read the training data files from the directory by using
AnnotatedFiles:
The recordings you produce may have differing time durations, resulting in a different number of
rows for each CSV file you associate with it. Configure the maximum number of samples that the
framework classifies by using maximumSequenceLength:
The next step is to process each CSV file into an AnnotatedFeature and process the features 
an MLShapedArray with a label as a String.


## Page 3

Finally, divide the data into training, validation, and testing sets where 80 percent of the data goes
into the training set, and 10 percent each for validation and testing.
Build and train a time-series classifier


## Page 4

After preparing your training data, configure your classifier model with the number of training
iterations and class labels:
Train your classifier model and print the training and validation accuracy at every iteration to
monitor the progress:
Use your testing set to evaluate your model. Classification provides an accuracy metric with a val
between 0 and 1, where 0 represents the least accurate. Look at how accurate it classified your
labeled test data to determine whether to export the model.
When you’re satisfied with the model’s accuracy, export it as a Core ML package:
Evaluate the model
Export the model


## Page 5

Deploy the model you export and use Core ML to perform predictions. When you use the model,
create a single shaped array of features with the shape [sequenceLength, 1]:.
Creating a time-series forecaster
Forecast future data points by training a machine learning model using historical data.
struct DateFeatures
A set of date and time features.
struct DateFeatureExtractor
A time and date feature extractor.
struct LinearTimeSeriesForecaster
A time-series forecasting estimator.
struct LinearTimeSeriesForecasterConfiguration
The configuration for a linear time-series forecaster.
struct TimeSeriesForecasterBatches
A sequence of forecaster batches on a time series shaped array.
struct TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
struct TemporalFeature
See Also
Time-based components


## Page 6

A temporal feature contains a segment identifier and a feature value.
protocol TemporalSequence
Async sequence for temporal features.
struct TemporalSegmentIdentifier
Uniquely identifiers a segment of a temporal sequence.
struct SlidingWindows
A sequence of windows on a time series shaped array.
struct SlidingWindowTransformer
A temporal transformer that groups input elements.
struct Downsampler
A temporal transformer that down samples the input stream.
struct VideoReader
A video file reader.
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


