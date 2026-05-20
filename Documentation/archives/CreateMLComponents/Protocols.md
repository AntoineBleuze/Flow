# Protocols.pdf

## Page 1

func applied(to: Self.Input, eventHandler: EventHandler?) async throws 
> Self.Output
Performs the transformation on a single input.
Required Default implementations provided.
func adaptedAsAnnotatedFeatureTransformer<Annotation>(annotationType:
Annotation.Type) -> some Transformer<AnnotatedFeature<Self.Input,
Annotation>, AnnotatedFeature<Self.Output, Annotation>>
Returns an annotated-feature transformer that transforms the features using this transforme
while leaving the annotations unchanged.
func adaptedAsAnnotatedPredictionTransformer<Annotation>(annotationType
Annotation.Type) -> some Transformer<AnnotatedPrediction<Self.Input,
Annotation>, AnnotatedPrediction<Self.Output, Annotation>>
Returns an annotated-prediction transformer that transforms the predictions using this
transformer while leaving the annotations unchanged.
func adaptedAsEstimator() -> TransformerToEstimatorAdaptor<Self>
Exposes this transformer as a trivial estimator.
Topics
Applying and adapting
Create ML Components / Transformer
Protocol
Transformer
A transformer that takes an input and produces an output.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func adaptedAsRandomTransformer() -> some RandomTransformer<Self.Input,
Self.Output>
Returns a random transformer wrapping a transformer.
func adaptedAsTemporal()
Exposes this transformer as a temporal transformer.
func adaptedAsUpdatableEstimator() -> TransformerToUpdatableEstimator
Adaptor<Self>
Exposes this transformer as a trivial estimator.
associatedtype Input
The input type.
Required
associatedtype Output
The output type.
Required
func appending(_:)
Composes this transformer with an annotated-feature transformer.
func callAsFunction(_:eventHandler:)
Performs the transformation on a single input.
func prediction(from:)
Performs a prediction from a single input.
func prediction<S, Annotation>(from: S, eventHandler: EventHandler?)
async throws -> [AnnotatedPrediction<Self.Output, Annotation>]
Performs a prediction on a sequence of annotated inputs.
func export(to: URL) throws
Exports this transformer as a CoreML model.
Appending
Transforming and predicting
Exporting


## Page 3

func export(to: URL, metadata: ModelMetadata) throws
Exports this transformer as a CoreML model with userInfo.
Classifier
ImageFeatureExtractor
Regressor
TabularTransformer
AudioConvertingTransformer
AudioReader
ColumnConcatenator
ColumnSelectorTransformer
ComposedTabularTransformer
ComposedTransformer
DateFeatureExtractor
FullyConnectedNetworkClassifierModel
FullyConnectedNetworkMultiLabelClassifierModel
FullyConnectedNetworkRegressorModel
HumanBodyActionPeriodPredictor
HumanBodyPoseExtractor
HumanHandPoseExtractor
ImageBlur
ImageColorTransformer
ImageCropper
ImageExposureAdjuster
ImageFeaturePrint
ImageFlipper
ImageReader
ImageRotator
ImageScaler
ImputeTransformer
JointsSelector
LinearRegressorModel
LinearTimeSeriesForecaster.Model
Relationships
Inherited By
Conforming Types


## Page 4

Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LinearTransformer
LogisticRegressionClassifierModel
MLModelClassifierAdaptor
MLModelImageFeatureExtractor
MLModelRegressorAdaptor
MLModelTransformerAdaptor
MaxAbsScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
MinMaxScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
MultivariateLinearRegressor.Model
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
NormalizationScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
OneHotEncoder.Transformer
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
OptionalUnwrapper
OrdinalEncoder.Transformer
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
PoseSelector
RandomImageNoiseGenerator
Reshaper
RobustScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
StandardScaler.Transformer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
TimeSeriesClassifier.Model
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
TreeClassifierModel
TreeRegressorModel
VideoReader
See Also
Protocols


## Page 5

protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 6



## Page 7

A temporal transformer, unlike a regular transformer, can accumulate multiple inputs before
producing an output. For example, an audio transformer can accumulate audio buffers until the
desired length is reached before producing an output.
func applied<S>(to: S, eventHandler: EventHandler?) async throws -> Sel
.OutputSequence
Performs the transformation on an input sequence.
Required Default implementations provided.
func adaptedAsEstimator() -> TemporalTransformerToEstimatorAdaptor<Self
Exposes this temporal transformer as a trivial temporal estimator.
Deprecated
Overview
Topics
Applying and adapting
Create ML Components / TemporalTransformer
Protocol
TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features
and produces an asynchronous output sequence.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 8

