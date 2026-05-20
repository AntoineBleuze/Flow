# 003_TemporalTransformerToUpdatableEstimatorAdaptor.pdf

## Page 1

init(Transformer)
Creates a trivial estimator.
let transformer: Transformer
A pre-defined transformer.
func encode(Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> Transformer
Returns the pre-defined transformer.
Topics
Creating an estimator
Getting the transformer
Encoding and decoding
Create ML Components / TemporalTransformerToUpdatableEstimatorAdaptor Deprecated
Structure
TemporalTransformerToUpdatable
EstimatorAdaptor Deprecated
A temporal estimator that always returns a predefined temporal transformer.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func encodeWithOptimizer(Transformer, to: inout any EstimatorEncoder)
throws
This method is part of the conformance. It doesn’t encode anything since the transformer is
pre-defined, so don’t call it.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Transformer
Returns the pre-defined transformer.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> Transformer
Returns the pre-defined transformer.
func makeTransformer() -> Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence>(inout Transformer, with: InputSequence, even
Handler: EventHandler?) async throws
Does nothing since this estimator uses a pre-defined transformer.
Sendable
SendableMetatype
TemporalEstimator
UpdatableTemporalEstimator
struct TemporalAdaptor
Fitting and updating
Relationships
Conforms To
See Also
Temporal adaptors


## Page 3

A temporal transformer that applies a regular transformer to each value of a temporal
sequence.
struct TemporalTransformerToEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
struct TemporalEstimatorToSupervisedAdaptor
An adaptor that exposes a temporal estimator as a supervised temporal estimator.
Deprecated


