# 009_UpdatableSupervisedTemporalEstimator.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

A tabular estimator that can be incrementally updated.