func adaptedAsUpdatableEstimator() -> TemporalTransformerToUpdatable
EstimatorAdaptor<Self>
Exposes this temporal transformer as a trivial temporal estimator.
Deprecated
associatedtype Input
The input type.
Required
associatedtype Output
The output type.
Required
associatedtype OutputSequence : TemporalSequence
The output async sequence type.
Required
func appending(_:)
Composes this temporal transformer with another temporal transformer.
func callAsFunction<S>(S, eventHandler: EventHandler?) async throws ->
Self.OutputSequence
Performs the transformation on an input sequence.
func callAsFunction<S>(to: S, eventHandler: EventHandler?) async throws
-> [Self.OutputSequence]
Performs the transformation on a sequence of inputs.
func prediction<S, Label>(from: S) async throws -> Self.OutputSequence
Performs a prediction on a single input.
func export(to: URL) throws
Exports this temporal transformer as a CoreML model.
func export(to: URL, metadata: ModelMetadata) throws
Appending
Transforming and predicting
Exporting


## Page 9

Exports this temporal transformer as a CoreML model with user-supplied metadata.
AudioFeaturePrint
ComposedTemporalTransformer
Downsampler
HumanBodyActionCounter
LinearTimeSeriesForecaster.Model
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
SlidingWindowTransformer
TemporalAdaptor
TimeSeriesClassifier.Model
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
TransformerToTemporalAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
Relationships
Conforming Types
See Also
Protocols


## Page 10

protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 11

func applied(to: Self.Input, generator: inout some RandomNumberGenerato
, eventHandler: EventHandler?) async throws -> Self.Output
Performs the random transformation on a single input.
Required
associatedtype Input
The input type.
Required
associatedtype Output
The output type.
Required
Topics
Performing the transformation
Relationships
Conforming Types
Create ML Components / RandomTransformer
Protocol
RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 11.0+


## Page 12

ApplyEachRandomly
ApplyRandomly
ChooseRandomly
RandomImageCropper
ShuffleRandomly
UniformRandomFloatingPointParameter
UniformRandomIntegerParameter
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
See Also
Protocols


## Page 13

protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 14

associatedtype Transformer : Transformer
The transformer type created by this estimator.
Required
func appending(_:)
Composes this estimator with another estimator.
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required Default implementation provided.
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required Default implementation provided.
Topics
Getting the properties
Appending
Encoding and decoding
Create ML Components / Estimator
Protocol
Estimator
An estimator that creates a transformer by fitting to a data set.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 15

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
func adaptedAsSupervised<Annotation>(annotationType: Annotation.Type) -
EstimatorToSupervisedAdaptor<Self, Annotation>
Exposes this estimator as a supervised estimator.
func adaptedAsTemporal() -> EstimatorToTemporalAdaptor<Self>
Exposes this estimator as a temporal estimator.
Deprecated
func fitted<S>(to: S, eventHandler: EventHandler?) async throws -> Self
Transformer
Fits a transformer to a sequence of examples.
Required
func fitted<S>(to: S) async throws -> Self.Transformer
UpdatableEstimator
CategoricalImputer
MaxAbsScaler
MinMaxScaler
NormalizationScaler
NumericImputer
Reading and writing
Fitting and adapting
Relationships
Inherited By
Conforming Types


## Page 16

OneHotEncoder
OrdinalEncoder
PreprocessingEstimator
PreprocessingUpdatableEstimator
RobustScaler
StandardScaler
TransformerToEstimatorAdaptor
TransformerToUpdatableEstimatorAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
See Also
Protocols


## Page 17

A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 18

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
func appending(_:)
Composes this temporal estimator with a supervised temporal estimator.
func adaptedAsSupervised<Annotation>(annotationType: Annotation.Type) -
TemporalEstimatorToSupervisedAdaptor<Self, Annotation>
Exposes this temporal estimator as a supervised temporal estimator.
Topics
Reading and writing
Appending
Adapting and fitting
Create ML Components / TemporalEstimator Deprecated
Protocol
TemporalEstimator Deprecated
An estimator that creates a transformer by fitting to a sequence of temporal
features.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 19

