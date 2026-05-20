# 002_UpdatableSupervisedEstimatorToTemporalAdaptor.pdf

## Page 1

init(Base)
Creates a temporal supervised estimator from a supervised estimator.
func encode(UpdatableSupervisedEstimatorToTemporalAdaptor<Base>.
Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> Updatable
SupervisedEstimatorToTemporalAdaptor<Base>.Transformer
Decodes the transformer.
Topics
Creating an adaptor
Encoding and decoding
Create ML Components / UpdatableSupervisedEstimatorToTemporalAdaptor Deprecated
Structure
UpdatableSupervisedEstimatorTo
TemporalAdaptor Deprecated
An updatable supervised temporal estimator wrapping an updatable supervised
estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func encodeWithOptimizer(UpdatableSupervisedEstimatorToTemporalAdaptor<
Base>.Transformer, to: inout any EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableSupervisedEstimatorToTemporalAdaptor<Base>.Transformer
Reads the encoded transformer and optimizer with a decoder.
func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> UpdatableSupervisedEstimatorTo
TemporalAdaptor<Base>.Transformer
Fits a transformer to a sequence of examples.
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> UpdatableSupervisedEstimatorToTemporalAdaptor<Base>.
Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
func makeTransformer() -> UpdatableSupervisedEstimatorToTemporalAdaptor
Base>.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence, FeatureSequence>(inout UpdatableSupervised
EstimatorToTemporalAdaptor<Base>.Transformer, with: InputSequence, even
Handler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
typealias Annotation
The annotation type.
typealias Input
The input type.
typealias Output
The output type.
typealias Transformer
The transformer type created by this estimator.
Fitting and updating


## Page 3

Sendable
SendableMetatype
SupervisedTemporalEstimator
UpdatableSupervisedTemporalEstimator
struct UpdatableEstimatorToTemporalAdaptor
An updatable temporal estimator wrapping an updatable estimator.
Deprecated
struct UpdatableEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable estimator as an updatable supervised estimator.
struct UpdatableTemporalEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable temporal estimator as an updatable supervised
temporal estimator.
Deprecated
Relationships
Conforms To
See Also
Updatable adaptors


