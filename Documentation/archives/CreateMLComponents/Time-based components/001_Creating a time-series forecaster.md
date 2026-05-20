# 001_Creating a time-series forecaster.pdf

## Page 1

Some signals have patterns that repeat over time or have clear trends. For example, the energy
consumption of a city has a pattern with peaks in the evening when most people get home. It’s
common practice to refer to these signals as time-series data. Other examples of time-series dat
are:
The accelerometer on your phone when performing an action.
The temperature of a machine in a factory.
Your heart rate during a gym session.
Even though there are patterns to the data, these patterns aren’t trivial to forecast. You can
perform forecasts on these data by training an ML model. For example, you can forecast future
energy consumption based on historical consumption.
Training a time-series forecaster with the Create ML Components framework shares common
training behavior with other model types.
The first step to begin forecasting the energy consumption is to prepare the data. Gather the data
as a CSV file, using the following structure:
Date
Consumption
2024-04-01 00:00:00
1.948
2024-04-01 01:00:00
1.678
Overview
Prepare your training data
Create ML Components / Creating a time-series forecaster
Article
Creating a time-series forecaster
Forecast future data points by training a machine learning model using historical
data.


## Page 2

Date
Consumption
2024-04-01 02:00:00
1.873
2024-04-01 03:00:00
1.604
The table shows a energy consumption reading for every hour (in GWh). Use the date and time
because the consumption depends on the season and the time of day. Parse the date string into a
Date type by using CSVReadingOptions and Date.ParseStrategy:
Now that you have a data frame with a Date column and a Float column, create a preprocessing
pipeline. First, scale the training consumptions to have a normal distribution. This makes it easier
for the model to learn. Take note of the mean and standard deviation to reverse this operation late
Extract features from the dates by using DateFeatureExtractor. The extractor creates value
in the range -0.5 ... 0.5 and represents the components you select. Concatenate all feature
into a single column of MLShapedArray<Float> values and create a features data frame.


## Page 3

Finally, extract features and annotations, and divide the data into training, validation, and testing
sets:
After preparing your training data, you can create a forecaster. The forecaster configuration takes
the input window size and forecast window size. Depending on your task you may want to adjust
these values. A larger input window provides more context to the model, but results in a larger
Build and train a time-series forecaster


## Page 4

model. For this example, set the input window size to 14 days (336 samples) and the forecast
window size to 4 days (96 samples).
Use your testing set to evaluate your model. Two useful metrics you use to check a forecaster
model are the mean-squared error (MSE) and the mean-absolute error (MAE).
Evaluate the model
Export the model


## Page 5

When you’re satisfied with the model’s accuracy, export it as a Core ML package:
Deploy the model you export and use Core ML to perform predictions. When you use the model,
you need to concatenate the input window samples into a single shaped array. If you provide mor
than one window of input, the model returns multiple results in a shaped array.
The model output provides scaled temperatures, so use the mean and standard deviation values 
compute the temperatures:
Creating a time-series classifier
Train a machine learning model to predict the class label of time-series signals.
struct DateFeatures
A set of date and time features.
struct DateFeatureExtractor
A time and date feature extractor.
struct LinearTimeSeriesForecaster
A time-series forecasting estimator.
See Also
Time-based components


## Page 6

struct LinearTimeSeriesForecasterConfiguration
The configuration for a linear time-series forecaster.
struct TimeSeriesForecasterBatches
A sequence of forecaster batches on a time series shaped array.
struct TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
struct TemporalFeature
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