func fitted<InputSequence>(to: InputSequence) async throws -> Self.
Transformer
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> Self.Transformer
Fits a transformer to a sequence of examples.
Required
associatedtype Transformer : TemporalTransformer
The transformer type created by this estimator.
Required
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required
UpdatableTemporalEstimator
EstimatorToTemporalAdaptor
PreprocessingTemporalEstimator
PreprocessingUpdatableTemporalEstimator
TemporalTransformerToEstimatorAdaptor
TemporalTransformerToUpdatableEstimatorAdaptor
UpdatableEstimatorToTemporalAdaptor
Encoding and decoding
Relationships
Inherited By
Conforming Types


## Page 20

protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
See Also
Protocols


## Page 21

Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 22

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
associatedtype Annotation : Equatable
The annotation type.
Required
associatedtype Transformer : Transformer
The transformer type created by this estimator.
Required
func appending(_:)
Composes this supervised estimator with an estimator.
Topics
Reading and writing
Appending
Create ML Components / SupervisedEstimator
Protocol
SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 23

func adaptedAsTemporal() -> SupervisedEstimatorToTemporalAdaptor<Self>
Exposes this supervised estimator as a temporal supervised estimator.
Deprecated
func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> Self.Transformer
Fits a transformer to a sequence of examples.
Required Default implementation provided.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> Self.Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
Required Default implementation provided.
func fitted<Input>(to: Input) async throws -> Self.Transformer
func fitted<Input, Validation>(to: Input, validateOn: Validation) async
throws -> Self.Transformer
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required Default implementation provided.
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required Default implementation provided.
UpdatableSupervisedEstimator
Adapting and fitting
Encoding and decoding
Relationships
Inherited By
Conforming Types


## Page 24

EstimatorToSupervisedAdaptor
FullyConnectedNetworkClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
FullyConnectedNetworkMultiLabelClassifier
FullyConnectedNetworkRegressor
LinearRegressor
LinearTimeSeriesForecaster
LogisticRegressionClassifier
MultivariateLinearRegressor
PreprocessingSupervisedEstimator
PreprocessingUpdatableSupervisedEstimator
TimeSeriesClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
UpdatableEstimatorToSupervisedAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
See Also
Protocols


## Page 25

protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 26

func read(from: URL) throws -> Self.Transformer
Reads the encoded transformer from a file.
func write(Self.Transformer, to: URL, overwrite: Bool) throws
Writes the encoded transformer to a file.
associatedtype Annotation : Equatable, Sendable
The annotation type.
Required
associatedtype Transformer : TemporalTransformer
The transformer type created by this estimator.
Required
func appending(_:)
Topics
Reading and writing
Appending
Create ML Components / SupervisedTemporalEstimator Deprecated
Protocol
SupervisedTemporalEstimator Deprecated
An estimator that creates a transformer by fitting to a sequence of annotated
temporal features.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 27

Composes this supervised temporal estimator with another supervised temporal estimator.
func fitted<InputSequence, FeatureSequence>(to: InputSequence) async 
throws -> Self.Transformer
func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> Self.Transformer
Fits a transformer to a sequence of examples.
Required
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation) async throws -> Self.Transformer
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> Self.Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
Required
associatedtype Annotation : Equatable, Sendable
The annotation type.
Required
associatedtype Transformer : TemporalTransformer
The transformer type created by this estimator.
Required
func encode(Self.Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
Required
func decode(from: inout any EstimatorDecoder) throws -> Self.Transforme
Decodes a previously fitted transformer.
Required
Fitting
Encoding and decoding
Relationships


## Page 28

UpdatableSupervisedTemporalEstimator
PreprocessingSupervisedTemporalEstimator
PreprocessingUpdatableSupervisedTemporalEstimator
SupervisedEstimatorToTemporalAdaptor
TemporalEstimatorToSupervisedAdaptor
UpdatableSupervisedEstimatorToTemporalAdaptor
UpdatableTemporalEstimatorToSupervisedAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol UpdatableEstimator
Inherited By
Conforming Types
See Also
Protocols


## Page 29

An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 30

func adaptedAsSupervised<Annotation>(annotationType: Annotation.Type) -
UpdatableEstimatorToSupervisedAdaptor<Self, Annotation>
Exposes this estimator as a supervised estimator.
func adaptedAsTemporal() -> UpdatableEstimatorToTemporalAdaptor<Self>
Exposes this estimator as a temporal estimator.
Deprecated
func appending(_:)
Composes this updatable estimator with another updatable estimator.
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Topics
Adapting
Appending
Encoding and decoding
Create ML Components / UpdatableEstimator
Protocol
UpdatableEstimator
An estimator that can be incrementally updated.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 31

Required
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Reads the encoded transformer and optimizer with a decoder.
Required
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence)
async throws
Estimator
NumericImputer
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
OneHotEncoder
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
OrdinalEncoder
Conforms when Category conforms to Comparable, Decodable, Encodable, and Hashable.
PreprocessingUpdatableEstimator
StandardScaler
Conforms when Element conforms to BinaryFloatingPoint, Decodable, and Encodable.
Transforming
Relationships
Inherits From
Conforming Types


