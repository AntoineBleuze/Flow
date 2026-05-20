# 002_TemporalEstimatorToSupervisedAdaptor.pdf

## Page 1

init(Estimator)
Creates a temporal estimator adaptor.
let estimator: Estimator
The wrapped estimator.
func encode(TemporalEstimatorToSupervisedAdaptor<Estimator, Annotation>
Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
Topics
Creating an adaptor
Getting the estimator
Encoding and decoding
Create ML Components / TemporalEstimatorToSupervisedAdaptor Deprecated
Structure
TemporalEstimatorToSupervised
Adaptor Deprecated
An adaptor that exposes a temporal estimator as a supervised temporal estimato
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func decode(from: inout any EstimatorDecoder) throws -> Temporal
EstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer
Returns the pre-defined transformer.
func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> TemporalEstimatorToSupervised
Adaptor<Estimator, Annotation>.Transformer
Fits a transformer to a sequence of examples.
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> TemporalEstimatorToSupervisedAdaptor<Estimator, Annotation>.
Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable, SendableMetatype, SupervisedTemporalEstimator
struct TemporalAdaptor
A temporal transformer that applies a regular transformer to each value of a temporal
sequence.
struct TemporalTransformerToEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Fitting
Relationships
Conforms To
See Also
Temporal adaptors


## Page 3

Deprecated
struct TemporalTransformerToUpdatableEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated


