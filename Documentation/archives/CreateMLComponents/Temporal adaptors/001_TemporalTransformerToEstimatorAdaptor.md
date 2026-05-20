# 001_TemporalTransformerToEstimatorAdaptor.pdf

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
Create ML Components / TemporalTransformerToEstimatorAdaptor Deprecated
Structure
TemporalTransformerToEstimator
Adaptor Deprecated
A temporal estimator that always returns a predefined temporal transformer.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> Transformer
Returns the pre-defined transformer.
Sendable, SendableMetatype, TemporalEstimator
struct TemporalAdaptor
A temporal transformer that applies a regular transformer to each value of a temporal
sequence.
struct TemporalEstimatorToSupervisedAdaptor
An adaptor that exposes a temporal estimator as a supervised temporal estimator.
Deprecated
struct TemporalTransformerToUpdatableEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
Fitting
Relationships
Conforms To
See Also
Temporal adaptors


