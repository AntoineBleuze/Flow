# 018_PreprocessedFeatureSequence.pdf

## Page 1

This sequence eagerly stores the results of preprocessing a temporal estimator.
init<S>(S) async throws
Creates an asynchronous sequence of stored temporal features.
var count: Int?
The stored temporal feature count.
var features: [TemporalFeature<Feature>]
The stored temporal features.
Overview
Topics
Creating a sequence
Getting the properties
Create ML Components / PreprocessedFeatureSequence
Structure
PreprocessedFeatureSequence
An asynchronous sequence of eagerly stored temporal features.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

AsyncSequence, TemporalSequence
Creating a time-series classifier
Train a machine learning model to predict the class label of time-series signals.
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
A temporal feature contains a segment identifier and a feature value.
protocol TemporalSequence
Relationships
Conforms To
See Also
Time-based components


## Page 3

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


