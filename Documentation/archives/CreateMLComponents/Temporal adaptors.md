# Temporal adaptors.pdf

## Page 1

init(Base)
Creates a temporal transformer from a transformer.
func applied(to: some TemporalSequence<Base.Input>, eventHandler: Event
Handler?) async throws -> AnyTemporalSequence<TemporalAdaptor<Base>.
Output>
Performs the transformation on each element of the input sequence.
typealias Input
The input type.
typealias Output
The output type.
Topics
Creating a temporal adaptor
Applying a temporal adapter
Supporting types
Create ML Components / TemporalAdaptor
Structure
TemporalAdaptor
A temporal transformer that applies a regular transformer to each value of a
temporal sequence.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

typealias OutputSequence
The output sequence type.
Sendable, SendableMetatype, TemporalTransformer
struct TemporalTransformerToEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
struct TemporalEstimatorToSupervisedAdaptor
An adaptor that exposes a temporal estimator as a supervised temporal estimator.
Deprecated
struct TemporalTransformerToUpdatableEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
Relationships
Conforms To
See Also
Temporal adaptors


## Page 3

init(Transformer)
Creates a trivial estimator.
let transformer: Transformer
A pre-defined transformer.
func encode(Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> Transformer
Returns the pre-defined transformer.
Topics
Creating an estimator
Getting the transformer
Encoding and decoding
Create ML Components / TemporalTransformerToEstimatorAdaptor Deprecated
Structure
TemporalTransformerToEstimator
Adaptor Deprecated
A temporal estimator that always returns a predefined temporal transformer.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 4

func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> Transformer
Returns the pre-defined transformer.
Sendable, SendableMetatype, TemporalEstimator
struct TemporalAdaptor
A temporal transformer that applies a regular transformer to each value of a temporal
sequence.
struct TemporalEstimatorToSupervisedAdaptor
An adaptor that exposes a temporal estimator as a supervised temporal estimator.
Deprecated
struct TemporalTransformerToUpdatableEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
Fitting
Relationships
Conforms To
See Also
Temporal adaptors


## Page 5

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


## Page 6

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


## Page 7

Deprecated
struct TemporalTransformerToUpdatableEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated


## Page 8

init(Transformer)
Creates a trivial estimator.
let transformer: Transformer
A pre-defined transformer.
func encode(Transformer, to: inout any EstimatorEncoder) throws
Does nothing since this estimator uses a pre-defined transformer.
func decode(from: inout any EstimatorDecoder) throws -> Transformer
Returns the pre-defined transformer.
Topics
Creating an estimator
Getting the transformer
Encoding and decoding
Create ML Components / TemporalTransformerToUpdatableEstimatorAdaptor Deprecated
Structure
TemporalTransformerToUpdatable
EstimatorAdaptor Deprecated
A temporal estimator that always returns a predefined temporal transformer.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 9

func encodeWithOptimizer(Transformer, to: inout any EstimatorEncoder)
throws
This method is part of the conformance. It doesn’t encode anything since the transformer is
pre-defined, so don’t call it.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
Transformer
Returns the pre-defined transformer.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> Transformer
Returns the pre-defined transformer.
func makeTransformer() -> Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence>(inout Transformer, with: InputSequence, even
Handler: EventHandler?) async throws
Does nothing since this estimator uses a pre-defined transformer.
Sendable
SendableMetatype
TemporalEstimator
UpdatableTemporalEstimator
struct TemporalAdaptor
Fitting and updating
Relationships
Conforms To
See Also
Temporal adaptors


## Page 10

A temporal transformer that applies a regular transformer to each value of a temporal
sequence.
struct TemporalTransformerToEstimatorAdaptor
A temporal estimator that always returns a predefined temporal transformer.
Deprecated
struct TemporalEstimatorToSupervisedAdaptor
An adaptor that exposes a temporal estimator as a supervised temporal estimator.
Deprecated


