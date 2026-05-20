# 006_SupervisedTemporalEstimator.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


