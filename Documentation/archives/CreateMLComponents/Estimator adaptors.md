# Estimator adaptors.pdf

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


## Page 3

init(Base)
Creates a temporal estimator from an estimator.
func encode(EstimatorToTemporalAdaptor<Base>.Transformer, to: inout any
EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> EstimatorTo
TemporalAdaptor<Base>.Transformer
Decodes the transformer.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> EstimatorToTemporalAdaptor<Base>.Transformer
Topics
Creating the estimator
Encoding and decoding
Fitting a transformer
Create ML Components / EstimatorToTemporalAdaptor Deprecated
Structure
EstimatorToTemporalAdaptor Deprecated
A temporal estimator wrapping an estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 4

Fits a transformer to a sequence of examples.
typealias Input
The input type.
typealias Output
The output type.
typealias Transformer
The transformer type created by this estimator.
Sendable, SendableMetatype, TemporalEstimator
struct EstimatorToSupervisedAdaptor
An adaptor that exposes an estimator as a supervised estimator.
struct SupervisedEstimatorToTemporalAdaptor
A supervised temporal estimator wrapping a supervised estimator.
Deprecated
Relationships
Conforms To
See Also
Estimator adaptors


## Page 5

init(Base)
Creates a temporal supervised estimator from a supervised estimator.
func encode(SupervisedEstimatorToTemporalAdaptor<Base>.Transformer, to:
inout any EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> Supervised
EstimatorToTemporalAdaptor<Base>.Transformer
Decodes the transformer.
Topics
Creating an estimator
Encoding and decoding
Fitting
Create ML Components / SupervisedEstimatorToTemporalAdaptor Deprecated
Structure
SupervisedEstimatorToTemporal
Adaptor Deprecated
A supervised temporal estimator wrapping a supervised estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 6

func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> SupervisedEstimatorToTemporal
Adaptor<Base>.Transformer
Fits a transformer to a sequence of examples.
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> SupervisedEstimatorToTemporalAdaptor<Base>.Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
typealias Annotation
The annotation type.
typealias Input
The input type.
typealias Output
The output type.
typealias Transformer
The transformer type created by this estimator.
Sendable, SendableMetatype, SupervisedTemporalEstimator
struct EstimatorToSupervisedAdaptor
An adaptor that exposes an estimator as a supervised estimator.
struct EstimatorToTemporalAdaptor
A temporal estimator wrapping an estimator.
Relationships
Conforms To
See Also
Estimator adaptors


## Page 7

Deprecated


