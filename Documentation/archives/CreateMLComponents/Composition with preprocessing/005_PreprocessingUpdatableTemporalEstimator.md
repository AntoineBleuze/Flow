# 005_PreprocessingUpdatableTemporalEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed temporal estimator from a preprocessing transformer and a temporal
estimator.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
Topics
Creating an estimator
Getting the properties
Create ML Components / PreprocessingUpdatableTemporalEstimator Deprecated
Structure
PreprocessingUpdatableTemporal
Estimator Deprecated
An updatable temporal estimator that composes a preprocessing transformer and
an updatable temporal estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func encodeWithOptimizer(PreprocessingUpdatableTemporalEstimator<
Preprocessor, Estimator>.Transformer, to: inout any EstimatorEncoder)
throws
Encodes the transformer and optimizer to an encoder.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
PreprocessingUpdatableTemporalEstimator<Preprocessor, Estimator>.
Transformer
Reads the encoded transformer and optimizer with a decoder.
func preprocessed<InputSequence>(from: InputSequence, eventHandler:
EventHandler?) async throws -> [PreprocessedFeatureSequence<Preprocesso
.Output>]
Preprocesses a sequence of examples.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> PreprocessingUpdatableTemporalEstimator<Preprocessor
Estimator>.Transformer
Fits a transformer to a sequence of examples.
func fitted(toPreprocessed: [PreprocessedFeatureSequence<Preprocessor.
Output>], eventHandler: EventHandler?) async throws -> Preprocessing
UpdatableTemporalEstimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of preprocessed features.
func update<InputSequence>(inout PreprocessingUpdatableTemporalEstimato
<Preprocessor, Estimator>.Transformer, withPreprocessed: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of preprocessed features.
func update<InputSequence>(inout PreprocessingUpdatableTemporalEstimato
<Preprocessor, Estimator>.Transformer, with: InputSequence, eventHandle
: EventHandler?) async throws
Updates a transformer with a new sequence of examples.
func makeTransformer() -> PreprocessingUpdatableTemporalEstimator<
Preprocessor, Estimator>.Transformer
Encoding and decoding
Preprocesing and fitting


## Page 3

Creates a default-initialized transformer suitable for incremental fitting.
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
TemporalEstimator
UpdatableTemporalEstimator
struct PreprocessingEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingTemporalEstimator
A temporal estimator that composes a preprocessing transformer and a temporal estimator.
Deprecated
struct PreprocessingSupervisedEstimator
A supervised estimator that composes a preprocessing transformer and a supervised
estimator.
Relationships
Conforms To
See Also
Composition with preprocessing


## Page 4

struct PreprocessingSupervisedTemporalEstimator
A supervised temporal estimator that composes a preprocessing transformer and a
supervised temporal estimator.
Deprecated
struct PreprocessingUpdatableEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.
struct PreprocessingUpdatableSupervisedEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableSupervisedTemporalEstimator
An updatable supervised temporal estimator that composes a preprocessing transformer an
an updatable supervised temporal estimator.
Deprecated


