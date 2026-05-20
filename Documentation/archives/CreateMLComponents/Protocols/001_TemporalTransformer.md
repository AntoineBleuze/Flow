# 001_TemporalTransformer.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