## Page 32

TransformerToUpdatableEstimatorAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
See Also
Protocols


## Page 33

A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 34

func appending(_:)
Composes this updatable estimator with an updatable estimator.
func adaptedAsTemporal() -> UpdatableSupervisedEstimatorToTemporal
Adaptor<Self>
Exposes this supervised estimator as a temporal supervised estimator.
Deprecated
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Required
Topics
Appending
Adapting
Encoding and decoding
Create ML Components / UpdatableSupervisedEstimator
Protocol
UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 35

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Reads the encoded transformer and optimizer with a decoder.
Required
func readWithOptimizer(from: URL) throws -> Self.Transformer
Reads the encoded transformer and optimizer from a file.
func writeWithOptimizer(Self.Transformer, to: URL, overwrite: Bool)
throws
Writes the encoded transformer and optimizer to a file.
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
Required Default implementation provided.
func update<InputSequence>(inout Self.Transformer, with: InputSequence)
async throws
SupervisedEstimator
FullyConnectedNetworkClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
Reading and writing
Transforming
Relationships
Inherits From
Conforming Types


## Page 36

FullyConnectedNetworkMultiLabelClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Scalar conforms to Decodable, Scalar conforms to Encodable, Label conforms to Comparable, Label
conforms to Decodable, Label conforms to Encodable, and Label conforms to Hashable.
FullyConnectedNetworkRegressor
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LinearRegressor
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LinearTimeSeriesForecaster
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
LogisticRegressionClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
MultivariateLinearRegressor
Conforms when Scalar conforms to MLShapedArrayScalar and BinaryFloatingPoint.
PreprocessingUpdatableSupervisedEstimator
TimeSeriesClassifier
Conforms when Scalar conforms to MLShapedArrayScalar, Scalar conforms to BinaryFloatingPoint,
Label conforms to Comparable, Label conforms to Decodable, Label conforms to Encodable, and Label
conforms to Hashable.
UpdatableEstimatorToSupervisedAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
See Also
Protocols


## Page 37

An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 38

func appending(_:)
Composes this updatable supervised temporal estimator with another updatable supervised
temporal estimator.
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Required
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Reads the encoded transformer and optimizer with a decoder.
Required
Topics
Appending
Encoding and decoding
Create ML Components / UpdatableSupervisedTemporalEstimator Deprecated
Protocol
UpdatableSupervisedTemporal
Estimator Deprecated
A supervised temporal estimator that can be incrementally updated.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 39

