# 011_UpdatableTemporalEstimator.pdf

## Page 1

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


## Page 2

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


## Page 3

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


