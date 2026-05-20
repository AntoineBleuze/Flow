# Time-based components.pdf

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


## Page 7

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


## Page 8

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


## Page 9

Finally, extract features and annotations, and divide the data into training, validation, and testing
sets:
After preparing your training data, you can create a forecaster. The forecaster configuration takes
the input window size and forecast window size. Depending on your task you may want to adjust
these values. A larger input window provides more context to the model, but results in a larger
Build and train a time-series forecaster


## Page 10

model. For this example, set the input window size to 14 days (336 samples) and the forecast
window size to 4 days (96 samples).
Use your testing set to evaluate your model. Two useful metrics you use to check a forecaster
model are the mean-squared error (MSE) and the mean-absolute error (MAE).
Evaluate the model
Export the model


## Page 11

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


## Page 12

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


## Page 13

The choice of features for a particular task depends on the relevance of different date and time
components. For example a dataset of weather data may require hour and day-of-year features,
while a dataset of workout metrics may require second, hour, and weekday features.
static let day: DateFeatures
A feature representing the day within the month.
static let dayOfYear: DateFeatures
A feature representing the day within the year.
static let hour: DateFeatures
A feature representing the hour within the day.
static let minute: DateFeatures
A feature representing the minute within the hour.
Overview
Topics
Features
Create ML Components / DateFeatures
Structure
DateFeatures
A set of date and time features.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 14

static let month: DateFeatures
A feature representing the month within the year.
static let second: DateFeatures
A feature representing the second within the minute.
static let weekOfMonth: DateFeatures
A feature representing the week within the month.
static let weekOfYear: DateFeatures
A feature representing the week within the year.
static let weekday: DateFeatures
A feature representing the weekday.
init(rawValue: Int)
Creates a feature from a raw value.
Decodable
Encodable
Equatable
ExpressibleByArrayLiteral
Hashable
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
Creating a date feature type
Relationships
Conforms To
See Also


## Page 15

Creating a time-series classifier
Train a machine learning model to predict the class label of time-series signals.
Creating a time-series forecaster
Forecast future data points by training a machine learning model using historical data.
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
struct SlidingWindows
A sequence of windows on a time series shaped array.
struct SlidingWindowTransformer
A temporal transformer that groups input elements.
struct Downsampler
A temporal transformer that down samples the input stream.
struct VideoReader
Time-based components


## Page 16

A video file reader.
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


## Page 17

This transformer takes a Date and extracts floating-point feature values according to the feature
parameter. Every feature value is roughly between -0.5 and 0.5. All date calculations are based on
Calendar, which defaults to current.
init(features: DateFeatures, calendar: Calendar)
Creates a date feature extractor.
func applied(to: Date, eventHandler: EventHandler?) -> [Scalar]
Extracts features of a particular date.
Overview
Topics
Creating a data feature extractor
Applying a data feature extractor
Inspecting a data feature extractor
Create ML Components / DateFeatureExtractor
Structure
DateFeatureExtractor
A time and date feature extractor.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 18

let calendar: Calendar
The calendar.
let features: DateFeatures
The date and time features.
Copyable
Decodable
Encodable
Sendable
SendableMetatype
Transformer
Creating a time-series classifier
Train a machine learning model to predict the class label of time-series signals.
Creating a time-series forecaster
Forecast future data points by training a machine learning model using historical data.
struct DateFeatures
A set of date and time features.
struct LinearTimeSeriesForecaster
A time-series forecasting estimator.
struct LinearTimeSeriesForecasterConfiguration
The configuration for a linear time-series forecaster.
struct TimeSeriesForecasterBatches
Relationships
Conforms To
See Also
Time-based components


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

init(inputWindowSize: Int, forecastWindowSize: Int)
Creates a configuration.
var batchSize: Int
The number of examples in each training batch.
var earlyStoppingIterationCount: Int
The number of iterations to use when evaluating whether to stop early.
var earlyStoppingTolerance: Float
The early-stopping tolerance.
var forecastWindowSize: Int
The number of predicted samples.
var inputWindowSize: Int
The number of input samples.
Topics
Creating a linear time series forecasater configuration
Inspecting a linear time series forecasater configuration
Create ML Components / LinearTimeSeriesForecasterConfiguration
Structure
LinearTimeSeriesForecasterConfiguration
The configuration for a linear time-series forecaster.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 25

