# 007_PreprocessingUpdatableSupervisedTemporalEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed supervised temporal estimator from a preprocessing transformer and a
supervised temporal estimator.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
Topics
Creating an estimator
Getting the properties
Create ML Components / PreprocessingUpdatableSupervisedTemporalEstimator Deprecated
Structure
PreprocessingUpdatableSupervised
TemporalEstimator Deprecated
An updatable supervised temporal estimator that composes a preprocessing
transformer and an updatable supervised temporal estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
PreprocessingUpdatableSupervisedTemporalEstimator<Preprocessor,
Estimator>.Transformer
Reads the encoded transformer and optimizer with a decoder.
func encodeWithOptimizer(PreprocessingUpdatableSupervisedTemporal
Estimator<Preprocessor, Estimator>.Transformer, to: inout any Estimator
Encoder) throws
Encodes the transformer and optimizer to an encoder.
func preprocessed<InputSequence, FeatureSequence>(from: InputSequence,
eventHandler: EventHandler?) async throws -> [AnnotatedFeature<
PreprocessedFeatureSequence<Preprocessor.Output>, PreprocessingUpdatabl
SupervisedTemporalEstimator<Preprocessor, Estimator>.Annotation>]
Preprocesses a sequence of examples.
func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> PreprocessingUpdatableSupervise
TemporalEstimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of examples.
func fitted(toPreprocessed: [AnnotatedFeature<PreprocessedFeature
Sequence<Preprocessor.Output>, PreprocessingUpdatableSupervisedTemporal
Estimator<Preprocessor, Estimator>.Annotation>], eventHandler: Event
Handler?) async throws -> PreprocessingUpdatableSupervisedTemporal
Estimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of preprocessed features.
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> PreprocessingUpdatableSupervisedTemporalEstimator<Preprocesso
, Estimator>.Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
Encoding and decoding
Preprocesing and fitting


## Page 3

func fitted(toPreprocessed: [AnnotatedFeature<PreprocessedFeature
Sequence<Preprocessor.Output>, PreprocessingUpdatableSupervisedTemporal
Estimator<Preprocessor, Estimator>.Annotation>], validateOn: [Annotated
Feature<PreprocessedFeatureSequence<Preprocessor.Output>, Preprocessing
UpdatableSupervisedTemporalEstimator<Preprocessor, Estimator>.Annotatio
>], eventHandler: EventHandler?) async throws -> PreprocessingUpdatable
SupervisedTemporalEstimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of preprocessed features while validating.
func makeTransformer() -> PreprocessingUpdatableSupervisedTemporal
Estimator<Preprocessor, Estimator>.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence, FeatureSequence>(inout PreprocessingUpdatabl
SupervisedTemporalEstimator<Preprocessor, Estimator>.Transformer, with:
InputSequence, eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
func update<InputSequence, FeatureSequence>(inout PreprocessingUpdatabl
SupervisedTemporalEstimator<Preprocessor, Estimator>.Transformer, with
Preprocessed: InputSequence, eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of preprocessed features.
typealias Annotation
The annotation type.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
typealias Output
The output type.
protocol Transformer
A transformer that takes an input and produces an output.
Relationships


## Page 4

Sendable
SendableMetatype
SupervisedTemporalEstimator
UpdatableSupervisedTemporalEstimator
struct PreprocessingEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingTemporalEstimator
A temporal estimator that composes a preprocessing transformer and a temporal estimator.
Deprecated
struct PreprocessingSupervisedEstimator
A supervised estimator that composes a preprocessing transformer and a supervised
estimator.
struct PreprocessingSupervisedTemporalEstimator
A supervised temporal estimator that composes a preprocessing transformer and a
supervised temporal estimator.
Deprecated
struct PreprocessingUpdatableEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.
struct PreprocessingUpdatableTemporalEstimator
An updatable temporal estimator that composes a preprocessing transformer and an
updatable temporal estimator.
Deprecated
struct PreprocessingUpdatableSupervisedEstimator
Conforms To
See Also
Composition with preprocessing


## Page 5

An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.