func readWithOptimizer(from: URL) throws -> Self.Transformer
Reads the encoded transformer and optimizer from a file.
func writeWithOptimizer(Self.Transformer, to: URL, overwrite: Bool)
throws
Writes the encoded transformer and optimizer to a file.
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update<InputSequence, FeatureSequence>(inout Self.Transformer, wit
: InputSequence, eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
Required
func update<InputSequence, FeatureSequence>(inout Self.Transformer, wit
: InputSequence) async throws
SupervisedTemporalEstimator
PreprocessingUpdatableSupervisedTemporalEstimator, 
UpdatableSupervisedEstimatorToTemporalAdaptor, 
UpdatableTemporalEstimatorToSupervisedAdaptor
Reading and writing
Transforming
Relationships
Inherits From
Conforming Types
See Also


## Page 40

protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
Protocols


## Page 41

A tabular estimator that can be incrementally updated.


## Page 42

func appending(_:)
Composes this supervised tabular estimator with another supervised tabular estimator.
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Required
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Reads the encoded transformer and optimizer with a decoder.
Required
func readWithOptimizer(from: URL) throws -> Self.Transformer
Topics
Appending
Encoding and decoding
Reading and writing
Create ML Components / UpdatableSupervisedTabularEstimator
Protocol
UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 43

Reads the encoded transformer and optimizer from a file.
func writeWithOptimizer(Self.Transformer, to: URL, overwrite: Bool)
throws
Writes the encoded transformer and optimizer to a file.
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update(inout Self.Transformer, with: DataFrame) async throws
func update(inout Self.Transformer, with: DataFrame, eventHandler: Even
Handler?) async throws
Updates a transformer with a new sequence of examples.
Required
SupervisedTabularEstimator
AnnotatedFeatureProvider
Conforms when Base conforms to UpdatableSupervisedEstimator, UnwrappedInput conforms to
Copyable, UnwrappedInput conforms to Escapable, and Base.Transformer.Input is UnwrappedInput
BoostedTreeClassifier
Conforms when Label conforms to Comparable, Decodable, Encodable, and Hashable.
BoostedTreeRegressor
Conforms when Annotation conforms to Copyable and Escapable.
PreprocessingUpdatableSupervisedTabularEstimator
UpdatableTabularEstimatorToSupervisedAdaptor
Transforming
Relationships
Inherits From
Conforming Types


## Page 44

protocol Transformer
A transformer that takes an input and produces an output.
protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
See Also
Protocols


## Page 45

protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 46

func appending(_:)
Composes this updatable temporal estimator with an updatable supervised temporal
estimator.
func adaptedAsSupervised<Annotation>(annotationType: Annotation.Type) -
UpdatableTemporalEstimatorToSupervisedAdaptor<Self, Annotation>
Exposes this temporal estimator as a supervised temporal estimator.
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Required
Topics
Appending
Adapting
Encoding and decoding
Create ML Components / UpdatableTemporalEstimator Deprecated
Protocol
UpdatableTemporalEstimator Deprecated
A temporal estimator that can be incrementally updated.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 47

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Reads the encoded transformer and optimizer with a decoder.
Required
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
Required
func update<InputSequence>(inout Self.Transformer, with: InputSequence)
async throws
TemporalEstimator
PreprocessingUpdatableTemporalEstimator, 
TemporalTransformerToUpdatableEstimatorAdaptor, 
UpdatableEstimatorToTemporalAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
Transforming
Relationships
Inherits From
Conforming Types
See Also
Protocols


## Page 48

protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.


## Page 49

func appending(_:)
Composes this updatable tabular estimator with an updatable supervised tabular estimator.
func adaptedAsSupervised<Annotation>(annotationColumnID: ColumnID<
Annotation>) -> UpdatableTabularEstimatorToSupervisedAdaptor<Self,
Annotation>
Exposes this updatable tabular estimator as a supervised tabular estimator.
func encodeWithOptimizer(Self.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
Required
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Self.Transformer
Topics
Appending
Adapting
Encoding and decoding
Create ML Components / UpdatableTabularEstimator
Protocol
UpdatableTabularEstimator
A tabular estimator that can be incrementally updated.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 50

Reads the encoded transformer and optimizer with a decoder.
Required
func makeTransformer() -> Self.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Required
func update(inout Self.Transformer, with: DataFrame) async throws
func update(inout Self.Transformer, with: DataFrame, eventHandler: Even
Handler?) async throws
Updates a transformer with a new sequence of examples.
Required
TabularEstimator
ColumnSelector
Conforms when Estimator conforms to UpdatableEstimator, UnwrappedInput conforms to Copyable,
UnwrappedInput conforms to Escapable, and Estimator.Transformer.Input is UnwrappedInput?.
PreprocessingUpdatableTabularEstimator
TabularTransformerToUpdatableEstimatorAdaptor
protocol Transformer
A transformer that takes an input and produces an output.
Transforming
Relationships
Inherits From
Conforming Types
See Also
Protocols


## Page 51

protocol TemporalTransformer
A transformer that takes an asynchronous input sequence of temporal features and produce
an asynchronous output sequence.
protocol RandomTransformer
A transformer that takes an input and a random number generator and produces a
randomized output.
protocol Estimator
An estimator that creates a transformer by fitting to a data set.
protocol TemporalEstimator
An estimator that creates a transformer by fitting to a sequence of temporal features.
Deprecated
protocol SupervisedEstimator
An estimator that creates a transformer by fitting to a data set.
protocol SupervisedTemporalEstimator
An estimator that creates a transformer by fitting to a sequence of annotated temporal
features.
Deprecated
protocol UpdatableEstimator
An estimator that can be incrementally updated.
protocol UpdatableSupervisedEstimator
A supervised estimator that can be incrementally updated.
protocol UpdatableSupervisedTemporalEstimator
A supervised temporal estimator that can be incrementally updated.
Deprecated
protocol UpdatableSupervisedTabularEstimator
A supervised tabular estimator that can be incrementally updated.
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated


