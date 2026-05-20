# 000_EstimatorToSupervisedAdaptor.pdf

## Page 1

init(Estimator)
Creates an estimator adaptor.
let estimator: Estimator
The wrapped estimator.
func encode(EstimatorToSupervisedAdaptor<Estimator, Annotation>.
Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> EstimatorTo
SupervisedAdaptor<Estimator, Annotation>.Transformer
Returns the pre-defined transformer.
Topics
Creating the adaptor
Getting the properties
Encoding and decoding
Create ML Components / EstimatorToSupervisedAdaptor
Structure
EstimatorToSupervisedAdaptor
An adaptor that exposes an estimator as a supervised estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func fitted<Input>(to: Input, eventHandler: EventHandler?) async throws
-> EstimatorToSupervisedAdaptor<Estimator, Annotation>.Transformer
Fits a transformer to a sequence of examples, ignoring the annotations and the validation.
func fitted<Input, Validation>(to: Input, validateOn: Validation, event
Handler: EventHandler?) async throws -> EstimatorToSupervisedAdaptor<
Estimator, Annotation>.Transformer
Fits a transformer to a sequence of examples.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable, SendableMetatype, SupervisedEstimator
struct EstimatorToTemporalAdaptor
A temporal estimator wrapping an estimator.
Deprecated
struct SupervisedEstimatorToTemporalAdaptor
A supervised temporal estimator wrapping a supervised estimator.
Deprecated
Fitting a transformer
Relationships
Conforms To
See Also
Estimator adaptors


