# 002_PreprocessingSupervisedEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed supervised estimator from a preprocessing transformer and an
estimator.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
Topics
Creating the estimator
Getting the properties
Preprocessing and fitting
Create ML Components / PreprocessingSupervisedEstimator
Structure
PreprocessingSupervisedEstimator
A supervised estimator that composes a preprocessing transformer and a
supervised estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

func preprocessed<S>(from: S, eventHandler: EventHandler?) async throws
-> AnySequence<AnnotatedFeature<Preprocessor.Output, Preprocessing
SupervisedEstimator<Preprocessor, Estimator>.Annotation>>
Preprocesses a sequence of examples.
func fitted<InputSequence>(to: InputSequence, eventHandler: EventHandle
?) async throws -> PreprocessingSupervisedEstimator<Preprocessor,
Estimator>.Transformer
Fits a composed transformer to a sequence of examples.
func fitted<S>(toPreprocessed: S, eventHandler: EventHandler?) async 
throws -> PreprocessingSupervisedEstimator<Preprocessor, Estimator>.
Transformer
Fits a transformer to a sequence of preprocessed features.
func fitted<InputSequence, Validation>(to: InputSequence, validateOn:
Validation, eventHandler: EventHandler?) async throws -> Preprocessing
SupervisedEstimator<Preprocessor, Estimator>.Transformer
Fits a composed transformer to a sequence of examples.
func fitted<Input, Validation>(toPreprocessed: Input, validateOn:
Validation, eventHandler: EventHandler?) async throws -> Preprocessing
SupervisedEstimator<Preprocessor, Estimator>.Transformer
Fits a composed transformer to a sequence of preprocessed features.
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


## Page 3

Sendable, SendableMetatype, SupervisedEstimator
struct PreprocessingEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingTemporalEstimator
A temporal estimator that composes a preprocessing transformer and a temporal estimator.
Deprecated
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
Conforms To
See Also
Composition with preprocessing


## Page 4



