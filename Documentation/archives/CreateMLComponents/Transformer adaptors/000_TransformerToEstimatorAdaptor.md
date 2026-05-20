# 000_TransformerToEstimatorAdaptor.pdf

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
Creating a feature
Getting the transformer
Encoding and Decoding
Fitting
Create ML Components / TransformerToEstimatorAdaptor
Structure
TransformerToEstimatorAdaptor
An estimator that always returns a predefined transformer.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func fitted<S>(to: S, eventHandler: EventHandler?) async throws ->
Transformer
Returns the pre-defined transformer.
Estimator, Sendable, SendableMetatype
struct TransformerToTemporalAdaptor
A temporal transformer that applies a regular transformer to each value of a temporal
sequence.
Deprecated
struct TransformerToUpdatableEstimatorAdaptor
An updatable estimator that always returns a predefined transformer.
Relationships
Conforms To
See Also
Transformer adaptors


