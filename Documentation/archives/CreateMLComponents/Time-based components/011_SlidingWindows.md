# 011_SlidingWindows.pdf

## Page 1

The shape of each window in the sequence is [length, featureSize]. The sequence will
return as many windows as fit in the input. For example, an input shaped array of shape [8, 1]
using stride of 1 and length of 4 will produce 5 examples:
init(input: MLShapedArray<Scalar>, length: Int, stride: Int) throws
Creates a sliding windows sequence.
Overview
Topics
Creating a sliding window
Inspecting the sliding window
Create ML Components / SlidingWindows
Structure
SlidingWindows
A sequence of windows on a time series shaped array.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

var endIndex: Int
The collection’s “past the end” position–that is, the position one greater than the last valid
subscript argument.
let input: MLShapedArray<Scalar>
The input shaped array.
let length: Int
The number samples in each window.
var startIndex: Int
The position of the first window.
let stride: Int
The number of samples between windows.
func index(Int, offsetBy: Int) -> Int
Returns an index that is the specified distance from the given index.
func index(after: Int) -> Int
Returns the position immediately after the given index.
func index(before: Int) -> Int
Returns the position immediately before the given index.
subscript(_:)
Accesses a contiguous range of windows.
BidirectionalCollection
Collection
RandomAccessCollection
Getting the index
Getting the subscript
Relationships
Conforms To


## Page 3

Sendable
SendableMetatype
Sequence
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
Async sequence for temporal features.
struct TemporalSegmentIdentifier
Uniquely identifiers a segment of a temporal sequence.
See Also
Time-based components


## Page 4

struct SlidingWindowTransformer
A temporal transformer that groups input elements.
struct Downsampler
A temporal transformer that down samples the input stream.
struct VideoReader
A video file reader.
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


