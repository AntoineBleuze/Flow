# Updatable adaptors.pdf

## Page 1

init(Base)
Creates a temporal estimator from an estimator.
func encode(UpdatableEstimatorToTemporalAdaptor<Base>.Transformer, to:
inout any EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> Updatable
EstimatorToTemporalAdaptor<Base>.Transformer
Decodes the transformer.
func encodeWithOptimizer(UpdatableEstimatorToTemporalAdaptor<Base>.
Transformer, to: inout any EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
Topics
Creating an adaptor
Encoding and decoding
Create ML Components / UpdatableEstimatorToTemporalAdaptor Deprecated
Structure
UpdatableEstimatorToTemporal
Adaptor Deprecated
An updatable temporal estimator wrapping an updatable estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableEstimatorToTemporalAdaptor<Base>.Transformer
Reads the encoded transformer and optimizer with a decoder.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> UpdatableEstimatorToTemporalAdaptor<Base>.Transforme
Fits a transformer to a sequence of examples.
func makeTransformer() -> UpdatableEstimatorToTemporalAdaptor<Base>.
Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence>(inout UpdatableEstimatorToTemporalAdaptor<
Base>.Transformer, with: InputSequence, eventHandler: EventHandler?)
async throws
Updates a transformer with a new sequence of examples.
typealias Input
The input type.
typealias Output
The output type.
typealias Transformer
The transformer type created by this estimator.
Sendable
SendableMetatype
TemporalEstimator
UpdatableTemporalEstimator
Fitting and updating
Relationships
Conforms To


## Page 3

struct UpdatableEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable estimator as an updatable supervised estimator.
struct UpdatableSupervisedEstimatorToTemporalAdaptor
An updatable supervised temporal estimator wrapping an updatable supervised estimator.
Deprecated
struct UpdatableTemporalEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable temporal estimator as an updatable supervised
temporal estimator.
Deprecated
See Also
Updatable adaptors


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

init(Base)
Creates a temporal supervised estimator from a supervised estimator.
func encode(UpdatableSupervisedEstimatorToTemporalAdaptor<Base>.
Transformer, to: inout any EstimatorEncoder) throws
Encodes a fitted transformer.
func decode(from: inout any EstimatorDecoder) throws -> Updatable
SupervisedEstimatorToTemporalAdaptor<Base>.Transformer
Decodes the transformer.
Topics
Creating an adaptor
Encoding and decoding
Create ML Components / UpdatableSupervisedEstimatorToTemporalAdaptor Deprecated
Structure
UpdatableSupervisedEstimatorTo
TemporalAdaptor Deprecated
An updatable supervised temporal estimator wrapping an updatable supervised
estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 8

func encodeWithOptimizer(UpdatableSupervisedEstimatorToTemporalAdaptor<
Base>.Transformer, to: inout any EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
UpdatableSupervisedEstimatorToTemporalAdaptor<Base>.Transformer
Reads the encoded transformer and optimizer with a decoder.
func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> UpdatableSupervisedEstimatorTo
TemporalAdaptor<Base>.Transformer
Fits a transformer to a sequence of examples.
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> UpdatableSupervisedEstimatorToTemporalAdaptor<Base>.
Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
func makeTransformer() -> UpdatableSupervisedEstimatorToTemporalAdaptor
Base>.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence, FeatureSequence>(inout UpdatableSupervised
EstimatorToTemporalAdaptor<Base>.Transformer, with: InputSequence, even
Handler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
typealias Annotation
The annotation type.
typealias Input
The input type.
typealias Output
The output type.
typealias Transformer
The transformer type created by this estimator.
Fitting and updating


## Page 9

Sendable
SendableMetatype
SupervisedTemporalEstimator
UpdatableSupervisedTemporalEstimator
struct UpdatableEstimatorToTemporalAdaptor
An updatable temporal estimator wrapping an updatable estimator.
Deprecated
struct UpdatableEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable estimator as an updatable supervised estimator.
struct UpdatableTemporalEstimatorToSupervisedAdaptor
An adaptor that exposes an updatable temporal estimator as an updatable supervised
temporal estimator.
Deprecated
Relationships
Conforms To
See Also
Updatable adaptors


## Page 10

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


## Page 11

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


## Page 12

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


