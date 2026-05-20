# 001_PreprocessingTemporalEstimator.pdf

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
Preprocesing and fitting
Create ML Components / PreprocessingTemporalEstimator Deprecated
Structure
PreprocessingTemporalEstimator Deprecated
A temporal estimator that composes a preprocessing transformer and a temporal
estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func preprocessed<InputSequence>(from: InputSequence, eventHandler:
EventHandler?) async throws -> [PreprocessedFeatureSequence<Preprocesso
.Output>]
Preprocesses a sequence of examples.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> PreprocessingTemporalEstimator<Preprocessor,
Estimator>.Transformer
Fits a transformer to a sequence of examples.
func fitted(toPreprocessed: [PreprocessedFeatureSequence<Preprocessor.
Output>], eventHandler: EventHandler?) async throws -> Preprocessing
TemporalEstimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of preprocessed features.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
typealias Output
The output type.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable, SendableMetatype, TemporalEstimator
Relationships
Conforms To
See Also
Composition with preprocessing


## Page 3

struct PreprocessingEstimator
An estimator that composes a preprocessing transformer and an estimator.
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
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableSupervisedTemporalEstimator
An updatable supervised temporal estimator that composes a preprocessing transformer an
an updatable supervised temporal estimator.
Deprecated


