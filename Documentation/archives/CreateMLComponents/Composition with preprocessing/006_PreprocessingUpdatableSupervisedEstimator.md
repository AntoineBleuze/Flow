# 006_PreprocessingUpdatableSupervisedEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed supervised estimator from a preprocessing transformer and a supervis
estimator.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
Topics
Creating the estimator
Getting the properties
Encoding and decoding
Create ML Components / PreprocessingUpdatableSupervisedEstimator
Structure
PreprocessingUpdatableSupervised
Estimator
An updatable supervised estimator that composes a preprocessing transformer
and an updatable supervised estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
PreprocessingUpdatableSupervisedEstimator<Preprocessor, Estimator>.
Transformer
Reads the encoded transformer and optimizer with a decoder.
func encodeWithOptimizer(PreprocessingUpdatableSupervisedEstimator<
Preprocessor, Estimator>.Transformer, to: inout any EstimatorEncoder)
throws
Encodes the transformer and optimizer to an encoder.
func preprocessed<S>(from: S, eventHandler: EventHandler?) async throws
-> AnySequence<AnnotatedFeature<Preprocessor.Output, Preprocessing
UpdatableSupervisedEstimator<Preprocessor, Estimator>.Annotation>>
Preprocesses a sequence of examples.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> PreprocessingUpdatableSupervisedEstimator<
Preprocessor, Estimator>.Transformer
Fits a composed transformer to a sequence of examples.
func fitted<S>(toPreprocessed: S, eventHandler: EventHandler?) async 
throws -> PreprocessingUpdatableSupervisedEstimator<Preprocessor,
Estimator>.Transformer
Fits a transformer to a sequence of preprocessed features.
func fitted<InputSequence, Validation>(to: InputSequence, validateOn:
Validation, eventHandler: EventHandler?) async throws -> Preprocessing
UpdatableSupervisedEstimator<Preprocessor, Estimator>.Transformer
Fits a composed transformer to a sequence of examples.
func fitted<InputSequence, Validation>(toPreprocessed: InputSequence,
validateOn: Validation, eventHandler: EventHandler?) async throws ->
PreprocessingUpdatableSupervisedEstimator<Preprocessor, Estimator>.
Transformer
Fits a composed transformer to a sequence of examples.
func makeTransformer() -> PreprocessingUpdatableSupervisedEstimator<
Preprocessor, Estimator>.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
Preprocesing and fitting


## Page 3

func update<InputSequence>(inout PreprocessingUpdatableSupervised
Estimator<Preprocessor, Estimator>.Transformer, with: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
func update<InputSequence>(inout PreprocessingUpdatableSupervised
Estimator<Preprocessor, Estimator>.Transformer, withPreprocessed: Input
Sequence, eventHandler: EventHandler?) async throws
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
Sendable
SendableMetatype
SupervisedEstimator
UpdatableSupervisedEstimator
Relationships
Conforms To
See Also
Composition with preprocessing


## Page 4

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
struct PreprocessingUpdatableSupervisedTemporalEstimator
An updatable supervised temporal estimator that composes a preprocessing transformer an
an updatable supervised temporal estimator.
Deprecated


