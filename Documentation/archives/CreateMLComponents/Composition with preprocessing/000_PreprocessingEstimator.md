# 000_PreprocessingEstimator.pdf

## Page 1

init(Preprocessor, Estimator)
Creates a composed estimator from a preprocessing transformer and an estimator.
var estimator: Estimator
The estimator.
var preprocessor: Preprocessor
The preprocessing transformer.
func preprocessed<S>(from: S, eventHandler: EventHandler?) async throws
-> [Preprocessor.Output]
Preprocesses a sequence of examples.
func fitted<S>(to: S, eventHandler: EventHandler?) async throws ->
PreprocessingEstimator<Preprocessor, Estimator>.Transformer
Topics
Creating an estimator
Getting the properties
Preprocesing and fitting
Create ML Components / PreprocessingEstimator
Structure
PreprocessingEstimator
An estimator that composes a preprocessing transformer and an estimator.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

Fits a composed transformer to a sequence of examples.
func fitted<S>(toPreprocessed: S, eventHandler: EventHandler?) async 
throws -> PreprocessingEstimator<Preprocessor, Estimator>.Transformer
Fits a transformer to a sequence of preprocessed features.
typealias Input
The input type.
typealias Intermediate
The intermediate type.
typealias Output
The output type.
protocol Transformer
A transformer that takes an input and produces an output.
Estimator, Sendable, SendableMetatype
struct PreprocessingTemporalEstimator
A temporal estimator that composes a preprocessing transformer and a temporal estimator.
Deprecated
struct PreprocessingSupervisedEstimator
A supervised estimator that composes a preprocessing transformer and a supervised
estimator.
struct PreprocessingSupervisedTemporalEstimator
Relationships
Conforms To
See Also
Composition with preprocessing


## Page 3

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


