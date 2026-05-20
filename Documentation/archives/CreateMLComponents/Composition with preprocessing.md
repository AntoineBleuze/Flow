# Composition with preprocessing.pdf

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10



## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

struct PreprocessingUpdatableSupervisedEstimator
An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableSupervisedTemporalEstimator
An updatable supervised temporal estimator that composes a preprocessing transformer an
an updatable supervised temporal estimator.
Deprecated


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.
struct PreprocessingUpdatableSupervisedTemporalEstimator
An updatable supervised temporal estimator that composes a preprocessing transformer an
an updatable supervised temporal estimator.
Deprecated


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

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


## Page 26

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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

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


## Page 31

An updatable supervised estimator that composes a preprocessing transformer and an
updatable supervised estimator.


