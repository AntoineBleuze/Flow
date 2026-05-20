# 004_PreprocessingUpdatableEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed updatable estimator from a preprocessing transformer and an estimato
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
func decodeWithOptimizer(from: inout any EstimatorDecoder) throws ->
PreprocessingUpdatableEstimator<Preprocessor, Estimator>.Transformer
Reads the encoded transformer and optimizer.
Topics
Creating an estimator
Getting the properties
Encoding and decoding
Create ML Components / PreprocessingUpdatableEstimator
Structure
PreprocessingUpdatableEstimator
An updatable estimator that composes a preprocessing transformer and an
updatable estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func encodeWithOptimizer(PreprocessingUpdatableEstimator<Preprocessor,
Estimator>.Transformer, to: inout any EstimatorEncoder) throws
Encodes the transformer and optimizer to an encoder.
func preprocessed<S>(from: S, eventHandler: EventHandler?) async throws
-> [Preprocessor.Output]
Preprocesses a sequence of examples.
func fitted<S>(to: S, eventHandler: EventHandler?) async throws ->
PreprocessingUpdatableEstimator<Preprocessor, Estimator>.Transformer
Fits a composed transformer to a sequence of examples.
func fitted<S>(toPreprocessed: S, eventHandler: EventHandler?) async 
throws -> PreprocessingUpdatableEstimator<Preprocessor, Estimator>.
Transformer
Fits a transformer to a sequence of preprocessed features.
func makeTransformer() -> PreprocessingUpdatableEstimator<Preprocessor,
Estimator>.Transformer
Creates a default-initialized transformer suitable for incremental fitting.
func update<InputSequence>(inout PreprocessingUpdatableEstimator<
Preprocessor, Estimator>.Transformer, with: InputSequence, eventHandler
EventHandler?) async throws
Updates a transformer with a new sequence of examples.
func update<InputSequence>(inout PreprocessingUpdatableEstimator<
Preprocessor, Estimator>.Transformer, withPreprocessed: InputSequence,
eventHandler: EventHandler?) async throws
Updates a transformer with a new sequence of preprocessed features.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
typealias Output
The output type.
protocol Transformer
Preprocesing and fitting


## Page 3

A transformer that takes an input and produces an output.
Estimator
Sendable
SendableMetatype
UpdatableEstimator
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
struct PreprocessingUpdatableTemporalEstimator
An updatable temporal estimator that composes a preprocessing transformer and an
updatable temporal estimator.
Deprecated
struct PreprocessingUpdatableSupervisedEstimator
Relationships
Conforms To
See Also
Composition with preprocessing


## Page 4

An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableSupervisedTemporalEstimator
An updatable supervised temporal estimator that composes a preprocessing transformer an
an updatable supervised temporal estimator.
Deprecated


