# 003_PreprocessingSupervisedTemporalEstimator.pdf

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
Create ML Components / PreprocessingSupervisedTemporalEstimator Deprecated
Structure
PreprocessingSupervisedTemporal
Estimator Deprecated
A supervised temporal estimator that composes a preprocessing transformer and
a supervised temporal estimator.
iOS 16.0–18.0 Deprecated
iPadOS 16.0–18.0 Deprecated
Mac Catalyst 16.0–18.0 Deprecated
macOS 13.0–15.0 Deprecated
tvOS 16.0–18.0 Deprecated
visionOS 1.0–2.0 Deprecated


## Page 2

func preprocessed<InputSequence, FeatureSequence>(from: InputSequence,
eventHandler: EventHandler?) async throws -> [AnnotatedFeature<
PreprocessedFeatureSequence<Preprocessor.Output>, Preprocessing
SupervisedTemporalEstimator<Preprocessor, Estimator>.Annotation>]
Preprocesses a sequence of examples.
func fitted<InputSequence, FeatureSequence>(to: InputSequence, event
Handler: EventHandler?) async throws -> PreprocessingSupervisedTemporal
Estimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of examples.
func fitted(toPreprocessed: [AnnotatedFeature<PreprocessedFeature
Sequence<Preprocessor.Output>, PreprocessingSupervisedTemporalEstimator
Preprocessor, Estimator>.Annotation>], eventHandler: EventHandler?)
async throws -> PreprocessingSupervisedTemporalEstimator<Preprocessor,
Estimator>.Transformer
Fits a transformer to a sequence of preprocessed annotated features.
func fitted<InputSequence, Validation, FeatureSequence>(to: Input
Sequence, validateOn: Validation, eventHandler: EventHandler?) async 
throws -> PreprocessingSupervisedTemporalEstimator<Preprocessor,
Estimator>.Transformer
Fits a transformer to a sequence of examples while validating with a validation sequence.
func fitted(toPreprocessed: [AnnotatedFeature<PreprocessedFeature
Sequence<Preprocessor.Output>, PreprocessingSupervisedTemporalEstimator
Preprocessor, Estimator>.Annotation>], validateOn: [AnnotatedFeature<
PreprocessedFeatureSequence<Preprocessor.Output>, Preprocessing
SupervisedTemporalEstimator<Preprocessor, Estimator>.Annotation>], even
Handler: EventHandler?) async throws -> PreprocessingSupervisedTemporal
Estimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of preprocessed examples while validating.
typealias Annotation
The annotation type.
typealias Input
The input type.
typealias Intermediate
Preprocesing and Fitting


## Page 3

The intermediate type.
typealias Output
The output type.
protocol Transformer
A transformer that takes an input and produces an output.
Sendable, SendableMetatype, SupervisedTemporalEstimator
struct PreprocessingEstimator
An estimator that composes a preprocessing transformer and an estimator.
struct PreprocessingTemporalEstimator
A temporal estimator that composes a preprocessing transformer and a temporal estimator.
Deprecated
struct PreprocessingSupervisedEstimator
A supervised estimator that composes a preprocessing transformer and a supervised
estimator.
struct PreprocessingUpdatableEstimator
An updatable estimator that composes a preprocessing transformer and an updatable
estimator.
struct PreprocessingUpdatableTemporalEstimator
An updatable temporal estimator that composes a preprocessing transformer and an
updatable temporal estimator.
Deprecated
Relationships
Conforms To
See Also
Composition with preprocessing


## Page 4

struct PreprocessingUpdatableSupervisedEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableSupervisedTemporalEstimator
An updatable supervised temporal estimator that composes a preprocessing transformer an
an updatable supervised temporal estimator.
Deprecated


