# 000_UpdatableEstimatorToTemporalAdaptor.pdf

## Page 1

init(Base)
Creates a temporal estimator from an estimator.
func encode(UpdatableEstimatorToTemporalAdaptor<Base>.Transformer, to:
inout any EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> Updatable
EstimatorToTemporalAdaptor<Base>.Transformer
Decodes the transformer.
func encodeWithOptimizer(UpdatableEstimatorToTemporalAdaptor<Base>.
Transformer, to: inout any EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
Topics
Creating an adaptor
Encoding and decoding
Create ML Components / UpdatableEstimatorToTemporalAdaptor Deprecated
Structure
UpdatableEstimatorToTemporal
Adaptor Deprecated
An updatable temporal estimator wrapping an updatable estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableEstimatorToTemporalAdaptor<Base>.Transformer
Reads the encoded transformer and optimizer with a decoder.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> UpdatableEstimatorToTemporalAdaptor<Base>.Transforme
Fits a transformer to a sequence of examples.
func makeTransformer() -> UpdatableEstimatorToTemporalAdaptor<Base>.
Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence>(inout UpdatableEstimatorToTemporalAdaptor<
Base>.Transformer, with: InputSequence, eventHandler: EventHandler?)
async throws
Updates a transformer with a new sequence of examples.
typealias Input
The input type.
typealias Output
The output type.
typealias Transformer
The transformer type created by this estimator.
Sendable
SendableMetatype
TemporalEstimator
UpdatableTemporalEstimator
Fitting and updating
Relationships
Conforms To


## Page 3

struct UpdatableEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable estimator as an updatable supervised estimator.
struct UpdatableSupervisedEstimatorToTemporalAdaptor
An updatable supervised temporal estimator wrapping an updatable supervised estimator.
Deprecated
struct UpdatableTemporalEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable temporal estimator as an updatable supervised
temporal estimator.
Deprecated
See Also
Updatable adaptors


