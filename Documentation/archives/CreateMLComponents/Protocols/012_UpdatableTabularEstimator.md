# 012_UpdatableTabularEstimator.pdf

## Page 1

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


## Page 2

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
protocol UpdatableTemporalEstimator
A temporal estimator that can be incrementally updated.
Deprecated


