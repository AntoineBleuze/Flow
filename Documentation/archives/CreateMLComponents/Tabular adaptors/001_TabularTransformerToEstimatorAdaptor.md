# 001_TabularTransformerToEstimatorAdaptor.pdf

## Page 1

init(Transformer)
Creates a trivial tabular estimator.
let transformer: Transformer
A pre-defined tabular transformer.
func encode(Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this tabular estimator uses a pre-defined tabular transformer.
func decode(from: inout any EstimatorDecoder) throws -> Transformer
Returns the pre-defined tabular transformer.
Topics
Creating an estimator
Getting the transformer
Encoding and decoding
Fitting
Create ML Components / TabularTransformerToEstimatorAdaptor
Structure
TabularTransformerToEstimatorAdaptor
A tabular estimator that always returns a predefined tabular transformer.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func fitted(to: DataFrame, eventHandler: EventHandler?) async throws ->
Transformer
Returns the pre-defined tabular transformer.
Sendable, SendableMetatype, TabularEstimator
struct TabularEstimatorToSupervisedAdaptor
An adaptor that exposes a tabular estimator as a tabular supervised estimator.
struct TabularTransformerToUpdatableEstimatorAdaptor
An updatable tabular estimator that always returns a predefined transformer.
struct UpdatableTabularEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable tabular estimator as an updatable supervised tabular
estimator.
Relationships
Conforms To
See Also
Tabular adaptors


