# 003_UpdatableTemporalEstimatorToSupervisedAdaptor.pdf

## Page 1

init(Estimator)
Creates a temporal estimator adaptor.
let estimator: Estimator
The wrapped estimator.
func encode(UpdatableTemporalEstimatorToSupervisedAdaptor<Estimator,
Annotation>.Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
Topics
Creating an adaptor
Getting the estimator
Encoding and decoding
Create ML Components / UpdatableTemporalEstimatorToSupervisedAdaptor Deprecated
Structure
UpdatableTemporalEstimatorTo
SupervisedAdaptor Deprecated
An adaptor that exposes an updatable temporal estimator as an updatable
supervised temporal estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func decode(from: inout any EstimatorDecoder) throws -> Updatable
TemporalEstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer
Returns the pre-defined transformer.
func encodeWithOptimizer(UpdatableTemporalEstimatorToSupervisedAdaptor<
Estimator, Annotation>.Transformer, to: inout any EstimatorEncoder)
throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableTemporalEstimatorToSupervisedAdaptor<Estimator, Annotation>.
Transformer
Reads the encoded transformer and optimizer with a decoder.
func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> UpdatableTemporalEstimatorTo
SupervisedAdaptor<Estimator, Annotation>.Transformer
Fits a transformer to a sequence of examples.
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> UpdatableTemporalEstimatorToSupervisedAdaptor<Estimator,
Annotation>.Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
func makeTransformer() -> Estimator.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence, FeatureSequence>(inout UpdatableTemporal
EstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer, with:
InputSequence, eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
func update<InputSequence, Validation, FeatureSequence>(inout Updatable
TemporalEstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer
with: InputSequence, validateOn: Validation, eventHandler: EventHandler
?) async throws
Fits a transformer to a sequence of examples while validating with a validation sequence.
protocol Transformer
Fitting and updating


## Page 3

A transformer that takes an input and produces an output.
Sendable
SendableMetatype
SupervisedTemporalEstimator
UpdatableSupervisedTemporalEstimator
struct UpdatableEstimatorToTemporalAdaptor
An updatable temporal estimator wrapping an updatable estimator.
Deprecated
struct UpdatableEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable estimator as an updatable supervised estimator.
struct UpdatableSupervisedEstimatorToTemporalAdaptor
An updatable supervised temporal estimator wrapping an updatable supervised estimator.
Deprecated
Relationships
Conforms To
See Also
Updatable adaptors


