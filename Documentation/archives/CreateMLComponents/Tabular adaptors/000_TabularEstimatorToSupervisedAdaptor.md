# 000_TabularEstimatorToSupervisedAdaptor.pdf

## Page 1

init(Estimator, annotationColumnID: ColumnID<Annotation>)
Creates a tabular estimator supervised adaptor.
var annotationColumnID: ColumnID<Annotation>
The annotation column identifier.
let estimator: Estimator
The wrapped estimator.
func encode(Estimator.Transformer, to: inout any EstimatorEncoder)
throws
Encodes a fitted transformer.
Topics
Creating an adaptor
Getting the properties
Encoding and decoding
Create ML Components / TabularEstimatorToSupervisedAdaptor
Structure
TabularEstimatorToSupervisedAdaptor
An adaptor that exposes a tabular estimator as a tabular supervised estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func decode(from: inout any EstimatorDecoder) throws -> Estimator.
Transformer
Decodes a previously fitted transformer.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> Estimator.Transformer
Returns the tabular transformer fitted using the provided tabular estimator.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable, SendableMetatype, SupervisedTabularEstimator
struct TabularTransformerToEstimatorAdaptor
A tabular estimator that always returns a predefined tabular transformer.
struct TabularTransformerToUpdatableEstimatorAdaptor
An updatable tabular estimator that always returns a predefined transformer.
struct UpdatableTabularEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable tabular estimator as an updatable supervised tabular
estimator.
Fitting
Relationships
Conforms To
See Also
Tabular adaptors


