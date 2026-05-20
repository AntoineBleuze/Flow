# 014_VideoReader.pdf

## Page 1

init()
Creates a video reader.
static read(_:)
Reads a sequence of annotated files as an array of annotated async sequences of video
frames.
static func readCamera(configuration: VideoReader.CameraConfiguration)
async throws -> VideoReader.CameraAsyncBuffers
Reads an async sequence of video frames captured with a video camera.
static func read(contentsOf: URL) async throws -> VideoReader.Async
Frames
Reads a video file as an async sequence of video frames.
struct AsyncFrames
An async sequence of video frames.
Topics
Creating the reader
Reading
Create ML Components / VideoReader
Structure
VideoReader
A video file reader.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

struct CameraAsyncBuffers
An async sequence of video frames.
struct CameraConfiguration
The configuration of the camera to pass to the readCamera method.
func applied(to: URL, eventHandler: EventHandler?) async throws -> Vide
Reader.AsyncFrames
Reads a video file as an async sequence of video frames.
Sendable, SendableMetatype, Transformer
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
Applying
Relationships
Conforms To
See Also
Time-based components


## Page 3

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
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


