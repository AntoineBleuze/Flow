# 004_LinearTimeSeriesForecaster.pdf

## Page 1

Note
Only Float and Double are currently supported as the Scalar type. You may get faster
training when using Float.
init(configuration: LinearTimeSeriesForecaster<Scalar>.Configuration)
Creates a linear time-series forecaster.
let configuration: LinearTimeSeriesForecaster<Scalar>.Configuration
The configuration.
Overview
Topics
Creating a linear time series forecaster
Inspecting a linear time series forecaster
Create ML Components / LinearTimeSeriesForecaster
Structure
LinearTimeSeriesForecaster
A time-series forecasting estimator.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

var forecastWindowSize: Int
The number of predicted samples.
var inputWindowSize: Int
The number of input samples.
func update(inout LinearTimeSeriesForecaster<Scalar>.Transformer, with:
AnnotatedBatch<Scalar>) async throws -> Scalar
Updates a model with a new batch of examples.
func update(inout LinearTimeSeriesForecaster<Scalar>.Model, withWindows
some Sequence<AnnotatedFeature<MLShapedArray<Scalar>, MLShapedArray<
Scalar>>>, eventHandler: EventHandler?) async throws
Updates a model with a sequence of windows.
func fitted(to: some Sequence<AnnotatedFeature<MLShapedArray<Scalar>,
MLShapedArray<Scalar>>>, eventHandler: EventHandler?) async throws ->
LinearTimeSeriesForecaster<Scalar>.Model
Fits a model to a sequence of examples.
func fitted(to: some Sequence<AnnotatedFeature<MLShapedArray<Scalar>,
MLShapedArray<Scalar>>>, validateOn: some Sequence<AnnotatedFeature<
MLShapedArray<Scalar>, MLShapedArray<Scalar>>>, eventHandler: Event
Handler?) async throws -> LinearTimeSeriesForecaster<Scalar>.Model
Fits a model to a sequence of examples with validation.
func fitted(toWindows: some Sequence<AnnotatedFeature<MLShapedArray<
Scalar>, MLShapedArray<Scalar>>>, eventHandler: EventHandler?) async 
throws -> LinearTimeSeriesForecaster<Scalar>.Model
Fits a model to a sequence of windows.
func fitted(toWindows: some Sequence<AnnotatedFeature<MLShapedArray<
Scalar>, MLShapedArray<Scalar>>>, validateOn: some Sequence<Annotated
Feature<MLShapedArray<Scalar>, MLShapedArray<Scalar>>>, eventHandler:
EventHandler?) async throws -> LinearTimeSeriesForecaster<Scalar>.Model
Fits a model to a sequence of annotated windows with validation.
typealias Configuration
Updating and fitting
Supporting types


## Page 3

struct Model
A linear time-series forecasting model.
SupervisedEstimator Implementations
UpdatableSupervisedEstimator Implementations
Copyable
Sendable
SendableMetatype
SupervisedEstimator
UpdatableSupervisedEstimator
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
Creating a time-series classifier
Train a machine learning model to predict the class label of time-series signals.
Creating a time-series forecaster
Forecast future data points by training a machine learning model using historical data.
struct DateFeatures
A set of date and time features.
struct DateFeatureExtractor
A time and date feature extractor.
struct LinearTimeSeriesForecasterConfiguration
Default Implementations
Relationships
Conforms To
See Also
Time-based components


## Page 4

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


