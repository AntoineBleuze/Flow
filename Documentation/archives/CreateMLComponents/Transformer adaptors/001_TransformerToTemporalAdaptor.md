# 001_TransformerToTemporalAdaptor.pdf

## Page 1

init(Base)
Creates a temporal transformer from a transformer.
func applied<S>(to: S, eventHandler: EventHandler?) async throws -> Any
TemporalSequence<TransformerToTemporalAdaptor<Base>.Output>
Performs the transformation on each element of the input sequence.
typealias Input
The input type.
typealias Output
The output type.
typealias OutputSequence
Topics
Creating a transformer
Applying
Create ML Components / TransformerToTemporalAdaptor Deprecated
Structure
TransformerToTemporalAdaptor Deprecated
A temporal transformer that applies a regular transformer to each value of a
temporal sequence.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

The output sequence type.
Sendable, SendableMetatype, TemporalTransformer
struct TransformerToEstimatorAdaptor
An estimator that always returns a predefined transformer.
struct TransformerToUpdatableEstimatorAdaptor
An updatable estimator that always returns a predefined transformer.
Relationships
Conforms To
See Also
Transformer adaptors


