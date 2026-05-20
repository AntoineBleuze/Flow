# 002_SupervisedEstimatorToTemporalAdaptor.pdf

## Page 1

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


## Page 2

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


## Page 3

Deprecated


