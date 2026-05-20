# 001_EstimatorToTemporalAdaptor.pdf

## Page 1

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


## Page 2

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


