# 002_TransformerToUpdatableEstimatorAdaptor.pdf

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
Create ML Components / TransformerToUpdatableEstimatorAdaptor
Structure
TransformerToUpdatableEstimator
Adaptor
An updatable estimator that always returns a predefined transformer.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func encodeWithOptimizer(Transformer, to: inout any EstimatorEncoder)
throws
Does nothing since this estimator uses a pre-defined transformer.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Transformer
Returns the pre-defined transformer.
func fitted<S>(to: S, eventHandler: EventHandler?) async throws ->
Transformer
Returns the pre-defined transformer.
func makeTransformer() -> Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence>(inout Transformer, with: InputSequence, even
Handler: EventHandler?) async throws
Does nothing since this estimator uses a pre-defined transformer.
Estimator
Sendable
SendableMetatype
UpdatableEstimator
struct TransformerToEstimatorAdaptor
An estimator that always returns a predefined transformer.
Fitting and updating
Relationships
Conforms To
See Also
Transformer adaptors


## Page 3

struct TransformerToTemporalAdaptor
A temporal transformer that applies a regular transformer to each value of a temporal
sequence.
Deprecated


