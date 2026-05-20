# 000_TemporalAdaptor.pdf

## Page 1

init(Base)
Creates a temporal transformer from a transformer.
func applied(to: some TemporalSequence<Base.Input>, eventHandler: Event
Handler?) async throws -> AnyTemporalSequence<TemporalAdaptor<Base>.
Output>
Performs the transformation on each element of the input sequence.
typealias Input
The input type.
typealias Output
The output type.
Topics
Creating a temporal adaptor
Applying a temporal adapter
Supporting types
Create ML Components / TemporalAdaptor
Structure
TemporalAdaptor
A temporal transformer that applies a regular transformer to each value of a
temporal sequence.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

typealias OutputSequence
The output sequence type.
Sendable, SendableMetatype, TemporalTransformer
struct TemporalTransformerToEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
struct TemporalEstimatorToSupervisedAdaptor
An adaptor that exposes a temporal estimator as a supervised temporal estimator.
Deprecated
struct TemporalTransformerToUpdatableEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
Relationships
Conforms To
See Also
Temporal adaptors


