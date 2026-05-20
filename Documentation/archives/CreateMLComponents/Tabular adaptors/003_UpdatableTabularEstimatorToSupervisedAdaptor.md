# 003_UpdatableTabularEstimatorToSupervisedAdaptor.pdf

## Page 1

init(Estimator, annotationColumnID: ColumnID<Annotation>)
Creates an updatable tabular estimator supervised adaptor.
var annotationColumnID: ColumnID<Annotation>
The annotation column identifier.
let estimator: Estimator
The wrapped estimator.
func encode(UpdatableTabularEstimatorToSupervisedAdaptor<Estimator,
Annotation>.Transformer, to: inout any EstimatorEncoder) throws
Topics
Creating an adaptor
Getting the properties
Encoding and decoding
Create ML Components / UpdatableTabularEstimatorToSupervisedAdaptor
Structure
UpdatableTabularEstimatorToSupervised
Adaptor
An adaptor that exposes an updatable tabular estimator as an updatable
supervised tabular estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> UpdatableTabula
EstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer
Returns the pre-defined transformer.
func encodeWithOptimizer(UpdatableTabularEstimatorToSupervisedAdaptor<
Estimator, Annotation>.Transformer, to: inout any EstimatorEncoder)
throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableTabularEstimatorToSupervisedAdaptor<Estimator, Annotation>.
Transformer
Reads the encoded transformer and optimizer.
func fitted(to: DataFrame, validateOn: DataFrame?, eventHandler: Event
Handler?) async throws -> UpdatableTabularEstimatorToSupervisedAdaptor<
Estimator, Annotation>.Transformer
Fits a transformer to a data frame.
func makeTransformer() -> Estimator.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update(inout UpdatableTabularEstimatorToSupervisedAdaptor<Estimato
, Annotation>.Transformer, with: DataFrame, eventHandler: EventHandler?
async throws
Updates a transformer with a new data frame containing examples.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable
SendableMetatype
Fitting
Relationships
Conforms To


## Page 3

SupervisedTabularEstimator
UpdatableSupervisedTabularEstimator
struct TabularEstimatorToSupervisedAdaptor
An adaptor that exposes a tabular estimator as a tabular supervised estimator.
struct TabularTransformerToEstimatorAdaptor
A tabular estimator that always returns a predefined tabular transformer.
struct TabularTransformerToUpdatableEstimatorAdaptor
An updatable tabular estimator that always returns a predefined transformer.
See Also
Tabular adaptors