var learningRate: Float
The starting learning rate.
var maximumIterationCount: Int
The maximum number of allowed passes through the data.
var randomSeed: Int?
A seed to generate reproducible results from random operations.
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
Relationships
Conforms To
See Also
Time-based components


## Page 26

A time-series forecasting estimator.
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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

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


## Page 31

A time-series forecaster takes a series of samples and produces a prediction of the next samples
For example the sequence [1, 2, 3, 4] could predict [5, 6].
The shape of each feature in the sequence is [inputWindowSize, featureSize] and the
shape of each annotation is [forecastWindowSize, annotationSize]. The sequence will
return as many feature-annotation examples as fit in the input. For example an input sequence of
size of 10 with an input sample count of 4, a prediction sample count of 2, and a stride of 1 will
produce 5 annotated windows:
Note that 9 and 10 are never used as features because there would be no annotations for those
samples.
Overview
Topics
Create ML Components / TimeSeriesForecasterAnnotatedWindows
Structure
TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 32

init(features: MLShapedArray<Scalar>, annotations: MLShapedArray<Scalar
>, inputWindowSize: Int, forecastWindowSize: Int, stride: Int, shuffles
Elements: Bool) throws
Creates a batch sequence.
let annotations: MLShapedArray<Scalar>
The original annotations.
let features: MLShapedArray<Scalar>
The original features.
let forecastWindowSize: Int
The prediction sample count.
let inputWindowSize: Int
The input sample count.
var shufflesElements: Bool
A Boolean value indicating whether to shuffle the elements.
var stride: Int
The number of samples between windows.
Sequence Implementations
Sendable, SendableMetatype, Sequence
Creating a time series forecaster annotated window
Inspecting a time series forecaster annotated window
Default Implementations
Relationships
Conforms To


## Page 33

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
See Also
Time-based components


## Page 34

A temporal transformer that down samples the input stream.
struct VideoReader
A video file reader.
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


## Page 35

init(id: TemporalSegmentIdentifier, feature: Feature)
Creates a temporal feature.
var feature: Feature
The feature value.
var id: TemporalSegmentIdentifier
The temporal segment identifier for this feature.
Copyable
Topics
Creating a temporal feature
Getting the properties
Relationships
Conforms To
Create ML Components / TemporalFeature
Structure
TemporalFeature
A temporal feature contains a segment identifier and a feature value.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 36

Decodable
Encodable
Equatable
Hashable
Identifiable
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
A sequence of forecaster batches on a time series shaped array.
struct TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
protocol TemporalSequence
Async sequence for temporal features.
struct TemporalSegmentIdentifier
See Also
Time-based components


## Page 37

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


## Page 38

var count: Int?
The number of elements in the sequence if available, calculated nondestructively.
Required
associatedtype Feature
The feature type.
Required
AsyncSequence
Topics
Getting the sequence count
Associating the types
Relationships
Inherits From
Create ML Components / TemporalSequence
Protocol
TemporalSequence
Async sequence for temporal features.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 39

AnyTemporalSequence
AudioFeaturePrint.FeatureSequence
AudioReader.AsyncBuffers
AudioReader.MicrophoneAsyncBuffers
Downsampler.DownStreamSequence
Conforms when Input conforms to Sendable.
HumanBodyActionCounter.CumulativeSumSequence
PreprocessedFeatureSequence
SlidingWindowTransformer.WindowSequence
Conforms when Input conforms to Sendable.
VideoReader.AsyncFrames
VideoReader.CameraAsyncBuffers
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
Conforming Types
See Also
Time-based components


## Page 40

A sequence of forecaster batches on a time series shaped array.
struct TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
struct TemporalFeature
A temporal feature contains a segment identifier and a feature value.
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


## Page 41

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


## Page 42

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


