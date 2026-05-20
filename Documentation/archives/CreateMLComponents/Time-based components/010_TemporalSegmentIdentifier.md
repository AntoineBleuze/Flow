# 010_TemporalSegmentIdentifier.pdf

## Page 1

init(source: String, range: Range<Int>, timescale: Int)
Creates a temporal-segment identifier.
var durationInSeconds: TimeInterval
The segment duration in seconds.
var range: Range<Int>
The segment’s timestamp range.
var rangeInSeconds: Range<TimeInterval>
The time range in seconds.
var source: String
The segment source. For files use the full path or URL of the file.
var timescale: Int
Topics
Creating a segment identifier
Getting the properties
Create ML Components / TemporalSegmentIdentifier
Structure
TemporalSegmentIdentifier
Uniquely identifiers a segment of a temporal sequence.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

The identifier’s timescale is the number of uniquely identifiable timestamps in a second.
Copyable
Decodable
Encodable
Equatable
Hashable
Sendable
SendableMetatype
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
Relationships
Conforms To
See Also
Time-based components


## Page 3

A sequence of forecaster batches on a time series shaped array.
struct TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
struct TemporalFeature
A temporal feature contains a segment identifier and a feature value.
protocol TemporalSequence
Async sequence for temporal features.
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


