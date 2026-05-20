# 006_TimeSeriesForecasterBatches.pdf

## Page 1

A time-series forecaster takes a series of samples and produces a prediction of the next samples
For example the sequence [1, 2, 3, 4] could predict [5, 6]. To train a forecaster, each
training batch contains the input samples along with the annotations (ground truth predictions). F
example a batch could have this:
The shape of the features in the sequence is [batchSize, inputWindowSize, feature
Size] and the shape of the annotations is [batchSize, forecastWindowSize,
annotationSize]. The batch sequence will return as many feature-annotation examples as fit 
the input. For example, an input sequence size of 10 with an input sample count of 4 and a
prediction sample count of 2 will produce 5 examples:
Overview
Create ML Components / TimeSeriesForecasterBatches
Structure
TimeSeriesForecasterBatches
A sequence of forecaster batches on a time series shaped array.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

Note that 9 and 10 are never used as features because there would be no annotations for those
examples.
init(features: MLShapedArray<Scalar>, annotations: MLShapedArray<Scalar
>, batchSize: Int, inputWindowSize: Int, forecastWindowSize: Int,
shufflesBatches: Bool) throws
Creates a batch sequence.
let annotations: MLShapedArray<Scalar>
The original annotations.
let batchSize: Int
The batch size.
let features: MLShapedArray<Scalar>
The original features.
let forecastWindowSize: Int
The prediction sample count.
let inputWindowSize: Int
The input sample count.
var shufflesBatches: Bool
A Boolean value indicating whether to shuffle the batches.
Topics
Creating a time series forecaster batch
Inspecting a time series forecaster batch
Default Implementations


## Page 3

Sequence Implementations
Sendable, SendableMetatype, Sequence
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
struct TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
struct TemporalFeature
A temporal feature contains a segment identifier and a feature value.
protocol TemporalSequence
Relationships
Conforms To
See Also
Time-based components


## Page 4

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