## Page 43

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


## Page 44

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


## Page 45

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


## Page 46

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


## Page 47

struct SlidingWindowTransformer
A temporal transformer that groups input elements.
struct Downsampler
A temporal transformer that down samples the input stream.
struct VideoReader
A video file reader.
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


## Page 48

init(stride: Int, length: Int)
Creates a window temporal transformer.
let length: Int
The length of a window.
let stride: Int
The number of elements between the start of two consecutive windows.
func applied<S>(to: S, eventHandler: EventHandler?) throws -> Sliding
WindowTransformer<Input>.WindowSequence
Extracts a window sequence from the input sequence
struct WindowSequence
Topics
Creating a transformer
Getting the properties
Performing the transformation
Create ML Components / SlidingWindowTransformer
Structure
SlidingWindowTransformer
A temporal transformer that groups input elements.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 49

An async sequence of windows.
Decodable
Encodable
Sendable
SendableMetatype
TemporalTransformer
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
Relationships
Conforms To
See Also
Time-based components


## Page 50

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
struct Downsampler
A temporal transformer that down samples the input stream.
struct VideoReader
A video file reader.
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


## Page 51

init(factor: Int)
Creates a down sample temporal transformer.
let factor: Int
The down sample factor to the input stream.
func applied<S>(to: S, eventHandler: EventHandler?) throws ->
Downsampler<Input>.DownStreamSequence
Down samples the input sequence
struct DownStreamSequence
An async sequence of down stream elements.
Topics
Creating a transformer
Getting the sample factor
Performing the transformation
Create ML Components / Downsampler
Structure
Downsampler
A temporal transformer that down samples the input stream.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 52

Decodable
Encodable
Sendable
SendableMetatype
TemporalTransformer
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
Relationships
Conforms To
See Also
Time-based components


## Page 53

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
struct VideoReader
A video file reader.
struct TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal) file.


## Page 54

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


## Page 55

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


## Page 56

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


## Page 57

init(url: URL, range: Range<TimeInterval>)
Creates a TemporalFileSegment.
var range: Range<TimeInterval>
The time range in seconds.
var url: URL
The file URL.
Topics
Creating a file segment
Getting the properties
Relationships
Conforms To
Create ML Components / TemporalFileSegment
Structure
TemporalFileSegment
A URL and a time range identifying a specific segment of a time-based (temporal
file.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 58

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
A sequence of forecaster batches on a time series shaped array.
struct TimeSeriesForecasterAnnotatedWindows
A sequence of forecasting windows on a time series shaped array.
struct TemporalFeature
A temporal feature contains a segment identifier and a feature value.
protocol TemporalSequence
See Also
Time-based components


## Page 59

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


## Page 60

AsyncIteratorProtocol
Creating a time-series classifier
Train a machine learning model to predict the class label of time-series signals.
Creating a time-series forecaster
Forecast future data points by training a machine learning model using historical data.
struct DateFeatures
A set of date and time features.
struct DateFeatureExtractor
A time and date feature extractor.
Relationships
Conforms To
See Also
Time-based components
Create ML Components / AnyTemporalIterator
Structure
AnyTemporalIterator
A type-erased async iterator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 61

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
struct SlidingWindows
A sequence of windows on a time series shaped array.
struct SlidingWindowTransformer
A temporal transformer that groups input elements.
struct Downsampler
A temporal transformer that down samples the input stream.
struct VideoReader
A video file reader.


## Page 62

init<S>(S)
init<S>(S, count: Int?)
AsyncSequence, TemporalSequence
Topics
Creating a sequence
Relationships
Conforms To
See Also
Time-based components
Create ML Components / AnyTemporalSequence
Structure
AnyTemporalSequence
A type-erased temporal sequence.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 63

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
struct SlidingWindows
A sequence of windows on a time series shaped array.
struct SlidingWindowTransformer
A temporal transformer that groups input elements.
struct Downsampler
A temporal transformer that down samples the input stream.
struct VideoReader


## Page 64

A video file reader.


## Page 65

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


## Page 66

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


## Page 67

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


