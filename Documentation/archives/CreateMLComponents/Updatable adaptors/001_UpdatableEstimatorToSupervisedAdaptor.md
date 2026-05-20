# 001_UpdatableEstimatorToSupervisedAdaptor.pdf

## Page 1

init(Estimator)
Creates an estimator adaptor.
let estimator: Estimator
The wrapped estimator.
func encode(UpdatableEstimatorToSupervisedAdaptor<Estimator, Annotation
>.Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> Updatable
EstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer
Topics
Creating an adaptor
Getting the estimator
Encoding and decoding
Create ML Components / UpdatableEstimatorToSupervisedAdaptor
Structure
UpdatableEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable estimator as an updatable supervised
estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Returns the pre-defined transformer.
func encodeWithOptimizer(UpdatableEstimatorToSupervisedAdaptor<Estimato
, Annotation>.Transformer, to: inout any EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableEstimatorToSupervisedAdaptor<Estimator, Annotation>.Transforme
Reads the encoded transformer and optimizer.
func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> UpdatableEstimatorToSupervisedAdaptor<Estimator, Annotation>.
Transformer
Fits a transformer to a sequence of examples, ignoring the annotations and the validation.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> UpdatableEstimatorToSupervised
Adaptor<Estimator, Annotation>.Transformer
Fits a transformer to a sequence of examples.
func makeTransformer() -> Estimator.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence>(inout Estimator.Transformer, with: Input
Sequence, eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
func update<InputSequence, Validation>(inout Estimator.Transformer, wit
: InputSequence, validateOn: Validation, eventHandler: EventHandler?)
async throws
Fits a transformer to a sequence of examples while validating with a validation sequence.
protocol Transformer
A transformer that takes an input and produces an output.
Fitting and Updating
Relationships
Conforms To


## Page 3

Sendable
SendableMetatype
SupervisedEstimator
UpdatableSupervisedEstimator
struct UpdatableEstimatorToTemporalAdaptor
An updatable temporal estimator wrapping an updatable estimator.
Deprecated
struct UpdatableSupervisedEstimatorToTemporalAdaptor
An updatable supervised temporal estimator wrapping an updatable supervised estimator.
Deprecated
struct UpdatableTemporalEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable temporal estimator as an updatable supervised
temporal estimator.
Deprecated
See Also
Updatable adaptors


